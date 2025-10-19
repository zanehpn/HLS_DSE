set -x

export CUDA_VISIBLE_DEVICES=0,1

MODEL_PATH='./llm_sft/model_Qwen2/checkpoint-426-merged'
#MODEL_PATH=/shared/hdd/c2hls/Qwen2.5-Coder-7B-Instruct
# export VLLM_ATTENTION_BACKEND=XFORMERS

export RAY_TMPDIR="xxx"
# 2) Tell Ray how/where to spill in-process objects
export RAY_OBJECT_STORE_ALLOW_SLOW_STORAGE=1
export RAY_OBJECT_SPILLING_CONFIG='{"type":"filesystem","params":{"directory_path":"'"/shared/hdd/qingyun/ray_spill"'"}}'


# invoke Python with Hydra overrides, pipe output to tee
(
  python3 -m verl.trainer.main_ppo \
    algorithm.adv_estimator=grpo \
    +algorithm.reward_ablation=reward_w_length \
    data.train_files=./HLS_datasets/train.parquet \
    data.val_files=./HLS_datasets/val.parquet \
    data.train_batch_size=8 \
    data.val_batch_size=8 \
    data.max_prompt_length=8192 \
    data.max_response_length=8192 \
    actor_rollout_ref.model.path="$MODEL_PATH" \
    actor_rollout_ref.actor.optim.lr=3e-7 \
    actor_rollout_ref.model.use_remove_padding=True \
    actor_rollout_ref.actor.ppo_mini_batch_size=8 \
    actor_rollout_ref.actor.ppo_micro_batch_size=8 \
    actor_rollout_ref.actor.use_kl_loss=True \
    actor_rollout_ref.actor.kl_loss_coef=0.001 \
    actor_rollout_ref.actor.kl_loss_type=low_var_kl \
    actor_rollout_ref.model.enable_gradient_checkpointing=True \
    actor_rollout_ref.actor.fsdp_config.param_offload=True \
    actor_rollout_ref.actor.fsdp_config.grad_offload=True \
    actor_rollout_ref.actor.fsdp_config.optimizer_offload=True \
    actor_rollout_ref.rollout.log_prob_micro_batch_size=160 \
    actor_rollout_ref.rollout.tensor_model_parallel_size=2 \
    actor_rollout_ref.rollout.name=vllm \
    actor_rollout_ref.rollout.gpu_memory_utilization=0.55 \
    actor_rollout_ref.rollout.n=16 \
    actor_rollout_ref.ref.log_prob_micro_batch_size=160 \
    actor_rollout_ref.ref.fsdp_config.param_offload=True \
    algorithm.kl_ctrl.kl_coef=0.001 \
    trainer.critic_warmup=0 \
    trainer.logger="['wandb']" \
    trainer.project_name=GRPO_logic_KK \
    trainer.experiment_name=Qwen-3B \
    trainer.n_gpus_per_node=2 \
    trainer.nnodes=1 \
    trainer.default_local_dir=./verl/trainer \
    trainer.default_hdfs_dir=null \
    trainer.save_freq=10 \
    trainer.test_freq=10 \
    trainer.total_epochs=5
) 2>&1 | tee grpo.log
