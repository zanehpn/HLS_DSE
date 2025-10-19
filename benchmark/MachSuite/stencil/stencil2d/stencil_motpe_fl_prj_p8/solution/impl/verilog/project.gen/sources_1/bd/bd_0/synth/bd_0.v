//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Thu Sep  4 21:38:04 2025
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
    filter_address0,
    filter_address1,
    filter_ce0,
    filter_ce1,
    filter_q0,
    filter_q1,
    orig_0_address0,
    orig_0_address1,
    orig_0_ce0,
    orig_0_ce1,
    orig_0_q0,
    orig_0_q1,
    orig_1_address0,
    orig_1_address1,
    orig_1_ce0,
    orig_1_ce1,
    orig_1_q0,
    orig_1_q1,
    sol_0_address0,
    sol_0_ce0,
    sol_0_d0,
    sol_0_we0,
    sol_1_address0,
    sol_1_ce0,
    sol_1_d0,
    sol_1_we0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FILTER_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FILTER_ADDRESS0, LAYERED_METADATA undef" *) output [3:0]filter_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FILTER_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FILTER_ADDRESS1, LAYERED_METADATA undef" *) output [3:0]filter_address1;
  output filter_ce0;
  output filter_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FILTER_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FILTER_Q0, LAYERED_METADATA undef" *) input [31:0]filter_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FILTER_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FILTER_Q1, LAYERED_METADATA undef" *) input [31:0]filter_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_0_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]orig_0_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_0_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_0_ADDRESS1, LAYERED_METADATA undef" *) output [10:0]orig_0_address1;
  output orig_0_ce0;
  output orig_0_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_0_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_0_Q0, LAYERED_METADATA undef" *) input [63:0]orig_0_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_0_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_0_Q1, LAYERED_METADATA undef" *) input [63:0]orig_0_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_1_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]orig_1_address0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_1_ADDRESS1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_1_ADDRESS1, LAYERED_METADATA undef" *) output [10:0]orig_1_address1;
  output orig_1_ce0;
  output orig_1_ce1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_1_Q0, LAYERED_METADATA undef" *) input [63:0]orig_1_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ORIG_1_Q1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ORIG_1_Q1, LAYERED_METADATA undef" *) input [63:0]orig_1_q1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_0_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]sol_0_address0;
  output sol_0_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_0_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_0_D0, LAYERED_METADATA undef" *) output [31:0]sol_0_d0;
  output sol_0_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_1_ADDRESS0, LAYERED_METADATA undef" *) output [11:0]sol_1_address0;
  output sol_1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SOL_1_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SOL_1_D0, LAYERED_METADATA undef" *) output [31:0]sol_1_d0;
  output sol_1_we0;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [31:0]filter_q0_0_1;
  wire [31:0]filter_q1_0_1;
  wire [3:0]hls_inst_filter_address0;
  wire [3:0]hls_inst_filter_address1;
  wire hls_inst_filter_ce0;
  wire hls_inst_filter_ce1;
  wire [10:0]hls_inst_orig_0_address0;
  wire [10:0]hls_inst_orig_0_address1;
  wire hls_inst_orig_0_ce0;
  wire hls_inst_orig_0_ce1;
  wire [10:0]hls_inst_orig_1_address0;
  wire [10:0]hls_inst_orig_1_address1;
  wire hls_inst_orig_1_ce0;
  wire hls_inst_orig_1_ce1;
  wire [11:0]hls_inst_sol_0_address0;
  wire hls_inst_sol_0_ce0;
  wire [31:0]hls_inst_sol_0_d0;
  wire hls_inst_sol_0_we0;
  wire [11:0]hls_inst_sol_1_address0;
  wire hls_inst_sol_1_ce0;
  wire [31:0]hls_inst_sol_1_d0;
  wire hls_inst_sol_1_we0;
  wire [63:0]orig_0_q0_0_1;
  wire [63:0]orig_0_q1_0_1;
  wire [63:0]orig_1_q0_0_1;
  wire [63:0]orig_1_q1_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign filter_address0[3:0] = hls_inst_filter_address0;
  assign filter_address1[3:0] = hls_inst_filter_address1;
  assign filter_ce0 = hls_inst_filter_ce0;
  assign filter_ce1 = hls_inst_filter_ce1;
  assign filter_q0_0_1 = filter_q0[31:0];
  assign filter_q1_0_1 = filter_q1[31:0];
  assign orig_0_address0[10:0] = hls_inst_orig_0_address0;
  assign orig_0_address1[10:0] = hls_inst_orig_0_address1;
  assign orig_0_ce0 = hls_inst_orig_0_ce0;
  assign orig_0_ce1 = hls_inst_orig_0_ce1;
  assign orig_0_q0_0_1 = orig_0_q0[63:0];
  assign orig_0_q1_0_1 = orig_0_q1[63:0];
  assign orig_1_address0[10:0] = hls_inst_orig_1_address0;
  assign orig_1_address1[10:0] = hls_inst_orig_1_address1;
  assign orig_1_ce0 = hls_inst_orig_1_ce0;
  assign orig_1_ce1 = hls_inst_orig_1_ce1;
  assign orig_1_q0_0_1 = orig_1_q0[63:0];
  assign orig_1_q1_0_1 = orig_1_q1[63:0];
  assign sol_0_address0[11:0] = hls_inst_sol_0_address0;
  assign sol_0_ce0 = hls_inst_sol_0_ce0;
  assign sol_0_d0[31:0] = hls_inst_sol_0_d0;
  assign sol_0_we0 = hls_inst_sol_0_we0;
  assign sol_1_address0[11:0] = hls_inst_sol_1_address0;
  assign sol_1_ce0 = hls_inst_sol_1_ce0;
  assign sol_1_d0[31:0] = hls_inst_sol_1_d0;
  assign sol_1_we0 = hls_inst_sol_1_we0;
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .filter_address0(hls_inst_filter_address0),
        .filter_address1(hls_inst_filter_address1),
        .filter_ce0(hls_inst_filter_ce0),
        .filter_ce1(hls_inst_filter_ce1),
        .filter_q0(filter_q0_0_1),
        .filter_q1(filter_q1_0_1),
        .orig_0_address0(hls_inst_orig_0_address0),
        .orig_0_address1(hls_inst_orig_0_address1),
        .orig_0_ce0(hls_inst_orig_0_ce0),
        .orig_0_ce1(hls_inst_orig_0_ce1),
        .orig_0_q0(orig_0_q0_0_1),
        .orig_0_q1(orig_0_q1_0_1),
        .orig_1_address0(hls_inst_orig_1_address0),
        .orig_1_address1(hls_inst_orig_1_address1),
        .orig_1_ce0(hls_inst_orig_1_ce0),
        .orig_1_ce1(hls_inst_orig_1_ce1),
        .orig_1_q0(orig_1_q0_0_1),
        .orig_1_q1(orig_1_q1_0_1),
        .sol_0_address0(hls_inst_sol_0_address0),
        .sol_0_ce0(hls_inst_sol_0_ce0),
        .sol_0_d0(hls_inst_sol_0_d0),
        .sol_0_we0(hls_inst_sol_0_we0),
        .sol_1_address0(hls_inst_sol_1_address0),
        .sol_1_ce0(hls_inst_sol_1_ce0),
        .sol_1_d0(hls_inst_sol_1_d0),
        .sol_1_we0(hls_inst_sol_1_we0));
endmodule
