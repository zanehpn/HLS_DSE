//Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
//Date        : Sun Aug 31 13:36:30 2025
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
    edges_0_address0,
    edges_0_ce0,
    edges_0_q0,
    edges_1_address0,
    edges_1_ce0,
    edges_1_q0,
    level_address0,
    level_ce0,
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
    level_d0,
    level_q0,
    level_we0,
    nodes_address0,
    nodes_ce0,
    nodes_q0,
    starting_node);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_RESET ap_rst, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.EDGES_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.EDGES_0_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]edges_0_address0;
  output edges_0_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.EDGES_0_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.EDGES_0_Q0, LAYERED_METADATA undef" *) input [63:0]edges_0_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.EDGES_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.EDGES_1_ADDRESS0, LAYERED_METADATA undef" *) output [10:0]edges_1_address0;
  output edges_1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.EDGES_1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.EDGES_1_Q0, LAYERED_METADATA undef" *) input [63:0]edges_1_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_ADDRESS0, LAYERED_METADATA undef" *) output [6:0]level_address0;
  output level_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_0_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_0_ADDRESS0, LAYERED_METADATA undef" *) output [1:0]level_counts_0_address0;
  output level_counts_0_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_0_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_0_D0, LAYERED_METADATA undef" *) output [127:0]level_counts_0_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_0_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_0_Q0, LAYERED_METADATA undef" *) input [127:0]level_counts_0_q0;
  output level_counts_0_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_1_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_1_ADDRESS0, LAYERED_METADATA undef" *) output [1:0]level_counts_1_address0;
  output level_counts_1_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_1_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_1_D0, LAYERED_METADATA undef" *) output [127:0]level_counts_1_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_COUNTS_1_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_COUNTS_1_Q0, LAYERED_METADATA undef" *) input [127:0]level_counts_1_q0;
  output level_counts_1_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_D0, LAYERED_METADATA undef" *) output [15:0]level_d0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LEVEL_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LEVEL_Q0, LAYERED_METADATA undef" *) input [15:0]level_q0;
  output level_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NODES_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NODES_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]nodes_address0;
  output nodes_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NODES_Q0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NODES_Q0, LAYERED_METADATA undef" *) input [127:0]nodes_q0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.STARTING_NODE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.STARTING_NODE, LAYERED_METADATA undef" *) input [63:0]starting_node;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_0_1;
  wire [63:0]edges_0_q0_0_1;
  wire [63:0]edges_1_q0_0_1;
  wire [10:0]hls_inst_edges_0_address0;
  wire hls_inst_edges_0_ce0;
  wire [10:0]hls_inst_edges_1_address0;
  wire hls_inst_edges_1_ce0;
  wire [6:0]hls_inst_level_address0;
  wire hls_inst_level_ce0;
  wire [1:0]hls_inst_level_counts_0_address0;
  wire hls_inst_level_counts_0_ce0;
  wire [127:0]hls_inst_level_counts_0_d0;
  wire hls_inst_level_counts_0_we0;
  wire [1:0]hls_inst_level_counts_1_address0;
  wire hls_inst_level_counts_1_ce0;
  wire [127:0]hls_inst_level_counts_1_d0;
  wire hls_inst_level_counts_1_we0;
  wire [15:0]hls_inst_level_d0;
  wire hls_inst_level_we0;
  wire [7:0]hls_inst_nodes_address0;
  wire hls_inst_nodes_ce0;
  wire [127:0]level_counts_0_q0_0_1;
  wire [127:0]level_counts_1_q0_0_1;
  wire [15:0]level_q0_0_1;
  wire [127:0]nodes_q0_0_1;
  wire [63:0]starting_node_0_1;

  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_0_1 = ap_rst;
  assign edges_0_address0[10:0] = hls_inst_edges_0_address0;
  assign edges_0_ce0 = hls_inst_edges_0_ce0;
  assign edges_0_q0_0_1 = edges_0_q0[63:0];
  assign edges_1_address0[10:0] = hls_inst_edges_1_address0;
  assign edges_1_ce0 = hls_inst_edges_1_ce0;
  assign edges_1_q0_0_1 = edges_1_q0[63:0];
  assign level_address0[6:0] = hls_inst_level_address0;
  assign level_ce0 = hls_inst_level_ce0;
  assign level_counts_0_address0[1:0] = hls_inst_level_counts_0_address0;
  assign level_counts_0_ce0 = hls_inst_level_counts_0_ce0;
  assign level_counts_0_d0[127:0] = hls_inst_level_counts_0_d0;
  assign level_counts_0_q0_0_1 = level_counts_0_q0[127:0];
  assign level_counts_0_we0 = hls_inst_level_counts_0_we0;
  assign level_counts_1_address0[1:0] = hls_inst_level_counts_1_address0;
  assign level_counts_1_ce0 = hls_inst_level_counts_1_ce0;
  assign level_counts_1_d0[127:0] = hls_inst_level_counts_1_d0;
  assign level_counts_1_q0_0_1 = level_counts_1_q0[127:0];
  assign level_counts_1_we0 = hls_inst_level_counts_1_we0;
  assign level_d0[15:0] = hls_inst_level_d0;
  assign level_q0_0_1 = level_q0[15:0];
  assign level_we0 = hls_inst_level_we0;
  assign nodes_address0[7:0] = hls_inst_nodes_address0;
  assign nodes_ce0 = hls_inst_nodes_ce0;
  assign nodes_q0_0_1 = nodes_q0[127:0];
  assign starting_node_0_1 = starting_node[63:0];
  bd_0_hls_inst_0 hls_inst
       (.ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst(ap_rst_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .edges_0_address0(hls_inst_edges_0_address0),
        .edges_0_ce0(hls_inst_edges_0_ce0),
        .edges_0_q0(edges_0_q0_0_1),
        .edges_1_address0(hls_inst_edges_1_address0),
        .edges_1_ce0(hls_inst_edges_1_ce0),
        .edges_1_q0(edges_1_q0_0_1),
        .level_address0(hls_inst_level_address0),
        .level_ce0(hls_inst_level_ce0),
        .level_counts_0_address0(hls_inst_level_counts_0_address0),
        .level_counts_0_ce0(hls_inst_level_counts_0_ce0),
        .level_counts_0_d0(hls_inst_level_counts_0_d0),
        .level_counts_0_q0(level_counts_0_q0_0_1),
        .level_counts_0_we0(hls_inst_level_counts_0_we0),
        .level_counts_1_address0(hls_inst_level_counts_1_address0),
        .level_counts_1_ce0(hls_inst_level_counts_1_ce0),
        .level_counts_1_d0(hls_inst_level_counts_1_d0),
        .level_counts_1_q0(level_counts_1_q0_0_1),
        .level_counts_1_we0(hls_inst_level_counts_1_we0),
        .level_d0(hls_inst_level_d0),
        .level_q0(level_q0_0_1),
        .level_we0(hls_inst_level_we0),
        .nodes_address0(hls_inst_nodes_address0),
        .nodes_ce0(hls_inst_nodes_ce0),
        .nodes_q0(nodes_q0_0_1),
        .starting_node(starting_node_0_1));
endmodule
