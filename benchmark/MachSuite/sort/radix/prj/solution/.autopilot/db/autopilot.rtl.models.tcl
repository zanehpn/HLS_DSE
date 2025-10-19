set SynModuleInfo {
  {SRCNAME init.1 MODELNAME init_1 RTLNAME ss_sort_init_1
    SUBMODULES {
      {MODELNAME ss_sort_flow_control_loop_pipe_sequential_init RTLNAME ss_sort_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ss_sort_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME hist.1 MODELNAME hist_1 RTLNAME ss_sort_hist_1
    SUBMODULES {
      {MODELNAME ss_sort_mux_21_32_1_1 RTLNAME ss_sort_mux_21_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME ss_sort_mux_22_32_1_1 RTLNAME ss_sort_mux_22_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME local_scan.1_Pipeline_local_2 MODELNAME local_scan_1_Pipeline_local_2 RTLNAME ss_sort_local_scan_1_Pipeline_local_2
    SUBMODULES {
      {MODELNAME ss_sort_mux_254_32_1_1 RTLNAME ss_sort_mux_254_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME local_scan.1 MODELNAME local_scan_1 RTLNAME ss_sort_local_scan_1}
  {SRCNAME sum_scan.1_Pipeline_sum_1 MODELNAME sum_scan_1_Pipeline_sum_1 RTLNAME ss_sort_sum_scan_1_Pipeline_sum_1
    SUBMODULES {
      {MODELNAME ss_sort_mux_258_32_1_1 RTLNAME ss_sort_mux_258_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sum_scan.1 MODELNAME sum_scan_1 RTLNAME ss_sort_sum_scan_1}
  {SRCNAME last_step_scan.1 MODELNAME last_step_scan_1 RTLNAME ss_sort_last_step_scan_1}
  {SRCNAME update.1 MODELNAME update_1 RTLNAME ss_sort_update_1}
  {SRCNAME ss_sort MODELNAME ss_sort RTLNAME ss_sort IS_TOP 1}
}
