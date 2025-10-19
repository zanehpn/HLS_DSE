set moduleName needwun_Pipeline_fill_in
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
set C_modelName {needwun_Pipeline_fill_in}
set C_modelType { void 0 }
set C_modelArgList {
	{ ptr int 16 regular {array 8321 { 2 3 } 1 1 }  }
	{ M_0 int 64 regular {array 4161 { 2 1 } 1 1 }  }
	{ SEQA_0 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQA_1 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQB_load int 16 regular  }
	{ p_cast21 int 4 regular  }
	{ p_cast15 int 14 regular  }
	{ M_1 int 64 regular {array 4161 { 2 1 } 1 1 }  }
	{ empty int 15 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ptr", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "M_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "SEQA_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQA_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQB_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_cast21", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "p_cast15", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "M_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ptr_address0 sc_out sc_lv 14 signal 0 } 
	{ ptr_ce0 sc_out sc_logic 1 signal 0 } 
	{ ptr_we0 sc_out sc_logic 1 signal 0 } 
	{ ptr_d0 sc_out sc_lv 16 signal 0 } 
	{ ptr_q0 sc_in sc_lv 16 signal 0 } 
	{ M_0_address0 sc_out sc_lv 13 signal 1 } 
	{ M_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ M_0_we0 sc_out sc_logic 1 signal 1 } 
	{ M_0_d0 sc_out sc_lv 64 signal 1 } 
	{ M_0_q0 sc_in sc_lv 64 signal 1 } 
	{ M_0_address1 sc_out sc_lv 13 signal 1 } 
	{ M_0_ce1 sc_out sc_logic 1 signal 1 } 
	{ M_0_q1 sc_in sc_lv 64 signal 1 } 
	{ SEQA_0_address0 sc_out sc_lv 5 signal 2 } 
	{ SEQA_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ SEQA_0_q0 sc_in sc_lv 16 signal 2 } 
	{ SEQA_1_address0 sc_out sc_lv 5 signal 3 } 
	{ SEQA_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ SEQA_1_q0 sc_in sc_lv 16 signal 3 } 
	{ SEQB_load sc_in sc_lv 16 signal 4 } 
	{ p_cast21 sc_in sc_lv 4 signal 5 } 
	{ p_cast15 sc_in sc_lv 14 signal 6 } 
	{ M_1_address0 sc_out sc_lv 13 signal 7 } 
	{ M_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ M_1_we0 sc_out sc_logic 1 signal 7 } 
	{ M_1_d0 sc_out sc_lv 64 signal 7 } 
	{ M_1_q0 sc_in sc_lv 64 signal 7 } 
	{ M_1_address1 sc_out sc_lv 13 signal 7 } 
	{ M_1_ce1 sc_out sc_logic 1 signal 7 } 
	{ M_1_q1 sc_in sc_lv 64 signal 7 } 
	{ empty sc_in sc_lv 15 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ptr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ptr", "role": "address0" }} , 
 	{ "name": "ptr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ptr", "role": "ce0" }} , 
 	{ "name": "ptr_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ptr", "role": "we0" }} , 
 	{ "name": "ptr_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ptr", "role": "d0" }} , 
 	{ "name": "ptr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ptr", "role": "q0" }} , 
 	{ "name": "M_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_0", "role": "address0" }} , 
 	{ "name": "M_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "ce0" }} , 
 	{ "name": "M_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "we0" }} , 
 	{ "name": "M_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "d0" }} , 
 	{ "name": "M_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "q0" }} , 
 	{ "name": "M_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_0", "role": "address1" }} , 
 	{ "name": "M_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "ce1" }} , 
 	{ "name": "M_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "q1" }} , 
 	{ "name": "SEQA_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "SEQA_0", "role": "address0" }} , 
 	{ "name": "SEQA_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SEQA_0", "role": "ce0" }} , 
 	{ "name": "SEQA_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQA_0", "role": "q0" }} , 
 	{ "name": "SEQA_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "SEQA_1", "role": "address0" }} , 
 	{ "name": "SEQA_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SEQA_1", "role": "ce0" }} , 
 	{ "name": "SEQA_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQA_1", "role": "q0" }} , 
 	{ "name": "SEQB_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "SEQB_load", "role": "default" }} , 
 	{ "name": "p_cast21", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p_cast21", "role": "default" }} , 
 	{ "name": "p_cast15", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_cast15", "role": "default" }} , 
 	{ "name": "M_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_1", "role": "address0" }} , 
 	{ "name": "M_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "ce0" }} , 
 	{ "name": "M_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "we0" }} , 
 	{ "name": "M_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "d0" }} , 
 	{ "name": "M_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "q0" }} , 
 	{ "name": "M_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_1", "role": "address1" }} , 
 	{ "name": "M_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "ce1" }} , 
 	{ "name": "M_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "q1" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "empty", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "needwun_Pipeline_fill_in",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "676", "EstimateLatencyMax" : "676",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ptr", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "M_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "SEQA_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SEQA_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "SEQB_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_cast21", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_cast15", "Type" : "None", "Direction" : "I"},
			{"Name" : "M_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "fill_in", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_15ns_15ns_14_19_1_U16", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_15ns_15ns_15_19_1_U17", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_8_1_1_U18", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_14ns_14ns_14_18_1_U19", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_14ns_14ns_14_18_1_U20", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_14ns_14ns_14_18_1_U21", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_14ns_14ns_14_18_1_U22", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_32_1_1_U23", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_32_1_1_U24", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_32ns_32ns_32_1_1_U25", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_32ns_32s_32_1_1_U26", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_22_32_1_1_U27", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_32ns_32s_32_1_1_U28", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15ns_16ns_31_4_1_U29", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14ns_15ns_29_4_1_U30", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15ns_16ns_31_4_1_U31", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14ns_15ns_29_4_1_U32", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15ns_16ns_31_4_1_U33", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15ns_16ns_31_4_1_U34", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14ns_15ns_29_4_1_U35", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_14ns_15ns_29_4_1_U36", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	needwun_Pipeline_fill_in {
		ptr {Type IO LastRead 35 FirstWrite 39}
		M_0 {Type IO LastRead 36 FirstWrite 38}
		SEQA_0 {Type I LastRead 0 FirstWrite -1}
		SEQA_1 {Type I LastRead 0 FirstWrite -1}
		SEQB_load {Type I LastRead 0 FirstWrite -1}
		p_cast21 {Type I LastRead 0 FirstWrite -1}
		p_cast15 {Type I LastRead 0 FirstWrite -1}
		M_1 {Type IO LastRead 36 FirstWrite 38}
		empty {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "676", "Max" : "676"}
	, {"Name" : "Interval", "Min" : "676", "Max" : "676"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	ptr { ap_memory {  { ptr_address0 mem_address 1 14 }  { ptr_ce0 mem_ce 1 1 }  { ptr_we0 mem_we 1 1 }  { ptr_d0 mem_din 1 16 }  { ptr_q0 mem_dout 0 16 } } }
	M_0 { ap_memory {  { M_0_address0 mem_address 1 13 }  { M_0_ce0 mem_ce 1 1 }  { M_0_we0 mem_we 1 1 }  { M_0_d0 mem_din 1 64 }  { M_0_q0 in_data 0 64 }  { M_0_address1 MemPortADDR2 1 13 }  { M_0_ce1 MemPortCE2 1 1 }  { M_0_q1 in_data 0 64 } } }
	SEQA_0 { ap_memory {  { SEQA_0_address0 mem_address 1 5 }  { SEQA_0_ce0 mem_ce 1 1 }  { SEQA_0_q0 in_data 0 16 } } }
	SEQA_1 { ap_memory {  { SEQA_1_address0 mem_address 1 5 }  { SEQA_1_ce0 mem_ce 1 1 }  { SEQA_1_q0 in_data 0 16 } } }
	SEQB_load { ap_none {  { SEQB_load in_data 0 16 } } }
	p_cast21 { ap_none {  { p_cast21 in_data 0 4 } } }
	p_cast15 { ap_none {  { p_cast15 in_data 0 14 } } }
	M_1 { ap_memory {  { M_1_address0 mem_address 1 13 }  { M_1_ce0 mem_ce 1 1 }  { M_1_we0 mem_we 1 1 }  { M_1_d0 mem_din 1 64 }  { M_1_q0 in_data 0 64 }  { M_1_address1 MemPortADDR2 1 13 }  { M_1_ce1 MemPortCE2 1 1 }  { M_1_q1 MemPortDOUT2 0 64 } } }
	empty { ap_none {  { empty in_data 0 15 } } }
}
