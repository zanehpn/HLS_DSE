//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Sat Aug 23 10:29:45 2025
//Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst,
    edges_0_address0,
    edges_0_ce0,
    edges_0_q0,
    edges_1_address0,
    edges_1_ce0,
    edges_1_q0,
    level_0_address0,
    level_0_ce0,
    level_0_d0,
    level_0_q0,
    level_0_we0,
    level_1_address0,
    level_1_ce0,
    level_1_d0,
    level_1_q0,
    level_1_we0,
    level_counts_0_address0,
    level_counts_0_ce0,
    level_counts_0_d0,
    level_counts_0_q0,
    level_counts_0_we0,
    level_counts_1_address0,
    level_counts_1_ce0,
    level_counts_1_d0,
    level_counts_1_q0,
    level_counts_1_we0,
    nodes_0_address0,
    nodes_0_ce0,
    nodes_0_q0,
    nodes_1_address0,
    nodes_1_ce0,
    nodes_1_q0,
    starting_node);
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [10:0]edges_0_address0;
  output edges_0_ce0;
  input [63:0]edges_0_q0;
  output [10:0]edges_1_address0;
  output edges_1_ce0;
  input [63:0]edges_1_q0;
  output [6:0]level_0_address0;
  output level_0_ce0;
  output [7:0]level_0_d0;
  input [7:0]level_0_q0;
  output level_0_we0;
  output [6:0]level_1_address0;
  output level_1_ce0;
  output [7:0]level_1_d0;
  input [7:0]level_1_q0;
  output level_1_we0;
  output [1:0]level_counts_0_address0;
  output level_counts_0_ce0;
  output [127:0]level_counts_0_d0;
  input [127:0]level_counts_0_q0;
  output level_counts_0_we0;
  output [1:0]level_counts_1_address0;
  output level_counts_1_ce0;
  output [127:0]level_counts_1_d0;
  input [127:0]level_counts_1_q0;
  output level_counts_1_we0;
  output [5:0]nodes_0_address0;
  output nodes_0_ce0;
  input [255:0]nodes_0_q0;
  output [5:0]nodes_1_address0;
  output nodes_1_ce0;
  input [255:0]nodes_1_q0;
  input [63:0]starting_node;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [10:0]edges_0_address0;
  wire edges_0_ce0;
  wire [63:0]edges_0_q0;
  wire [10:0]edges_1_address0;
  wire edges_1_ce0;
  wire [63:0]edges_1_q0;
  wire [6:0]level_0_address0;
  wire level_0_ce0;
  wire [7:0]level_0_d0;
  wire [7:0]level_0_q0;
  wire level_0_we0;
  wire [6:0]level_1_address0;
  wire level_1_ce0;
  wire [7:0]level_1_d0;
  wire [7:0]level_1_q0;
  wire level_1_we0;
  wire [1:0]level_counts_0_address0;
  wire level_counts_0_ce0;
  wire [127:0]level_counts_0_d0;
  wire [127:0]level_counts_0_q0;
  wire level_counts_0_we0;
  wire [1:0]level_counts_1_address0;
  wire level_counts_1_ce0;
  wire [127:0]level_counts_1_d0;
  wire [127:0]level_counts_1_q0;
  wire level_counts_1_we0;
  wire [5:0]nodes_0_address0;
  wire nodes_0_ce0;
  wire [255:0]nodes_0_q0;
  wire [5:0]nodes_1_address0;
  wire nodes_1_ce0;
  wire [255:0]nodes_1_q0;
  wire [63:0]starting_node;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .edges_0_address0(edges_0_address0),
        .edges_0_ce0(edges_0_ce0),
        .edges_0_q0(edges_0_q0),
        .edges_1_address0(edges_1_address0),
        .edges_1_ce0(edges_1_ce0),
        .edges_1_q0(edges_1_q0),
        .level_0_address0(level_0_address0),
        .level_0_ce0(level_0_ce0),
        .level_0_d0(level_0_d0),
        .level_0_q0(level_0_q0),
        .level_0_we0(level_0_we0),
        .level_1_address0(level_1_address0),
        .level_1_ce0(level_1_ce0),
        .level_1_d0(level_1_d0),
        .level_1_q0(level_1_q0),
        .level_1_we0(level_1_we0),
        .level_counts_0_address0(level_counts_0_address0),
        .level_counts_0_ce0(level_counts_0_ce0),
        .level_counts_0_d0(level_counts_0_d0),
        .level_counts_0_q0(level_counts_0_q0),
        .level_counts_0_we0(level_counts_0_we0),
        .level_counts_1_address0(level_counts_1_address0),
        .level_counts_1_ce0(level_counts_1_ce0),
        .level_counts_1_d0(level_counts_1_d0),
        .level_counts_1_q0(level_counts_1_q0),
        .level_counts_1_we0(level_counts_1_we0),
        .nodes_0_address0(nodes_0_address0),
        .nodes_0_ce0(nodes_0_ce0),
        .nodes_0_q0(nodes_0_q0),
        .nodes_1_address0(nodes_1_address0),
        .nodes_1_ce0(nodes_1_ce0),
        .nodes_1_q0(nodes_1_q0),
        .starting_node(starting_node));
endmodule
