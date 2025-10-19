import re
from typing import Dict, Tuple, Optional
import numpy as np
import textwrap
import copy
import json
import os
import subprocess
import tempfile

import textwrap

from sentence_transformers import SentenceTransformer
from verl.utils.performance_reward.kk_performance_reward import compute_reward
from verl.utils.performance_reward.kk_ppa import run_vitis_hls

comparer = SentenceTransformer("all-MiniLM-L6-v2")

def find_name_position(name, name_list, one_based=False,
                       case_sensitive=True, default=None):
    """
    Return the position of `name` in `name_list`.
    - one_based=False -> returns 0-based index (default)
    - one_based=True  -> returns 1-based position
    - case_sensitive=False -> match ignoring case
    - default -> value returned if name not found (if None, ValueError is raised)
    """
    if not case_sensitive:
        lowered = [n.lower() for n in name_list]
        key = name.lower()
        try:
            idx = lowered.index(key)
        except ValueError:
            if default is not None:
                return default
            raise ValueError(f"'{name}' not found in name_list")
    else:
        try:
            idx = name_list.index(name)
        except ValueError:
            if default is not None:
                return default
            raise ValueError(f"'{name}' not found in name_list")

    return idx + 1 if one_based else idx

def validate_response_structure(processed_str: str) -> float:
    """Performs comprehensive validation of response structure.

    Args:
        processed_str: Processed response string from the model

    Returns:
        Float score based on validation results
    """
    print("\n[Structure Validation]")

    # Check required tags
    tags = {
        'think_start': ('<think>', 1),
        'think_end': ('</think>', 1),
        'answer_start': ('<answer>', 1),
        'answer_end': ('</answer>', 1)
    }
    # functions = ['Loop directive',
    #              'Function directive',
    #              'Array and memory directive',
    #              'Operator directive']
    positions = {}
    for tag_name, (tag_str, expected_count) in tags.items():
        count = processed_str.count(tag_str)
        positions[tag_name] = pos = processed_str.find(tag_str)

        print(f"  {tag_str}: count={count}, position={pos}")

        if count != expected_count:
            print(f"  [Error] {tag_str} appears {count} times (expected {expected_count})")
            return -1.0

    # Verify tag order
    if (positions['think_start'] > positions['think_end'] or
            positions['think_end'] > positions['answer_start'] or
            positions['answer_start'] > positions['answer_end']):
        print("  [Error] Incorrect tag order: Expected <think>...</think><answer>...</answer>")
        return -1.0
    else:
        print("  Tag sequence validation passed")

    #Verify FADR analysis
    # for func in functions:
    #     if processed_str.find(func) == -1:
    #         print(f"  [Error] Reasoning does not contain subfield '{func}'")
    #         return -0.5
    # Validate answer content format
    answer_pattern = r'<answer>(.*?)</answer>'
    matches = list(re.finditer(answer_pattern, processed_str, re.DOTALL))

    if len(matches) != 1:
        print("  [Error] Should have exactly 1 answer tag")
        return -1.0

    return 1.0


def extract_code(raw_response: str, ori_prj_path, case, top, bench, device, clk) -> Optional[str]:
    """
    Extracts and returns only the HLS/C++ code from inside the <answer>…</answer>
    of a raw model response. Strips away markdown fences and leading indentation.

    Args:
        raw_response: the full raw string (including <think> and <answer> tags)

    Returns:
        A single string containing the concatenated code blocks, or None if nothing found.
    """
    # 1) Isolate the <answer> block
    # answer_match = re.search(r'<answer>([\s\S]*?)</answer>', raw_response, re.DOTALL)
    # if not answer_match:
    #     return None
    # answer_body = answer_match.group(1)

    # 2) Find all triple-backtick code fences labeled tcl
    print("raw_response:\n", raw_response)
    m = re.search(r'tcl:\s*\n([\s\S]*)```', raw_response)
    if m:
        code_blocks = m.group(1)
        if not code_blocks:
            return None
        else:
            cleaned = code_blocks.replace("`", "").replace("\\/", "/").strip()
    else:
        return None
    # 3) Dedent each block, then join them
    #cleaned_blocks = [textwrap.dedent(block).rstrip() for block in code_blocks]
    opt_dir = os.path.join(ori_prj_path, 'dir_test.tcl')
    with open(opt_dir, 'w') as f:
        f.write(cleaned)
        print("Wrote extracted code to dir_test.tcl: ", cleaned)

    script_path = os.path.join(ori_prj_path, 'hls_temp.tcl')

    # ensure target directory exists (do not create other dirs, just in case)
    os.makedirs(ori_prj_path, exist_ok=True)

    with open(script_path, "w") as fw:
        # change directory to project path
        fw.write(f'cd {ori_prj_path}\n')

        # open project (original had same action for both branches)
        fw.write('open_project prj\n')

        # add source files
        fw.write(f'add_files {case}.c\n')
        if bench == 'MachSuite':
            fw.write('add_files local_support.c\n')
        elif bench == 'Polybench':
            fw.write(f'add_files {case}.h\n')

        # top and solution settings
        fw.write(f'set_top {top}\n')
        fw.write('open_solution -reset solution\n')
        fw.write(f'set_part {device}\n')
        fw.write(f'create_clock -period {clk}\n')

        # source a local dir_test.tcl if exists in ori_prj_path (keeps original behavior)
        fw.write(f'source {os.path.join(ori_prj_path, "dir_test.tcl")}\n')

        # run csynth and optionally export impl
        fw.write('csynth_design\n')

        fw.write('exit\n')

    return script_path


def extract_reasoning(solution_str):
    if solution_str == 'Nil':
        return 'Nil'
    reasoning_pattern = r'<think>(.*?)</think>'

    matches = list(re.finditer(reasoning_pattern, solution_str, re.DOTALL))

    if len(matches) == 0:
        return 'Nil'

    m = matches[0]
    full_think_block = m.group(0)
    return full_think_block



# You could also make this configurable rather than hard-coding:
HLS_INCLUDE = "***" # adjust to your HLS include path

import os
import subprocess
import tempfile

# adjust these to wherever your HLS headers live
VITIS_ROOT = "/shared/hdd/c2hls/vitis_hls"
HLS_INCLUDE      = os.path.join(VITIS_ROOT, "include")
AUTOPILOT_INCLUDE = os.path.join(VITIS_ROOT, "common", "technology", "autopilot")

def validate_syn(code: str, path) -> bool:
    """
    Returns True if `code` is syntactically valid C++ (with HLS annotations)
    as far as g++ -fsyntax-only can tell.  On failure, prints the compiler errors.
    """
    # 1) dump code to a temp .cpp file
    p = subprocess.Popen('vitis_hls -f ' + code, shell=True, cwd=path)
    try:
        p.wait(3600)
    except subprocess.TimeoutExpired:
        p.terminate()
        print("[INFO] Subprocess timeout !")
        with open('./runtime.log', 'a') as tlog:
            tlog.write(("Iteration, Timeout !" ) + '\n')

    return p.returncode == 0

def extract_truth_code(raw: str) -> str:
    """
    Given a raw response string (which may begin with "Optimized Version:" and
    possibly some stray markdown fences like ```h or ```cpp), return only the
    C/HLS code starting at the first #include, with all leading indentation
    normalized away.

    If no `#include` is found, returns an empty string.
    """
    # 1) Find the position of the first #include (start of the real code)
    m = re.search(r'(#include\b)', raw)
    if not m:
        return ""
    code = raw[m.start():]

    # 2) Drop any markdown fences (```h, ```cpp, or plain ```)
    code = re.sub(r'```(?:h|cpp)?\s*', '', code)
    code = re.sub(r'\s*```$', '', code)

    # 3) Dedent to flush‐left
    code = textwrap.dedent(code).strip()

    return code

def compute_similarity(condensed_reasoning, condensed_truth):

    pair = [condensed_reasoning, condensed_truth]

    embeddings = comparer.encode(pair)
    print("Shape of the embeddings:\n")
    print(embeddings.shape)

    similarities = comparer.similarity(embeddings, embeddings)
    print("Raw Similarity Score:\n")
    print(similarities)

    return similarities[0, 1].item()
    

def condense_reasoning(reasoning: str) -> str:
    """
    Remove <think> tags and specified list headers from a reasoning string,
    replacing each removal with a single newline.
    """
    # 1. Remove <think> and </think> tags
    condensed = re.sub(r'</?think>', '\n', reasoning)

    # 2. Define the list headers to remove
    # headers = [
    #     'to optimize the HLS codes for the given target, we can add optimization directive according to these reasons. ',
    #     '. Loop directive',
    #     '. function directive',
    #     '. array and memory directive',
    #     '. operator directive'
    # ]

    # # 3. Remove each header, replacing it with a newline
    # for header in headers:
    #     # we escape any regex-special chars just in case
    #     escaped = re.escape(header)
    #     condensed = re.sub(escaped, '', condensed)

    # 4. Collapse multiple blank lines into a single newline
    # condensed = re.sub(r'\n+', '\n', condensed).strip()

    return condensed

def compute_score(keyword: Dict[str, str],
                  solution_str: str,
                  ground_truth: Dict[str, str],
                  format_reward: float = 1.0,
                  answer_reward: float = 1.0,
                  reward_ablation: str = 'base_reward',
                  response_length: int = 0,
                  max_response_length: int = 0):
    """Computes comprehensive score for model response."""
    print("\n" + "=" * 80)
    print(" Processing New Sample ".center(80, '='))
    nameList = ['aes', 'bfs_bulk', 'fft_strided', 'gemm_ncubed', 'md_knn', 'nw', 'sort_radix', 'spmv_ellpack',
                'stencil3d', 'viterbi']
    # Parse ground truth data
    # truth_code = ground_truth.get('output', 'Nil')
    # truth_reasoning = extract_reasoning(ground_truth.get('reasoning', 'Nil'))
    # if truth_code == 'Nil' or truth_reasoning == 'Nil':
    #     print(" Error: Failed to extract truth code/reasoning")
    #     return 0
    # truth_code = extract_truth_code(truth_code)

    # if not validate_syn(truth_code):
    #     print(" Error: Truth Code failed syntax validation")
    #     return 0

    # # Validate response structure, complete 7.17
    #format_score = validate_response_structure(solution_str) * format_reward
    # print(f"\n  Format validation score: {format_score}")

    # #Extract reasoning trace and actual code
    # reasoning = extract_reasoning(solution_str) #<think>...</think>
    ori_prj_path = f"xxx/benchmark/MachSuite/{keyword['case']}/{keyword['folder']}" # adjust to your benchmark path
    code = extract_code(solution_str, ori_prj_path, case=keyword['case'], top=keyword['top'], bench='MachSuite', device="xc7vx485tffg1761-2",
                  clk=10) # only contains code

    # Initialize answer score-----------------------------------
    answer_score = 0
    if code is None:
        format_score = 0.0
    else:
        format_score = 1.0
    if format_score > 0:

        print(f"\n[Syntax Validation & Similarity Scoring]\n")

        if validate_syn(code, ori_prj_path):
            # condensed_reasoning = condense_reasoning(reasoning)
            # condensed_truth = condense_reasoning(truth_reasoning)

            # if compute_similarity(condensed_reasoning, condensed_truth) > 0.8:
            #     answer_score = 1
            # else:
            #     answer_score = -0.5
            answer_score = 1.0
            print("Candidate Response Passed syn validation\n")
            #0.8 as threshold...?
        else:
            #Perform Similarity Scoring
            print("Candidate Response Failed syn validation\n")
            answer_score = -1.0

        # if reward_ablation == 'reward_w_length':
        #     length_bonus = 0.2 if response_length > 120 else 0.0
        #     length_penalty = -1.0 if response_length >= max_response_length else 0.0
        #     answer_score += length_bonus + length_penalty
    else:
        answer_score = -2.0
        print("\n[Content Validation] Skipped due to format errors or missing answer")

    performance_score = 0
    if answer_score == 1.0:
        candidate = run_vitis_hls(case=keyword['case'],
                  top=keyword['top'],
                  ver=keyword['folder'],
                  ori_prj_path=ori_prj_path,
                  bench='MachSuite'
                  )
        #index = find_name_position(keyword['case'], nameList)
        performance_score = 100000000*compute_reward(candidate, keyword['case'])
    else:
        performance_score = 0

    total_score = answer_score + performance_score
    print("\n" + "-" * 80)
    print(f" Final Score ".center(80, '-'))
    print(f"  Format: {format_score}")
    print(f"  Answer: {answer_score}")
    print(f"  Total: {total_score}")
    print("=" * 80 + "\n")

    return total_score
