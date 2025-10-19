from transformers import AutoTokenizer, AutoModelForCausalLM
from peft import PeftModel
import os

BASE_MODEL = "./Qwen2.5-Coder-7B-Instruct"
ADAPTER_DIR = "./llm_finetune/model/lora_adapters"
OUT_DIR = "./llm_finetune/model/checkpoint-426-merged"

tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL)
base = AutoModelForCausalLM.from_pretrained(BASE_MODEL)
model = PeftModel.from_pretrained(base, ADAPTER_DIR)


merged = model.merge_and_unload()   
os.makedirs(OUT_DIR, exist_ok=True)
merged.save_pretrained(OUT_DIR)
tokenizer.save_pretrained(OUT_DIR)

