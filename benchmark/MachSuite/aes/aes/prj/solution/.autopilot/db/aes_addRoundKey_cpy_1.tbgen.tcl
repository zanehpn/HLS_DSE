set moduleName aes_addRoundKey_cpy_1
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
set C_modelName {aes_addRoundKey_cpy.1}
set C_modelType { int 768 }
set C_modelArgList {
	{ buf_0 int 16 regular {array 4 { 0 1 } 1 1 }  }
	{ buf_1 int 16 regular {array 4 { 0 1 } 1 1 }  }
	{ ctx_read int 768 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buf_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "ctx_read", "interface" : "wire", "bitwidth" : 768, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 768} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ buf_0_address0 sc_out sc_lv 2 signal 0 } 
	{ buf_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ buf_0_we0 sc_out sc_logic 1 signal 0 } 
	{ buf_0_d0 sc_out sc_lv 16 signal 0 } 
	{ buf_0_address1 sc_out sc_lv 2 signal 0 } 
	{ buf_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ buf_0_q1 sc_in sc_lv 16 signal 0 } 
	{ buf_1_address0 sc_out sc_lv 2 signal 1 } 
	{ buf_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_1_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_1_d0 sc_out sc_lv 16 signal 1 } 
	{ buf_1_address1 sc_out sc_lv 2 signal 1 } 
	{ buf_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ buf_1_q1 sc_in sc_lv 16 signal 1 } 
	{ ctx_read sc_in sc_lv 768 signal 2 } 
	{ ap_return sc_out sc_lv 768 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "buf_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_0", "role": "address0" }} , 
 	{ "name": "buf_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_0", "role": "ce0" }} , 
 	{ "name": "buf_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_0", "role": "we0" }} , 
 	{ "name": "buf_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_0", "role": "d0" }} , 
 	{ "name": "buf_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_0", "role": "address1" }} , 
 	{ "name": "buf_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_0", "role": "ce1" }} , 
 	{ "name": "buf_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_0", "role": "q1" }} , 
 	{ "name": "buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_1", "role": "address0" }} , 
 	{ "name": "buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "ce0" }} , 
 	{ "name": "buf_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "we0" }} , 
 	{ "name": "buf_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "d0" }} , 
 	{ "name": "buf_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_1", "role": "address1" }} , 
 	{ "name": "buf_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "ce1" }} , 
 	{ "name": "buf_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "q1" }} , 
 	{ "name": "ctx_read", "direction": "in", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ctx_read", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "aes_addRoundKey_cpy_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ctx_read", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "cpkey", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_8_1_1_U15", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	aes_addRoundKey_cpy_1 {
		buf_0 {Type IO LastRead 1 FirstWrite 2}
		buf_1 {Type IO LastRead 1 FirstWrite 2}
		ctx_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19", "Max" : "19"}
	, {"Name" : "Interval", "Min" : "19", "Max" : "19"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buf_0 { ap_memory {  { buf_0_address0 mem_address 1 2 }  { buf_0_ce0 mem_ce 1 1 }  { buf_0_we0 mem_we 1 1 }  { buf_0_d0 mem_din 1 16 }  { buf_0_address1 MemPortADDR2 1 2 }  { buf_0_ce1 MemPortCE2 1 1 }  { buf_0_q1 in_data 0 16 } } }
	buf_1 { ap_memory {  { buf_1_address0 mem_address 1 2 }  { buf_1_ce0 mem_ce 1 1 }  { buf_1_we0 mem_we 1 1 }  { buf_1_d0 mem_din 1 16 }  { buf_1_address1 MemPortADDR2 1 2 }  { buf_1_ce1 MemPortCE2 1 1 }  { buf_1_q1 in_data 0 16 } } }
	ctx_read { ap_none {  { ctx_read in_data 0 768 } } }
}
