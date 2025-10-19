""" Preprocess dataset for knights and knaves logic task """

import os
from datasets import Dataset, load_dataset
from tqdm import tqdm
from verl.utils.hdfs_io import copy, makedirs
import argparse
import json

def make_prefix(dp, template_type):
    input = dp['prompt']
    answer_1 = 'Nil'
    answer_2 = 'Nil'
    if template_type == 'base':
        prefix = f"""The user asks a question, and the Assistant solves it.The assistant first thinks about the reasoning process in the mind and then provides the user with the final answer. The reasoning process and answer are enclosed within <think> </think> and <answer> </answer> tags, respectively, i.e., <think> reasoning process here </think><answer> answer here </answer>. Now the user asks you to solve a logical reasoning problem. After thinking, when you finally reach a conclusion, clearly state the identity of each character within <answer> </answer> tags. List the identity of each person one by one, for example, <answer> (1) Zoey is a knight\n(2) Oliver is a knight\n(3)... </answer>.\n\nUser:\nAssistant: <think>"""
    elif template_type == 'qwen-instruct':
        # prefix = f"""<|im_start|>system\nYou are a helpful assistant. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The reasoning process and answer are enclosed within <think> </think> and<answer> </answer> tags, respectively, i.e., <think> reasoning process here </think><answer> answer here </answer>.  Now the user asks you to solve a logical reasoning problem. After thinking, when you finally reach a conclusion, clearly state the identity of each character within <answer> </answer> tags. i.e., <answer> (1) Zoey is a knight\n(2) ... </answer>.\n<|im_end|>\n<|im_start|>user\n{quiz}\n<|im_end|>\n<|im_start|>assistant\n<think>"""
        # prefix = f"""
        #         <|im_start|>system\n You are an expert HLS optimization assistant. For least power, least latency, least area, least clock period. you will choose the most suitable directive according to the given HLS code by performing in-depth reasoning before you answer.  
        #         Your reply must consist of two parts:
        #         1. <think> … </think>  
        #            - In your reasoning, identify the bottlenecks of the given HLS code. For bottlenecks, choose unroll and pipeline to reduce clock period and latency and assign dsp for their computation. For not bottlenecks, reduce area and power consumption.
                
        #         2. <answer> … </answer>  
        #            - Present only the chosen directives.  

        #         Example response:
        #         <think>
        #         the bottleneck of the given HLS code is the loop "for i in range(1000)" which has a large iteration count. To optimize for latency and reduce clock period, I will apply loop unrolling and pipelining directives to this loop, and assign dsp to reduce the period. for 
        #         </think>
        #         <answer>
        #         set_directive_unroll -factor 2 bfs/loop_neighbors
        #         set_directive_pipeline -style stp bfs/loop_neighbors
        #         </answer>

        #         The true prompt is below:
        #         """
        prefix = f" <|im_start|> system\nYou are a helpful assistant.{input} <|im_end|>"
        #true_prompt = prefix
        true_prompt = input
    return true_prompt

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--local_dir', default='/home/zqy/DSE/Logic-RL/HLS_datasets')
    parser.add_argument('--hdfs_dir', default=None)
    parser.add_argument('--data_path', default='/home/zqy/DSE/HGBO-DSE/llm_finetune/train_rl.jsonl')
    parser.add_argument('--val_data_path', default='/home/zqy/DSE/HGBO-DSE/llm_finetune/test_rl.jsonl')
    parser.add_argument('--train_size', type=int, default=5765)
    parser.add_argument('--test_size', type=int, default=5562)
    parser.add_argument('--template_type', type=str, default='qwen-instruct')
    
    args = parser.parse_args()
    
    data_source = "kk"
    TRAIN_SIZE = args.train_size
    TEST_SIZE = args.test_size

    # Load custom JSONL dataset
    def gen_from_jsonl(path):
        with open(path) as f:
            for line in f:
                yield json.loads(line)
    
    # raw_dataset = Dataset.from_generator(gen_from_jsonl, gen_kwargs={'path': args.data_path})
    # print(len(raw_dataset))

    # assert len(raw_dataset) >= TRAIN_SIZE + TEST_SIZE
    # train_dataset = raw_dataset.select(range(TRAIN_SIZE))
    # test_dataset = raw_dataset.select(range(TRAIN_SIZE, TRAIN_SIZE + TEST_SIZE))
    train_dataset = Dataset.from_generator(gen_from_jsonl, gen_kwargs={'path': args.data_path})
    test_dataset = Dataset.from_generator(gen_from_jsonl, gen_kwargs={'path': args.val_data_path})

    def make_map_fn(split):
        def process_fn(example, idx):
            question = make_prefix(example, template_type=args.template_type)
            solution = {
                #"input": example["prompt"],
                "output": example["response"],
                # "reasoning": example["reasoning"]
            }
            data = {
                "data_source": data_source,
                "prompt": [{
                    "role": "user",
                    "content": example["prompt"]
                }],
                "ability": "logic",
                "reward_model": {
                    "style": "syntax_semantic",
                    "ground_truth": solution
                },
                "extra_info": {
                    'split': split,
                    'index': idx,
                }
            }
            return data
        return process_fn

    train_dataset = train_dataset.map(function=make_map_fn('train'), with_indices=True)
    test_dataset = test_dataset.map(function=make_map_fn('test'), with_indices=True)

    local_dir = args.local_dir
    hdfs_dir = args.hdfs_dir

    # Create local directory if not exists
    os.makedirs(os.path.expanduser(local_dir), exist_ok=True)

    train_dataset.to_parquet(os.path.join(local_dir, 'train.parquet'))
    test_dataset.to_parquet(os.path.join(local_dir, 'test.parquet'))

    if hdfs_dir is not None:
        makedirs(hdfs_dir)
        copy(src=local_dir, dst=hdfs_dir)
