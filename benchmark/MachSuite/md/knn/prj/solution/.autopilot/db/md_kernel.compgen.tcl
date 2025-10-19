# This script segment is generated automatically by AutoPilot

set name md_kernel_dsub_64ns_64ns_64_4_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dsub} IMPL {fabric} LATENCY 3 ALLOW_PRAGMA 1
}


set name md_kernel_dadddsub_64ns_64ns_64_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dsub} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name md_kernel_dadd_64ns_64ns_64_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name md_kernel_dmul_64ns_64ns_64_4_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {fabric} LATENCY 3 ALLOW_PRAGMA 1
}


set name md_kernel_dmul_64ns_64ns_64_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name md_kernel_dmul_64ns_64ns_64_5_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {maxdsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name md_kernel_ddiv_64ns_64ns_64_22_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {ddiv} IMPL {fabric} LATENCY 21 ALLOW_PRAGMA 1
}


set id 43
set name md_kernel_mux_21_64_1_1
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


set id 46
set name md_kernel_mux_21_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 1
set din2_signed 0
set dout_width 32
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


set id 53
set name md_kernel_mux_225_64_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 64
set din0_signed 0
set din1_width 64
set din1_signed 0
set din2_width 25
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

set axilite_register_dict [dict create]
# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 187 \
    name force_x_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_x_0 \
    op interface \
    ports { force_x_0_address0 { O 6 vector } force_x_0_ce0 { O 1 bit } force_x_0_we0 { O 1 bit } force_x_0_d0 { O 128 vector } force_x_0_q0 { I 128 vector } force_x_0_address1 { O 6 vector } force_x_0_ce1 { O 1 bit } force_x_0_we1 { O 1 bit } force_x_0_d1 { O 128 vector } force_x_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 188 \
    name force_x_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_x_1 \
    op interface \
    ports { force_x_1_address0 { O 6 vector } force_x_1_ce0 { O 1 bit } force_x_1_we0 { O 1 bit } force_x_1_d0 { O 128 vector } force_x_1_q0 { I 128 vector } force_x_1_address1 { O 6 vector } force_x_1_ce1 { O 1 bit } force_x_1_we1 { O 1 bit } force_x_1_d1 { O 128 vector } force_x_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 189 \
    name force_y_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_y_0 \
    op interface \
    ports { force_y_0_address0 { O 6 vector } force_y_0_ce0 { O 1 bit } force_y_0_we0 { O 1 bit } force_y_0_d0 { O 128 vector } force_y_0_q0 { I 128 vector } force_y_0_address1 { O 6 vector } force_y_0_ce1 { O 1 bit } force_y_0_we1 { O 1 bit } force_y_0_d1 { O 128 vector } force_y_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_y_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 190 \
    name force_y_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_y_1 \
    op interface \
    ports { force_y_1_address0 { O 6 vector } force_y_1_ce0 { O 1 bit } force_y_1_we0 { O 1 bit } force_y_1_d0 { O 128 vector } force_y_1_q0 { I 128 vector } force_y_1_address1 { O 6 vector } force_y_1_ce1 { O 1 bit } force_y_1_we1 { O 1 bit } force_y_1_d1 { O 128 vector } force_y_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_y_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 191 \
    name force_z_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_z_0 \
    op interface \
    ports { force_z_0_address0 { O 6 vector } force_z_0_ce0 { O 1 bit } force_z_0_we0 { O 1 bit } force_z_0_d0 { O 128 vector } force_z_0_q0 { I 128 vector } force_z_0_address1 { O 6 vector } force_z_0_ce1 { O 1 bit } force_z_0_we1 { O 1 bit } force_z_0_d1 { O 128 vector } force_z_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_z_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 192 \
    name force_z_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename force_z_1 \
    op interface \
    ports { force_z_1_address0 { O 6 vector } force_z_1_ce0 { O 1 bit } force_z_1_we0 { O 1 bit } force_z_1_d0 { O 128 vector } force_z_1_q0 { I 128 vector } force_z_1_address1 { O 6 vector } force_z_1_ce1 { O 1 bit } force_z_1_we1 { O 1 bit } force_z_1_d1 { O 128 vector } force_z_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'force_z_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 193 \
    name position_x_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_x_0 \
    op interface \
    ports { position_x_0_address0 { O 6 vector } position_x_0_ce0 { O 1 bit } position_x_0_q0 { I 128 vector } position_x_0_address1 { O 6 vector } position_x_0_ce1 { O 1 bit } position_x_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_x_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 194 \
    name position_x_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_x_1 \
    op interface \
    ports { position_x_1_address0 { O 6 vector } position_x_1_ce0 { O 1 bit } position_x_1_q0 { I 128 vector } position_x_1_address1 { O 6 vector } position_x_1_ce1 { O 1 bit } position_x_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_x_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 195 \
    name position_y_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_y_0 \
    op interface \
    ports { position_y_0_address0 { O 6 vector } position_y_0_ce0 { O 1 bit } position_y_0_q0 { I 128 vector } position_y_0_address1 { O 6 vector } position_y_0_ce1 { O 1 bit } position_y_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_y_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 196 \
    name position_y_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_y_1 \
    op interface \
    ports { position_y_1_address0 { O 6 vector } position_y_1_ce0 { O 1 bit } position_y_1_q0 { I 128 vector } position_y_1_address1 { O 6 vector } position_y_1_ce1 { O 1 bit } position_y_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_y_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 197 \
    name position_z_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_z_0 \
    op interface \
    ports { position_z_0_address0 { O 6 vector } position_z_0_ce0 { O 1 bit } position_z_0_q0 { I 128 vector } position_z_0_address1 { O 6 vector } position_z_0_ce1 { O 1 bit } position_z_0_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_z_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 198 \
    name position_z_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename position_z_1 \
    op interface \
    ports { position_z_1_address0 { O 6 vector } position_z_1_ce0 { O 1 bit } position_z_1_q0 { I 128 vector } position_z_1_address1 { O 6 vector } position_z_1_ce1 { O 1 bit } position_z_1_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'position_z_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 199 \
    name NL_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename NL_0 \
    op interface \
    ports { NL_0_address0 { O 10 vector } NL_0_ce0 { O 1 bit } NL_0_q0 { I 64 vector } NL_0_address1 { O 10 vector } NL_0_ce1 { O 1 bit } NL_0_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'NL_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 200 \
    name NL_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename NL_1 \
    op interface \
    ports { NL_1_address0 { O 10 vector } NL_1_ce0 { O 1 bit } NL_1_q0 { I 64 vector } NL_1_address1 { O 10 vector } NL_1_ce1 { O 1 bit } NL_1_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'NL_1'"
}
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
set InstName md_kernel_flow_control_loop_pipe_U
set CompName md_kernel_flow_control_loop_pipe
set name flow_control_loop_pipe
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix md_kernel_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


