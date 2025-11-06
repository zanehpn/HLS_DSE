# HLS-DSE Framework

<figure>
<img src=img/image.png alt="Trulli" style="width:100%">
<figcaption align="left">
The proposed MML is an automatic framework composed of MMQP and LDG to support fast and efficient multi-objective design space exploration for HLS.
</figcaption>
</figure>

## Prerequisites
### Python Environmant
- python 3.9
- torch 1.13.1
- torch-geometric 2.3.1
- torch-scatter 2.1.1
- torch-sparse 0.6.17
- optuna 3.2.0
- pyDOE 0.3.8
### Vitis Environment
- Vitis HLS 2022.1
- Vivado 2022.1

## Overview

This repository contains code, datasets, and experiments for exploring automated HLS design space exploration with LLM and multi-modality QoR predictor. 

The goal is to produce HLS implementations with improved performance/resource trade-offs compared to hand-tuned baselines.

---

## Repository layout

```
HLS_DSE/
├─ baseline/        # Reference HLS implementations and baseline kernels
├─ benchmark/       # Benchmark harnesses, runners, and evaluation scripts
├─ config/          # Configuration files (YAML/JSON) for experiments and runs
├─ dataset/         # Dataset generation, parsers, and stored datasets
├─ dse_ds/          # Design-space dataset utilities (feature extraction, encoding)
├─ img/             # Images used in docs/slides (screenshots, figures)
├─ llm_rl/          # Reinforcement-learning components for LLM-guided optimization
├─ llm_sft/         # Supervised fine-tuning / SFT pipelines for Multi-modality QoR Predictor
├─ mmqp/            # Multi-objective / QP utilities and solvers
checkpoints
├─ pareto/          # Pareto-front analysis & plotting utilities
└─ README.md        # This file
```

