// Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
// Date        : Sun Aug 31 13:37:17 2025
// Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/pengjin/HGBO-DSE/benchmark/MachSuite/bfs/queue/bfs_motpe_fl_prj_p8/solution/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bfs,Vivado 2022.2.2" *)
module bd_0_hls_inst_0(nodes_ce0, edges_0_ce0, edges_1_ce0, level_ce0, 
  level_we0, level_counts_0_ce0, level_counts_0_we0, level_counts_1_ce0, 
  level_counts_1_we0, ap_clk, ap_rst, ap_start, ap_done, ap_idle, ap_ready, nodes_address0, 
  nodes_q0, edges_0_address0, edges_0_q0, edges_1_address0, edges_1_q0, starting_node, 
  level_address0, level_d0, level_q0, level_counts_0_address0, level_counts_0_d0, 
  level_counts_0_q0, level_counts_1_address0, level_counts_1_d0, level_counts_1_q0)
/* synthesis syn_black_box black_box_pad_pin="nodes_ce0,edges_0_ce0,edges_1_ce0,level_ce0,level_we0,level_counts_0_ce0,level_counts_0_we0,level_counts_1_ce0,level_counts_1_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,nodes_address0[7:0],nodes_q0[127:0],edges_0_address0[10:0],edges_0_q0[63:0],edges_1_address0[10:0],edges_1_q0[63:0],starting_node[63:0],level_address0[6:0],level_d0[15:0],level_q0[15:0],level_counts_0_address0[1:0],level_counts_0_d0[127:0],level_counts_0_q0[127:0],level_counts_1_address0[1:0],level_counts_1_d0[127:0],level_counts_1_q0[127:0]" */;
  output nodes_ce0;
  output edges_0_ce0;
  output edges_1_ce0;
  output level_ce0;
  output level_we0;
  output level_counts_0_ce0;
  output level_counts_0_we0;
  output level_counts_1_ce0;
  output level_counts_1_we0;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [7:0]nodes_address0;
  input [127:0]nodes_q0;
  output [10:0]edges_0_address0;
  input [63:0]edges_0_q0;
  output [10:0]edges_1_address0;
  input [63:0]edges_1_q0;
  input [63:0]starting_node;
  output [6:0]level_address0;
  output [15:0]level_d0;
  input [15:0]level_q0;
  output [1:0]level_counts_0_address0;
  output [127:0]level_counts_0_d0;
  input [127:0]level_counts_0_q0;
  output [1:0]level_counts_1_address0;
  output [127:0]level_counts_1_d0;
  input [127:0]level_counts_1_q0;
endmodule
