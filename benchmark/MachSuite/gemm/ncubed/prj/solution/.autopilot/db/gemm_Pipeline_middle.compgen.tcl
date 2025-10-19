# This script segment is generated automatically by AutoPilot

set name gemm_dadd_64ns_64ns_64_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name gemm_dmul_64ns_64ns_64_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set id 9
set name gemm_mux_21_64_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 64
set din0_signed 0
set din1_width 64
set din1_signed 0
set din2_width 1
set din2_signed 0
set dout_width 64
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 76 \
    name prod_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prod_0 \
    op interface \
    ports { prod_0_address0 { O 10 vector } prod_0_ce0 { O 1 bit } prod_0_we0 { O 1 bit } prod_0_d0 { O 128 vector } prod_0_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prod_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 81 \
    name m2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename m2_0 \
    op interface \
    ports { m2_0_address0 { O 10 vector } m2_0_ce0 { O 1 bit } m2_0_q0 { I 128 vector } m2_0_address1 { O 10 vector } m2_0_ce1 { O 1 bit } m2_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 146 \
    name m2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename m2_1 \
    op interface \
    ports { m2_1_address0 { O 10 vector } m2_1_ce0 { O 1 bit } m2_1_q0 { I 128 vector } m2_1_address1 { O 10 vector } m2_1_ce1 { O 1 bit } m2_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'm2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 212 \
    name prod_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename prod_1 \
    op interface \
    ports { prod_1_address0 { O 10 vector } prod_1_ce0 { O 1 bit } prod_1_we0 { O 1 bit } prod_1_d0 { O 128 vector } prod_1_q0 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prod_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name m1_0_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load \
    op interface \
    ports { m1_0_load { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name zext_ln14_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln14_15 \
    op interface \
    ports { zext_ln14_15 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name m1_1_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load \
    op interface \
    ports { m1_1_load { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name tmp_260 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_260 \
    op interface \
    ports { tmp_260 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name m1_0_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_1 \
    op interface \
    ports { m1_0_load_1 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name m1_1_load_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_1 \
    op interface \
    ports { m1_1_load_1 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name m1_0_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_2 \
    op interface \
    ports { m1_0_load_2 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name m1_1_load_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_2 \
    op interface \
    ports { m1_1_load_2 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name m1_0_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_3 \
    op interface \
    ports { m1_0_load_3 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name m1_1_load_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_3 \
    op interface \
    ports { m1_1_load_3 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name m1_0_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_4 \
    op interface \
    ports { m1_0_load_4 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name m1_1_load_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_4 \
    op interface \
    ports { m1_1_load_4 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name m1_0_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_5 \
    op interface \
    ports { m1_0_load_5 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name m1_1_load_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_5 \
    op interface \
    ports { m1_1_load_5 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name m1_0_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_6 \
    op interface \
    ports { m1_0_load_6 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name m1_1_load_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_6 \
    op interface \
    ports { m1_1_load_6 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name m1_0_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_7 \
    op interface \
    ports { m1_0_load_7 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name m1_1_load_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_7 \
    op interface \
    ports { m1_1_load_7 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name m1_0_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_8 \
    op interface \
    ports { m1_0_load_8 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name m1_1_load_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_8 \
    op interface \
    ports { m1_1_load_8 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name m1_0_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_9 \
    op interface \
    ports { m1_0_load_9 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name m1_1_load_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_9 \
    op interface \
    ports { m1_1_load_9 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name m1_0_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_10 \
    op interface \
    ports { m1_0_load_10 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name m1_1_load_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_10 \
    op interface \
    ports { m1_1_load_10 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name m1_0_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_11 \
    op interface \
    ports { m1_0_load_11 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name m1_1_load_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_11 \
    op interface \
    ports { m1_1_load_11 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name m1_0_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_12 \
    op interface \
    ports { m1_0_load_12 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name m1_1_load_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_12 \
    op interface \
    ports { m1_1_load_12 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name m1_0_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_13 \
    op interface \
    ports { m1_0_load_13 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 107 \
    name m1_1_load_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_13 \
    op interface \
    ports { m1_1_load_13 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name m1_0_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_14 \
    op interface \
    ports { m1_0_load_14 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name m1_1_load_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_14 \
    op interface \
    ports { m1_1_load_14 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name m1_0_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_15 \
    op interface \
    ports { m1_0_load_15 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name m1_1_load_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_15 \
    op interface \
    ports { m1_1_load_15 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name m1_0_load_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_16 \
    op interface \
    ports { m1_0_load_16 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name m1_1_load_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_16 \
    op interface \
    ports { m1_1_load_16 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name m1_0_load_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_17 \
    op interface \
    ports { m1_0_load_17 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name m1_1_load_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_17 \
    op interface \
    ports { m1_1_load_17 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name m1_0_load_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_18 \
    op interface \
    ports { m1_0_load_18 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name m1_1_load_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_18 \
    op interface \
    ports { m1_1_load_18 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name m1_0_load_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_19 \
    op interface \
    ports { m1_0_load_19 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name m1_1_load_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_19 \
    op interface \
    ports { m1_1_load_19 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name m1_0_load_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_20 \
    op interface \
    ports { m1_0_load_20 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name m1_1_load_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_20 \
    op interface \
    ports { m1_1_load_20 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name m1_0_load_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_21 \
    op interface \
    ports { m1_0_load_21 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name m1_1_load_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_21 \
    op interface \
    ports { m1_1_load_21 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name m1_0_load_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_22 \
    op interface \
    ports { m1_0_load_22 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name m1_1_load_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_22 \
    op interface \
    ports { m1_1_load_22 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name m1_0_load_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_23 \
    op interface \
    ports { m1_0_load_23 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name m1_1_load_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_23 \
    op interface \
    ports { m1_1_load_23 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name m1_0_load_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_24 \
    op interface \
    ports { m1_0_load_24 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name m1_1_load_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_24 \
    op interface \
    ports { m1_1_load_24 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name m1_0_load_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_25 \
    op interface \
    ports { m1_0_load_25 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name m1_1_load_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_25 \
    op interface \
    ports { m1_1_load_25 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name m1_0_load_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_26 \
    op interface \
    ports { m1_0_load_26 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name m1_1_load_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_26 \
    op interface \
    ports { m1_1_load_26 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name m1_0_load_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_27 \
    op interface \
    ports { m1_0_load_27 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name m1_1_load_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_27 \
    op interface \
    ports { m1_1_load_27 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name m1_0_load_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_28 \
    op interface \
    ports { m1_0_load_28 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name m1_1_load_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_28 \
    op interface \
    ports { m1_1_load_28 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name m1_0_load_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_29 \
    op interface \
    ports { m1_0_load_29 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name m1_1_load_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_29 \
    op interface \
    ports { m1_1_load_29 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name m1_0_load_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_30 \
    op interface \
    ports { m1_0_load_30 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name m1_1_load_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_30 \
    op interface \
    ports { m1_1_load_30 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name m1_0_load_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_31 \
    op interface \
    ports { m1_0_load_31 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name m1_1_load_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_31 \
    op interface \
    ports { m1_1_load_31 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name m1_0_load_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_32 \
    op interface \
    ports { m1_0_load_32 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name m1_1_load_32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_32 \
    op interface \
    ports { m1_1_load_32 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name m1_0_load_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_33 \
    op interface \
    ports { m1_0_load_33 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name m1_1_load_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_33 \
    op interface \
    ports { m1_1_load_33 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name m1_0_load_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_34 \
    op interface \
    ports { m1_0_load_34 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name m1_1_load_34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_34 \
    op interface \
    ports { m1_1_load_34 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name m1_0_load_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_35 \
    op interface \
    ports { m1_0_load_35 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name m1_1_load_35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_35 \
    op interface \
    ports { m1_1_load_35 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name m1_0_load_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_36 \
    op interface \
    ports { m1_0_load_36 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name m1_1_load_36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_36 \
    op interface \
    ports { m1_1_load_36 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name m1_0_load_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_37 \
    op interface \
    ports { m1_0_load_37 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name m1_1_load_37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_37 \
    op interface \
    ports { m1_1_load_37 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name m1_0_load_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_38 \
    op interface \
    ports { m1_0_load_38 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name m1_1_load_38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_38 \
    op interface \
    ports { m1_1_load_38 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name m1_0_load_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_39 \
    op interface \
    ports { m1_0_load_39 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name m1_1_load_39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_39 \
    op interface \
    ports { m1_1_load_39 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name m1_0_load_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_40 \
    op interface \
    ports { m1_0_load_40 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name m1_1_load_40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_40 \
    op interface \
    ports { m1_1_load_40 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name m1_0_load_41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_41 \
    op interface \
    ports { m1_0_load_41 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name m1_1_load_41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_41 \
    op interface \
    ports { m1_1_load_41 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name m1_0_load_42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_42 \
    op interface \
    ports { m1_0_load_42 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name m1_1_load_42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_42 \
    op interface \
    ports { m1_1_load_42 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name m1_0_load_43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_43 \
    op interface \
    ports { m1_0_load_43 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name m1_1_load_43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_43 \
    op interface \
    ports { m1_1_load_43 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name m1_0_load_44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_44 \
    op interface \
    ports { m1_0_load_44 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name m1_1_load_44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_44 \
    op interface \
    ports { m1_1_load_44 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name m1_0_load_45 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_45 \
    op interface \
    ports { m1_0_load_45 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name m1_1_load_45 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_45 \
    op interface \
    ports { m1_1_load_45 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name m1_0_load_46 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_46 \
    op interface \
    ports { m1_0_load_46 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name m1_1_load_46 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_46 \
    op interface \
    ports { m1_1_load_46 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name m1_0_load_47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_47 \
    op interface \
    ports { m1_0_load_47 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name m1_1_load_47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_47 \
    op interface \
    ports { m1_1_load_47 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name m1_0_load_48 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_48 \
    op interface \
    ports { m1_0_load_48 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name m1_1_load_48 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_48 \
    op interface \
    ports { m1_1_load_48 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name m1_0_load_49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_49 \
    op interface \
    ports { m1_0_load_49 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name m1_1_load_49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_49 \
    op interface \
    ports { m1_1_load_49 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name m1_0_load_50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_50 \
    op interface \
    ports { m1_0_load_50 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name m1_1_load_50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_50 \
    op interface \
    ports { m1_1_load_50 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name m1_0_load_51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_51 \
    op interface \
    ports { m1_0_load_51 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name m1_1_load_51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_51 \
    op interface \
    ports { m1_1_load_51 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name m1_0_load_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_52 \
    op interface \
    ports { m1_0_load_52 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name m1_1_load_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_52 \
    op interface \
    ports { m1_1_load_52 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name m1_0_load_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_53 \
    op interface \
    ports { m1_0_load_53 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name m1_1_load_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_53 \
    op interface \
    ports { m1_1_load_53 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name m1_0_load_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_54 \
    op interface \
    ports { m1_0_load_54 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name m1_1_load_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_54 \
    op interface \
    ports { m1_1_load_54 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name m1_0_load_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_55 \
    op interface \
    ports { m1_0_load_55 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name m1_1_load_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_55 \
    op interface \
    ports { m1_1_load_55 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name m1_0_load_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_56 \
    op interface \
    ports { m1_0_load_56 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name m1_1_load_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_56 \
    op interface \
    ports { m1_1_load_56 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name m1_0_load_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_57 \
    op interface \
    ports { m1_0_load_57 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name m1_1_load_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_57 \
    op interface \
    ports { m1_1_load_57 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name m1_0_load_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_58 \
    op interface \
    ports { m1_0_load_58 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name m1_1_load_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_58 \
    op interface \
    ports { m1_1_load_58 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name m1_0_load_59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_59 \
    op interface \
    ports { m1_0_load_59 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name m1_1_load_59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_59 \
    op interface \
    ports { m1_1_load_59 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name m1_0_load_60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_60 \
    op interface \
    ports { m1_0_load_60 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name m1_1_load_60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_60 \
    op interface \
    ports { m1_1_load_60 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name m1_0_load_61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_61 \
    op interface \
    ports { m1_0_load_61 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name m1_1_load_61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_61 \
    op interface \
    ports { m1_1_load_61 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name m1_0_load_62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_62 \
    op interface \
    ports { m1_0_load_62 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name m1_1_load_62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_62 \
    op interface \
    ports { m1_1_load_62 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name m1_0_load_63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_0_load_63 \
    op interface \
    ports { m1_0_load_63 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name m1_1_load_63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_m1_1_load_63 \
    op interface \
    ports { m1_1_load_63 { I 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name tmp_258 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp_258 \
    op interface \
    ports { tmp_258 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name p_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_cast \
    op interface \
    ports { p_cast { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name trunc_ln17_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln17_1 \
    op interface \
    ports { trunc_ln17_1 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName gemm_flow_control_loop_pipe_sequential_init_U
set CompName gemm_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix gemm_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


