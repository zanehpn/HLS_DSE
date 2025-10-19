set SynModuleInfo {
  {SRCNAME aes256_encrypt_ecb_Pipeline_ecb1 MODELNAME aes256_encrypt_ecb_Pipeline_ecb1 RTLNAME aes256_encrypt_ecb_aes256_encrypt_ecb_Pipeline_ecb1
    SUBMODULES {
      {MODELNAME aes256_encrypt_ecb_mux_21_8_1_1 RTLNAME aes256_encrypt_ecb_mux_21_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME aes256_encrypt_ecb_flow_control_loop_pipe_sequential_init RTLNAME aes256_encrypt_ecb_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME aes256_encrypt_ecb_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME aes_expandEncKey MODELNAME aes_expandEncKey RTLNAME aes256_encrypt_ecb_aes_expandEncKey
    SUBMODULES {
      {MODELNAME aes256_encrypt_ecb_aes_expandEncKey_sbox_ROM_AUTO_1R RTLNAME aes256_encrypt_ecb_aes_expandEncKey_sbox_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME aes256_encrypt_ecb_Pipeline_ecb2 MODELNAME aes256_encrypt_ecb_Pipeline_ecb2 RTLNAME aes256_encrypt_ecb_aes256_encrypt_ecb_Pipeline_ecb2}
  {SRCNAME aes_addRoundKey_cpy.1 MODELNAME aes_addRoundKey_cpy_1 RTLNAME aes256_encrypt_ecb_aes_addRoundKey_cpy_1}
  {SRCNAME aes_subBytes.1 MODELNAME aes_subBytes_1 RTLNAME aes256_encrypt_ecb_aes_subBytes_1
    SUBMODULES {
      {MODELNAME aes256_encrypt_ecb_aes_subBytes_1_sbox_ROM_AUTO_1R RTLNAME aes256_encrypt_ecb_aes_subBytes_1_sbox_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME aes_shiftRows.1 MODELNAME aes_shiftRows_1 RTLNAME aes256_encrypt_ecb_aes_shiftRows_1}
  {SRCNAME aes_mixColumns.1 MODELNAME aes_mixColumns_1 RTLNAME aes256_encrypt_ecb_aes_mixColumns_1}
  {SRCNAME aes_addRoundKey.1 MODELNAME aes_addRoundKey_1 RTLNAME aes256_encrypt_ecb_aes_addRoundKey_1}
  {SRCNAME aes256_encrypt_ecb_Pipeline_ecb3 MODELNAME aes256_encrypt_ecb_Pipeline_ecb3 RTLNAME aes256_encrypt_ecb_aes256_encrypt_ecb_Pipeline_ecb3}
  {SRCNAME aes256_encrypt_ecb MODELNAME aes256_encrypt_ecb RTLNAME aes256_encrypt_ecb IS_TOP 1}
}
