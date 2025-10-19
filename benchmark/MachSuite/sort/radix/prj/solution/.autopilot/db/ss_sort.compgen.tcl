# This script segment is generated automatically by AutoPilot

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
    id 55 \
    name a_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename a_0 \
    op interface \
    ports { a_0_address0 { O 9 vector } a_0_ce0 { O 1 bit } a_0_we0 { O 1 bit } a_0_d0 { O 64 vector } a_0_q0 { I 64 vector } a_0_address1 { O 9 vector } a_0_ce1 { O 1 bit } a_0_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'a_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 56 \
    name a_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename a_1 \
    op interface \
    ports { a_1_address0 { O 9 vector } a_1_ce0 { O 1 bit } a_1_we0 { O 1 bit } a_1_d0 { O 64 vector } a_1_q0 { I 64 vector } a_1_address1 { O 9 vector } a_1_ce1 { O 1 bit } a_1_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'a_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 57 \
    name b_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename b_0 \
    op interface \
    ports { b_0_address0 { O 9 vector } b_0_ce0 { O 1 bit } b_0_we0 { O 1 bit } b_0_d0 { O 64 vector } b_0_q0 { I 64 vector } b_0_address1 { O 9 vector } b_0_ce1 { O 1 bit } b_0_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'b_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 58 \
    name b_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename b_1 \
    op interface \
    ports { b_1_address0 { O 9 vector } b_1_ce0 { O 1 bit } b_1_we0 { O 1 bit } b_1_d0 { O 64 vector } b_1_q0 { I 64 vector } b_1_address1 { O 9 vector } b_1_ce1 { O 1 bit } b_1_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'b_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 59 \
    name bucket_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bucket_0 \
    op interface \
    ports { bucket_0_address0 { O 9 vector } bucket_0_ce0 { O 1 bit } bucket_0_we0 { O 1 bit } bucket_0_d0 { O 64 vector } bucket_0_q0 { I 64 vector } bucket_0_address1 { O 9 vector } bucket_0_ce1 { O 1 bit } bucket_0_we1 { O 1 bit } bucket_0_d1 { O 64 vector } bucket_0_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bucket_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 60 \
    name bucket_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bucket_1 \
    op interface \
    ports { bucket_1_address0 { O 9 vector } bucket_1_ce0 { O 1 bit } bucket_1_we0 { O 1 bit } bucket_1_d0 { O 64 vector } bucket_1_q0 { I 64 vector } bucket_1_address1 { O 9 vector } bucket_1_ce1 { O 1 bit } bucket_1_we1 { O 1 bit } bucket_1_d1 { O 64 vector } bucket_1_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bucket_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 61 \
    name sum_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename sum_0 \
    op interface \
    ports { sum_0_address0 { O 5 vector } sum_0_ce0 { O 1 bit } sum_0_we0 { O 1 bit } sum_0_d0 { O 64 vector } sum_0_q0 { I 64 vector } sum_0_address1 { O 5 vector } sum_0_ce1 { O 1 bit } sum_0_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sum_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 62 \
    name sum_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename sum_1 \
    op interface \
    ports { sum_1_address0 { O 5 vector } sum_1_ce0 { O 1 bit } sum_1_we0 { O 1 bit } sum_1_d0 { O 64 vector } sum_1_q0 { I 64 vector } sum_1_address1 { O 5 vector } sum_1_ce1 { O 1 bit } sum_1_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'sum_1'"
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


