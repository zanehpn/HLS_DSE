import os
import glob
import json
import torch,re
import networkx as nx
from graph_construct import CDFG
from feature_encode import *
from gen_dataframe import generate_dataframe

# General node features
n_num_items    = ['m_delay', 'latency', 'bitwidth', 'lut', 'ff', 'dsp']
n_num_items_cp = ['m_delay', 'latency']

bench_list = ['polybench', 'polybench','polybench','polybench','polybench','polybench','polybench','polybench','polybench','polybench','polybench','polybench']
ver_list   = ['atax', 'avg_pool', 'bicg', 'correlation', 'covariance', 'dft', 'durbin', 'gesummv', 'merge_sort_parallel', 'mvt','sgd','syrk','tsp']
top_list   = ['atax', 'avg_pool', 'bicg', 'correlation', 'covariance', 'dft', 'durbin', 'gesummv', 'merge_sort_parallel', 'mvt','sgd','syrk','tsp']

cpp_file = ['avg_pool','sgd', 'tsp']
# extra bench
# bench_list = ['bfs', 'fft', 'gemm', 'sort',  'spmv', 'stencil']
# ver_list   = ['queue', 'transpose', 'blocked', 'merge', 'crs', 'stencil2d']
# top_list   = ['bfs', 'fft', 'gemm', 'ms_mergesort', 'spmv', 'stencil']

root     = os.path.abspath('../../dataset')
bench_path = os.path.abspath('../../benchmark/')
common_path = os.path.abspath('../../benchmark/MachSuite/common')
raw_root = os.path.join(root, 'raw')  # raw HLS dataset path
std_path = os.path.join(root, 'new_std')  # standard dataset
rdc_path = os.path.join(root, 'rdc')  # reduced dataset

for idx_b in range(len(bench_list)):
    bench_name = bench_list[idx_b]
    bench_ver  = ver_list[idx_b]
    print(f"************************** {bench_name} starts processing **************************")
    top_name = top_list[idx_b]  # top function name

    bench    = os.path.join(raw_root, bench_name, bench_ver)
    if not os.path.isdir(bench):
        continue
    if bench_ver in cpp_file:
        bench_code = os.path.join(bench_path, bench_name, bench_ver, f'{bench_ver}.cpp')
    else:
        bench_code = os.path.join(bench_path, bench_name, bench_ver, f'{bench_ver}.c')
    #header_file = os.path.join(bench_path, bench_name, bench_ver, f'{bench_ver}.h')
    with open(bench_code, 'r') as f:
        bench_code_content = f.read()
    
    ppa_path   = os.path.join(bench, 'script')
    ppa_json   = os.path.join(ppa_path, 'ppa_*.json')

    std_dataframe_list = []
    std_results = []
    std_only_script = []
    std_only_code = []

    ppa_files = sorted(
        [f for f in os.listdir(ppa_path) if f.startswith('ppa_') and f.endswith('.json')],
        key=lambda x: int(re.search(r'ppa_(\d+)\.json', x).group(1))
    )

    for ppa_file in ppa_files:
        idx = re.search(r'ppa_(\d+)\.json', ppa_file).group(1)
        prj = f'prj_{idx}'
        print(f"{prj} processing...")
        
        ppa_rpt = os.path.join(ppa_path, ppa_file)
        with open(ppa_rpt, 'r') as f:
            ppa_info = json.load(f)
        dict_metric = ppa_info['IMPL']
        
        script = ""
        only_script = ""
        tcl_file = f'dir_{idx}.tcl'
        tcl_path = os.path.join(ppa_path, tcl_file)
        
        if os.path.isfile(tcl_path):
            with open(tcl_path, 'r') as tf:
                script = tf.read()
        
        only_script = script
        only_code =  bench_code_content
        script =  bench_code_content + script
        
        std_dataframe_list.append(script)
        std_only_script.append(only_script)
        std_only_code.append(only_code)
        std_results.append(dict_metric)


    print(std_only_script[0])
    print(std_only_code[0])


    torch.save(std_dataframe_list, os.path.join(std_path, f'{bench_name}_{bench_ver}_codes.pt'))
    torch.save(std_only_script, os.path.join(std_path, f'{bench_name}_{bench_ver}_only_scripts.pt'))
    torch.save(std_only_code, os.path.join(std_path, f'{bench_name}_{bench_ver}_only_codes.pt'))
    torch.save(std_results, os.path.join(std_path, f'{bench_name}_{bench_ver}_results.pt'))
