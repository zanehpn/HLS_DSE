set SynModuleInfo {
  {SRCNAME fft MODELNAME fft RTLNAME fft IS_TOP 1
    SUBMODULES {
      {MODELNAME fft_dadddsub_64ns_64ns_64_5_full_dsp_1 RTLNAME fft_dadddsub_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_dmul_64ns_64ns_64_5_full_dsp_1 RTLNAME fft_dmul_64ns_64ns_64_5_full_dsp_1 BINDTYPE op TYPE dmul IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_dmul_64ns_64ns_64_5_max_dsp_1 RTLNAME fft_dmul_64ns_64ns_64_5_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_mux_223_64_1_1 RTLNAME fft_mux_223_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fft_mux_22_64_1_1 RTLNAME fft_mux_22_64_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
}
