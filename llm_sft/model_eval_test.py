import torch
from transformers import AutoTokenizer, AutoModelForCausalLM
from bome.tdm.test_gen_config import make_paraDict_for_all, train_genDirConfig, getYaml
# ====================
# ====================
prj  = '' # your path here
ckpt_path = f"{prj}/llm_finetune/model/checkpoint-sft-merged" #fintune model
#ckpt_path = "/shared/hdd/c2hls/Qwen2.5-Coder-7B-Instruct/"
# ====================
# ====================
print(f"Loading model from {ckpt_path} ...")
tokenizer = AutoTokenizer.from_pretrained(ckpt_path, trust_remote_code=True)
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

model = AutoModelForCausalLM.from_pretrained(
    ckpt_path,
    device_map="auto",   #  GPU
    torch_dtype=torch.float16,
    trust_remote_code=True
)

model.eval()

# ====================
# prompt1 = '''
# please finsh the following Vivado HLS optimizations directive tcl script, [xxx]  need to be filled, [xxx/xxx] need to be choosed, [or delete this line] means you can remove this line, must not add new directive

# set_directive_loop_flatten [off/ ] stencil3d/height_bound_col [or delete this line]
# set_directive_pipeline [off/-style stp] stencil3d/height_bound_col [or delete this line]
# set_directive_unroll -factor 2 stencil3d/height_bound_col [or delete this line]
# set_directive_pipeline [off/-style stp] stencil3d/height_bound_row
# set_directive_loop_flatten stencil3d/col_bound_height
# set_directive_pipeline -style stp stencil3d/col_bound_row
# set_directive_loop_flatten stencil3d/row_bound_height
# set_directive_unroll -factor [xxx] stencil3d/row_bound_col
# set_directive_pipeline [off/on] stencil3d/row_bound_col
# set_directive_loop_flatten [off/on] stencil3d/loop_height
# set_directive_loop_flatten [off/on] stencil3d/loop_col
# set_directive_pipeline -style stp stencil3d/loop_col
# set_directive_array_reshape -factor [xxx] -type cyclic stencil3d orig
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/loop_row sum1
# set_directive_bind_op -op mul -impl [fabric/dsp] -latency -1 stencil3d/loop_row mul0
# set_directive_bind_op -op mul -impl [fabric/dsp] -latency -1 stencil3d/loop_row mul1
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/col_bound_height i
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/row_bound_height i
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/loop_height i
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/height_bound_col j
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/row_bound_col j
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/loop_col j
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/height_bound_row k
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/col_bound_row k
# set_directive_bind_op -op add -impl [fabric/dsp] -latency -1 stencil3d/loop_row k

# The out answer should follow the format: answer: directive tcl script
# '''

static_config = getYaml('/home/zqy/DATE2025/HGBO-DSE/config/MachSuite/aes_aes_config.yaml')
params = getYaml('/home/zqy/DATE2025/HGBO-DSE/config/MachSuite/aes_aes_params.yaml')
paraDict = make_paraDict_for_all(static_config)
train_genDirConfig(encode='discrete', params=params, static_config=static_config,
             paraDict=paraDict, dir_tcl='/home/zqy/DATE2025/HGBO-DSE/llm_finetune/directive.tcl',
             tempDir=None, dir_json='/home/zqy/DATE2025/HGBO-DSE/llm_finetune/dir.json')
code = ''
tcl = ''
code_path = "/home/zqy/DATE2025/HGBO-DSE/benchmark/MachSuite/aes/aes/aes.c"
with open(code_path, 'r') as f:
    code = f.read()
tcl_path = '/home/zqy/DATE2025/HGBO-DSE/llm_finetune/directive.tcl'
with open(tcl_path, 'r') as f:
    tcl = f.read()

  
prompt1 = f''' please finish the script. contains only the completed TCL lines.

Template ( choose options <xxx|xxxx>; if you choose `OMIT` for a line, delete that entire line;<xxx|xxxx> means choose one of the options from xxx and xxxx):
{tcl}
Notes:
- All replacements must obey case-sensitivity and the allowed choices. Output only the completed script, prefixed by the single line `tcl:` as specified above.
'''

# ====================
prompt = f'''Given the Xilinx HLS FPGA code and its target QoR metrics [HLS Code] {code} [QoR Targets] [1,2,3,4]'''
prompt = prompt + prompt1

prompt = "Given the Xilinx HLS FPGA code and its target QoR metrics [HLS Code] \/*\nBased on:\nLawrence Rabiner. \"A Tutorial on Hidden Markov Models and Selected Applications in Speech Recognition.\" Proc. IEEE, v77, #2. 1989.\n*\/\n\n#include <stdlib.h>\n#include <stdio.h>\n#include <stdint.h>\n#include <fcntl.h>\n#include \"..\/..\/common\/support.h\"\n\n#define TYPE double\ntypedef uint8_t tok_t;\ntypedef TYPE prob_t;\ntypedef uint8_t state_t;\ntypedef int32_t step_t;\n\n\/\/#define N_STATES 5\n\/\/#define N_OBS 32\n\/\/#define N_TOKENS 9\n#define N_STATES  64\n#define N_OBS     140\n#define N_TOKENS  64\n\nint viterbi( tok_t obs[N_OBS], prob_t init[N_STATES], prob_t transition[N_STATES*N_STATES], prob_t emission[N_STATES*N_TOKENS], state_t path[N_OBS] );\n\n\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\n\/\/ Test harness interface code.\n\nstruct bench_args_t {\n  tok_t obs[N_OBS];\n  prob_t init[N_STATES];\n  prob_t transition[N_STATES*N_STATES];\n  prob_t emission[N_STATES*N_TOKENS];\n  state_t path[N_OBS];\n};\n#include \"viterbi.h\"\n\nint viterbi( tok_t obs[N_OBS], prob_t init[N_STATES], prob_t transition[N_STATES*N_STATES], prob_t emission[N_STATES*N_TOKENS], state_t path[N_OBS] )\n{\n  prob_t llike[N_OBS][N_STATES];\n  step_t t;\n  state_t prev, curr;\n  prob_t min_p, p;\n  state_t min_s, s;\n  \/\/ All probabilities are in -log space. (i.e.: P(x) => -log(P(x)) )\n \n  \/\/ Initialize with first observation and initial probabilities\n  L_init: for( s=0; s<N_STATES; s++ ) {\n    llike[0][s] = init[s] + emission[s*N_TOKENS+obs[0]];\n  }\n\n  \/\/ Iteratively compute the probabilities over time\n  L_timestep: for( t=1; t<N_OBS; t++ ) {\n    L_curr_state: for( curr=0; curr<N_STATES; curr++ ) {\n      \/\/ Compute likelihood HMM is in current state and where it came from.\n      prev = 0;\n      min_p = llike[t-1][prev] +\n              transition[prev*N_STATES+curr] +\n              emission[curr*N_TOKENS+obs[t]];\n      L_prev_state: for( prev=1; prev<N_STATES; prev++ ) {\n        p = llike[t-1][prev] +\n            transition[prev*N_STATES+curr] +\n            emission[curr*N_TOKENS+obs[t]];\n        if( p<min_p ) {\n          min_p = p;\n        }\n      }\n      llike[t][curr] = min_p;\n    }\n  }\n\n  \/\/ Identify end state\n  min_s = 0;\n  min_p = llike[N_OBS-1][min_s];\n  L_end: for( s=1; s<N_STATES; s++ ) {\n    p = llike[N_OBS-1][s];\n    if( p<min_p ) {\n      min_p = p;\n      min_s = s;\n    }\n  }\n  path[N_OBS-1] = min_s;\n\n  \/\/ Backtrack to recover full path\n  L_backtrack: for( t=N_OBS-2; t>=0; t-- ) {\n    min_s = 0;\n    min_p = llike[t][min_s] + transition[min_s*N_STATES+path[t+1]];\n    L_state: for( s=1; s<N_STATES; s++ ) {\n      p = llike[t][s] + transition[s*N_STATES+path[t+1]];\n      if( p<min_p ) {\n        min_p = p;\n        min_s = s;\n      }\n    }\n    path[t] = min_s;\n  }\n\n  return 0;\n}\n\n [QoR Targets] least lut, least ff, least dsp, least bram, least uram, least srl, least cp, and least power. Please finish the script. Template ( choose options <xxx|xxxx>; if you choose `OMIT` for a line, delete that entire line;<xxx|xxxx> means choose one of the options from xxx and xxxx):set_directive_unroll -factor <2 viterbi\/L_init | OMIT>\nset_directive_pipeline <off | -style stp | OMIT> viterbi\/L_init\nset_directive_unroll -factor <2 viterbi\/L_end | OMIT>\nset_directive_pipeline <off | -style stp | OMIT> viterbi\/L_end\nset_directive_unroll -factor <2 viterbi\/L_backtrack | OMIT>\nset_directive_pipeline <off | -style stp | OMIT> viterbi\/L_backtrack\nset_directive_loop_flatten <viterbi\/L_timestep | -off viterbi\/L_timestep>\nset_directive_unroll -factor <2 viterbi\/L_curr_state | OMIT>\nset_directive_pipeline <off | -style stp | OMIT> viterbi\/L_curr_state\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi llike\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi llike\nset_directive_bind_storage -type ram_1 -impl impl_mem -latency -1 viterbi llike\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi obs\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi obs\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi init\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi init\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi transition\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi transition\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi emission\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi emission\nset_directive_array_partition -factor 2 -type <cyclic | block | OMIT> viterbi path\nset_directive_array_reshape -factor 2 -type <cyclic | block | OMIT> viterbi path\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_timestep t\nset_directive_bind_op -op sub -impl <fabric | dsp> -latency -1 viterbi\/L_backtrack t\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_prev_state prev\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_curr_state curr\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_init s\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_end s\nset_directive_bind_op -op add -impl <fabric | dsp> -latency -1 viterbi\/L_state s\nset_directive_bind_op -op dadd -impl <fabric | fulldsp> -latency -1 viterbi\/L_curr_state min_p\nset_directive_bind_op -op dadd -impl <fabric | fulldsp> -latency -1 viterbi\/L_backtrack min_p\nset_directive_bind_op -op dadd -impl <fabric | fulldsp> -latency -1 viterbi\/L_prev_state p\nset_directive_bind_op -op dadd -impl <fabric | fulldsp> -latency -1 viterbi\/L_state p\nNotes:\n - All replacements must obey case-sensitivity and the allowed choices. Output only the completed script, prefixed by the single line `tcl:` as specified above.\n"
inputs = tokenizer(prompt, return_tensors="pt").to(model.device)

# ====================
# ====================
with torch.no_grad():
    outputs = model.generate(
        **inputs,
        max_new_tokens=1024,   # 
        num_beams=4,          # beam search
        do_sample=False,
        eos_token_id=tokenizer.eos_token_id,
        pad_token_id=tokenizer.pad_token_id
    )

generated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)

print("=== Prompt ===")
print(prompt)
print("\n=== Model Output ===")
print(generated_text)

