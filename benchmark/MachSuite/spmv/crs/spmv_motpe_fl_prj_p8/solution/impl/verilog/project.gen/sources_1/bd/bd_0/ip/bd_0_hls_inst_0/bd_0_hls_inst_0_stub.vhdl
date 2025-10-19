-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Mon Sep  1 01:05:11 2025
-- Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/pengjin/HGBO-DSE/benchmark/MachSuite/spmv/crs/spmv_motpe_fl_prj_p8/solution/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    val_r_ce0 : out STD_LOGIC;
    cols_0_ce0 : out STD_LOGIC;
    cols_1_ce0 : out STD_LOGIC;
    rowDelimiters_ce0 : out STD_LOGIC;
    rowDelimiters_ce1 : out STD_LOGIC;
    vec_ce0 : out STD_LOGIC;
    out_0_ce0 : out STD_LOGIC;
    out_0_we0 : out STD_LOGIC;
    out_1_ce0 : out STD_LOGIC;
    out_1_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    val_r_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    val_r_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    cols_0_address0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    cols_0_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    cols_1_address0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    cols_1_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rowDelimiters_address0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rowDelimiters_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rowDelimiters_address1 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rowDelimiters_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    vec_address0 : out STD_LOGIC_VECTOR ( 8 downto 0 );
    vec_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    out_0_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_0_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_1_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_1_d0 : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "val_r_ce0,cols_0_ce0,cols_1_ce0,rowDelimiters_ce0,rowDelimiters_ce1,vec_ce0,out_0_ce0,out_0_we0,out_1_ce0,out_1_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,val_r_address0[10:0],val_r_q0[63:0],cols_0_address0[8:0],cols_0_q0[63:0],cols_1_address0[8:0],cols_1_q0[63:0],rowDelimiters_address0[8:0],rowDelimiters_q0[31:0],rowDelimiters_address1[8:0],rowDelimiters_q1[31:0],vec_address0[8:0],vec_q0[63:0],out_0_address0[7:0],out_0_d0[63:0],out_1_address0[7:0],out_1_d0[63:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "spmv,Vivado 2022.2.2";
begin
end;
