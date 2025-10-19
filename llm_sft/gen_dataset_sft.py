import os, json
import torch
from datasets import Dataset
from bome.tdm.test_gen_config import make_paraDict_for_all, train_genDirConfig, getYaml
from typing import Optional, Tuple
from pathlib import Path
prj = '/xxx/xxx' # your path here 

# noLatList = ['bfs', 'fft', 'nw', 'stencil3d']

# nameList = ['aes', 'bfs', 'fft', 'gemm', 'md', 'nw', 'sort', 'spmv',
#               'stencil', 'viterbi']

# folderList = ['aes', 'bulk', 'strided', 'ncubed', 'knn', 'nw', 'radix', 'ellpack',
#               'stencil3d', 'viterbi']

# toplist = ['aes256_encrypt_ecb', 'bfs', 'fft', 'gemm', 'md_kernel', 'needwun', 'ss_sort', 'ellpack',
#             'stencil3d', 'viterbi']
noLatList = []
nameList = ['polybench_atax','polybench_avg_pool', 'polybench_bicg','polybench_correlation','polybench_covariance','polybench_dft','polybench_durbin','polybench_gesummv','polybench_merge_sort_parallel','polybench_mvt','polybench_sgd','polybench_syrk','polybench_tsp', 'bfs_queue', 'fft_transpose', 'gemm_blocked', 'sort_merge',  'spmv_crs', 'stencil_stencil2d', 'kmp_kmp']
folderList   = ['atax', 'avg_pool', 'bicg', 'correlation', 'covariance', 'dft', 'durbin', 'gesummv', 'merge_sort_parallel', 'mvt','sgd','syrk','tsp', 'queue', 'transpose', 'blocked', 'merge', 'crs', 'stencil2d','kmp']
toplist   = ['atax', 'avg_pool', 'bicg', 'correlation', 'covariance', 'dft', 'durbin', 'gesummv', 'merge_sort_parallel', 'mvt','sgd','syrk','tsp', 'bfs', 'fft', 'gemm', 'ms_mergesort', 'spmv', 'stencil','kmp']

def read_jsonl(path):
    path = Path(path)
    if not path.exists():
        raise FileNotFoundError(f"{path} not found")
    out = []
    with path.open('r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            out.append(json.loads(line))
    return out

# train_list = read_jsonl('train.jsonl')   
# test_list  = read_jsonl('test.jsonl')

# assert all(isinstance(x, dict) for x in train_list), "train_list elements must be dict"
# assert all(isinstance(x, dict) for x in test_list),  "test_list elements must be dict"

# train_ds = Dataset.from_list(train_list)
# test_ds  = Dataset.from_list(test_list)

def get_folder_and_top(base: str,
                       nameList: list,
                       folderList: list,
                       toplist: list) -> Optional[Tuple[str, str]]:
    if not (len(nameList) == len(folderList) == len(toplist)):
        print(f"len(nameList)={len(nameList)}, len(folderList)={len(folderList)}, len(toplist)={len(toplist)}")
        raise ValueError("nameList, folderList and toplist must have the same length")

    # build a dict mapping for O(1) lookup
    mapping = {name: (folder, top) for name, folder, top in zip(nameList, folderList, toplist)}
    return mapping.get(base) 

def generate_dataset_llm(dataset_dir: str, print_info: bool=False):
    """
    Args:
        dataset_dir (str): 
        print_info (bool): 
    
    Returns:
        train_ds (datasets.Dataset): HuggingFace Dataset, fields=["prompt","response"]
        test_ds  (datasets.Dataset): HuggingFace Dataset, fields=["prompt","response"]
    """
    all_files = os.listdir(dataset_dir)
    base_names = {
    fn.replace("_codes.pt", "") for fn in all_files
    if fn.endswith("_codes.pt") and not fn.endswith("_only_codes.pt")
    }

    sorted_bases = sorted(base_names)
    n_bases = len(sorted_bases)

    #test_keywords = ['bfs', 'sort', 'stencil', 'spmv']
    test_keywords = []
    test_bases = [b for b in sorted_bases if any(k.lower() in b.lower() for k in test_keywords)]

    train_bases = [b for b in sorted_bases if b not in test_bases]


    if print_info:
        print(f"Found {n_bases} base types. Train types ({len(train_bases)}): {train_bases}")
        print(f"Test  types ({len(test_bases)}): {test_bases}")

    train_list, test_list = [], []

    qor_names = ['lut', 'ff', 'dsp', 'bram', 'uram', 'srl', 'cp', 'power']

    for base in sorted_bases:
        result_path = os.path.join(dataset_dir, base + '_results.pt')
        if not os.path.exists(result_path):
            if print_info:
                print(f"Warning: base file missing {result_path}, skipping.")
            continue

        result = torch.load(result_path, weights_only=False)

        codes_path = os.path.join(dataset_dir, base + '_only_codes.pt')
        codes = torch.load(codes_path) if os.path.exists(codes_path) else [None] * len(result)

        scripts_path = os.path.join(dataset_dir, base + '_only_scripts.pt')
        scripts = torch.load(scripts_path) if os.path.exists(scripts_path) else [None] * len(result)

        L = len(result)
        if len(codes) != L:
            codes = list(codes) + [None] * (L - len(codes)) if len(codes) < L else codes[:L]
        if len(scripts) != L:
            scripts = list(scripts) + [None] * (L - len(scripts)) if len(scripts) < L else scripts[:L]

        target_list = train_list if base in train_bases else test_list if base in test_bases else train_list

        for g, c, s in zip(result, codes, scripts):
            # QoR target
            print("g: ", g)
            qor_targets = list(g.values()) if all(name in g for name in qor_names) else []
            print("qor_targets: ", qor_targets)
            qor_str = ", ".join(f"{name}: {val}" for name, val in zip(qor_names, qor_targets)) if qor_targets else "unknown"
            if os.path.exists(f'{prj}/config/MachSuite_new/{base}_params.yaml'):
                static_config = getYaml(f'{prj}/config/MachSuite_new/{base}_config.yaml')
                params = getYaml(f'{prj}/config/MachSuite/{base}_params.yaml')
            else:
                static_config = getYaml(f'{prj}/config/polybench/{base}_config.yaml')
                params = getYaml(f'{prj}/config/polybench/{base}_params.yaml')
            paraDict = make_paraDict_for_all(static_config)
            tcl = train_genDirConfig(encode='discrete', params=params, static_config=static_config,
                paraDict=paraDict, dir_tcl='{prj}/llm_finetune/directive.tcl',
                tempDir=None, dir_json='{prj}/llm_finetune/dir.json')
            print("tcl: ", tcl)
            # tcl = ''
            # tcl_path = '{prj}/llm_finetune/directive.tcl'
            # with open(tcl_path, 'r') as f:
            #     tcl = f.read()
            print("base: ", base)
            print("nameList: ", nameList)
            print("toplist: ", toplist)

            folder, top = get_folder_and_top(base, nameList, folderList, toplist)
                        prompt = f'''Given the Xilinx HLS FPGA code and its target QoR metrics [HLS Code,top functions:{top}] {c} [QoR Targets] {g}'''
prompt1 = prompt1 + prompt2
            # ====================
            prompt = f'''Given the Xilinx HLS FPGA code and its target QoR metrics [HLS Code,top functions:{top}] {c} [QoR Targets] {g}'''
            prompt = prompt + prompt1
            response = s if s is not None else ""
            response = "`tcl:\n" + response.strip() + '\n`' if response.strip() else "`tcl:\n`"
            #print(f"Prompt: {prompt}")
            #print(f"Response: {response}")

            target_list.append({"prompt": prompt, "response": response})

        if print_info:
            print(f"Loaded base '{base}': {L} samples -> {'train' if base in train_bases else 'test' if base in test_bases else 'train(fallback)'}")

    if print_info:
        print(f"Total train samples: {len(train_list)}")
        print(f"Total test  samples: {len(test_list)}")

    out_dir = "{prj}/llm_finetune"
    os.makedirs(out_dir, exist_ok=True)
    train_path = os.path.join(out_dir, "train_sft.jsonl")
    test_path  = os.path.join(out_dir, "test_sft.jsonl")


    train_ds = Dataset.from_list(train_list)
    test_ds  = Dataset.from_list(test_list)
    #print(train_list[0])
    #print(test_list[0])

    train_ds.to_json(train_path, orient="records", lines=True)
    test_ds.to_json(test_path, orient="records", lines=True)
    

    return train_ds, test_ds


def extract_text_from_item(item):
    """
    Robustly extract a text/code string from a dataset element.
    Handles:
      - plain str
      - dicts with keys 'text', 'code', 'source', 'prompt', 'answer'
      - tuples/lists like (graph, code, script)
    Returns empty string if nothing found.
    """
    if item is None:
        return ""
    if isinstance(item, str):
        return item
    if isinstance(item, dict):
        for key in ("code", "text", "src", "source", "prompt", "input", "snippet"):
            if key in item and item[key] is not None:
                return str(item[key])
        # fallback: join all str fields
        parts = []
        for v in item.values():
            if isinstance(v, str):
                parts.append(v)
        return "\n".join(parts) if parts else ""
    if isinstance(item, (list, tuple)):
        # assume common tuple shapes: (graph, code, script) -> prefer code/script
        for cand in item[::-1]:  # try last elements first (code/script)
            if isinstance(cand, str):
                return cand
            if cand is None:
                continue
            # if tensor, skip; if object with .code attr, try that
            if hasattr(cand, "code") and isinstance(cand.code, str):
                return cand.code
        # nothing found
        return ""
    # fallback
    try:
        return str(item)
    except:
        return ""

# dataset_dir = os.path.abspath('../dataset/new_std')
# model_dir = os.path.abspath('./model') 
# dataset = os.listdir(dataset_dir)
# train_list, test_list = generate_dataset_llm(dataset_dir, print_info=True)