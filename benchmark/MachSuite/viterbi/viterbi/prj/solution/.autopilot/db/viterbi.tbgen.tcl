set moduleName viterbi
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {viterbi}
set C_modelType { int 32 }
set C_modelArgList {
	{ obs int 16 regular {array 70 { 1 3 } 1 1 }  }
	{ init_0 int 128 regular {array 16 { 1 3 } 1 1 }  }
	{ init_1 int 128 regular {array 16 { 1 3 } 1 1 }  }
	{ transition_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ transition_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ emission_0 int 128 regular {array 1024 { 1 3 } 1 1 }  }
	{ emission_1 int 128 regular {array 1024 { 1 3 } 1 1 }  }
	{ path int 16 regular {array 70 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "obs", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "init_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "init_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "transition_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "transition_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "emission_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "emission_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "path", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ obs_address0 sc_out sc_lv 7 signal 0 } 
	{ obs_ce0 sc_out sc_logic 1 signal 0 } 
	{ obs_q0 sc_in sc_lv 16 signal 0 } 
	{ init_0_address0 sc_out sc_lv 4 signal 1 } 
	{ init_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ init_0_q0 sc_in sc_lv 128 signal 1 } 
	{ init_1_address0 sc_out sc_lv 4 signal 2 } 
	{ init_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ init_1_q0 sc_in sc_lv 128 signal 2 } 
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
	{ emission_0_address0 sc_out sc_lv 10 signal 5 } 
	{ emission_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ emission_0_q0 sc_in sc_lv 128 signal 5 } 
	{ emission_1_address0 sc_out sc_lv 10 signal 6 } 
	{ emission_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ emission_1_q0 sc_in sc_lv 128 signal 6 } 
	{ path_address0 sc_out sc_lv 7 signal 7 } 
	{ path_ce0 sc_out sc_logic 1 signal 7 } 
	{ path_we0 sc_out sc_logic 1 signal 7 } 
	{ path_d0 sc_out sc_lv 16 signal 7 } 
	{ path_q0 sc_in sc_lv 16 signal 7 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "obs_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "obs", "role": "address0" }} , 
 	{ "name": "obs_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obs", "role": "ce0" }} , 
 	{ "name": "obs_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "obs", "role": "q0" }} , 
 	{ "name": "init_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "init_0", "role": "address0" }} , 
 	{ "name": "init_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_0", "role": "ce0" }} , 
 	{ "name": "init_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "init_0", "role": "q0" }} , 
 	{ "name": "init_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "init_1", "role": "address0" }} , 
 	{ "name": "init_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_1", "role": "ce0" }} , 
 	{ "name": "init_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "init_1", "role": "q0" }} , 
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
 	{ "name": "emission_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_0", "role": "address0" }} , 
 	{ "name": "emission_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_0", "role": "ce0" }} , 
 	{ "name": "emission_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_0", "role": "q0" }} , 
 	{ "name": "emission_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_1", "role": "address0" }} , 
 	{ "name": "emission_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_1", "role": "ce0" }} , 
 	{ "name": "emission_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_1", "role": "q0" }} , 
 	{ "name": "path_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "path", "role": "address0" }} , 
 	{ "name": "path_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "path", "role": "ce0" }} , 
 	{ "name": "path_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "path", "role": "we0" }} , 
 	{ "name": "path_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "path", "role": "d0" }} , 
 	{ "name": "path_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "path", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "7", "82", "84", "161", "162", "163"],
		"CDFG" : "viterbi",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "703943", "EstimateLatencyMax" : "703943",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "obs", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Port" : "obs", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "init_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_viterbi_Pipeline_L_init_fu_123", "Port" : "init_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "init_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_viterbi_Pipeline_L_init_fu_123", "Port" : "init_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "transition_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Port" : "transition_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "84", "SubInstance" : "grp_viterbi_Pipeline_L_backtrack_fu_162", "Port" : "transition_0", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "transition_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Port" : "transition_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "84", "SubInstance" : "grp_viterbi_Pipeline_L_backtrack_fu_162", "Port" : "transition_1", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "emission_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Port" : "emission_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "3", "SubInstance" : "grp_viterbi_Pipeline_L_init_fu_123", "Port" : "emission_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "emission_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Port" : "emission_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "3", "SubInstance" : "grp_viterbi_Pipeline_L_init_fu_123", "Port" : "emission_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "path", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "84", "SubInstance" : "grp_viterbi_Pipeline_L_backtrack_fu_162", "Port" : "path", "Inst_start_state" : "11", "Inst_end_state" : "12"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.llike_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.llike_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_init_fu_123", "Parent" : "0", "Child" : ["4", "5", "6"],
		"CDFG" : "viterbi_Pipeline_L_init",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "72", "EstimateLatencyMax" : "72",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "llike", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "init_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "init_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln13", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln14_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln14_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "emission_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "emission_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "L_init", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_init_fu_123.mux_21_64_1_1_U2", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_init_fu_123.mux_22_64_1_1_U3", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_init_fu_123.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139", "Parent" : "0", "Child" : ["8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81"],
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
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mul_8ns_10ns_17_1_1_U17", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.urem_8ns_8ns_7_12_1_U18", "Parent" : "7"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mul_8ns_10ns_17_1_1_U19", "Parent" : "7"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.urem_8ns_8ns_8_12_1_U20", "Parent" : "7"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mul_7ns_9ns_15_1_1_U21", "Parent" : "7"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.urem_7ns_7ns_6_11_1_U22", "Parent" : "7"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mul_7ns_9ns_15_1_1_U23", "Parent" : "7"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.urem_7ns_7ns_6_11_1_U24", "Parent" : "7"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U25", "Parent" : "7"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U26", "Parent" : "7"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U27", "Parent" : "7"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U28", "Parent" : "7"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U29", "Parent" : "7"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U30", "Parent" : "7"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U31", "Parent" : "7"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U32", "Parent" : "7"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U33", "Parent" : "7"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U34", "Parent" : "7"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U35", "Parent" : "7"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U36", "Parent" : "7"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U37", "Parent" : "7"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U38", "Parent" : "7"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U39", "Parent" : "7"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U40", "Parent" : "7"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U41", "Parent" : "7"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U42", "Parent" : "7"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U43", "Parent" : "7"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U44", "Parent" : "7"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U45", "Parent" : "7"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U46", "Parent" : "7"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U47", "Parent" : "7"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U48", "Parent" : "7"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U49", "Parent" : "7"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U50", "Parent" : "7"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U51", "Parent" : "7"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U52", "Parent" : "7"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U53", "Parent" : "7"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U54", "Parent" : "7"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U55", "Parent" : "7"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U56", "Parent" : "7"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U57", "Parent" : "7"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U58", "Parent" : "7"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U59", "Parent" : "7"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U60", "Parent" : "7"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U61", "Parent" : "7"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U62", "Parent" : "7"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U63", "Parent" : "7"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U64", "Parent" : "7"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U65", "Parent" : "7"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U66", "Parent" : "7"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U67", "Parent" : "7"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U68", "Parent" : "7"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U69", "Parent" : "7"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U70", "Parent" : "7"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U71", "Parent" : "7"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U72", "Parent" : "7"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U73", "Parent" : "7"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U74", "Parent" : "7"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U75", "Parent" : "7"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U76", "Parent" : "7"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U77", "Parent" : "7"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U78", "Parent" : "7"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U79", "Parent" : "7"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U80", "Parent" : "7"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U81", "Parent" : "7"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U82", "Parent" : "7"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U83", "Parent" : "7"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U84", "Parent" : "7"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U85", "Parent" : "7"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U86", "Parent" : "7"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U87", "Parent" : "7"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U88", "Parent" : "7"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.mux_22_64_1_1_U89", "Parent" : "7"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_timestep_L_curr_state_fu_139.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_end_fu_155", "Parent" : "0", "Child" : ["83"],
		"CDFG" : "viterbi_Pipeline_L_end",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "min_p", "Type" : "None", "Direction" : "I"},
			{"Name" : "llike_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_s_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "L_end", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_end_fu_155.flow_control_loop_pipe_sequential_init_U", "Parent" : "82"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162", "Parent" : "0", "Child" : ["85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160"],
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
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mul_8ns_10ns_17_1_1_U109", "Parent" : "84"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.urem_8ns_8ns_8_12_1_U110", "Parent" : "84"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mul_8ns_10ns_17_1_1_U111", "Parent" : "84"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.urem_7ns_7ns_6_11_1_U112", "Parent" : "84"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mul_7ns_9ns_15_1_1_U113", "Parent" : "84"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U114", "Parent" : "84"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U115", "Parent" : "84"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U116", "Parent" : "84"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U117", "Parent" : "84"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U118", "Parent" : "84"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U119", "Parent" : "84"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U120", "Parent" : "84"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U121", "Parent" : "84"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U122", "Parent" : "84"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_21_64_1_1_U123", "Parent" : "84"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U124", "Parent" : "84"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U125", "Parent" : "84"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U126", "Parent" : "84"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_21_64_1_1_U127", "Parent" : "84"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_21_64_1_1_U128", "Parent" : "84"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U129", "Parent" : "84"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U130", "Parent" : "84"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U131", "Parent" : "84"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U132", "Parent" : "84"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U133", "Parent" : "84"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U134", "Parent" : "84"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U135", "Parent" : "84"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U136", "Parent" : "84"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U137", "Parent" : "84"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U138", "Parent" : "84"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U139", "Parent" : "84"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U140", "Parent" : "84"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U141", "Parent" : "84"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U142", "Parent" : "84"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U143", "Parent" : "84"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U144", "Parent" : "84"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U145", "Parent" : "84"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U146", "Parent" : "84"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U147", "Parent" : "84"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U148", "Parent" : "84"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U149", "Parent" : "84"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U150", "Parent" : "84"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U151", "Parent" : "84"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U152", "Parent" : "84"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U153", "Parent" : "84"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U154", "Parent" : "84"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U155", "Parent" : "84"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U156", "Parent" : "84"},
	{"ID" : "133", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U157", "Parent" : "84"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U158", "Parent" : "84"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U159", "Parent" : "84"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U160", "Parent" : "84"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U161", "Parent" : "84"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U162", "Parent" : "84"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U163", "Parent" : "84"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U164", "Parent" : "84"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U165", "Parent" : "84"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U166", "Parent" : "84"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U167", "Parent" : "84"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U168", "Parent" : "84"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U169", "Parent" : "84"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U170", "Parent" : "84"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U171", "Parent" : "84"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U172", "Parent" : "84"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U173", "Parent" : "84"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U174", "Parent" : "84"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U175", "Parent" : "84"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U176", "Parent" : "84"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U177", "Parent" : "84"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U178", "Parent" : "84"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U179", "Parent" : "84"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U180", "Parent" : "84"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U181", "Parent" : "84"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U182", "Parent" : "84"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.mux_22_64_1_1_U183", "Parent" : "84"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_viterbi_Pipeline_L_backtrack_fu_162.flow_control_loop_pipe_sequential_init_U", "Parent" : "84"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U189", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U190", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dcmp_64ns_64ns_1_2_no_dsp_1_U191", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	viterbi {
		obs {Type I LastRead 12 FirstWrite -1}
		init_0 {Type I LastRead 0 FirstWrite -1}
		init_1 {Type I LastRead 0 FirstWrite -1}
		transition_0 {Type I LastRead 21 FirstWrite -1}
		transition_1 {Type I LastRead 21 FirstWrite -1}
		emission_0 {Type I LastRead 14 FirstWrite -1}
		emission_1 {Type I LastRead 14 FirstWrite -1}
		path {Type IO LastRead 11 FirstWrite 9}}
	viterbi_Pipeline_L_init {
		llike {Type O LastRead -1 FirstWrite 7}
		init_0 {Type I LastRead 0 FirstWrite -1}
		init_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln13 {Type I LastRead 0 FirstWrite -1}
		zext_ln14_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln14_3 {Type I LastRead 0 FirstWrite -1}
		emission_0 {Type I LastRead 0 FirstWrite -1}
		emission_1 {Type I LastRead 0 FirstWrite -1}}
	viterbi_Pipeline_L_timestep_L_curr_state {
		llike {Type IO LastRead 84 FirstWrite 98}
		llike_1 {Type IO LastRead 84 FirstWrite 98}
		obs {Type I LastRead 12 FirstWrite -1}
		transition_0 {Type I LastRead 8 FirstWrite -1}
		emission_0 {Type I LastRead 14 FirstWrite -1}
		emission_1 {Type I LastRead 14 FirstWrite -1}
		transition_1 {Type I LastRead 8 FirstWrite -1}}
	viterbi_Pipeline_L_end {
		min_p {Type I LastRead 0 FirstWrite -1}
		llike_1 {Type I LastRead 0 FirstWrite -1}
		min_s_out {Type O LastRead -1 FirstWrite 1}}
	viterbi_Pipeline_L_backtrack {
		llike {Type I LastRead 74 FirstWrite -1}
		llike_1 {Type I LastRead 74 FirstWrite -1}
		path {Type IO LastRead 11 FirstWrite 84}
		transition_0 {Type I LastRead 21 FirstWrite -1}
		transition_1 {Type I LastRead 21 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "703943", "Max" : "703943"}
	, {"Name" : "Interval", "Min" : "703944", "Max" : "703944"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	obs { ap_memory {  { obs_address0 mem_address 1 7 }  { obs_ce0 mem_ce 1 1 }  { obs_q0 in_data 0 16 } } }
	init_0 { ap_memory {  { init_0_address0 mem_address 1 4 }  { init_0_ce0 mem_ce 1 1 }  { init_0_q0 mem_dout 0 128 } } }
	init_1 { ap_memory {  { init_1_address0 mem_address 1 4 }  { init_1_ce0 mem_ce 1 1 }  { init_1_q0 mem_dout 0 128 } } }
	transition_0 { ap_memory {  { transition_0_address0 mem_address 1 10 }  { transition_0_ce0 mem_ce 1 1 }  { transition_0_q0 mem_dout 0 128 }  { transition_0_address1 MemPortADDR2 1 10 }  { transition_0_ce1 MemPortCE2 1 1 }  { transition_0_q1 MemPortDOUT2 0 128 } } }
	transition_1 { ap_memory {  { transition_1_address0 mem_address 1 10 }  { transition_1_ce0 mem_ce 1 1 }  { transition_1_q0 mem_dout 0 128 }  { transition_1_address1 MemPortADDR2 1 10 }  { transition_1_ce1 MemPortCE2 1 1 }  { transition_1_q1 MemPortDOUT2 0 128 } } }
	emission_0 { ap_memory {  { emission_0_address0 mem_address 1 10 }  { emission_0_ce0 mem_ce 1 1 }  { emission_0_q0 mem_dout 0 128 } } }
	emission_1 { ap_memory {  { emission_1_address0 mem_address 1 10 }  { emission_1_ce0 mem_ce 1 1 }  { emission_1_q0 mem_dout 0 128 } } }
	path { ap_memory {  { path_address0 mem_address 1 7 }  { path_ce0 mem_ce 1 1 }  { path_we0 mem_we 1 1 }  { path_d0 mem_din 1 16 }  { path_q0 in_data 0 16 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
