//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Thu Sep  4 21:38:04 2025
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
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [3:0]filter_address0;
  output [3:0]filter_address1;
  output filter_ce0;
  output filter_ce1;
  input [31:0]filter_q0;
  input [31:0]filter_q1;
  output [10:0]orig_0_address0;
  output [10:0]orig_0_address1;
  output orig_0_ce0;
  output orig_0_ce1;
  input [63:0]orig_0_q0;
  input [63:0]orig_0_q1;
  output [10:0]orig_1_address0;
  output [10:0]orig_1_address1;
  output orig_1_ce0;
  output orig_1_ce1;
  input [63:0]orig_1_q0;
  input [63:0]orig_1_q1;
  output [11:0]sol_0_address0;
  output sol_0_ce0;
  output [31:0]sol_0_d0;
  output sol_0_we0;
  output [11:0]sol_1_address0;
  output sol_1_ce0;
  output [31:0]sol_1_d0;
  output sol_1_we0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [3:0]filter_address0;
  wire [3:0]filter_address1;
  wire filter_ce0;
  wire filter_ce1;
  wire [31:0]filter_q0;
  wire [31:0]filter_q1;
  wire [10:0]orig_0_address0;
  wire [10:0]orig_0_address1;
  wire orig_0_ce0;
  wire orig_0_ce1;
  wire [63:0]orig_0_q0;
  wire [63:0]orig_0_q1;
  wire [10:0]orig_1_address0;
  wire [10:0]orig_1_address1;
  wire orig_1_ce0;
  wire orig_1_ce1;
  wire [63:0]orig_1_q0;
  wire [63:0]orig_1_q1;
  wire [11:0]sol_0_address0;
  wire sol_0_ce0;
  wire [31:0]sol_0_d0;
  wire sol_0_we0;
  wire [11:0]sol_1_address0;
  wire sol_1_ce0;
  wire [31:0]sol_1_d0;
  wire sol_1_we0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .filter_address0(filter_address0),
        .filter_address1(filter_address1),
        .filter_ce0(filter_ce0),
        .filter_ce1(filter_ce1),
        .filter_q0(filter_q0),
        .filter_q1(filter_q1),
        .orig_0_address0(orig_0_address0),
        .orig_0_address1(orig_0_address1),
        .orig_0_ce0(orig_0_ce0),
        .orig_0_ce1(orig_0_ce1),
        .orig_0_q0(orig_0_q0),
        .orig_0_q1(orig_0_q1),
        .orig_1_address0(orig_1_address0),
        .orig_1_address1(orig_1_address1),
        .orig_1_ce0(orig_1_ce0),
        .orig_1_ce1(orig_1_ce1),
        .orig_1_q0(orig_1_q0),
        .orig_1_q1(orig_1_q1),
        .sol_0_address0(sol_0_address0),
        .sol_0_ce0(sol_0_ce0),
        .sol_0_d0(sol_0_d0),
        .sol_0_we0(sol_0_we0),
        .sol_1_address0(sol_1_address0),
        .sol_1_ce0(sol_1_ce0),
        .sol_1_d0(sol_1_d0),
        .sol_1_we0(sol_1_we0));
endmodule
