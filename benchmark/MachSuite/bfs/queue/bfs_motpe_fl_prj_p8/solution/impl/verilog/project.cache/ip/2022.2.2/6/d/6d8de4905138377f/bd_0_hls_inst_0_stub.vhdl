-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Sun Aug 31 13:37:16 2025
-- Host        : hacc-gpu1 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    nodes_ce0 : out STD_LOGIC;
    edges_0_ce0 : out STD_LOGIC;
    edges_1_ce0 : out STD_LOGIC;
    level_ce0 : out STD_LOGIC;
    level_we0 : out STD_LOGIC;
    level_counts_0_ce0 : out STD_LOGIC;
    level_counts_0_we0 : out STD_LOGIC;
    level_counts_1_ce0 : out STD_LOGIC;
    level_counts_1_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    nodes_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    nodes_q0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    edges_0_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    edges_0_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    edges_1_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    edges_1_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    starting_node : in STD_LOGIC_VECTOR ( 63 downto 0 );
    level_address0 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    level_d0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    level_q0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    level_counts_0_address0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    level_counts_0_d0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    level_counts_0_q0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    level_counts_1_address0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    level_counts_1_d0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    level_counts_1_q0 : in STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "nodes_ce0,edges_0_ce0,edges_1_ce0,level_ce0,level_we0,level_counts_0_ce0,level_counts_0_we0,level_counts_1_ce0,level_counts_1_we0,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,nodes_address0[7:0],nodes_q0[127:0],edges_0_address0[10:0],edges_0_q0[63:0],edges_1_address0[10:0],edges_1_q0[63:0],starting_node[63:0],level_address0[6:0],level_d0[15:0],level_q0[15:0],level_counts_0_address0[1:0],level_counts_0_d0[127:0],level_counts_0_q0[127:0],level_counts_1_address0[1:0],level_counts_1_d0[127:0],level_counts_1_q0[127:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bfs,Vivado 2022.2.2";
begin
end;
