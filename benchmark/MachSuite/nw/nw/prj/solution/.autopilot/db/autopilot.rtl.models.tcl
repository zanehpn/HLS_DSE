set SynModuleInfo {
  {SRCNAME needwun_Pipeline_init_row MODELNAME needwun_Pipeline_init_row RTLNAME needwun_needwun_Pipeline_init_row
    SUBMODULES {
      {MODELNAME needwun_flow_control_loop_pipe_sequential_init RTLNAME needwun_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME needwun_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME needwun_Pipeline_init_col MODELNAME needwun_Pipeline_init_col RTLNAME needwun_needwun_Pipeline_init_col
    SUBMODULES {
      {MODELNAME needwun_urem_64ns_15ns_14_68_1 RTLNAME needwun_urem_64ns_15ns_14_68_1 BINDTYPE op TYPE urem IMPL auto LATENCY 67 ALLOW_PRAGMA 1}
      {MODELNAME needwun_urem_14ns_14ns_14_18_1 RTLNAME needwun_urem_14ns_14ns_14_18_1 BINDTYPE op TYPE urem IMPL auto LATENCY 17 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mul_64ns_66ns_79_2_1 RTLNAME needwun_mul_64ns_66ns_79_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mul_mul_14ns_15ns_29_4_1 RTLNAME needwun_mul_mul_14ns_15ns_29_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME needwun_Pipeline_fill_in MODELNAME needwun_Pipeline_fill_in RTLNAME needwun_needwun_Pipeline_fill_in
    SUBMODULES {
      {MODELNAME needwun_urem_15ns_15ns_14_19_1 RTLNAME needwun_urem_15ns_15ns_14_19_1 BINDTYPE op TYPE urem IMPL auto LATENCY 18 ALLOW_PRAGMA 1}
      {MODELNAME needwun_urem_15ns_15ns_15_19_1 RTLNAME needwun_urem_15ns_15ns_15_19_1 BINDTYPE op TYPE urem IMPL auto LATENCY 18 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mux_21_8_1_1 RTLNAME needwun_mux_21_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mux_22_32_1_1 RTLNAME needwun_mux_22_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_add_32ns_32ns_32_1_1 RTLNAME needwun_add_32ns_32ns_32_1_1 BINDTYPE op TYPE add IMPL dsp LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_add_32ns_32s_32_1_1 RTLNAME needwun_add_32ns_32s_32_1_1 BINDTYPE op TYPE add IMPL dsp LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mul_mul_15ns_16ns_31_4_1 RTLNAME needwun_mul_mul_15ns_16ns_31_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME needwun_Pipeline_fill_in1 MODELNAME needwun_Pipeline_fill_in1 RTLNAME needwun_needwun_Pipeline_fill_in1}
  {SRCNAME needwun_Pipeline_trace MODELNAME needwun_Pipeline_trace RTLNAME needwun_needwun_Pipeline_trace
    SUBMODULES {
      {MODELNAME needwun_mul_32s_9ns_32_1_1 RTLNAME needwun_mul_32s_9ns_32_1_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mul_32ns_34ns_65_1_1 RTLNAME needwun_mul_32ns_34ns_65_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME needwun_urem_32ns_15ns_32_36_1 RTLNAME needwun_urem_32ns_15ns_32_36_1 BINDTYPE op TYPE urem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME needwun_mux_226_8_1_1 RTLNAME needwun_mux_226_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME needwun_Pipeline_pad_a MODELNAME needwun_Pipeline_pad_a RTLNAME needwun_needwun_Pipeline_pad_a}
  {SRCNAME needwun_Pipeline_pad_b MODELNAME needwun_Pipeline_pad_b RTLNAME needwun_needwun_Pipeline_pad_b}
  {SRCNAME needwun MODELNAME needwun RTLNAME needwun IS_TOP 1}
}
