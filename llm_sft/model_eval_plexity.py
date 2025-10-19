# eval_with_lora.py
import os
import argparse
import math, time
import json
from typing import List
import torch
from tqdm import tqdm
from datasets import Dataset
from torch.utils.data import DataLoader

from transformers import (
    AutoTokenizer,
    AutoModelForCausalLM,
    BitsAndBytesConfig
)
from peft import PeftModel

# user dataset utils (must be importable)
from dataset_utils import generate_dataset_llm, extract_text_from_item

def make_hf_dataset_from_list(lst: List, extractor=extract_text_from_item):
    texts = []
    for item in lst:
        txt = extractor(item)
        if not txt:
            continue
        texts.append(txt)
    if len(texts) == 0:
        return None
    return Dataset.from_dict({"text": texts})

def tokenize_and_chunk_fn(tokenizer, max_length):
    def fn(batch):
        enc = tokenizer(batch["text"], return_attention_mask=False, add_special_tokens=True)
        input_ids_batch = enc["input_ids"]
        all_ids = []
        for ids in input_ids_batch:
            if len(ids) <= max_length:
                all_ids.append(ids)
            else:
                stride = max(1, max_length // 4)
                start = 0
                L = len(ids)
                while start < L:
                    end = min(start + max_length, L)
                    all_ids.append(ids[start:end])
                    if end == L:
                        break
                    start = end - stride
        return {"input_ids": all_ids}
    return fn

def to_lm_inputs_fn(batch):
    return {"input_ids": batch["input_ids"], "labels": batch["input_ids"]}

def collate_pad(batch, pad_id):
    input_lists = [ex["input_ids"] for ex in batch]
    maxlen = max(len(x) for x in input_lists)
    input_ids = []
    labels = []
    for ids in input_lists:
        pad_len = maxlen - len(ids)
        input_ids.append(ids + [pad_id] * pad_len)
        labels.append(ids + [-100] * pad_len)
    input_ids = torch.tensor(input_ids, dtype=torch.long)
    labels = torch.tensor(labels, dtype=torch.long)
    attention_mask = (input_ids != pad_id).long()
    return {"input_ids": input_ids, "labels": labels, "attention_mask": attention_mask}

def compute_eval_loss_and_perplexity(model, dataloader, device):
    model.eval()
    total_token_loss = 0.0
    total_tokens = 0
    with torch.no_grad():
        for batch in tqdm(dataloader, desc="eval-loss"):
            input_ids = batch["input_ids"].to(device)
            labels = batch["labels"].to(device)
            attention_mask = batch["attention_mask"].to(device)
            outputs = model(input_ids=input_ids, attention_mask=attention_mask, labels=labels)
            loss = outputs.loss  # average over active tokens
            # count active tokens (labels != -100)
            active_tokens = (labels != -100).sum().item()
            if active_tokens == 0:
                continue
            total_token_loss += loss.item() * active_tokens
            total_tokens += active_tokens
    if total_tokens == 0:
        return None, None
    avg_token_loss = total_token_loss / total_tokens
    perplexity = math.exp(min(avg_token_loss, 100.0))
    return avg_token_loss, perplexity

def compute_next_token_accuracy(model, dataloader, device):
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for batch in tqdm(dataloader, desc="next-token-acc"):
            input_ids = batch["input_ids"].to(device)
            labels = batch["labels"].to(device)
            attention_mask = batch["attention_mask"].to(device)
            outputs = model(input_ids=input_ids, attention_mask=attention_mask)
            logits = outputs.logits
            preds = logits.argmax(dim=-1)
            # shift compare
            pred_next = preds[:, :-1].reshape(-1)
            target_next = labels[:, 1:].reshape(-1)
            mask = target_next != -100
            if mask.sum().item() == 0:
                continue
            pred_next = pred_next[mask]
            target_next = target_next[mask]
            correct += (pred_next == target_next).sum().item()
            total += target_next.numel()
    acc = correct / total if total > 0 else None
    return acc, total

def generate_samples_and_save(model, tokenizer, eval_dataset, device, out_path,
                                   n_examples=50, n_prompt_tokens=None, desired_new_tokens=1024,
                                   chunk_max_new=512, num_beams=1, max_time_per_sample=600):
    """
    Safe generation wrapper:
      - If prompt length > model_max - 1: trim prompt (keep QoR tail if possible)
      - Iteratively generate in chunks (chunk_max_new) until desired_new_tokens or EOS
      - num_beams default 1 for long generation
    """
    model.eval()
    preds, refs = [], []
    count = 0
    model_max = getattr(model.config, "max_position_embeddings", tokenizer.model_max_length)
    print(f"Model max context: {model_max}, tokenizer.model_max_length: {tokenizer.model_max_length}")

    def smart_trim_prompt(prompt_text, keep_tokens):
        # 保证保留 QoR Targets 行，如果存在
        if "[QoR Targets]" in prompt_text:
            head, tail = prompt_text.split("[QoR Targets]", 1)
            tail = "[QoR Targets]" + tail
            tail_ids = tokenizer(tail, add_special_tokens=False)["input_ids"]
            tail_len = len(tail_ids)
            keep_for_head = max(0, keep_tokens - tail_len)
            head_ids = tokenizer(head, add_special_tokens=False)["input_ids"]
            head_trim = head_ids[-keep_for_head:] if keep_for_head < len(head_ids) else head_ids
            new_ids = head_trim + tail_ids
            return new_ids
        else:
            ids = tokenizer(prompt_text, add_special_tokens=False)["input_ids"]
            return ids[-keep_tokens:]

    for ex in tqdm(eval_dataset, desc="generation"):
        if count >= n_examples:
            break
        ids = ex["input_ids"]
        if isinstance(ids, torch.Tensor):
            ids = ids.tolist()

        # Decide prompt_ids: if user provided n_prompt_tokens use it, else use full prompt but trim to model max-1.
        if n_prompt_tokens is None:
            prompt_ids = ids[:]  # full
        else:
            prompt_ids = ids[:n_prompt_tokens]

        # If prompt too long to fit model's context, trim smartly
        max_allowed_prompt = model_max - 1  # leave at least 1 token for generation
        if len(prompt_ids) > max_allowed_prompt:
            # try smart trim preserving QoR line
            prompt_text = tokenizer.decode(prompt_ids, skip_special_tokens=True)
            prompt_ids = smart_trim_prompt(prompt_text, keep_tokens=max_allowed_prompt)

        # iterative generation
        generated_ids = []
        remaining = desired_new_tokens
        current_context = prompt_ids.copy()
        t0 = time.time()
        while remaining > 0:
            # compute chunk size allowed
            available = model_max - len(current_context) - 1
            if available <= 0:
                # trim context to keep room for chunk_max_new
                current_context = current_context[-(model_max - chunk_max_new - 1):]
                available = model_max - len(current_context) - 1
                if available <= 0:
                    # still no space, force small chunk
                    chunk = 1
                else:
                    chunk = min(remaining, chunk_max_new, available)
            else:
                chunk = min(remaining, chunk_max_new, available)

            input_tensor = torch.tensor([current_context], dtype=torch.long).to(device)
            attention_mask = (input_tensor != tokenizer.pad_token_id).long().to(device)

            try:
                with torch.no_grad():
                    gen = model.generate(
                        input_ids=input_tensor,
                        attention_mask=attention_mask,
                        max_new_tokens=chunk,
                        num_beams=num_beams,
                        do_sample=False,
                        eos_token_id=tokenizer.eos_token_id,
                        pad_token_id=tokenizer.pad_token_id,
                        use_cache=True,
                    )
            except Exception as e:
                print("Generation exception:", e)
                break

            gen_list = gen[0].tolist()
            new_part = gen_list[len(current_context):]
            if len(new_part) == 0:
                break
            generated_ids.extend(new_part)
            remaining -= len(new_part)

            if tokenizer.eos_token_id in new_part:
                # stop at eos
                eos_pos = generated_ids.index(tokenizer.eos_token_id)
                generated_ids = generated_ids[:eos_pos]
                break

            # update context: append but keep window
            current_context = (current_context + new_part)
            if len(current_context) > model_max - 1:
                current_context = current_context[-(model_max - 1):]

            # safety timeout
            if time.time() - t0 > max_time_per_sample:
                print("Timeout generating sample, breaking.")
                break

        t1 = time.time()
        continuation = tokenizer.decode(generated_ids, skip_special_tokens=True)
        prompt_text = tokenizer.decode(prompt_ids, skip_special_tokens=True)[:600]
        ref_text = ""  # if you have ref ids logic keep it
        print(f"[sample {count}] prompt_tokens={len(prompt_ids)}, gen_tokens={len(generated_ids)}, time={t1-t0:.1f}s")
        print("Generated preview:", continuation[:400].replace("\n","\\n"))
        preds.append(continuation)
        refs.append(ref_text)
        count += 1

    # save
    with open(out_path, "w", encoding="utf-8") as f:
        for i,(p,r) in enumerate(zip(preds, refs)):
            f.write(f"=== Example {i} ===\nREF:\n{r}\n\nPRED:\n{p}\n\n\n")
    with open(out_path + ".json", "w", encoding="utf-8") as jf:
        json.dump({"preds": preds, "refs": refs}, jf, ensure_ascii=False, indent=2)

    return len(preds)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--local_model_path", type=str, default="/shared/hdd/c2hls/Qwen2.5-Coder-7B-Instruct")
    parser.add_argument("--lora_dir", type=str, default="./model/lora_adapters")
    parser.add_argument("--tokenizer_dir", type=str, default="./model/tokenizer")
    parser.add_argument("--dataset_dir", type=str, default="../dataset/std")
    parser.add_argument("--model_dir", type=str, default="./model")
    parser.add_argument("--max_length", type=int, default=8192)
    parser.add_argument("--per_device_batch", type=int, default=1)
    parser.add_argument("--n_examples", type=int, default=2)
    parser.add_argument("--n_prompt_tokens", type=int, default=8192)
    parser.add_argument("--max_new_tokens", type=int, default=256)
    parser.add_argument("--num_beams", type=int, default=4)
    args = parser.parse_args()

    os.makedirs(args.model_dir, exist_ok=True)

    # tokenizer
    tok_source = args.tokenizer_dir if os.path.isdir(args.tokenizer_dir) else args.local_model_path
    print("Loading tokenizer from", tok_source)
    tokenizer = AutoTokenizer.from_pretrained(tok_source, trust_remote_code=True)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    # build datasets
    print("Building dataset lists from:", args.dataset_dir)
    _files = os.listdir(args.dataset_dir)
    train_list, test_list = generate_dataset_llm(args.dataset_dir, print_info=False)
    eval_hf = make_hf_dataset_from_list(test_list)
    if eval_hf is None:
        print("No eval data found (test_list empty). Exiting.")
        return

    print("Tokenizing + chunking eval dataset (may take a while)...")
    tokenize_and_chunk = tokenize_and_chunk_fn(tokenizer, args.max_length)
    train_hf = make_hf_dataset_from_list(train_list)
    train_tok = train_hf.map(tokenize_and_chunk, batched=True, remove_columns=["text"])
    train_final = train_tok.map(to_lm_inputs_fn, batched=True)

    eval_tok = eval_hf.map(tokenize_and_chunk, batched=True, remove_columns=["text"])
    eval_final = eval_tok.map(to_lm_inputs_fn, batched=True)

    # load base and lora
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_use_double_quant=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_compute_dtype=torch.float16
    )
    print("Loading base model (4-bit)...")
    base = AutoModelForCausalLM.from_pretrained(
        args.local_model_path,
        quantization_config=bnb_config,
        device_map="cuda:0",
        trust_remote_code=True
    )
    print("Applying LoRA adapters from", args.lora_dir)
    model = PeftModel.from_pretrained(base, args.lora_dir, device_map="auto", torch_dtype=torch.float16)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    # dataloader
    pad_id = tokenizer.pad_token_id
    collate = lambda b: collate_pad(b, pad_id)
    dl = DataLoader(eval_final, batch_size=args.per_device_batch, collate_fn=collate)

    # # eval loss & perplexity
    # avg_token_loss, ppl = compute_eval_loss_and_perplexity(model, dl, device)
    # if avg_token_loss is not None:
    #     print(f"Avg token loss = {avg_token_loss:.6f}, Perplexity = {ppl:.6f}")
    # else:
    #     print("No eval tokens found to compute loss/perplexity.")

    # # next-token accuracy
    # acc, total_tokens = compute_next_token_accuracy(model, dl, device)
    # if acc is not None:
    #     print(f"Next-token accuracy = {acc:.6f} (tokens={total_tokens})")
    # else:
    #     print("Next-token accuracy could not be computed (no valid tokens).")

    # generate and save samples
    out_path = os.path.join(args.model_dir, "eval_generated_samples.txt")
    saved = generate_samples_and_save(
        model, tokenizer, train_final, device, out_path,
        n_examples=args.n_examples
    )
    print(f"Saved {saved} generated examples to {out_path}")

if __name__ == "__main__":
    main()
