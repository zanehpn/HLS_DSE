set moduleName needwun_Pipeline_trace
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
set C_modelName {needwun_Pipeline_trace}
set C_modelType { void 0 }
set C_modelArgList {
	{ SEQA_0 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQA_1 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQB int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ ptr int 16 regular {array 8321 { 1 3 } 1 1 }  }
	{ alignedA int 8 regular {array 256 { 0 3 } 0 1 }  }
	{ alignedB int 8 regular {array 256 { 0 3 } 0 1 }  }
	{ b_str_idx_out int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "SEQA_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQA_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQB", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ptr", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "alignedA", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alignedB", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "b_str_idx_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ SEQA_0_address0 sc_out sc_lv 5 signal 0 } 
	{ SEQA_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ SEQA_0_q0 sc_in sc_lv 16 signal 0 } 
	{ SEQA_1_address0 sc_out sc_lv 5 signal 1 } 
	{ SEQA_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ SEQA_1_q0 sc_in sc_lv 16 signal 1 } 
	{ SEQB_address0 sc_out sc_lv 6 signal 2 } 
	{ SEQB_ce0 sc_out sc_logic 1 signal 2 } 
	{ SEQB_q0 sc_in sc_lv 16 signal 2 } 
	{ ptr_address0 sc_out sc_lv 14 signal 3 } 
	{ ptr_ce0 sc_out sc_logic 1 signal 3 } 
	{ ptr_q0 sc_in sc_lv 16 signal 3 } 
	{ alignedA_address0 sc_out sc_lv 8 signal 4 } 
	{ alignedA_ce0 sc_out sc_logic 1 signal 4 } 
	{ alignedA_we0 sc_out sc_logic 1 signal 4 } 
	{ alignedA_d0 sc_out sc_lv 8 signal 4 } 
	{ alignedB_address0 sc_out sc_lv 8 signal 5 } 
	{ alignedB_ce0 sc_out sc_logic 1 signal 5 } 
	{ alignedB_we0 sc_out sc_logic 1 signal 5 } 
	{ alignedB_d0 sc_out sc_lv 8 signal 5 } 
	{ b_str_idx_out sc_out sc_lv 32 signal 6 } 
	{ b_str_idx_out_ap_vld sc_out sc_logic 1 outvld 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "SEQA_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "SEQA_0", "role": "address0" }} , 
 	{ "name": "SEQA_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SEQA_0", "role": "ce0" }} , 
 	{ "name": "SEQA_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQA_0", "role": "q0" }} , 
 	{ "name": "SEQA_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "SEQA_1", "role": "address0" }} , 
 	{ "name": "SEQA_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SEQA_1", "role": "ce0" }} , 
 	{ "name": "SEQA_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQA_1", "role": "q0" }} , 
 	{ "name": "SEQB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "SEQB", "role": "address0" }} , 
 	{ "name": "SEQB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SEQB", "role": "ce0" }} , 
 	{ "name": "SEQB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQB", "role": "q0" }} , 
 	{ "name": "ptr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ptr", "role": "address0" }} , 
 	{ "name": "ptr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ptr", "role": "ce0" }} , 
 	{ "name": "ptr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ptr", "role": "q0" }} , 
 	{ "name": "alignedA_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "address0" }} , 
 	{ "name": "alignedA_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "ce0" }} , 
 	{ "name": "alignedA_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "we0" }} , 
 	{ "name": "alignedA_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "d0" }} , 
 	{ "name": "alignedB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "address0" }} , 
 	{ "name": "alignedB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "ce0" }} , 
 	{ "name": "alignedB_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "we0" }} , 
 	{ "name": "alignedB_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "d0" }} , 
 	{ "name": "b_str_idx_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b_str_idx_out", "role": "default" }} , 
 	{ "name": "b_str_idx_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "b_str_idx_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "needwun_Pipeline_trace",
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
			{"Name" : "SEQA_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SEQA_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SEQB", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ptr", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "alignedA", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "alignedB", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "b_str_idx_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "trace", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "38", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_9ns_32_1_1_U85", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_34ns_65_1_1_U86", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32ns_15ns_32_36_1_U87", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_226_8_1_1_U88", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_226_8_1_1_U89", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	needwun_Pipeline_trace {
		SEQA_0 {Type I LastRead 39 FirstWrite -1}
		SEQA_1 {Type I LastRead 39 FirstWrite -1}
		SEQB {Type I LastRead 39 FirstWrite -1}
		ptr {Type I LastRead 37 FirstWrite -1}
		alignedA {Type O LastRead -1 FirstWrite 38}
		alignedB {Type O LastRead -1 FirstWrite 38}
		b_str_idx_out {Type O LastRead -1 FirstWrite 38}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	SEQA_0 { ap_memory {  { SEQA_0_address0 mem_address 1 5 }  { SEQA_0_ce0 mem_ce 1 1 }  { SEQA_0_q0 in_data 0 16 } } }
	SEQA_1 { ap_memory {  { SEQA_1_address0 mem_address 1 5 }  { SEQA_1_ce0 mem_ce 1 1 }  { SEQA_1_q0 mem_dout 0 16 } } }
	SEQB { ap_memory {  { SEQB_address0 mem_address 1 6 }  { SEQB_ce0 mem_ce 1 1 }  { SEQB_q0 in_data 0 16 } } }
	ptr { ap_memory {  { ptr_address0 mem_address 1 14 }  { ptr_ce0 mem_ce 1 1 }  { ptr_q0 in_data 0 16 } } }
	alignedA { ap_memory {  { alignedA_address0 mem_address 1 8 }  { alignedA_ce0 mem_ce 1 1 }  { alignedA_we0 mem_we 1 1 }  { alignedA_d0 mem_din 1 8 } } }
	alignedB { ap_memory {  { alignedB_address0 mem_address 1 8 }  { alignedB_ce0 mem_ce 1 1 }  { alignedB_we0 mem_we 1 1 }  { alignedB_d0 mem_din 1 8 } } }
	b_str_idx_out { ap_vld {  { b_str_idx_out out_data 1 32 }  { b_str_idx_out_ap_vld out_vld 1 1 } } }
}
