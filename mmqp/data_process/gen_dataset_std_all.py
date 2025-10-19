import os
import glob
import json
import torch
import networkx as nx
from graph_construct import CDFG
from feature_encode import *
from gen_dataframe import generate_dataframe

# General node features
n_num_items    = ['m_delay', 'latency', 'bitwidth', 'lut', 'ff', 'dsp']
n_num_items_cp = ['m_delay', 'latency']

bench_list = ['aes', 'bfs', 'fft', 'gemm', 'md', 'nw', 'sort', 'spmv', 'stencil', 'viterbi']
ver_list   = ['aes', 'bulk', 'strided', 'ncubed', 'knn', 'nw', 'radix', 'ellpack', 'stencil3d', 'viterbi']
top_list   = ['aes256_encrypt_ecb', 'bfs', 'fft', 'gemm', 'md_kernel', 'needwun', 'ss_sort', 'ellpack',
              'stencil3d', 'viterbi']

root     = os.path.abspath('../../dataset')
bench_path = os.path.abspath('../../benchmark/MachSuite')
common_path = os.path.abspath('../../benchmark/MachSuite/common')
raw_root = os.path.join(root, 'raw')  # raw HLS dataset path
std_path = os.path.join(root, 'std')  # standard dataset
rdc_path = os.path.join(root, 'rdc')  # reduced dataset

for idx_b in range(len(bench_list)):
    bench_name = bench_list[idx_b]
    bench_ver  = ver_list[idx_b]
    print(f"************************** {bench_name} starts processing **************************")
    top_name = top_list[idx_b]  # top function name

    bench    = os.path.join(raw_root, bench_name, bench_ver)
    if not os.path.isdir(bench):
        continue

    bench_code = os.path.join(bench_path, bench_name, bench_ver, f'{bench_name}.c')
    header_file = os.path.join(bench_path, bench_name, bench_ver, f'{bench_name}.h')
    with open(bench_code, 'r') as f:
        bench_code_content = f.read()
    with open(header_file, 'r') as f:
        header_content = f.read()
    
    ppa_path   = os.path.join(bench, 'script')
    ppa_json   = os.path.join(ppa_path, 'ppa_*.json')
    sample_num = len(glob.glob(ppa_json))
    if sample_num == 0:
        continue

    std_dataframe_list = []
    rdc_dataframe_list = []

    for idx in range(sample_num):
        prj      = f'prj_{idx}'
        print(f"{prj} process...")

        # Load PPA JSON
        ppa_rpt = os.path.join(ppa_path, f'ppa_{idx}.json')
        with open(ppa_rpt, 'r') as f:
            ppa_info = json.load(f)

        dict_metric = ppa_info['IMPL']
        dict_hls    = ppa_info['HLS']
        metric_list = list(dict_metric.values())
        hls_attr    = list(dict_hls.values())

        myIRfolder   = os.path.join(bench, prj, 'graph')
        mySavePath   = os.path.join(bench, prj, 'cdfg')
        if not os.path.isdir(myIRfolder):
            continue
        os.makedirs(mySavePath, exist_ok=True)

        graph      = CDFG(myIRfolder, mySavePath, top_name)
        DG         = graph.G
        std_dot    = os.path.join(mySavePath, 'std_pyg_G.dot')
        std_pyg_dot = generate_pyg_dot(DG, std_dot, n_num_items)
        std_pyg_dot = nx.convert_node_labels_to_integers(std_pyg_dot)

        std_pt = os.path.join(mySavePath, 'std_pyg_G.pt')
        std_dataframe = generate_dataframe(
            std_pyg_dot, metric_list, hls_attr,
            bench_name, prj, std_pt
        )
        tcl_path = os.path.join(ppa_path, f'dir_{idx}.tcl')
        if os.path.isfile(tcl_path):
            with open(tcl_path, 'r') as tf:
                std_dataframe.script = tf.read()
        else:
            std_dataframe.script = ""

        std_dataframe.script = header_content + bench_code_content + std_dataframe.script
        std_dataframe_list.append(std_dataframe)

        rdc_dot    = os.path.join(mySavePath, 'rdc_pyg_G.dot')
        rdc_pyg_dot = generate_pyg_dot(DG, rdc_dot, n_num_items_cp)
        rdc_pyg_dot = nx.convert_node_labels_to_integers(rdc_pyg_dot)

        rdc_pt       = os.path.join(mySavePath, 'rdc_pyg_G.pt')

        rdc_hls_attr = [hls_attr[-1]]
        rdc_dataframe = generate_dataframe(
            rdc_pyg_dot, metric_list, rdc_hls_attr,
            bench_name, prj, rdc_pt
        )

        if os.path.isfile(tcl_path):
            rdc_dataframe.script = std_dataframe.script
        else:
            rdc_dataframe.script = ""
        
        rdc_dataframe.script = header_content + bench_code_content + rdc_dataframe.script

        rdc_dataframe_list.append(rdc_dataframe)

    torch.save(std_dataframe_list, os.path.join(std_path, f'{bench_name}.pt'))
    torch.save(rdc_dataframe_list, os.path.join(rdc_path, f'{bench_name}.pt'))
