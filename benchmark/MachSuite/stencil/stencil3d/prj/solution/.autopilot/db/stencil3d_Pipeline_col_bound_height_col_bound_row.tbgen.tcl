set moduleName stencil3d_Pipeline_col_bound_height_col_bound_row
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
set C_modelName {stencil3d_Pipeline_col_bound_height_col_bound_row}
set C_modelType { void 0 }
set C_modelArgList {
	{ sol_0 int 64 regular {array 4096 { 2 3 } 1 1 }  }
	{ orig_0 int 64 regular {array 4096 { 1 1 } 1 1 }  }
	{ orig_1 int 64 regular {array 4096 { 1 1 } 1 1 }  }
	{ sol_1 int 64 regular {array 4096 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sol_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "orig_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "orig_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sol_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sol_0_address0 sc_out sc_lv 12 signal 0 } 
	{ sol_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ sol_0_we0 sc_out sc_logic 1 signal 0 } 
	{ sol_0_d0 sc_out sc_lv 64 signal 0 } 
	{ sol_0_q0 sc_in sc_lv 64 signal 0 } 
	{ orig_0_address0 sc_out sc_lv 12 signal 1 } 
	{ orig_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ orig_0_q0 sc_in sc_lv 64 signal 1 } 
	{ orig_0_address1 sc_out sc_lv 12 signal 1 } 
	{ orig_0_ce1 sc_out sc_logic 1 signal 1 } 
	{ orig_0_q1 sc_in sc_lv 64 signal 1 } 
	{ orig_1_address0 sc_out sc_lv 12 signal 2 } 
	{ orig_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ orig_1_q0 sc_in sc_lv 64 signal 2 } 
	{ orig_1_address1 sc_out sc_lv 12 signal 2 } 
	{ orig_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ orig_1_q1 sc_in sc_lv 64 signal 2 } 
	{ sol_1_address0 sc_out sc_lv 12 signal 3 } 
	{ sol_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ sol_1_we0 sc_out sc_logic 1 signal 3 } 
	{ sol_1_d0 sc_out sc_lv 64 signal 3 } 
	{ sol_1_q0 sc_in sc_lv 64 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sol_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_0", "role": "address0" }} , 
 	{ "name": "sol_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "ce0" }} , 
 	{ "name": "sol_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "we0" }} , 
 	{ "name": "sol_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "d0" }} , 
 	{ "name": "sol_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "q0" }} , 
 	{ "name": "orig_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "orig_0", "role": "address0" }} , 
 	{ "name": "orig_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "orig_0", "role": "ce0" }} , 
 	{ "name": "orig_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "orig_0", "role": "q0" }} , 
 	{ "name": "orig_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "orig_0", "role": "address1" }} , 
 	{ "name": "orig_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "orig_0", "role": "ce1" }} , 
 	{ "name": "orig_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "orig_0", "role": "q1" }} , 
 	{ "name": "orig_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "orig_1", "role": "address0" }} , 
 	{ "name": "orig_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "orig_1", "role": "ce0" }} , 
 	{ "name": "orig_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "orig_1", "role": "q0" }} , 
 	{ "name": "orig_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "orig_1", "role": "address1" }} , 
 	{ "name": "orig_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "orig_1", "role": "ce1" }} , 
 	{ "name": "orig_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "orig_1", "role": "q1" }} , 
 	{ "name": "sol_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_1", "role": "address0" }} , 
 	{ "name": "sol_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "ce0" }} , 
 	{ "name": "sol_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "we0" }} , 
 	{ "name": "sol_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "d0" }} , 
 	{ "name": "sol_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "stencil3d_Pipeline_col_bound_height_col_bound_row",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1922", "EstimateLatencyMax" : "1922",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sol_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "orig_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "orig_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sol_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "col_bound_height_col_bound_row", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U7", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_32_1_1_U8", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	stencil3d_Pipeline_col_bound_height_col_bound_row {
		sol_0 {Type IO LastRead 3 FirstWrite 2}
		orig_0 {Type I LastRead 1 FirstWrite -1}
		orig_1 {Type I LastRead 1 FirstWrite -1}
		sol_1 {Type IO LastRead 3 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1922", "Max" : "1922"}
	, {"Name" : "Interval", "Min" : "1922", "Max" : "1922"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sol_0 { ap_memory {  { sol_0_address0 mem_address 1 12 }  { sol_0_ce0 mem_ce 1 1 }  { sol_0_we0 mem_we 1 1 }  { sol_0_d0 mem_din 1 64 }  { sol_0_q0 in_data 0 64 } } }
	orig_0 { ap_memory {  { orig_0_address0 mem_address 1 12 }  { orig_0_ce0 mem_ce 1 1 }  { orig_0_q0 in_data 0 64 }  { orig_0_address1 MemPortADDR2 1 12 }  { orig_0_ce1 MemPortCE2 1 1 }  { orig_0_q1 in_data 0 64 } } }
	orig_1 { ap_memory {  { orig_1_address0 mem_address 1 12 }  { orig_1_ce0 mem_ce 1 1 }  { orig_1_q0 mem_dout 0 64 }  { orig_1_address1 MemPortADDR2 1 12 }  { orig_1_ce1 MemPortCE2 1 1 }  { orig_1_q1 in_data 0 64 } } }
	sol_1 { ap_memory {  { sol_1_address0 mem_address 1 12 }  { sol_1_ce0 mem_ce 1 1 }  { sol_1_we0 mem_we 1 1 }  { sol_1_d0 mem_din 1 64 }  { sol_1_q0 in_data 0 64 } } }
}
