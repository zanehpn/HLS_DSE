set moduleName aes_mixColumns_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {aes_mixColumns.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ buf_0 int 16 regular {array 4 { 2 2 } 1 1 }  }
	{ buf_1 int 16 regular {array 4 { 2 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buf_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 26
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
	{ buf_0_q0 sc_in sc_lv 16 signal 0 } 
	{ buf_0_address1 sc_out sc_lv 2 signal 0 } 
	{ buf_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ buf_0_we1 sc_out sc_logic 1 signal 0 } 
	{ buf_0_d1 sc_out sc_lv 16 signal 0 } 
	{ buf_0_q1 sc_in sc_lv 16 signal 0 } 
	{ buf_1_address0 sc_out sc_lv 2 signal 1 } 
	{ buf_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ buf_1_we0 sc_out sc_logic 1 signal 1 } 
	{ buf_1_d0 sc_out sc_lv 16 signal 1 } 
	{ buf_1_q0 sc_in sc_lv 16 signal 1 } 
	{ buf_1_address1 sc_out sc_lv 2 signal 1 } 
	{ buf_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ buf_1_we1 sc_out sc_logic 1 signal 1 } 
	{ buf_1_d1 sc_out sc_lv 16 signal 1 } 
	{ buf_1_q1 sc_in sc_lv 16 signal 1 } 
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
 	{ "name": "buf_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_0", "role": "q0" }} , 
 	{ "name": "buf_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_0", "role": "address1" }} , 
 	{ "name": "buf_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_0", "role": "ce1" }} , 
 	{ "name": "buf_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_0", "role": "we1" }} , 
 	{ "name": "buf_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_0", "role": "d1" }} , 
 	{ "name": "buf_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_0", "role": "q1" }} , 
 	{ "name": "buf_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_1", "role": "address0" }} , 
 	{ "name": "buf_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "ce0" }} , 
 	{ "name": "buf_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "we0" }} , 
 	{ "name": "buf_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "d0" }} , 
 	{ "name": "buf_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "q0" }} , 
 	{ "name": "buf_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "buf_1", "role": "address1" }} , 
 	{ "name": "buf_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "ce1" }} , 
 	{ "name": "buf_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_1", "role": "we1" }} , 
 	{ "name": "buf_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "d1" }} , 
 	{ "name": "buf_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "aes_mixColumns_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "4",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	aes_mixColumns_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 2}
		buf_1 {Type IO LastRead 2 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	buf_0 { ap_memory {  { buf_0_address0 mem_address 1 2 }  { buf_0_ce0 mem_ce 1 1 }  { buf_0_we0 mem_we 1 1 }  { buf_0_d0 mem_din 1 16 }  { buf_0_q0 in_data 0 16 }  { buf_0_address1 MemPortADDR2 1 2 }  { buf_0_ce1 MemPortCE2 1 1 }  { buf_0_we1 MemPortWE2 1 1 }  { buf_0_d1 MemPortDIN2 1 16 }  { buf_0_q1 in_data 0 16 } } }
	buf_1 { ap_memory {  { buf_1_address0 mem_address 1 2 }  { buf_1_ce0 mem_ce 1 1 }  { buf_1_we0 mem_we 1 1 }  { buf_1_d0 mem_din 1 16 }  { buf_1_q0 in_data 0 16 }  { buf_1_address1 MemPortADDR2 1 2 }  { buf_1_ce1 MemPortCE2 1 1 }  { buf_1_we1 MemPortWE2 1 1 }  { buf_1_d1 MemPortDIN2 1 16 }  { buf_1_q1 in_data 0 16 } } }
}
