set moduleName needwun
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
set C_modelName {needwun}
set C_modelType { void 0 }
set C_modelArgList {
	{ SEQA_0 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQA_1 int 16 regular {array 32 { 1 3 } 1 1 }  }
	{ SEQB int 16 regular {array 64 { 1 3 } 1 1 }  }
	{ alignedA int 8 regular {array 256 { 0 0 } 0 1 }  }
	{ alignedB int 8 regular {array 256 { 0 0 } 0 1 }  }
	{ M_0 int 64 regular {array 4161 { 2 1 } 1 1 }  }
	{ M_1 int 64 regular {array 4161 { 2 1 } 1 1 }  }
	{ ptr int 16 regular {array 8321 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "SEQA_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQA_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "SEQB", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "alignedA", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "alignedB", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "M_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "M_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "ptr", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 52
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
	{ alignedA_address0 sc_out sc_lv 8 signal 3 } 
	{ alignedA_ce0 sc_out sc_logic 1 signal 3 } 
	{ alignedA_we0 sc_out sc_logic 1 signal 3 } 
	{ alignedA_d0 sc_out sc_lv 8 signal 3 } 
	{ alignedA_address1 sc_out sc_lv 8 signal 3 } 
	{ alignedA_ce1 sc_out sc_logic 1 signal 3 } 
	{ alignedA_we1 sc_out sc_logic 1 signal 3 } 
	{ alignedA_d1 sc_out sc_lv 8 signal 3 } 
	{ alignedB_address0 sc_out sc_lv 8 signal 4 } 
	{ alignedB_ce0 sc_out sc_logic 1 signal 4 } 
	{ alignedB_we0 sc_out sc_logic 1 signal 4 } 
	{ alignedB_d0 sc_out sc_lv 8 signal 4 } 
	{ alignedB_address1 sc_out sc_lv 8 signal 4 } 
	{ alignedB_ce1 sc_out sc_logic 1 signal 4 } 
	{ alignedB_we1 sc_out sc_logic 1 signal 4 } 
	{ alignedB_d1 sc_out sc_lv 8 signal 4 } 
	{ M_0_address0 sc_out sc_lv 13 signal 5 } 
	{ M_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ M_0_we0 sc_out sc_logic 1 signal 5 } 
	{ M_0_d0 sc_out sc_lv 64 signal 5 } 
	{ M_0_q0 sc_in sc_lv 64 signal 5 } 
	{ M_0_address1 sc_out sc_lv 13 signal 5 } 
	{ M_0_ce1 sc_out sc_logic 1 signal 5 } 
	{ M_0_q1 sc_in sc_lv 64 signal 5 } 
	{ M_1_address0 sc_out sc_lv 13 signal 6 } 
	{ M_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ M_1_we0 sc_out sc_logic 1 signal 6 } 
	{ M_1_d0 sc_out sc_lv 64 signal 6 } 
	{ M_1_q0 sc_in sc_lv 64 signal 6 } 
	{ M_1_address1 sc_out sc_lv 13 signal 6 } 
	{ M_1_ce1 sc_out sc_logic 1 signal 6 } 
	{ M_1_q1 sc_in sc_lv 64 signal 6 } 
	{ ptr_address0 sc_out sc_lv 14 signal 7 } 
	{ ptr_ce0 sc_out sc_logic 1 signal 7 } 
	{ ptr_we0 sc_out sc_logic 1 signal 7 } 
	{ ptr_d0 sc_out sc_lv 16 signal 7 } 
	{ ptr_q0 sc_in sc_lv 16 signal 7 } 
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
 	{ "name": "alignedA_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "address0" }} , 
 	{ "name": "alignedA_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "ce0" }} , 
 	{ "name": "alignedA_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "we0" }} , 
 	{ "name": "alignedA_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "d0" }} , 
 	{ "name": "alignedA_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "address1" }} , 
 	{ "name": "alignedA_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "ce1" }} , 
 	{ "name": "alignedA_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedA", "role": "we1" }} , 
 	{ "name": "alignedA_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedA", "role": "d1" }} , 
 	{ "name": "alignedB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "address0" }} , 
 	{ "name": "alignedB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "ce0" }} , 
 	{ "name": "alignedB_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "we0" }} , 
 	{ "name": "alignedB_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "d0" }} , 
 	{ "name": "alignedB_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "address1" }} , 
 	{ "name": "alignedB_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "ce1" }} , 
 	{ "name": "alignedB_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alignedB", "role": "we1" }} , 
 	{ "name": "alignedB_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alignedB", "role": "d1" }} , 
 	{ "name": "M_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_0", "role": "address0" }} , 
 	{ "name": "M_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "ce0" }} , 
 	{ "name": "M_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "we0" }} , 
 	{ "name": "M_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "d0" }} , 
 	{ "name": "M_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "q0" }} , 
 	{ "name": "M_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_0", "role": "address1" }} , 
 	{ "name": "M_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_0", "role": "ce1" }} , 
 	{ "name": "M_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_0", "role": "q1" }} , 
 	{ "name": "M_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_1", "role": "address0" }} , 
 	{ "name": "M_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "ce0" }} , 
 	{ "name": "M_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "we0" }} , 
 	{ "name": "M_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "d0" }} , 
 	{ "name": "M_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "q0" }} , 
 	{ "name": "M_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "M_1", "role": "address1" }} , 
 	{ "name": "M_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_1", "role": "ce1" }} , 
 	{ "name": "M_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "M_1", "role": "q1" }} , 
 	{ "name": "ptr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "ptr", "role": "address0" }} , 
 	{ "name": "ptr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ptr", "role": "ce0" }} , 
 	{ "name": "ptr_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ptr", "role": "we0" }} , 
 	{ "name": "ptr_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ptr", "role": "d0" }} , 
 	{ "name": "ptr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ptr", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "13", "20", "43", "68", "70"],
		"CDFG" : "needwun",
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
			{"Name" : "SEQA_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_needwun_Pipeline_fill_in1_fu_173", "Port" : "SEQA_0", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "SEQA_0", "Inst_start_state" : "5", "Inst_end_state" : "10"},
					{"ID" : "20", "SubInstance" : "grp_needwun_Pipeline_fill_in_fu_154", "Port" : "SEQA_0", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "SEQA_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_needwun_Pipeline_fill_in1_fu_173", "Port" : "SEQA_1", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "SEQA_1", "Inst_start_state" : "5", "Inst_end_state" : "10"},
					{"ID" : "20", "SubInstance" : "grp_needwun_Pipeline_fill_in_fu_154", "Port" : "SEQA_1", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "SEQB", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "SEQB", "Inst_start_state" : "5", "Inst_end_state" : "10"}]},
			{"Name" : "alignedA", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "alignedA", "Inst_start_state" : "5", "Inst_end_state" : "10"},
					{"ID" : "68", "SubInstance" : "grp_needwun_Pipeline_pad_a_fu_192", "Port" : "alignedA", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "alignedB", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "alignedB", "Inst_start_state" : "5", "Inst_end_state" : "10"},
					{"ID" : "70", "SubInstance" : "grp_needwun_Pipeline_pad_b_fu_199", "Port" : "alignedB", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "M_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_needwun_Pipeline_init_col_fu_129", "Port" : "M_0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "43", "SubInstance" : "grp_needwun_Pipeline_fill_in1_fu_173", "Port" : "M_0", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "1", "SubInstance" : "grp_needwun_Pipeline_init_row_fu_123", "Port" : "M_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "20", "SubInstance" : "grp_needwun_Pipeline_fill_in_fu_154", "Port" : "M_0", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "M_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_needwun_Pipeline_init_col_fu_129", "Port" : "M_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "43", "SubInstance" : "grp_needwun_Pipeline_fill_in1_fu_173", "Port" : "M_1", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "20", "SubInstance" : "grp_needwun_Pipeline_fill_in_fu_154", "Port" : "M_1", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "ptr", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "43", "SubInstance" : "grp_needwun_Pipeline_fill_in1_fu_173", "Port" : "ptr", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_needwun_Pipeline_trace_fu_137", "Port" : "ptr", "Inst_start_state" : "5", "Inst_end_state" : "10"},
					{"ID" : "20", "SubInstance" : "grp_needwun_Pipeline_fill_in_fu_154", "Port" : "ptr", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}],
		"Loop" : [
			{"Name" : "fill_out", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state9"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state10"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_row_fu_123", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "needwun_Pipeline_init_row",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "M_0", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "init_row", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_row_fu_123.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9", "10", "11", "12"],
		"CDFG" : "needwun_Pipeline_init_col",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "348", "EstimateLatencyMax" : "348",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "M_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "M_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "init_col", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter22", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter21", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.urem_64ns_15ns_14_68_1_U2", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.urem_64ns_15ns_14_68_1_U3", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.urem_14ns_14ns_14_18_1_U4", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.urem_14ns_14ns_14_18_1_U5", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.mul_64ns_66ns_79_2_1_U6", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.mul_64ns_66ns_79_2_1_U7", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.mul_mul_14ns_15ns_29_4_1_U8", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.mul_mul_14ns_15ns_29_4_1_U9", "Parent" : "3"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_init_col_fu_129.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137", "Parent" : "0", "Child" : ["14", "15", "16", "17", "18", "19"],
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
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.mul_32s_9ns_32_1_1_U85", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.mul_32ns_34ns_65_1_1_U86", "Parent" : "13"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.urem_32ns_15ns_32_36_1_U87", "Parent" : "13"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.mux_226_8_1_1_U88", "Parent" : "13"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.mux_226_8_1_1_U89", "Parent" : "13"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_trace_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154", "Parent" : "0", "Child" : ["21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"],
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
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_15ns_15ns_14_19_1_U16", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_15ns_15ns_15_19_1_U17", "Parent" : "20"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mux_21_8_1_1_U18", "Parent" : "20"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_14ns_14ns_14_18_1_U19", "Parent" : "20"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_14ns_14ns_14_18_1_U20", "Parent" : "20"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_14ns_14ns_14_18_1_U21", "Parent" : "20"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.urem_14ns_14ns_14_18_1_U22", "Parent" : "20"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mux_22_32_1_1_U23", "Parent" : "20"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mux_22_32_1_1_U24", "Parent" : "20"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.add_32ns_32ns_32_1_1_U25", "Parent" : "20"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.add_32ns_32s_32_1_1_U26", "Parent" : "20"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mux_22_32_1_1_U27", "Parent" : "20"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.add_32ns_32s_32_1_1_U28", "Parent" : "20"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_15ns_16ns_31_4_1_U29", "Parent" : "20"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_14ns_15ns_29_4_1_U30", "Parent" : "20"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_15ns_16ns_31_4_1_U31", "Parent" : "20"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_14ns_15ns_29_4_1_U32", "Parent" : "20"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_15ns_16ns_31_4_1_U33", "Parent" : "20"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_15ns_16ns_31_4_1_U34", "Parent" : "20"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_14ns_15ns_29_4_1_U35", "Parent" : "20"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.mul_mul_14ns_15ns_29_4_1_U36", "Parent" : "20"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in_fu_154.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173", "Parent" : "0", "Child" : ["44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67"],
		"CDFG" : "needwun_Pipeline_fill_in1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "677", "EstimateLatencyMax" : "677",
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
			{"Name" : "SEQB_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_cast21", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "M_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "fill_in", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_15ns_15ns_14_19_1_U53", "Parent" : "43"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_15ns_15ns_14_19_1_U54", "Parent" : "43"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mux_21_8_1_1_U55", "Parent" : "43"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_15ns_15ns_14_19_1_U56", "Parent" : "43"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_15ns_15ns_15_19_1_U57", "Parent" : "43"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_14ns_14ns_14_18_1_U58", "Parent" : "43"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_14ns_14ns_14_18_1_U59", "Parent" : "43"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_14ns_14ns_14_18_1_U60", "Parent" : "43"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.urem_14ns_14ns_14_18_1_U61", "Parent" : "43"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mux_22_32_1_1_U62", "Parent" : "43"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.add_32ns_32ns_32_1_1_U63", "Parent" : "43"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mux_22_32_1_1_U64", "Parent" : "43"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.add_32ns_32s_32_1_1_U65", "Parent" : "43"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mux_22_32_1_1_U66", "Parent" : "43"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.add_32ns_32s_32_1_1_U67", "Parent" : "43"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_15ns_16ns_31_4_1_U68", "Parent" : "43"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_15ns_16ns_31_4_1_U69", "Parent" : "43"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_14ns_15ns_29_4_1_U70", "Parent" : "43"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_14ns_15ns_29_4_1_U71", "Parent" : "43"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_14ns_15ns_29_4_1_U72", "Parent" : "43"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_14ns_15ns_29_4_1_U73", "Parent" : "43"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_15ns_16ns_31_4_1_U74", "Parent" : "43"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.mul_mul_15ns_16ns_31_4_1_U75", "Parent" : "43"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_fill_in1_fu_173.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_pad_a_fu_192", "Parent" : "0", "Child" : ["69"],
		"CDFG" : "needwun_Pipeline_pad_a",
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
			{"Name" : "trunc_ln3", "Type" : "None", "Direction" : "I"},
			{"Name" : "alignedA", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pad_a", "PipelineType" : "NotSupport"}]},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_pad_a_fu_192.flow_control_loop_pipe_sequential_init_U", "Parent" : "68"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_pad_b_fu_199", "Parent" : "0", "Child" : ["71"],
		"CDFG" : "needwun_Pipeline_pad_b",
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
			{"Name" : "trunc_ln3", "Type" : "None", "Direction" : "I"},
			{"Name" : "alignedB", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pad_b", "PipelineType" : "NotSupport"}]},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_needwun_Pipeline_pad_b_fu_199.flow_control_loop_pipe_sequential_init_U", "Parent" : "70"}]}


set ArgLastReadFirstWriteLatency {
	needwun {
		SEQA_0 {Type I LastRead 39 FirstWrite -1}
		SEQA_1 {Type I LastRead 39 FirstWrite -1}
		SEQB {Type I LastRead 39 FirstWrite -1}
		alignedA {Type O LastRead -1 FirstWrite 0}
		alignedB {Type O LastRead -1 FirstWrite 0}
		M_0 {Type IO LastRead 88 FirstWrite 1}
		M_1 {Type IO LastRead 88 FirstWrite 38}
		ptr {Type IO LastRead 37 FirstWrite -1}}
	needwun_Pipeline_init_row {
		M_0 {Type IO LastRead 0 FirstWrite 1}}
	needwun_Pipeline_init_col {
		M_0 {Type IO LastRead 88 FirstWrite 87}
		M_1 {Type IO LastRead 88 FirstWrite 87}}
	needwun_Pipeline_trace {
		SEQA_0 {Type I LastRead 39 FirstWrite -1}
		SEQA_1 {Type I LastRead 39 FirstWrite -1}
		SEQB {Type I LastRead 39 FirstWrite -1}
		ptr {Type I LastRead 37 FirstWrite -1}
		alignedA {Type O LastRead -1 FirstWrite 38}
		alignedB {Type O LastRead -1 FirstWrite 38}
		b_str_idx_out {Type O LastRead -1 FirstWrite 38}}
	needwun_Pipeline_fill_in {
		ptr {Type IO LastRead 35 FirstWrite 39}
		M_0 {Type IO LastRead 36 FirstWrite 38}
		SEQA_0 {Type I LastRead 0 FirstWrite -1}
		SEQA_1 {Type I LastRead 0 FirstWrite -1}
		SEQB_load {Type I LastRead 0 FirstWrite -1}
		p_cast21 {Type I LastRead 0 FirstWrite -1}
		p_cast15 {Type I LastRead 0 FirstWrite -1}
		M_1 {Type IO LastRead 36 FirstWrite 38}
		empty {Type I LastRead 0 FirstWrite -1}}
	needwun_Pipeline_fill_in1 {
		ptr {Type IO LastRead 36 FirstWrite 40}
		M_0 {Type IO LastRead 37 FirstWrite 39}
		SEQA_0 {Type I LastRead 0 FirstWrite -1}
		SEQA_1 {Type I LastRead 0 FirstWrite -1}
		SEQB_load_3 {Type I LastRead 0 FirstWrite -1}
		p_cast21 {Type I LastRead 0 FirstWrite -1}
		empty_16 {Type I LastRead 0 FirstWrite -1}
		M_1 {Type IO LastRead 37 FirstWrite 39}
		empty {Type I LastRead 0 FirstWrite -1}}
	needwun_Pipeline_pad_a {
		trunc_ln3 {Type I LastRead 0 FirstWrite -1}
		alignedA {Type O LastRead -1 FirstWrite 0}}
	needwun_Pipeline_pad_b {
		trunc_ln3 {Type I LastRead 0 FirstWrite -1}
		alignedB {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	SEQA_0 { ap_memory {  { SEQA_0_address0 mem_address 1 5 }  { SEQA_0_ce0 mem_ce 1 1 }  { SEQA_0_q0 mem_dout 0 16 } } }
	SEQA_1 { ap_memory {  { SEQA_1_address0 mem_address 1 5 }  { SEQA_1_ce0 mem_ce 1 1 }  { SEQA_1_q0 mem_dout 0 16 } } }
	SEQB { ap_memory {  { SEQB_address0 mem_address 1 6 }  { SEQB_ce0 mem_ce 1 1 }  { SEQB_q0 mem_dout 0 16 } } }
	alignedA { ap_memory {  { alignedA_address0 mem_address 1 8 }  { alignedA_ce0 mem_ce 1 1 }  { alignedA_we0 mem_we 1 1 }  { alignedA_d0 mem_din 1 8 }  { alignedA_address1 MemPortADDR2 1 8 }  { alignedA_ce1 MemPortCE2 1 1 }  { alignedA_we1 MemPortWE2 1 1 }  { alignedA_d1 MemPortDIN2 1 8 } } }
	alignedB { ap_memory {  { alignedB_address0 mem_address 1 8 }  { alignedB_ce0 mem_ce 1 1 }  { alignedB_we0 mem_we 1 1 }  { alignedB_d0 mem_din 1 8 }  { alignedB_address1 MemPortADDR2 1 8 }  { alignedB_ce1 MemPortCE2 1 1 }  { alignedB_we1 MemPortWE2 1 1 }  { alignedB_d1 MemPortDIN2 1 8 } } }
	M_0 { ap_memory {  { M_0_address0 mem_address 1 13 }  { M_0_ce0 mem_ce 1 1 }  { M_0_we0 mem_we 1 1 }  { M_0_d0 mem_din 1 64 }  { M_0_q0 mem_dout 0 64 }  { M_0_address1 MemPortADDR2 1 13 }  { M_0_ce1 MemPortCE2 1 1 }  { M_0_q1 MemPortDOUT2 0 64 } } }
	M_1 { ap_memory {  { M_1_address0 mem_address 1 13 }  { M_1_ce0 mem_ce 1 1 }  { M_1_we0 mem_we 1 1 }  { M_1_d0 mem_din 1 64 }  { M_1_q0 mem_dout 0 64 }  { M_1_address1 MemPortADDR2 1 13 }  { M_1_ce1 MemPortCE2 1 1 }  { M_1_q1 MemPortDOUT2 0 64 } } }
	ptr { ap_memory {  { ptr_address0 mem_address 1 14 }  { ptr_ce0 mem_ce 1 1 }  { ptr_we0 mem_we 1 1 }  { ptr_d0 mem_din 1 16 }  { ptr_q0 mem_dout 0 16 } } }
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
