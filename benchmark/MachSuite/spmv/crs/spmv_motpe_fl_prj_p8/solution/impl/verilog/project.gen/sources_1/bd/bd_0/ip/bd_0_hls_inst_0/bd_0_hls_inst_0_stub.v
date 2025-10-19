// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Mon Sep  1 01:05:11 2025
// Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/pengjin/HGBO-DSE/benchmark/MachSuite/spmv/crs/spmv_motpe_fl_prj_p8/solution/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "spmv,Vivado 2022.2.2" *)
module bd_0_hls_inst_0(val_r_ce0, cols_0_ce0, cols_1_ce0, 
  rowDelimiters_ce0, rowDelimiters_ce1, vec_ce0, out_0_ce0, out_0_we0, out_1_ce0, out_1_we0, 
  ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, val_r_address0, val_r_q0, cols_0_address0, 
  cols_0_q0, cols_1_address0, cols_1_q0, rowDelimiters_address0, rowDelimiters_q0, 
  rowDelimiters_address1, rowDelimiters_q1, vec_address0, vec_q0, out_0_address0, out_0_d0, 
  out_1_address0, out_1_d0)
/* synthesis syn_black_box black_box_pad_pin="val_r_ce0,cols_0_ce0,cols_1_ce0,rowDelimiters_ce0,rowDelimiters_ce1,vec_ce0,out_0_ce0,out_0_we0,out_1_ce0,out_1_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,val_r_address0[10:0],val_r_q0[63:0],cols_0_address0[8:0],cols_0_q0[63:0],cols_1_address0[8:0],cols_1_q0[63:0],rowDelimiters_address0[8:0],rowDelimiters_q0[31:0],rowDelimiters_address1[8:0],rowDelimiters_q1[31:0],vec_address0[8:0],vec_q0[63:0],out_0_address0[7:0],out_0_d0[63:0],out_1_address0[7:0],out_1_d0[63:0]" */;
  output val_r_ce0;
  output cols_0_ce0;
  output cols_1_ce0;
  output rowDelimiters_ce0;
  output rowDelimiters_ce1;
  output vec_ce0;
  output out_0_ce0;
  output out_0_we0;
  output out_1_ce0;
  output out_1_we0;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [10:0]val_r_address0;
  input [63:0]val_r_q0;
  output [8:0]cols_0_address0;
  input [63:0]cols_0_q0;
  output [8:0]cols_1_address0;
  input [63:0]cols_1_q0;
  output [8:0]rowDelimiters_address0;
  input [31:0]rowDelimiters_q0;
  output [8:0]rowDelimiters_address1;
  input [31:0]rowDelimiters_q1;
  output [8:0]vec_address0;
  input [63:0]vec_q0;
  output [7:0]out_0_address0;
  output [63:0]out_0_d0;
  output [7:0]out_1_address0;
  output [63:0]out_1_d0;
endmodule
