-- Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2.2 (lin64) Build 3788238 Tue Feb 21 19:59:23 MST 2023
-- Date        : Thu Sep  4 21:41:43 2025
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
    orig_0_ce0 : out STD_LOGIC;
    orig_0_ce1 : out STD_LOGIC;
    orig_1_ce0 : out STD_LOGIC;
    orig_1_ce1 : out STD_LOGIC;
    sol_0_ce0 : out STD_LOGIC;
    sol_0_we0 : out STD_LOGIC;
    sol_1_ce0 : out STD_LOGIC;
    sol_1_we0 : out STD_LOGIC;
    filter_ce0 : out STD_LOGIC;
    filter_ce1 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    orig_0_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_0_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    orig_0_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_0_q1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    orig_1_address0 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_1_q0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    orig_1_address1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    orig_1_q1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    sol_0_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sol_0_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sol_1_address0 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sol_1_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    filter_address0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    filter_q0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    filter_address1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    filter_q1 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "orig_0_ce0,orig_0_ce1,orig_1_ce0,orig_1_ce1,sol_0_ce0,sol_0_we0,sol_1_ce0,sol_1_we0,filter_ce0,filter_ce1,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,orig_0_address0[10:0],orig_0_q0[63:0],orig_0_address1[10:0],orig_0_q1[63:0],orig_1_address0[10:0],orig_1_q0[63:0],orig_1_address1[10:0],orig_1_q1[63:0],sol_0_address0[11:0],sol_0_d0[31:0],sol_1_address0[11:0],sol_1_d0[31:0],filter_address0[3:0],filter_q0[31:0],filter_address1[3:0],filter_q1[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "stencil,Vivado 2022.2.2";
begin
end;
