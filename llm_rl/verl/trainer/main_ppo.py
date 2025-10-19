# Copyright 2024 Bytedance Ltd. and/or its affiliates
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
Note that we don't combine the main with ray_trainer as ray_trainer is used by other main.
"""

from verl import DataProto
import torch
from verl.utils.reward_score import gsm8k, math, multiply, countdown, kk
from verl.trainer.ppo.ray_trainer import RayPPOTrainer
import os
import json
import re
from typing import Dict

def grasp_key_word(text: str) -> Dict[str, str]:
    result = {}

    bracket_re = re.compile(r'\[([^\]]+)\]')
    for m in bracket_re.finditer(text):
        seg = m.group(1) 
        if re.search(r'\b(case|folder|top)\b', seg, flags=re.I):
            parts = re.split(r'\s*,\s*', seg)
            for p in parts:
                if ':' in p:
                    k, v = p.split(':', 1)
                    k = k.strip().lower()
                    v = v.strip().strip('\'" ')
                    if k in ('case', 'folder', 'top'):
                        result[k] = v
            break
    return result




def _select_rm_score_fn(data_source):
    if data_source == 'openai/gsm8k':
        return gsm8k.compute_score
    elif data_source == 'lighteval/MATH':
        return math.compute_score
    elif "multiply" in data_source or "arithmetic" in data_source:
        return multiply.compute_score
    elif "countdown" in data_source:
        return countdown.compute_score
    elif "kk" in data_source:
        return kk.compute_score
    else:
        return kk.compute_score # default fallback


class RewardManager():
    """The reward manager."""

    def __init__(self, tokenizer, num_examine, reward_ablation='base_reward') -> None:
        self.tokenizer = tokenizer
        self.num_examine = num_examine
        self.reward_ablation = reward_ablation

    def __call__(self, data: DataProto):
        if 'rm_scores' in data.batch.keys():
            return data.batch['rm_scores']

        reward_tensor = torch.zeros_like(data.batch['responses'], dtype=torch.float32)
        seen = {}

        for i in range(len(data)):
            data_item = data[i]
            prompt_ids = data_item.batch['prompts']
            prompt_len = data_item.batch['attention_mask'][:prompt_ids.shape[-1]].sum()
            valid_prompt = prompt_ids[-prompt_len:]
            #print("Prompt length: ", prompt_len)
            response_ids = data_item.batch['responses']
            resp_len = data_item.batch['attention_mask'][prompt_len:].sum()
            #print("Response length: ", resp_len)
            valid_resp = response_ids[:resp_len]
            try:
                prompt_tokens = valid_prompt.cpu().tolist()
            except Exception:
                prompt_tokens = valid_prompt.tolist()
            prompt_str = self.tokenizer.decode(prompt_tokens, skip_special_tokens=True)
            #print("Prompt: ", prompt_str)
            keyword = grasp_key_word(prompt_str)
            seq = torch.cat((valid_prompt, valid_resp))
            seq_str = self.tokenizer.decode(seq)
            gt = data_item.non_tensor_batch['reward_model']['ground_truth']

            fn = _select_rm_score_fn(data_item.non_tensor_batch['data_source'])
            score = fn(
                keyword=keyword,
                solution_str=seq_str,
                ground_truth=gt,
                reward_ablation=self.reward_ablation,
                response_length=resp_len,
                max_response_length=response_ids.shape[-1]
            )
            reward_tensor[i, resp_len - 1] = score

            src = data_item.non_tensor_batch['data_source']
            seen[src] = seen.get(src, 0) + 1
            if seen[src] <= self.num_examine:
                print(seq_str)

        return reward_tensor

import ray
import hydra

@hydra.main(config_path='config', config_name='ppo_trainer', version_base=None)
def main(config):
    # Ensure Ray uses a user-writable directory for its session files and object spills
    ray_temp = os.environ.get('RAY_TMPDIR')
    if ray_temp:
        ray_temp = os.path.expanduser(ray_temp)

    spill_cfg = os.environ.get('RAY_OBJECT_SPILLING_CONFIG')
    system_config = {}
    if spill_cfg:
        try:
            json.loads(spill_cfg)
            system_config['object_spilling_config'] = spill_cfg
        except Exception as e:
            raise RuntimeError(f"Invalid RAY_OBJECT_SPILLING_CONFIG: {e}")

    if not ray.is_initialized():
        ray.init(
            _temp_dir=ray_temp,
            _system_config=system_config,
            runtime_env={
                'env_vars': {
                    'TOKENIZERS_PARALLELISM': 'true',
                    'NCCL_DEBUG': 'WARN'
                }
            }
        )

    ray.get(main_task.remote(config))

@ray.remote
def main_task(config):
    from verl.utils.fs import copy_local_path_from_hdfs
    from transformers import AutoTokenizer
    from pprint import pprint
    from omegaconf import OmegaConf

    pprint(OmegaConf.to_container(config, resolve=True))
    OmegaConf.resolve(config)

    local_path = copy_local_path_from_hdfs(config.actor_rollout_ref.model.path)
    from verl.utils import hf_tokenizer
    tokenizer = hf_tokenizer(local_path)

    if config.actor_rollout_ref.actor.strategy == 'fsdp':
        from verl.workers.fsdp_workers import ActorRolloutRefWorker, CriticWorker
        from verl.single_controller.ray import RayWorkerGroup
        ray_worker_group_cls = RayWorkerGroup
    elif config.actor_rollout_ref.actor.strategy == 'megatron':
        from verl.workers.megatron_workers import ActorRolloutRefWorker, CriticWorker
        from verl.single_controller.ray.megatron import NVMegatronRayWorkerGroup
        ray_worker_group_cls = NVMegatronRayWorkerGroup
    else:
        raise NotImplementedError

    from verl.trainer.ppo.ray_trainer import ResourcePoolManager, Role
    role_map = {
        Role.ActorRollout: ray.remote(ActorRolloutRefWorker),
        Role.Critic: ray.remote(CriticWorker),
        Role.RefPolicy: ray.remote(ActorRolloutRefWorker)
    }

    pool_id = 'global_pool'
    pool_spec = {pool_id: [config.trainer.n_gpus_per_node] * config.trainer.nnodes}
    assignment = {k: pool_id for k in role_map}

    if config.reward_model.enable:
        if config.reward_model.strategy == 'fsdp':
            from verl.workers.fsdp_workers import RewardModelWorker
        else:
            from verl.workers.megatron_workers import RewardModelWorker
        role_map[Role.RewardModel] = ray.remote(RewardModelWorker)
        assignment[Role.RewardModel] = pool_id

    reward_fn = RewardManager(tokenizer, num_examine=0, reward_ablation=config.algorithm.reward_ablation)
    val_reward_fn = RewardManager(tokenizer, num_examine=1, reward_ablation=config.algorithm.reward_ablation)

    rpm = ResourcePoolManager(resource_pool_spec=pool_spec, mapping=assignment)

    trainer = RayPPOTrainer(
        config=config,
        tokenizer=tokenizer,
        role_worker_mapping=role_map,
        resource_pool_manager=rpm,
        ray_worker_group_cls=ray_worker_group_cls,
        reward_fn=reward_fn,
        val_reward_fn=val_reward_fn
    )
    trainer.init_workers()
    trainer.fit()

if __name__ == '__main__':
    main()

