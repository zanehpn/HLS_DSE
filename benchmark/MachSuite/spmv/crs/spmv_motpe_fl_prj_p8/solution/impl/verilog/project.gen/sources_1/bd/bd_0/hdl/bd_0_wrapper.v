//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Mon Sep  1 01:03:54 2025
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
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst;
  output [8:0]cols_0_address0;
  output cols_0_ce0;
  input [63:0]cols_0_q0;
  output [8:0]cols_1_address0;
  output cols_1_ce0;
  input [63:0]cols_1_q0;
  output [7:0]out_0_address0;
  output out_0_ce0;
  output [63:0]out_0_d0;
  output out_0_we0;
  output [7:0]out_1_address0;
  output out_1_ce0;
  output [63:0]out_1_d0;
  output out_1_we0;
  output [8:0]rowDelimiters_address0;
  output [8:0]rowDelimiters_address1;
  output rowDelimiters_ce0;
  output rowDelimiters_ce1;
  input [31:0]rowDelimiters_q0;
  input [31:0]rowDelimiters_q1;
  output [10:0]val_r_address0;
  output val_r_ce0;
  input [63:0]val_r_q0;
  output [8:0]vec_address0;
  output vec_ce0;
  input [63:0]vec_q0;

  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst;
  wire [8:0]cols_0_address0;
  wire cols_0_ce0;
  wire [63:0]cols_0_q0;
  wire [8:0]cols_1_address0;
  wire cols_1_ce0;
  wire [63:0]cols_1_q0;
  wire [7:0]out_0_address0;
  wire out_0_ce0;
  wire [63:0]out_0_d0;
  wire out_0_we0;
  wire [7:0]out_1_address0;
  wire out_1_ce0;
  wire [63:0]out_1_d0;
  wire out_1_we0;
  wire [8:0]rowDelimiters_address0;
  wire [8:0]rowDelimiters_address1;
  wire rowDelimiters_ce0;
  wire rowDelimiters_ce1;
  wire [31:0]rowDelimiters_q0;
  wire [31:0]rowDelimiters_q1;
  wire [10:0]val_r_address0;
  wire val_r_ce0;
  wire [63:0]val_r_q0;
  wire [8:0]vec_address0;
  wire vec_ce0;
  wire [63:0]vec_q0;

  bd_0 bd_0_i
       (.ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst(ap_rst),
        .cols_0_address0(cols_0_address0),
        .cols_0_ce0(cols_0_ce0),
        .cols_0_q0(cols_0_q0),
        .cols_1_address0(cols_1_address0),
        .cols_1_ce0(cols_1_ce0),
        .cols_1_q0(cols_1_q0),
        .out_0_address0(out_0_address0),
        .out_0_ce0(out_0_ce0),
        .out_0_d0(out_0_d0),
        .out_0_we0(out_0_we0),
        .out_1_address0(out_1_address0),
        .out_1_ce0(out_1_ce0),
        .out_1_d0(out_1_d0),
        .out_1_we0(out_1_we0),
        .rowDelimiters_address0(rowDelimiters_address0),
        .rowDelimiters_address1(rowDelimiters_address1),
        .rowDelimiters_ce0(rowDelimiters_ce0),
        .rowDelimiters_ce1(rowDelimiters_ce1),
        .rowDelimiters_q0(rowDelimiters_q0),
        .rowDelimiters_q1(rowDelimiters_q1),
        .val_r_address0(val_r_address0),
        .val_r_ce0(val_r_ce0),
        .val_r_q0(val_r_q0),
        .vec_address0(vec_address0),
        .vec_ce0(vec_ce0),
        .vec_q0(vec_q0));
endmodule
