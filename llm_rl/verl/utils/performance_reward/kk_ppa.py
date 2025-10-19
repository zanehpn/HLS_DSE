import os,subprocess
from typing import List, Tuple, Optional, Dict, Any
import numpy as np
from verl.utils.performance_reward.get_adb_rpt_verilog import get_adb_rpt_verilog
from verl.utils.performance_reward.get_ppa import *
from verl.utils.performance_reward.hgp_pred import *
from verl.utils.performance_reward.parse_xml import *

root = 'xxx' #add your path here

def get_params_path(bench, case, ver):
    if ver == "":
        params_path = os.path.join(root, 'HGBO-DSE', 'config', bench, case + '_params.yaml')
    else:
        params_path = os.path.join(root, 'HGBO-DSE', 'config', bench, case + '_' + ver +
                                        '_params.yaml')
    return params_path

def gen_hls_temp_script(ori_prj_path: str,
                        case: str,
                        top: str,
                        device: str,
                        clk: float,
                        bench: str) -> str:
    """
    Generate an HLS temporary TCL script under `ori_prj_path` and return its path.

    Args:
        ori_prj_path: project root path where the script will be created (and cd'd to in the script).
        case: case name (used to add source files like "<case>.c" or "<case>.h").
        top: top module name (set_top).
        device: FPGA device string for set_part.
        clk: clock period value for create_clock.
        bench: optional bench type; if 'MachSuite' or 'Polybench' extra files are added.
        script_name: name of the generated TCL script (default 'hls_temp.tcl').

    Returns:
        Full path of the generated script (string).
    """
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
  

def run_vitis_hls(case: Optional[str] = None,
                  top: Optional[str] = None,
                  ver: str = "",
                  ori_prj_path: Optional[str] = None,
                  bench: Optional[str] = None
                  ) -> Tuple[str, List[str], Dict[str, Any]]:
    noLatList = ['bfs', 'fft', 'nw', 'stencil']
    params_path = get_params_path(bench, case, ver)
    #print("Using params path:", params_path)
    params = getYaml(params_path)
    #print("Params:", params)
    # gen_hls_temp_script(ori_prj_path, case, top, device, clk, bench)

    # p = subprocess.Popen('vitis_hls -f ' + hls_tcl, shell=True)
    # try:
    #     p.wait(3600)
    # except subprocess.TimeoutExpired:
    #     p.terminate()
    #     print("[INFO] Subprocess timeout !")
    #     with open('./runtime.log', 'a') as tlog:
    #         tlog.write(("Iteration, Timeout !" ) + '\n')
    print("Using HGP to predict PPA values...")
    rpt_list, prj_path = get_adb_rpt_verilog(top, ori_prj_path)
    #print("Report files:", rpt_list)
    #print("Project path:", prj_path)
    dictPPA, fail_flag = getHLS(params, rpt_list)  # get results from HLS
    if fail_flag:
        dictPPA['IMPL'] = {'LUT': 1e8, 'FF': 1e8, 'DSP': 1e8, 'BRAM': 1e8, 'CP': 1e8, 'PWR': 1e8}
    else:
        dict_hls = dictPPA['HLS']
        hls_attr = list(dict_hls.values())
        dictPPA['IMPL'] = getGNNPred(prj_path, hls_attr, case)

    if case in noLatList:
        npower, ncp, narea = normalizePCA(params, dictPPA)
        ppa = [ncp, narea]
    else:
        npower, nlat, ncp, narea = normalizePLCA(params, dictPPA)
        ppa = [nlat, ncp, narea]

    return ppa