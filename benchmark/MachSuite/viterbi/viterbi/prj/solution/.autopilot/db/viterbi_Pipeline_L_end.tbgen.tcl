set moduleName viterbi_Pipeline_L_end
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
set C_modelName {viterbi_Pipeline_L_end}
set C_modelType { void 0 }
set C_modelArgList {
	{ min_p double 64 regular  }
	{ llike_1 int 128 regular {array 2240 { 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ min_s_out int 8 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "min_p", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "llike_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "min_s_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ min_p sc_in sc_lv 64 signal 0 } 
	{ llike_1_address0 sc_out sc_lv 12 signal 1 } 
	{ llike_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ llike_1_q0 sc_in sc_lv 128 signal 1 } 
	{ min_s_out sc_out sc_lv 8 signal 2 } 
	{ min_s_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ grp_fu_257_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_257_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_257_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_257_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_257_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "min_p", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "min_p", "role": "default" }} , 
 	{ "name": "llike_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "llike_1", "role": "address0" }} , 
 	{ "name": "llike_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "llike_1", "role": "ce0" }} , 
 	{ "name": "llike_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "llike_1", "role": "q0" }} , 
 	{ "name": "min_s_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_s_out", "role": "default" }} , 
 	{ "name": "min_s_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "min_s_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_257_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_257_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_257_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_257_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_257_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_257_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_257_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	viterbi_Pipeline_L_end {
		min_p {Type I LastRead 0 FirstWrite -1}
		llike_1 {Type I LastRead 0 FirstWrite -1}
		min_s_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "66"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	min_p { ap_none {  { min_p in_data 0 64 } } }
	llike_1 { ap_memory {  { llike_1_address0 mem_address 1 12 }  { llike_1_ce0 mem_ce 1 1 }  { llike_1_q0 in_data 0 128 } } }
	min_s_out { ap_vld {  { min_s_out out_data 1 8 }  { min_s_out_ap_vld out_vld 1 1 } } }
}
