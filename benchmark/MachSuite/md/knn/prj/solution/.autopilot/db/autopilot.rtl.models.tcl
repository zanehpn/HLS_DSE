set SynModuleInfo {
  {SRCNAME md_kernel MODELNAME md_kernel RTLNAME md_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME md_kernel_dsub_64ns_64ns_64_4_no_dsp_1 RTLNAME md_kernel_dsub_64ns_64ns_64_4_no_dsp_1 BINDTYPE op TYPE dsub IMPL fabric LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dadddsub_64ns_64ns_64_5_full_dsp_1 RTLNAME md_kernel_dadddsub_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dadd_64ns_64ns_64_5_full_dsp_1 RTLNAME md_kernel_dadd_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dmul_64ns_64ns_64_4_no_dsp_1 RTLNAME md_kernel_dmul_64ns_64ns_64_4_no_dsp_1 BINDTYPE op TYPE dmul IMPL fabric LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dmul_64ns_64ns_64_5_full_dsp_1 RTLNAME md_kernel_dmul_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_dmul_64ns_64ns_64_5_max_dsp_1 RTLNAME md_kernel_dmul_64ns_64ns_64_5_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_ddiv_64ns_64ns_64_22_no_dsp_1 RTLNAME md_kernel_ddiv_64ns_64ns_64_22_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 21 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_mux_21_64_1_1 RTLNAME md_kernel_mux_21_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_mux_21_32_1_1 RTLNAME md_kernel_mux_21_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_mux_225_64_1_1 RTLNAME md_kernel_mux_225_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME md_kernel_flow_control_loop_pipe RTLNAME md_kernel_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME md_kernel_flow_control_loop_pipe_U}
    }
  }
}
