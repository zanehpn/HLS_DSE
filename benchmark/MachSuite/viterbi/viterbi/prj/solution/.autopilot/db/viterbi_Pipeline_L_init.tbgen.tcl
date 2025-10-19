set moduleName viterbi_Pipeline_L_init
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
set C_modelName {viterbi_Pipeline_L_init}
set C_modelType { void 0 }
set C_modelArgList {
	{ llike int 128 regular {array 2240 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ init_0 int 128 regular {array 16 { 1 3 } 1 1 }  }
	{ init_1 int 128 regular {array 16 { 1 3 } 1 1 }  }
	{ zext_ln13 int 8 regular  }
	{ zext_ln14_5 int 8 regular  }
	{ zext_ln14_3 int 8 regular  }
	{ emission_0 int 128 regular {array 1024 { 1 3 } 1 1 }  }
	{ emission_1 int 128 regular {array 1024 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "llike", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "init_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "init_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln13", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln14_5", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln14_3", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "emission_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "emission_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 30
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
	{ init_0_address0 sc_out sc_lv 4 signal 1 } 
	{ init_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ init_0_q0 sc_in sc_lv 128 signal 1 } 
	{ init_1_address0 sc_out sc_lv 4 signal 2 } 
	{ init_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ init_1_q0 sc_in sc_lv 128 signal 2 } 
	{ zext_ln13 sc_in sc_lv 8 signal 3 } 
	{ zext_ln14_5 sc_in sc_lv 8 signal 4 } 
	{ zext_ln14_3 sc_in sc_lv 8 signal 5 } 
	{ emission_0_address0 sc_out sc_lv 10 signal 6 } 
	{ emission_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ emission_0_q0 sc_in sc_lv 128 signal 6 } 
	{ emission_1_address0 sc_out sc_lv 10 signal 7 } 
	{ emission_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ emission_1_q0 sc_in sc_lv 128 signal 7 } 
	{ grp_fu_249_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_249_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_249_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_249_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_249_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "init_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "init_0", "role": "address0" }} , 
 	{ "name": "init_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_0", "role": "ce0" }} , 
 	{ "name": "init_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "init_0", "role": "q0" }} , 
 	{ "name": "init_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "init_1", "role": "address0" }} , 
 	{ "name": "init_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "init_1", "role": "ce0" }} , 
 	{ "name": "init_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "init_1", "role": "q0" }} , 
 	{ "name": "zext_ln13", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln13", "role": "default" }} , 
 	{ "name": "zext_ln14_5", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln14_5", "role": "default" }} , 
 	{ "name": "zext_ln14_3", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "zext_ln14_3", "role": "default" }} , 
 	{ "name": "emission_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_0", "role": "address0" }} , 
 	{ "name": "emission_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_0", "role": "ce0" }} , 
 	{ "name": "emission_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_0", "role": "q0" }} , 
 	{ "name": "emission_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "emission_1", "role": "address0" }} , 
 	{ "name": "emission_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "emission_1", "role": "ce0" }} , 
 	{ "name": "emission_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "emission_1", "role": "q0" }} , 
 	{ "name": "grp_fu_249_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_249_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_249_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_249_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_249_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U2", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_64_1_1_U3", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	viterbi_Pipeline_L_init {
		llike {Type O LastRead -1 FirstWrite 7}
		init_0 {Type I LastRead 0 FirstWrite -1}
		init_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln13 {Type I LastRead 0 FirstWrite -1}
		zext_ln14_5 {Type I LastRead 0 FirstWrite -1}
		zext_ln14_3 {Type I LastRead 0 FirstWrite -1}
		emission_0 {Type I LastRead 0 FirstWrite -1}
		emission_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "72", "Max" : "72"}
	, {"Name" : "Interval", "Min" : "72", "Max" : "72"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	llike { ap_memory {  { llike_address0 mem_address 1 12 }  { llike_ce0 mem_ce 1 1 }  { llike_we0 mem_we 1 16 }  { llike_d0 mem_din 1 128 } } }
	init_0 { ap_memory {  { init_0_address0 mem_address 1 4 }  { init_0_ce0 mem_ce 1 1 }  { init_0_q0 in_data 0 128 } } }
	init_1 { ap_memory {  { init_1_address0 mem_address 1 4 }  { init_1_ce0 mem_ce 1 1 }  { init_1_q0 in_data 0 128 } } }
	zext_ln13 { ap_none {  { zext_ln13 in_data 0 8 } } }
	zext_ln14_5 { ap_none {  { zext_ln14_5 in_data 0 8 } } }
	zext_ln14_3 { ap_none {  { zext_ln14_3 in_data 0 8 } } }
	emission_0 { ap_memory {  { emission_0_address0 mem_address 1 10 }  { emission_0_ce0 mem_ce 1 1 }  { emission_0_q0 in_data 0 128 } } }
	emission_1 { ap_memory {  { emission_1_address0 mem_address 1 10 }  { emission_1_ce0 mem_ce 1 1 }  { emission_1_q0 in_data 0 128 } } }
}
