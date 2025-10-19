// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Thu Sep  4 21:41:43 2025
// Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "stencil,Vivado 2022.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(orig_0_ce0, orig_0_ce1, orig_1_ce0, orig_1_ce1, 
  sol_0_ce0, sol_0_we0, sol_1_ce0, sol_1_we0, filter_ce0, filter_ce1, ap_clk, ap_rst, ap_start, 
  ap_done, ap_idle, ap_ready, orig_0_address0, orig_0_q0, orig_0_address1, orig_0_q1, 
  orig_1_address0, orig_1_q0, orig_1_address1, orig_1_q1, sol_0_address0, sol_0_d0, 
  sol_1_address0, sol_1_d0, filter_address0, filter_q0, filter_address1, filter_q1)
/* synthesis syn_black_box black_box_pad_pin="orig_0_ce0,orig_0_ce1,orig_1_ce0,orig_1_ce1,sol_0_ce0,sol_0_we0,sol_1_ce0,sol_1_we0,filter_ce0,filter_ce1,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,orig_0_address0[10:0],orig_0_q0[63:0],orig_0_address1[10:0],orig_0_q1[63:0],orig_1_address0[10:0],orig_1_q0[63:0],orig_1_address1[10:0],orig_1_q1[63:0],sol_0_address0[11:0],sol_0_d0[31:0],sol_1_address0[11:0],sol_1_d0[31:0],filter_address0[3:0],filter_q0[31:0],filter_address1[3:0],filter_q1[31:0]" */;
  output orig_0_ce0;
  output orig_0_ce1;
  output orig_1_ce0;
  output orig_1_ce1;
  output sol_0_ce0;
  output sol_0_we0;
  output sol_1_ce0;
  output sol_1_we0;
  output filter_ce0;
  output filter_ce1;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [10:0]orig_0_address0;
  input [63:0]orig_0_q0;
  output [10:0]orig_0_address1;
  input [63:0]orig_0_q1;
  output [10:0]orig_1_address0;
  input [63:0]orig_1_q0;
  output [10:0]orig_1_address1;
  input [63:0]orig_1_q1;
  output [11:0]sol_0_address0;
  output [31:0]sol_0_d0;
  output [11:0]sol_1_address0;
  output [31:0]sol_1_d0;
  output [3:0]filter_address0;
  input [31:0]filter_q0;
  output [3:0]filter_address1;
  input [31:0]filter_q1;
endmodule
