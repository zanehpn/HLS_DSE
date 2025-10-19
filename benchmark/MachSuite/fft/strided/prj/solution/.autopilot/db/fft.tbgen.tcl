set moduleName fft
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
set C_modelName {fft}
set C_modelType { void 0 }
set C_modelArgList {
	{ real_0 int 128 regular {array 256 { 2 2 } 1 1 }  }
	{ real_1 int 128 regular {array 256 { 2 2 } 1 1 }  }
	{ img_0 int 128 regular {array 256 { 2 2 } 1 1 }  }
	{ img_1 int 128 regular {array 256 { 2 2 } 1 1 }  }
	{ real_twid_0 int 128 regular {array 128 { 1 3 } 1 1 }  }
	{ real_twid_1 int 128 regular {array 128 { 1 3 } 1 1 }  }
	{ img_twid_0 int 128 regular {array 128 { 1 3 } 1 1 }  }
	{ img_twid_1 int 128 regular {array 128 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "real_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "real_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "img_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "img_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "real_twid_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "real_twid_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "img_twid_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "img_twid_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ real_0_address0 sc_out sc_lv 8 signal 0 } 
	{ real_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ real_0_we0 sc_out sc_logic 1 signal 0 } 
	{ real_0_d0 sc_out sc_lv 128 signal 0 } 
	{ real_0_q0 sc_in sc_lv 128 signal 0 } 
	{ real_0_address1 sc_out sc_lv 8 signal 0 } 
	{ real_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ real_0_we1 sc_out sc_logic 1 signal 0 } 
	{ real_0_d1 sc_out sc_lv 128 signal 0 } 
	{ real_0_q1 sc_in sc_lv 128 signal 0 } 
	{ real_1_address0 sc_out sc_lv 8 signal 1 } 
	{ real_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ real_1_we0 sc_out sc_logic 1 signal 1 } 
	{ real_1_d0 sc_out sc_lv 128 signal 1 } 
	{ real_1_q0 sc_in sc_lv 128 signal 1 } 
	{ real_1_address1 sc_out sc_lv 8 signal 1 } 
	{ real_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ real_1_we1 sc_out sc_logic 1 signal 1 } 
	{ real_1_d1 sc_out sc_lv 128 signal 1 } 
	{ real_1_q1 sc_in sc_lv 128 signal 1 } 
	{ img_0_address0 sc_out sc_lv 8 signal 2 } 
	{ img_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ img_0_we0 sc_out sc_logic 1 signal 2 } 
	{ img_0_d0 sc_out sc_lv 128 signal 2 } 
	{ img_0_q0 sc_in sc_lv 128 signal 2 } 
	{ img_0_address1 sc_out sc_lv 8 signal 2 } 
	{ img_0_ce1 sc_out sc_logic 1 signal 2 } 
	{ img_0_we1 sc_out sc_logic 1 signal 2 } 
	{ img_0_d1 sc_out sc_lv 128 signal 2 } 
	{ img_0_q1 sc_in sc_lv 128 signal 2 } 
	{ img_1_address0 sc_out sc_lv 8 signal 3 } 
	{ img_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ img_1_we0 sc_out sc_logic 1 signal 3 } 
	{ img_1_d0 sc_out sc_lv 128 signal 3 } 
	{ img_1_q0 sc_in sc_lv 128 signal 3 } 
	{ img_1_address1 sc_out sc_lv 8 signal 3 } 
	{ img_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ img_1_we1 sc_out sc_logic 1 signal 3 } 
	{ img_1_d1 sc_out sc_lv 128 signal 3 } 
	{ img_1_q1 sc_in sc_lv 128 signal 3 } 
	{ real_twid_0_address0 sc_out sc_lv 7 signal 4 } 
	{ real_twid_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ real_twid_0_q0 sc_in sc_lv 128 signal 4 } 
	{ real_twid_1_address0 sc_out sc_lv 7 signal 5 } 
	{ real_twid_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ real_twid_1_q0 sc_in sc_lv 128 signal 5 } 
	{ img_twid_0_address0 sc_out sc_lv 7 signal 6 } 
	{ img_twid_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ img_twid_0_q0 sc_in sc_lv 128 signal 6 } 
	{ img_twid_1_address0 sc_out sc_lv 7 signal 7 } 
	{ img_twid_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ img_twid_1_q0 sc_in sc_lv 128 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "real_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_0", "role": "address0" }} , 
 	{ "name": "real_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_0", "role": "ce0" }} , 
 	{ "name": "real_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_0", "role": "we0" }} , 
 	{ "name": "real_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_0", "role": "d0" }} , 
 	{ "name": "real_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_0", "role": "q0" }} , 
 	{ "name": "real_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_0", "role": "address1" }} , 
 	{ "name": "real_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_0", "role": "ce1" }} , 
 	{ "name": "real_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_0", "role": "we1" }} , 
 	{ "name": "real_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_0", "role": "d1" }} , 
 	{ "name": "real_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_0", "role": "q1" }} , 
 	{ "name": "real_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_1", "role": "address0" }} , 
 	{ "name": "real_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_1", "role": "ce0" }} , 
 	{ "name": "real_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_1", "role": "we0" }} , 
 	{ "name": "real_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_1", "role": "d0" }} , 
 	{ "name": "real_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_1", "role": "q0" }} , 
 	{ "name": "real_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "real_1", "role": "address1" }} , 
 	{ "name": "real_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_1", "role": "ce1" }} , 
 	{ "name": "real_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_1", "role": "we1" }} , 
 	{ "name": "real_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_1", "role": "d1" }} , 
 	{ "name": "real_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_1", "role": "q1" }} , 
 	{ "name": "img_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_0", "role": "address0" }} , 
 	{ "name": "img_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "ce0" }} , 
 	{ "name": "img_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "we0" }} , 
 	{ "name": "img_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_0", "role": "d0" }} , 
 	{ "name": "img_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_0", "role": "q0" }} , 
 	{ "name": "img_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_0", "role": "address1" }} , 
 	{ "name": "img_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "ce1" }} , 
 	{ "name": "img_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_0", "role": "we1" }} , 
 	{ "name": "img_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_0", "role": "d1" }} , 
 	{ "name": "img_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_0", "role": "q1" }} , 
 	{ "name": "img_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_1", "role": "address0" }} , 
 	{ "name": "img_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "ce0" }} , 
 	{ "name": "img_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "we0" }} , 
 	{ "name": "img_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_1", "role": "d0" }} , 
 	{ "name": "img_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_1", "role": "q0" }} , 
 	{ "name": "img_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_1", "role": "address1" }} , 
 	{ "name": "img_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "ce1" }} , 
 	{ "name": "img_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_1", "role": "we1" }} , 
 	{ "name": "img_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_1", "role": "d1" }} , 
 	{ "name": "img_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_1", "role": "q1" }} , 
 	{ "name": "real_twid_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "real_twid_0", "role": "address0" }} , 
 	{ "name": "real_twid_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_twid_0", "role": "ce0" }} , 
 	{ "name": "real_twid_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_twid_0", "role": "q0" }} , 
 	{ "name": "real_twid_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "real_twid_1", "role": "address0" }} , 
 	{ "name": "real_twid_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "real_twid_1", "role": "ce0" }} , 
 	{ "name": "real_twid_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "real_twid_1", "role": "q0" }} , 
 	{ "name": "img_twid_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "img_twid_0", "role": "address0" }} , 
 	{ "name": "img_twid_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_twid_0", "role": "ce0" }} , 
 	{ "name": "img_twid_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_twid_0", "role": "q0" }} , 
 	{ "name": "img_twid_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "img_twid_1", "role": "address0" }} , 
 	{ "name": "img_twid_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_twid_1", "role": "ce0" }} , 
 	{ "name": "img_twid_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "img_twid_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "real_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "real_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "img_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "img_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "real_twid_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "real_twid_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "img_twid_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "img_twid_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "inner", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "70", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state36"], "QuitState" : ["ap_ST_fsm_state36"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state70", "ap_ST_fsm_state37"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "inner", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "70", "FirstState" : "ap_ST_fsm_state37", "LastState" : ["ap_ST_fsm_state70"], "QuitState" : ["ap_ST_fsm_state70"], "PreState" : ["ap_ST_fsm_state36"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "outer", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "70", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state70"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_max_dsp_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_max_dsp_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U9", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U10", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U11", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U12", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U13", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U14", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U15", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U16", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U17", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U18", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U19", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U20", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U21", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_223_64_1_1_U22", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft {
		real_0 {Type IO LastRead 53 FirstWrite 9}
		real_1 {Type IO LastRead 53 FirstWrite 9}
		img_0 {Type IO LastRead 53 FirstWrite 18}
		img_1 {Type IO LastRead 53 FirstWrite 18}
		real_twid_0 {Type I LastRead 53 FirstWrite -1}
		real_twid_1 {Type I LastRead 53 FirstWrite -1}
		img_twid_0 {Type I LastRead 53 FirstWrite -1}
		img_twid_1 {Type I LastRead 53 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	real_0 { ap_memory {  { real_0_address0 mem_address 1 8 }  { real_0_ce0 mem_ce 1 1 }  { real_0_we0 mem_we 1 1 }  { real_0_d0 mem_din 1 128 }  { real_0_q0 in_data 0 128 }  { real_0_address1 MemPortADDR2 1 8 }  { real_0_ce1 MemPortCE2 1 1 }  { real_0_we1 MemPortWE2 1 1 }  { real_0_d1 MemPortDIN2 1 128 }  { real_0_q1 in_data 0 128 } } }
	real_1 { ap_memory {  { real_1_address0 mem_address 1 8 }  { real_1_ce0 mem_ce 1 1 }  { real_1_we0 mem_we 1 1 }  { real_1_d0 mem_din 1 128 }  { real_1_q0 in_data 0 128 }  { real_1_address1 MemPortADDR2 1 8 }  { real_1_ce1 MemPortCE2 1 1 }  { real_1_we1 MemPortWE2 1 1 }  { real_1_d1 MemPortDIN2 1 128 }  { real_1_q1 in_data 0 128 } } }
	img_0 { ap_memory {  { img_0_address0 mem_address 1 8 }  { img_0_ce0 mem_ce 1 1 }  { img_0_we0 mem_we 1 1 }  { img_0_d0 mem_din 1 128 }  { img_0_q0 in_data 0 128 }  { img_0_address1 MemPortADDR2 1 8 }  { img_0_ce1 MemPortCE2 1 1 }  { img_0_we1 MemPortWE2 1 1 }  { img_0_d1 MemPortDIN2 1 128 }  { img_0_q1 in_data 0 128 } } }
	img_1 { ap_memory {  { img_1_address0 mem_address 1 8 }  { img_1_ce0 mem_ce 1 1 }  { img_1_we0 mem_we 1 1 }  { img_1_d0 mem_din 1 128 }  { img_1_q0 in_data 0 128 }  { img_1_address1 MemPortADDR2 1 8 }  { img_1_ce1 MemPortCE2 1 1 }  { img_1_we1 MemPortWE2 1 1 }  { img_1_d1 MemPortDIN2 1 128 }  { img_1_q1 in_data 0 128 } } }
	real_twid_0 { ap_memory {  { real_twid_0_address0 mem_address 1 7 }  { real_twid_0_ce0 mem_ce 1 1 }  { real_twid_0_q0 in_data 0 128 } } }
	real_twid_1 { ap_memory {  { real_twid_1_address0 mem_address 1 7 }  { real_twid_1_ce0 mem_ce 1 1 }  { real_twid_1_q0 in_data 0 128 } } }
	img_twid_0 { ap_memory {  { img_twid_0_address0 mem_address 1 7 }  { img_twid_0_ce0 mem_ce 1 1 }  { img_twid_0_q0 in_data 0 128 } } }
	img_twid_1 { ap_memory {  { img_twid_1_address0 mem_address 1 7 }  { img_twid_1_ce0 mem_ce 1 1 }  { img_twid_1_q0 in_data 0 128 } } }
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
