import os
import glob
import shutil

def createFolder(folder_path):
    if not os.path.exists(folder_path):
        os.mkdir(folder_path)

def get_adb_rpt_verilog(top, ori_prj_path):
    ir_path = 'prj/solution/.autopilot/db/'
    prj_path = os.path.join(ori_prj_path, 'prj_new')

    createFolder(prj_path)
    graph_path = os.path.join(prj_path, 'graph')
    report_path = os.path.join(prj_path, 'report')

    createFolder(graph_path)
    createFolder(report_path)

    for adb_file in glob.glob(os.path.join(ori_prj_path, ir_path) + '*.adb'):
        if 'bind' not in adb_file and 'sched' not in adb_file:
            func_name = (adb_file.split('/')[-1]).split('.')[0]
            adb_path_ori = os.path.join(ori_prj_path, ir_path + func_name + '.adb')
            adb_xml_path_ori = os.path.join(ori_prj_path, ir_path + func_name + '.adb.xml')
            shutil.copy(adb_path_ori, graph_path)
            shutil.copy(adb_xml_path_ori, graph_path)

    # copy ll and bc files
    bc_path = os.path.join(ori_prj_path, ir_path, 'a.o.3.bc')
    ll_path = os.path.join(ori_prj_path, ir_path, 'apatb_' + top + '_ir.ll')
    if os.path.exists(bc_path):
        shutil.copy(bc_path, graph_path)
    if os.path.exists(ll_path):
        shutil.copy(ll_path, graph_path)

    # copy hls reports
    verbose_rpt = os.path.join(ori_prj_path, ir_path, top + '.verbose.rpt')
    verbose_xml = verbose_rpt + '.xml'
    csyn_path = 'prj/solution/syn/report'
    hls_rpt = os.path.join(ori_prj_path, csyn_path, top + '_csynth.rpt')
    hls_xml = os.path.join(ori_prj_path, csyn_path, top + '_csynth.xml')
    hls_rpt_full = os.path.join(ori_prj_path, csyn_path, 'csynth.rpt')
    hls_xml_full = os.path.join(ori_prj_path, csyn_path, 'csynth.xml')
    solution_path = 'prj/solution'
    directive_record = os.path.join(ori_prj_path, solution_path, 'solution.directive')
    solution_log = os.path.join(ori_prj_path, solution_path, 'solution.log')
    solution_data = os.path.join(ori_prj_path, solution_path, 'solution_data.json')
    hls_rpt_list = [verbose_rpt, verbose_xml, hls_rpt, hls_xml, hls_rpt_full, hls_xml_full, directive_record,
                    solution_log, solution_data]
    for hls_idx in hls_rpt_list:
        if os.path.exists(hls_idx):
            shutil.copy(hls_idx, report_path)

    rpt_list = [hls_rpt, hls_xml]

    return rpt_list, prj_path