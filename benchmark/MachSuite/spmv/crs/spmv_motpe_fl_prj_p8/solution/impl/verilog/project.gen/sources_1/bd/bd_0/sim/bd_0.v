//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Mon Sep  1 01:03:53 2025
//Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    cols_0_address0,
    cols_0_ce0,
    cols_0_q0,
    cols_1_address0,
    cols_1_ce0,
    cols_1_q0,
    out_0_address0,
    out_0_ce0,
    out_0_d0,
    out_0_we0,
    out_1_address0,
    out_1_ce0,
    out_1_d0,
    out_1_we0,
    rowDelimiters_address0,
    rowDelimiters_address1,
    rowDelimiters_ce0,
    rowDelimiters_ce1,
    rowDelimiters_q0,
    rowDelimiters_q1,
    val_r_address0,
    val_r_ce0,
    val_r_q0,
    vec_address0,
    vec_ce0,
    vec_q0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COLS_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COLS_0_ADDRESS0, LAYERED_METADATA undef" *) output [8:0]cols_0_address0;
  output cols_0_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COLS_0_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COLS_0_Q0, LAYERED_METADATA undef" *) input [63:0]cols_0_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COLS_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COLS_1_ADDRESS0, LAYERED_METADATA undef" *) output [8:0]cols_1_address0;
  output cols_1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COLS_1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COLS_1_Q0, LAYERED_METADATA undef" *) input [63:0]cols_1_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_0_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]out_0_address0;
  output out_0_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_0_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_0_D0, LAYERED_METADATA undef" *) output [63:0]out_0_d0;
  output out_0_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_1_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]out_1_address0;
  output out_1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_1_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_1_D0, LAYERED_METADATA undef" *) output [63:0]out_1_d0;
  output out_1_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ROWDELIMITERS_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ROWDELIMITERS_ADDRESS0, LAYERED_METADATA undef" *) output [8:0]rowDelimiters_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ROWDELIMITERS_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ROWDELIMITERS_ADDRESS1, LAYERED_METADATA undef" *) output [8:0]rowDelimiters_address1;
  output rowDelimiters_ce0;
  output rowDelimiters_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ROWDELIMITERS_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ROWDELIMITERS_Q0, LAYERED_METADATA undef" *) input [31:0]rowDelimiters_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ROWDELIMITERS_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ROWDELIMITERS_Q1, LAYERED_METADATA undef" *) input [31:0]rowDelimiters_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VAL_R_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VAL_R_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]val_r_address0;
  output val_r_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VAL_R_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VAL_R_Q0, LAYERED_METADATA undef" *) input [63:0]val_r_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_ADDRESS0, LAYERED_METADATA undef" *) output [8:0]vec_address0;
  output vec_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_Q0, LAYERED_METADATA undef" *) input [63:0]vec_q0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [63:0]cols_0_q0_0_1;
  wire [63:0]cols_1_q0_0_1;
  wire [8:0]hls_inst_cols_0_address0;
  wire hls_inst_cols_0_ce0;
  wire [8:0]hls_inst_cols_1_address0;
  wire hls_inst_cols_1_ce0;
  wire [7:0]hls_inst_out_0_address0;
  wire hls_inst_out_0_ce0;
  wire [63:0]hls_inst_out_0_d0;
  wire hls_inst_out_0_we0;
  wire [7:0]hls_inst_out_1_address0;
  wire hls_inst_out_1_ce0;
  wire [63:0]hls_inst_out_1_d0;
  wire hls_inst_out_1_we0;
  wire [8:0]hls_inst_rowDelimiters_address0;
  wire [8:0]hls_inst_rowDelimiters_address1;
  wire hls_inst_rowDelimiters_ce0;
  wire hls_inst_rowDelimiters_ce1;
  wire [10:0]hls_inst_val_r_address0;
  wire hls_inst_val_r_ce0;
  wire [8:0]hls_inst_vec_address0;
  wire hls_inst_vec_ce0;
  wire [31:0]rowDelimiters_q0_0_1;
  wire [31:0]rowDelimiters_q1_0_1;
  wire [63:0]val_r_q0_0_1;
  wire [63:0]vec_q0_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign cols_0_address0[8:0] = hls_inst_cols_0_address0;
  assign cols_0_ce0 = hls_inst_cols_0_ce0;
  assign cols_0_q0_0_1 = cols_0_q0[63:0];
  assign cols_1_address0[8:0] = hls_inst_cols_1_address0;
  assign cols_1_ce0 = hls_inst_cols_1_ce0;
  assign cols_1_q0_0_1 = cols_1_q0[63:0];
  assign out_0_address0[7:0] = hls_inst_out_0_address0;
  assign out_0_ce0 = hls_inst_out_0_ce0;
  assign out_0_d0[63:0] = hls_inst_out_0_d0;
  assign out_0_we0 = hls_inst_out_0_we0;
  assign out_1_address0[7:0] = hls_inst_out_1_address0;
  assign out_1_ce0 = hls_inst_out_1_ce0;
  assign out_1_d0[63:0] = hls_inst_out_1_d0;
  assign out_1_we0 = hls_inst_out_1_we0;
  assign rowDelimiters_address0[8:0] = hls_inst_rowDelimiters_address0;
  assign rowDelimiters_address1[8:0] = hls_inst_rowDelimiters_address1;
  assign rowDelimiters_ce0 = hls_inst_rowDelimiters_ce0;
  assign rowDelimiters_ce1 = hls_inst_rowDelimiters_ce1;
  assign rowDelimiters_q0_0_1 = rowDelimiters_q0[31:0];
  assign rowDelimiters_q1_0_1 = rowDelimiters_q1[31:0];
  assign val_r_address0[10:0] = hls_inst_val_r_address0;
  assign val_r_ce0 = hls_inst_val_r_ce0;
  assign val_r_q0_0_1 = val_r_q0[63:0];
  assign vec_address0[8:0] = hls_inst_vec_address0;
  assign vec_ce0 = hls_inst_vec_ce0;
  assign vec_q0_0_1 = vec_q0[63:0];
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .cols_0_address0(hls_inst_cols_0_address0),
        .cols_0_ce0(hls_inst_cols_0_ce0),
        .cols_0_q0(cols_0_q0_0_1),
        .cols_1_address0(hls_inst_cols_1_address0),
        .cols_1_ce0(hls_inst_cols_1_ce0),
        .cols_1_q0(cols_1_q0_0_1),
        .out_0_address0(hls_inst_out_0_address0),
        .out_0_ce0(hls_inst_out_0_ce0),
        .out_0_d0(hls_inst_out_0_d0),
        .out_0_we0(hls_inst_out_0_we0),
        .out_1_address0(hls_inst_out_1_address0),
        .out_1_ce0(hls_inst_out_1_ce0),
        .out_1_d0(hls_inst_out_1_d0),
        .out_1_we0(hls_inst_out_1_we0),
        .rowDelimiters_address0(hls_inst_rowDelimiters_address0),
        .rowDelimiters_address1(hls_inst_rowDelimiters_address1),
        .rowDelimiters_ce0(hls_inst_rowDelimiters_ce0),
        .rowDelimiters_ce1(hls_inst_rowDelimiters_ce1),
        .rowDelimiters_q0(rowDelimiters_q0_0_1),
        .rowDelimiters_q1(rowDelimiters_q1_0_1),
        .val_r_address0(hls_inst_val_r_address0),
        .val_r_ce0(hls_inst_val_r_ce0),
        .val_r_q0(val_r_q0_0_1),
        .vec_address0(hls_inst_vec_address0),
        .vec_ce0(hls_inst_vec_ce0),
        .vec_q0(vec_q0_0_1));
endmodule
