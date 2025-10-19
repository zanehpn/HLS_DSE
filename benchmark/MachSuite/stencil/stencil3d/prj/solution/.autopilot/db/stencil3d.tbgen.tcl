set moduleName stencil3d
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
set C_modelName {stencil3d}
set C_modelType { void 0 }
set C_modelArgList {
	{ C int 32 regular {array 2 { 1 1 } 1 1 }  }
	{ orig_0 int 64 regular {array 4096 { 1 1 } 1 1 }  }
	{ orig_1 int 64 regular {array 4096 { 1 1 } 1 1 }  }
	{ sol_0 int 64 regular {array 4096 { 2 2 } 1 1 }  }
	{ sol_1 int 64 regular {array 4096 { 2 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "C", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "orig_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "orig_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sol_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "sol_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ C_address0 sc_out sc_lv 1 signal 0 } 
	{ C_ce0 sc_out sc_logic 1 signal 0 } 
	{ C_q0 sc_in sc_lv 32 signal 0 } 
	{ C_address1 sc_out sc_lv 1 signal 0 } 
	{ C_ce1 sc_out sc_logic 1 signal 0 } 
	{ C_q1 sc_in sc_lv 32 signal 0 } 
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
	{ sol_0_address0 sc_out sc_lv 12 signal 3 } 
	{ sol_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ sol_0_we0 sc_out sc_logic 1 signal 3 } 
	{ sol_0_d0 sc_out sc_lv 64 signal 3 } 
	{ sol_0_q0 sc_in sc_lv 64 signal 3 } 
	{ sol_0_address1 sc_out sc_lv 12 signal 3 } 
	{ sol_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ sol_0_we1 sc_out sc_logic 1 signal 3 } 
	{ sol_0_d1 sc_out sc_lv 64 signal 3 } 
	{ sol_0_q1 sc_in sc_lv 64 signal 3 } 
	{ sol_1_address0 sc_out sc_lv 12 signal 4 } 
	{ sol_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ sol_1_we0 sc_out sc_logic 1 signal 4 } 
	{ sol_1_d0 sc_out sc_lv 64 signal 4 } 
	{ sol_1_q0 sc_in sc_lv 64 signal 4 } 
	{ sol_1_address1 sc_out sc_lv 12 signal 4 } 
	{ sol_1_ce1 sc_out sc_logic 1 signal 4 } 
	{ sol_1_we1 sc_out sc_logic 1 signal 4 } 
	{ sol_1_d1 sc_out sc_lv 64 signal 4 } 
	{ sol_1_q1 sc_in sc_lv 64 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "C_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "address0" }} , 
 	{ "name": "C_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "ce0" }} , 
 	{ "name": "C_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "q0" }} , 
 	{ "name": "C_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "address1" }} , 
 	{ "name": "C_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "ce1" }} , 
 	{ "name": "C_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "q1" }} , 
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
 	{ "name": "sol_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_0", "role": "address0" }} , 
 	{ "name": "sol_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "ce0" }} , 
 	{ "name": "sol_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "we0" }} , 
 	{ "name": "sol_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "d0" }} , 
 	{ "name": "sol_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "q0" }} , 
 	{ "name": "sol_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_0", "role": "address1" }} , 
 	{ "name": "sol_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "ce1" }} , 
 	{ "name": "sol_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_0", "role": "we1" }} , 
 	{ "name": "sol_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "d1" }} , 
 	{ "name": "sol_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_0", "role": "q1" }} , 
 	{ "name": "sol_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_1", "role": "address0" }} , 
 	{ "name": "sol_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "ce0" }} , 
 	{ "name": "sol_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "we0" }} , 
 	{ "name": "sol_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "d0" }} , 
 	{ "name": "sol_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "q0" }} , 
 	{ "name": "sol_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "sol_1", "role": "address1" }} , 
 	{ "name": "sol_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "ce1" }} , 
 	{ "name": "sol_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sol_1", "role": "we1" }} , 
 	{ "name": "sol_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "d1" }} , 
 	{ "name": "sol_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sol_1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "7", "11"],
		"CDFG" : "stencil3d",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "55286", "EstimateLatencyMax" : "55286",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "C", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "orig_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103", "Port" : "orig_0", "Inst_start_state" : "2", "Inst_end_state" : "4"},
					{"ID" : "7", "SubInstance" : "grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115", "Port" : "orig_0", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "11", "SubInstance" : "grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127", "Port" : "orig_0", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_stencil3d_Pipeline_height_bound_row_fu_89", "Port" : "orig_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "orig_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103", "Port" : "orig_1", "Inst_start_state" : "2", "Inst_end_state" : "4"},
					{"ID" : "7", "SubInstance" : "grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115", "Port" : "orig_1", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "11", "SubInstance" : "grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127", "Port" : "orig_1", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_stencil3d_Pipeline_height_bound_row_fu_89", "Port" : "orig_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "sol_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103", "Port" : "sol_0", "Inst_start_state" : "2", "Inst_end_state" : "4"},
					{"ID" : "7", "SubInstance" : "grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115", "Port" : "sol_0", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "11", "SubInstance" : "grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127", "Port" : "sol_0", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_stencil3d_Pipeline_height_bound_row_fu_89", "Port" : "sol_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "sol_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103", "Port" : "sol_1", "Inst_start_state" : "2", "Inst_end_state" : "4"},
					{"ID" : "7", "SubInstance" : "grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115", "Port" : "sol_1", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "11", "SubInstance" : "grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127", "Port" : "sol_1", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_stencil3d_Pipeline_height_bound_row_fu_89", "Port" : "sol_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "height_bound_col", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_height_bound_row_fu_89", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "stencil3d_Pipeline_height_bound_row",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "34", "EstimateLatencyMax" : "34",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "tmp_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "orig_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sol_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "zext_ln16", "Type" : "None", "Direction" : "I"},
			{"Name" : "orig_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sol_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "height_bound_row", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_height_bound_row_fu_89.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103", "Parent" : "0", "Child" : ["4", "5", "6"],
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103.mux_21_32_1_1_U7", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103.mux_22_32_1_1_U8", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_col_bound_height_col_bound_row_fu_103.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115", "Parent" : "0", "Child" : ["8", "9", "10"],
		"CDFG" : "stencil3d_Pipeline_row_bound_height_row_bound_col",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1802", "EstimateLatencyMax" : "1802",
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
			{"Name" : "row_bound_height_row_bound_col", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115.mux_21_32_1_1_U15", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115.mux_21_32_1_1_U16", "Parent" : "7"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_row_bound_height_row_bound_col_fu_115.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127", "Parent" : "0", "Child" : ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "stencil3d_Pipeline_loop_height_loop_col_loop_row",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "50404", "EstimateLatencyMax" : "50404",
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
			{"Name" : "C_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "C_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sol_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "loop_height_loop_col_loop_row", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U21", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U22", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.add_32ns_32ns_32_1_1_U23", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_22_32_1_1_U24", "Parent" : "11"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U25", "Parent" : "11"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.add_32ns_32ns_32_1_1_U26", "Parent" : "11"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.add_32ns_32ns_32_1_1_U27", "Parent" : "11"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U28", "Parent" : "11"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U29", "Parent" : "11"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mux_21_32_1_1_U30", "Parent" : "11"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.add_32ns_32ns_32_1_1_U31", "Parent" : "11"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.add_32ns_32ns_32_1_1_U32", "Parent" : "11"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mul_32s_32s_32_1_1_U33", "Parent" : "11"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.mul_32s_32s_32_1_1_U34", "Parent" : "11"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_stencil3d_Pipeline_loop_height_loop_col_loop_row_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"}]}


set ArgLastReadFirstWriteLatency {
	stencil3d {
		C {Type I LastRead 5 FirstWrite -1}
		orig_0 {Type I LastRead 4 FirstWrite -1}
		orig_1 {Type I LastRead 4 FirstWrite -1}
		sol_0 {Type IO LastRead 4 FirstWrite 2}
		sol_1 {Type IO LastRead 4 FirstWrite 2}}
	stencil3d_Pipeline_height_bound_row {
		tmp_52 {Type I LastRead 0 FirstWrite -1}
		orig_0 {Type I LastRead 1 FirstWrite -1}
		sol_0 {Type IO LastRead 1 FirstWrite 2}
		zext_ln16 {Type I LastRead 0 FirstWrite -1}
		orig_1 {Type I LastRead 1 FirstWrite -1}
		sol_1 {Type IO LastRead 1 FirstWrite 3}}
	stencil3d_Pipeline_col_bound_height_col_bound_row {
		sol_0 {Type IO LastRead 3 FirstWrite 2}
		orig_0 {Type I LastRead 1 FirstWrite -1}
		orig_1 {Type I LastRead 1 FirstWrite -1}
		sol_1 {Type IO LastRead 3 FirstWrite 2}}
	stencil3d_Pipeline_row_bound_height_row_bound_col {
		sol_0 {Type IO LastRead 2 FirstWrite 2}
		orig_0 {Type I LastRead 1 FirstWrite -1}
		orig_1 {Type I LastRead 1 FirstWrite -1}
		sol_1 {Type IO LastRead 2 FirstWrite 2}}
	stencil3d_Pipeline_loop_height_loop_col_loop_row {
		sol_0 {Type IO LastRead 4 FirstWrite 7}
		orig_0 {Type I LastRead 4 FirstWrite -1}
		orig_1 {Type I LastRead 4 FirstWrite -1}
		C_load {Type I LastRead 0 FirstWrite -1}
		C_load_1 {Type I LastRead 0 FirstWrite -1}
		sol_1 {Type IO LastRead 4 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "55286", "Max" : "55286"}
	, {"Name" : "Interval", "Min" : "55287", "Max" : "55287"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	C { ap_memory {  { C_address0 mem_address 1 1 }  { C_ce0 mem_ce 1 1 }  { C_q0 mem_dout 0 32 }  { C_address1 MemPortADDR2 1 1 }  { C_ce1 MemPortCE2 1 1 }  { C_q1 MemPortDOUT2 0 32 } } }
	orig_0 { ap_memory {  { orig_0_address0 mem_address 1 12 }  { orig_0_ce0 mem_ce 1 1 }  { orig_0_q0 mem_dout 0 64 }  { orig_0_address1 MemPortADDR2 1 12 }  { orig_0_ce1 MemPortCE2 1 1 }  { orig_0_q1 MemPortDOUT2 0 64 } } }
	orig_1 { ap_memory {  { orig_1_address0 mem_address 1 12 }  { orig_1_ce0 mem_ce 1 1 }  { orig_1_q0 mem_dout 0 64 }  { orig_1_address1 MemPortADDR2 1 12 }  { orig_1_ce1 MemPortCE2 1 1 }  { orig_1_q1 MemPortDOUT2 0 64 } } }
	sol_0 { ap_memory {  { sol_0_address0 mem_address 1 12 }  { sol_0_ce0 mem_ce 1 1 }  { sol_0_we0 mem_we 1 1 }  { sol_0_d0 mem_din 1 64 }  { sol_0_q0 mem_dout 0 64 }  { sol_0_address1 MemPortADDR2 1 12 }  { sol_0_ce1 MemPortCE2 1 1 }  { sol_0_we1 MemPortWE2 1 1 }  { sol_0_d1 MemPortDIN2 1 64 }  { sol_0_q1 MemPortDOUT2 0 64 } } }
	sol_1 { ap_memory {  { sol_1_address0 mem_address 1 12 }  { sol_1_ce0 mem_ce 1 1 }  { sol_1_we0 mem_we 1 1 }  { sol_1_d0 mem_din 1 64 }  { sol_1_q0 mem_dout 0 64 }  { sol_1_address1 MemPortADDR2 1 12 }  { sol_1_ce1 MemPortCE2 1 1 }  { sol_1_we1 MemPortWE2 1 1 }  { sol_1_d1 MemPortDIN2 1 64 }  { sol_1_q1 MemPortDOUT2 0 64 } } }
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
