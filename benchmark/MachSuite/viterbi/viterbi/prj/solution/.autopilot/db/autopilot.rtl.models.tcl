set SynModuleInfo {
  {SRCNAME viterbi_Pipeline_L_init MODELNAME viterbi_Pipeline_L_init RTLNAME viterbi_viterbi_Pipeline_L_init
    SUBMODULES {
      {MODELNAME viterbi_mux_21_64_1_1 RTLNAME viterbi_mux_21_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_mux_22_64_1_1 RTLNAME viterbi_mux_22_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_flow_control_loop_pipe_sequential_init RTLNAME viterbi_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME viterbi_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME viterbi_Pipeline_L_timestep_L_curr_state MODELNAME viterbi_Pipeline_L_timestep_L_curr_state RTLNAME viterbi_viterbi_Pipeline_L_timestep_L_curr_state
    SUBMODULES {
      {MODELNAME viterbi_mul_8ns_10ns_17_1_1 RTLNAME viterbi_mul_8ns_10ns_17_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_urem_8ns_8ns_7_12_1 RTLNAME viterbi_urem_8ns_8ns_7_12_1 BINDTYPE op TYPE urem IMPL auto LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_urem_8ns_8ns_8_12_1 RTLNAME viterbi_urem_8ns_8ns_8_12_1 BINDTYPE op TYPE urem IMPL auto LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_mul_7ns_9ns_15_1_1 RTLNAME viterbi_mul_7ns_9ns_15_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_urem_7ns_7ns_6_11_1 RTLNAME viterbi_urem_7ns_7ns_6_11_1 BINDTYPE op TYPE urem IMPL auto LATENCY 10 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME viterbi_Pipeline_L_end MODELNAME viterbi_Pipeline_L_end RTLNAME viterbi_viterbi_Pipeline_L_end}
  {SRCNAME viterbi_Pipeline_L_backtrack MODELNAME viterbi_Pipeline_L_backtrack RTLNAME viterbi_viterbi_Pipeline_L_backtrack}
  {SRCNAME viterbi MODELNAME viterbi RTLNAME viterbi IS_TOP 1
    SUBMODULES {
      {MODELNAME viterbi_dadd_64ns_64ns_64_5_full_dsp_1 RTLNAME viterbi_dadd_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME viterbi_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME viterbi_llike_RAM_1WNR_BRAM_1R1W RTLNAME viterbi_llike_RAM_1WNR_BRAM_1R1W BINDTYPE storage TYPE ram_1wnr IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
