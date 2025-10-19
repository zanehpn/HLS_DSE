// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:spmv:1.0
// IP Revision: 2114240583

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  val_r_ce0,
  cols_0_ce0,
  cols_1_ce0,
  rowDelimiters_ce0,
  rowDelimiters_ce1,
  vec_ce0,
  out_0_ce0,
  out_0_we0,
  out_1_ce0,
  out_1_we0,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  val_r_address0,
  val_r_q0,
  cols_0_address0,
  cols_0_q0,
  cols_1_address0,
  cols_1_q0,
  rowDelimiters_address0,
  rowDelimiters_q0,
  rowDelimiters_address1,
  rowDelimiters_q1,
  vec_address0,
  vec_q0,
  out_0_address0,
  out_0_d0,
  out_1_address0,
  out_1_d0
);

output wire val_r_ce0;
output wire cols_0_ce0;
output wire cols_1_ce0;
output wire rowDelimiters_ce0;
output wire rowDelimiters_ce1;
output wire vec_ce0;
output wire out_0_ce0;
output wire out_0_we0;
output wire out_1_ce0;
output wire out_1_we0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME val_r_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 val_r_address0 DATA" *)
output wire [10 : 0] val_r_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME val_r_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 val_r_q0 DATA" *)
input wire [63 : 0] val_r_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cols_0_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cols_0_address0 DATA" *)
output wire [8 : 0] cols_0_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cols_0_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cols_0_q0 DATA" *)
input wire [63 : 0] cols_0_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cols_1_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cols_1_address0 DATA" *)
output wire [8 : 0] cols_1_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cols_1_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 cols_1_q0 DATA" *)
input wire [63 : 0] cols_1_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rowDelimiters_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rowDelimiters_address0 DATA" *)
output wire [8 : 0] rowDelimiters_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rowDelimiters_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rowDelimiters_q0 DATA" *)
input wire [31 : 0] rowDelimiters_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rowDelimiters_address1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rowDelimiters_address1 DATA" *)
output wire [8 : 0] rowDelimiters_address1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rowDelimiters_q1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rowDelimiters_q1 DATA" *)
input wire [31 : 0] rowDelimiters_q1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_address0 DATA" *)
output wire [8 : 0] vec_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_q0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_q0 DATA" *)
input wire [63 : 0] vec_q0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_0_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_0_address0 DATA" *)
output wire [7 : 0] out_0_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_0_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_0_d0 DATA" *)
output wire [63 : 0] out_0_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_1_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_1_address0 DATA" *)
output wire [7 : 0] out_1_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_1_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 out_1_d0 DATA" *)
output wire [63 : 0] out_1_d0;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  spmv inst (
    .val_r_ce0(val_r_ce0),
    .cols_0_ce0(cols_0_ce0),
    .cols_1_ce0(cols_1_ce0),
    .rowDelimiters_ce0(rowDelimiters_ce0),
    .rowDelimiters_ce1(rowDelimiters_ce1),
    .vec_ce0(vec_ce0),
    .out_0_ce0(out_0_ce0),
    .out_0_we0(out_0_we0),
    .out_1_ce0(out_1_ce0),
    .out_1_we0(out_1_we0),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .val_r_address0(val_r_address0),
    .val_r_q0(val_r_q0),
    .cols_0_address0(cols_0_address0),
    .cols_0_q0(cols_0_q0),
    .cols_1_address0(cols_1_address0),
    .cols_1_q0(cols_1_q0),
    .rowDelimiters_address0(rowDelimiters_address0),
    .rowDelimiters_q0(rowDelimiters_q0),
    .rowDelimiters_address1(rowDelimiters_address1),
    .rowDelimiters_q1(rowDelimiters_q1),
    .vec_address0(vec_address0),
    .vec_q0(vec_q0),
    .out_0_address0(out_0_address0),
    .out_0_d0(out_0_d0),
    .out_1_address0(out_1_address0),
    .out_1_d0(out_1_d0)
  );
endmodule
