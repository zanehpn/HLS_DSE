# train_qwen_coder.py
import os
import math
import torch
from typing import List
from datasets import Dataset, DatasetDict
from transformers import AutoTokenizer, AutoModelForCausalLM, TrainingArguments, Trainer, DataCollatorForLanguageModeling
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training
from transformers import BitsAndBytesConfig
from gen_dataset_sft import generate_dataset_llm, extract_text_from_item
from pathlib import Path
from peft import PeftModel 

#BASE_MODEL = "/shared/hdd/c2hls/Qwen3-8B/models--Qwen--Qwen3-8B/snapshots/b968826d9c46dd6066d109eabc6255188de91218"
BASE_MODEL = "./Qwen2.5-Coder-7B-Instruct"
ADAPTER_DIR = "./llm_finetune/model_Qwen2_new/lora_adapters"
OUT_DIR = "./llm_finetune/model_Qwen2_new/checkpoint-426-merged"
LLM_PATH = "./llm_finetune"
batch_size = 32
dataset_dir = os.path.abspath('../dataset/std')
model_dir = os.path.abspath('./sft_model')   
model_name = "Qwen/Qwen2.5-Coder-7B-Instruct"    
max_length = 8192       
num_train_epochs = 2
learning_rate = 2e-4
save_steps = 1000
eval_steps = 500
logging_steps = 50
seed = 128
# =================================
    
with open(os.path.join(LLM_PATH, "train_sft.jsonl"), "r", encoding="utf-8") as f:
    train_list = f.readlines()
with open(os.path.join(LLM_PATH, "train_sft.jsonl"), "r", encoding="utf-8") as f:
    test_list = f.readlines()

# dataset = os.listdir(dataset_dir)
#train_list, test_list = generate_dataset_llm(dataset_dir, print_info=False)

# Seed
torch.manual_seed(seed)
local_model_path  = BASE_MODEL
# Tokenizer & model (QLoRA + LoRA)
print("Loading tokenizer and model (QLoRA + LoRA)...")
tokenizer = AutoTokenizer.from_pretrained(local_model_path, trust_remote_code=True)
# Qwen tokenizer might not have pad token
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

# bitsandbytes config for 4-bit loading
bnb_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_use_double_quant=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=torch.float16
)

# load model in 4-bit (device_map auto)
model = AutoModelForCausalLM.from_pretrained(
    local_model_path,
    quantization_config=bnb_config,
    device_map="auto",
    trust_remote_code=True
)

# prepare for k-bit training (wrap attention / enable gradient checkpoint if desired)
model = prepare_model_for_kbit_training(model)

# LoRA config
lora_config = LoraConfig(
    r=16,
    lora_alpha=32,
    target_modules=["q_proj", "k_proj", "v_proj", "o_proj"],  # qwen-like modules;若不生效可换 ["query_key_value","qkv"]
    lora_dropout=0.05,
    bias="none",
    task_type="CAUSAL_LM"
)
model = get_peft_model(model, lora_config)

# Build HF Dataset from train_list/test_list
def make_hf_dataset_from_list(lst: List):
    texts = []
    for item in lst:
        txt = extract_text_from_item(item)
        if not txt:
            continue
        texts.append(txt)
    return Dataset.from_dict({"text": texts})

train_hf = make_hf_dataset_from_list(train_list)
eval_hf  = make_hf_dataset_from_list(test_list) if len(test_list)>0 else None

# Tokenize and chunk (sliding window)
def tokenize_and_chunk(batch):
    # batch["text"] is a list of strings
    enc = tokenizer(batch["text"], return_attention_mask=False, add_special_tokens=True)
    input_ids = enc["input_ids"]
    # flatten and chunk
    all_ids = []
    for ids in input_ids:
        if len(ids) <= max_length:
            all_ids.append(ids)
        else:
            # sliding window
            stride = max_length // 4
            start = 0
            L = len(ids)
            while start < L:
                end = min(start + max_length, L)
                all_ids.append(ids[start:end])
                if end == L:
                    break
                start = end - stride
    return {"input_ids": all_ids}

# apply
train_tok = train_hf.map(tokenize_and_chunk, batched=True, remove_columns=["text"])
if eval_hf is not None:
    eval_tok = eval_hf.map(tokenize_and_chunk, batched=True, remove_columns=["text"])
else:
    eval_tok = None

# convert token lists to proper format with labels
def to_lm_inputs(example):
    ids = example["input_ids"]
    return {"input_ids": ids, "labels": ids}

train_final = train_tok.map(to_lm_inputs, batched=True)
if eval_tok is not None:
    eval_final = eval_tok.map(to_lm_inputs, batched=True)
else:
    eval_final = None

# data collator
data_collator = DataCollatorForLanguageModeling(tokenizer=tokenizer, mlm=False)

# TrainingArguments
per_device_batch = 1   # conservative default; we will use grad_accum to reach user batch_size
gradient_accumulation_steps = max(1, batch_size // per_device_batch)

training_args = TrainingArguments(
    output_dir=model_dir,
    per_device_train_batch_size=per_device_batch,
    per_device_eval_batch_size=per_device_batch,
    gradient_accumulation_steps=gradient_accumulation_steps,
    num_train_epochs=num_train_epochs,
    fp16=True,
    learning_rate=learning_rate,
    logging_steps=logging_steps,
    #evaluation_strategy="steps" if eval_final is not None else "no",
    eval_steps=eval_steps,
    save_strategy="steps",
    save_steps=save_steps,
    save_total_limit=3,
    remove_unused_columns=False,
    push_to_hub=False,
)

trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=train_final,
    eval_dataset=eval_final if eval_final is not None else None,
    data_collator=data_collator,
)

# Start training
trainer.train()

# Save LoRA adapters + tokenizer
print("Saving fine-tuned LoRA adapters...")
model.save_pretrained(os.path.join(model_dir, "lora_adapters"))
adapter_path = os.path.join(model_dir, "lora_adapters")

tokenizer.save_pretrained(os.path.join(model_dir, "tokenizer"))
tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL)
base = AutoModelForCausalLM.from_pretrained(BASE_MODEL)
model = PeftModel.from_pretrained(base, adapter_path)


merged = model.merge_and_unload()   
os.makedirs(OUT_DIR, exist_ok=True)
merged.save_pretrained(OUT_DIR)
tokenizer.save_pretrained(OUT_DIR)
print("Done.")
