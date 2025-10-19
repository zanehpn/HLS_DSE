set moduleName viterbi_Pipeline_L_backtrack
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
set C_modelName {viterbi_Pipeline_L_backtrack}
set C_modelType { void 0 }
set C_modelArgList {
	{ llike int 128 regular {array 2240 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ llike_1 int 128 regular {array 2240 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ path int 16 regular {array 70 { 2 3 } 1 1 }  }
	{ transition_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ transition_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "llike", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "llike_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "path", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "transition_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "transition_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ llike_address0 sc_out sc_lv 12 signal 0 } 
	{ llike_ce0 sc_out sc_logic 1 signal 0 } 
	{ llike_q0 sc_in sc_lv 128 signal 0 } 
	{ llike_1_address0 sc_out sc_lv 12 signal 1 } 
	{ llike_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ llike_1_q0 sc_in sc_lv 128 signal 1 } 
	{ path_address0 sc_out sc_lv 7 signal 2 } 
	{ path_ce0 sc_out sc_logic 1 signal 2 } 
	{ path_we0 sc_out sc_logic 1 signal 2 } 
	{ path_d0 sc_out sc_lv 16 signal 2 } 
	{ path_q0 sc_in sc_lv 16 signal 2 } 
	{ transition_0_address0 sc_out sc_lv 10 signal 3 } 
	{ transition_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ transition_0_q0 sc_in sc_lv 128 signal 3 } 
	{ transition_0_address1 sc_out sc_lv 10 signal 3 } 
	{ transition_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ transition_0_q1 sc_in sc_lv 128 signal 3 } 
	{ transition_1_address0 sc_out sc_lv 10 signal 4 } 
	{ transition_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ transition_1_q0 sc_in sc_lv 128 signal 4 } 
	{ transition_1_address1 sc_out sc_lv 10 signal 4 } 
	{ transition_1_ce1 sc_out sc_logic 1 signal 4 } 
	{ transition_1_q1 sc_in sc_lv 128 signal 4 } 
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
 	{ "name": "llike_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike", "role": "q0" }} , 
 	{ "name": "llike_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "llike_1", "role": "address0" }} , 
 	{ "name": "llike_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "llike_1", "role": "ce0" }} , 
 	{ "name": "llike_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike_1", "role": "q0" }} , 
 	{ "name": "path_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "path", "role": "address0" }} , 
 	{ "name": "path_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "path", "role": "ce0" }} , 
 	{ "name": "path_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "path", "role": "we0" }} , 
 	{ "name": "path_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "path", "role": "d0" }} , 
 	{ "name": "path_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "path", "role": "q0" }} , 
 	{ "name": "transition_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_0", "role": "address0" }} , 
 	{ "name": "transition_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_0", "role": "ce0" }} , 
 	{ "name": "transition_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_0", "role": "q0" }} , 
 	{ "name": "transition_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "transition_0", "role": "address1" }} , 
 	{ "name": "transition_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "transition_0", "role": "ce1" }} , 
 	{ "name": "transition_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "transition_0", "role": "q1" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76"],
		"CDFG" : "viterbi_Pipeline_L_backtrack",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9884", "EstimateLatencyMax" : "9884",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "llike", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "llike_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "path", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "transition_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "transition_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "L_backtrack", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "71", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage13", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage13_subdone", "QuitState" : "ap_ST_fsm_pp0_stage13", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage13_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U109", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_8ns_8_12_1_U110", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U111", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_7ns_7ns_6_11_1_U112", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_9ns_15_1_1_U113", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U114", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U115", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U116", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U117", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U118", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U119", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U120", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U121", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U122", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U123", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U124", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U125", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U126", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U127", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U128", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U129", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U130", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U131", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U132", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U133", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U134", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U135", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U136", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U137", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U138", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U139", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U140", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U141", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U142", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U143", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U144", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U145", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U146", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U147", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U148", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U149", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U150", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U151", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U152", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U153", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U154", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U155", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U156", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U157", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U158", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U159", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U160", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U161", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U162", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U163", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U164", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U165", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U166", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U167", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U168", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U169", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U170", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U171", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U172", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U173", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U174", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U175", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U176", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U177", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U178", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U179", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U180", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U181", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U182", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U183", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	viterbi_Pipeline_L_backtrack {
		llike {Type I LastRead 74 FirstWrite -1}
		llike_1 {Type I LastRead 74 FirstWrite -1}
		path {Type IO LastRead 11 FirstWrite 84}
		transition_0 {Type I LastRead 21 FirstWrite -1}
		transition_1 {Type I LastRead 21 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9884", "Max" : "9884"}
	, {"Name" : "Interval", "Min" : "9884", "Max" : "9884"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	llike { ap_memory {  { llike_address0 mem_address 1 12 }  { llike_ce0 mem_ce 1 1 }  { llike_q0 in_data 0 128 } } }
	llike_1 { ap_memory {  { llike_1_address0 mem_address 1 12 }  { llike_1_ce0 mem_ce 1 1 }  { llike_1_q0 in_data 0 128 } } }
	path { ap_memory {  { path_address0 mem_address 1 7 }  { path_ce0 mem_ce 1 1 }  { path_we0 mem_we 1 1 }  { path_d0 mem_din 1 16 }  { path_q0 mem_dout 0 16 } } }
	transition_0 { ap_memory {  { transition_0_address0 mem_address 1 10 }  { transition_0_ce0 mem_ce 1 1 }  { transition_0_q0 in_data 0 128 }  { transition_0_address1 MemPortADDR2 1 10 }  { transition_0_ce1 MemPortCE2 1 1 }  { transition_0_q1 in_data 0 128 } } }
	transition_1 { ap_memory {  { transition_1_address0 mem_address 1 10 }  { transition_1_ce0 mem_ce 1 1 }  { transition_1_q0 in_data 0 128 }  { transition_1_address1 MemPortADDR2 1 10 }  { transition_1_ce1 MemPortCE2 1 1 }  { transition_1_q1 in_data 0 128 } } }
}
