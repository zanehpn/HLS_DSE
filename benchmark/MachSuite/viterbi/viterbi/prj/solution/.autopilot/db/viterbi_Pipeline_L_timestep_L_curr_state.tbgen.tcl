set moduleName viterbi_Pipeline_L_timestep_L_curr_state
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {viterbi_Pipeline_L_timestep_L_curr_state}
set C_modelType { void 0 }
set C_modelArgList {
	{ llike int 128 regular {array 2240 { 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ llike_1 int 128 regular {array 2240 { 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ obs int 16 regular {array 70 { 1 3 } 1 1 }  }
	{ transition_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ emission_0 int 128 regular {array 1024 { 1 3 } 1 1 }  }
	{ emission_1 int 128 regular {array 1024 { 1 3 } 1 1 }  }
	{ transition_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "llike", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "llike_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "obs", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "transition_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "emission_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "emission_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "transition_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ llike_address0 sc_out sc_lv 12 signal 0 } 
	{ llike_ce0 sc_out sc_logic 1 signal 0 } 
	{ llike_we0 sc_out sc_lv 16 signal 0 } 
	{ llike_d0 sc_out sc_lv 128 signal 0 } 
	{ llike_q0 sc_in sc_lv 128 signal 0 } 
	{ llike_1_address0 sc_out sc_lv 12 signal 1 } 
	{ llike_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ llike_1_we0 sc_out sc_lv 16 signal 1 } 
	{ llike_1_d0 sc_out sc_lv 128 signal 1 } 
	{ llike_1_q0 sc_in sc_lv 128 signal 1 } 
	{ obs_address0 sc_out sc_lv 7 signal 2 } 
	{ obs_ce0 sc_out sc_logic 1 signal 2 } 
	{ obs_q0 sc_in sc_lv 16 signal 2 } 
	{ transition_0_address0 sc_out sc_lv 10 signal 3 } 
	{ transition_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ transition_0_q0 sc_in sc_lv 128 signal 3 } 
	{ transition_0_address1 sc_out sc_lv 10 signal 3 } 
	{ transition_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ transition_0_q1 sc_in sc_lv 128 signal 3 } 
	{ emission_0_address0 sc_out sc_lv 10 signal 4 } 
	{ emission_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ emission_0_q0 sc_in sc_lv 128 signal 4 } 
	{ emission_1_address0 sc_out sc_lv 10 signal 5 } 
	{ emission_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ emission_1_q0 sc_in sc_lv 128 signal 5 } 
	{ transition_1_address0 sc_out sc_lv 10 signal 6 } 
	{ transition_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ transition_1_q0 sc_in sc_lv 128 signal 6 } 
	{ transition_1_address1 sc_out sc_lv 10 signal 6 } 
	{ transition_1_ce1 sc_out sc_logic 1 signal 6 } 
	{ transition_1_q1 sc_in sc_lv 128 signal 6 } 
	{ grp_fu_249_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_249_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_249_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_249_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_249_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_253_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_253_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_253_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_253_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_253_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_257_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_257_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_257_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_257_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_257_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "llike_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "llike", "role": "address0" }} , 
 	{ "name": "llike_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "llike", "role": "ce0" }} , 
 	{ "name": "llike_we0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "llike", "role": "we0" }} , 
 	{ "name": "llike_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike", "role": "d0" }} , 
 	{ "name": "llike_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike", "role": "q0" }} , 
 	{ "name": "llike_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "llike_1", "role": "address0" }} , 
 	{ "name": "llike_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "llike_1", "role": "ce0" }} , 
 	{ "name": "llike_1_we0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "llike_1", "role": "we0" }} , 
 	{ "name": "llike_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike_1", "role": "d0" }} , 
 	{ "name": "llike_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike_1", "role": "q0" }} , 
 	{ "name": "obs_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "obs", "role": "address0" }} , 
 	{ "name": "obs_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obs", "role": "ce0" }} , 
 	{ "name": "obs_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "obs", "role": "q0" }} , 
 	{ "name": "transition_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_0", "role": "address0" }} , 
 	{ "name": "transition_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_0", "role": "ce0" }} , 
 	{ "name": "transition_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_0", "role": "q0" }} , 
 	{ "name": "transition_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_0", "role": "address1" }} , 
 	{ "name": "transition_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_0", "role": "ce1" }} , 
 	{ "name": "transition_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_0", "role": "q1" }} , 
 	{ "name": "emission_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_0", "role": "address0" }} , 
 	{ "name": "emission_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_0", "role": "ce0" }} , 
 	{ "name": "emission_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_0", "role": "q0" }} , 
 	{ "name": "emission_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_1", "role": "address0" }} , 
 	{ "name": "emission_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_1", "role": "ce0" }} , 
 	{ "name": "emission_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_1", "role": "q0" }} , 
 	{ "name": "transition_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_1", "role": "address0" }} , 
 	{ "name": "transition_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_1", "role": "ce0" }} , 
 	{ "name": "transition_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_1", "role": "q0" }} , 
 	{ "name": "transition_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_1", "role": "address1" }} , 
 	{ "name": "transition_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_1", "role": "ce1" }} , 
 	{ "name": "transition_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_1", "role": "q1" }} , 
 	{ "name": "grp_fu_249_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_249_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_249_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_253_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_253_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_253_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_253_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_253_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_253_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_257_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_257_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_257_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_257_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_257_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74"],
		"CDFG" : "viterbi_Pipeline_L_timestep_L_curr_state",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "693910", "EstimateLatencyMax" : "693910",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "llike", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "llike_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "obs", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "transition_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "emission_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "emission_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "transition_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "L_timestep_L_curr_state", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "78", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage20", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage20_subdone", "QuitState" : "ap_ST_fsm_pp0_stage20", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage20_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U17", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_8ns_7_12_1_U18", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U19", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_8ns_8_12_1_U20", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_9ns_15_1_1_U21", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_7ns_7ns_6_11_1_U22", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_9ns_15_1_1_U23", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_7ns_7ns_6_11_1_U24", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U25", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U26", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U27", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U28", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U29", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U30", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U31", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U32", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U33", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U34", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U35", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U36", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U37", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U38", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U39", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U40", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U41", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U42", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U43", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U44", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U45", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U46", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U47", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U48", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U49", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U50", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U51", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U52", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U53", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U54", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U55", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U56", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U57", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U58", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U59", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U60", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U61", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U62", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U63", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U64", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U65", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U66", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U67", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U68", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U69", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U70", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U71", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U72", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U73", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U74", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U75", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U76", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U77", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U78", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U79", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U80", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U81", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U82", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U83", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U84", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U85", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U86", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U87", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U88", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U89", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	viterbi_Pipeline_L_timestep_L_curr_state {
		llike {Type IO LastRead 84 FirstWrite 98}
		llike_1 {Type IO LastRead 84 FirstWrite 98}
		obs {Type I LastRead 12 FirstWrite -1}
		transition_0 {Type I LastRead 8 FirstWrite -1}
		emission_0 {Type I LastRead 14 FirstWrite -1}
		emission_1 {Type I LastRead 14 FirstWrite -1}
		transition_1 {Type I LastRead 8 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "693910", "Max" : "693910"}
	, {"Name" : "Interval", "Min" : "693910", "Max" : "693910"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	llike { ap_memory {  { llike_address0 mem_address 1 12 }  { llike_ce0 mem_ce 1 1 }  { llike_we0 mem_we 1 16 }  { llike_d0 mem_din 1 128 }  { llike_q0 in_data 0 128 } } }
	llike_1 { ap_memory {  { llike_1_address0 mem_address 1 12 }  { llike_1_ce0 mem_ce 1 1 }  { llike_1_we0 mem_we 1 16 }  { llike_1_d0 mem_din 1 128 }  { llike_1_q0 in_data 0 128 } } }
	obs { ap_memory {  { obs_address0 mem_address 1 7 }  { obs_ce0 mem_ce 1 1 }  { obs_q0 in_data 0 16 } } }
	transition_0 { ap_memory {  { transition_0_address0 mem_address 1 10 }  { transition_0_ce0 mem_ce 1 1 }  { transition_0_q0 in_data 0 128 }  { transition_0_address1 MemPortADDR2 1 10 }  { transition_0_ce1 MemPortCE2 1 1 }  { transition_0_q1 in_data 0 128 } } }
	emission_0 { ap_memory {  { emission_0_address0 mem_address 1 10 }  { emission_0_ce0 mem_ce 1 1 }  { emission_0_q0 in_data 0 128 } } }
	emission_1 { ap_memory {  { emission_1_address0 mem_address 1 10 }  { emission_1_ce0 mem_ce 1 1 }  { emission_1_q0 in_data 0 128 } } }
	transition_1 { ap_memory {  { transition_1_address0 mem_address 1 10 }  { transition_1_ce0 mem_ce 1 1 }  { transition_1_q0 in_data 0 128 }  { transition_1_address1 MemPortADDR2 1 10 }  { transition_1_ce1 MemPortCE2 1 1 }  { transition_1_q1 in_data 0 128 } } }
}
