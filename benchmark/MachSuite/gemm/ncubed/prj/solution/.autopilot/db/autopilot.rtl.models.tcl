set SynModuleInfo {
  {SRCNAME gemm_Pipeline_middle MODELNAME gemm_Pipeline_middle RTLNAME gemm_gemm_Pipeline_middle
    SUBMODULES {
      {MODELNAME gemm_dadd_64ns_64ns_64_5_full_dsp_1 RTLNAME gemm_dadd_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gemm_dmul_64ns_64ns_64_5_full_dsp_1 RTLNAME gemm_dmul_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME gemm_mux_21_64_1_1 RTLNAME gemm_mux_21_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME gemm_flow_control_loop_pipe_sequential_init RTLNAME gemm_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME gemm_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME gemm MODELNAME gemm RTLNAME gemm IS_TOP 1}
}
