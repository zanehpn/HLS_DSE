set moduleName gemm
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
set C_modelName {gemm}
set C_modelType { void 0 }
set C_modelArgList {
	{ m1_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ m1_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ m2_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ m2_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ prod_0 int 128 regular {array 1024 { 2 3 } 1 1 }  }
	{ prod_1 int 128 regular {array 1024 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m1_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m2_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m2_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "prod_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "prod_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m1_0_address0 sc_out sc_lv 10 signal 0 } 
	{ m1_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ m1_0_q0 sc_in sc_lv 128 signal 0 } 
	{ m1_0_address1 sc_out sc_lv 10 signal 0 } 
	{ m1_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ m1_0_q1 sc_in sc_lv 128 signal 0 } 
	{ m1_1_address0 sc_out sc_lv 10 signal 1 } 
	{ m1_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ m1_1_q0 sc_in sc_lv 128 signal 1 } 
	{ m1_1_address1 sc_out sc_lv 10 signal 1 } 
	{ m1_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ m1_1_q1 sc_in sc_lv 128 signal 1 } 
	{ m2_0_address0 sc_out sc_lv 10 signal 2 } 
	{ m2_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ m2_0_q0 sc_in sc_lv 128 signal 2 } 
	{ m2_0_address1 sc_out sc_lv 10 signal 2 } 
	{ m2_0_ce1 sc_out sc_logic 1 signal 2 } 
	{ m2_0_q1 sc_in sc_lv 128 signal 2 } 
	{ m2_1_address0 sc_out sc_lv 10 signal 3 } 
	{ m2_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ m2_1_q0 sc_in sc_lv 128 signal 3 } 
	{ m2_1_address1 sc_out sc_lv 10 signal 3 } 
	{ m2_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ m2_1_q1 sc_in sc_lv 128 signal 3 } 
	{ prod_0_address0 sc_out sc_lv 10 signal 4 } 
	{ prod_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ prod_0_we0 sc_out sc_logic 1 signal 4 } 
	{ prod_0_d0 sc_out sc_lv 128 signal 4 } 
	{ prod_0_q0 sc_in sc_lv 128 signal 4 } 
	{ prod_1_address0 sc_out sc_lv 10 signal 5 } 
	{ prod_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ prod_1_we0 sc_out sc_logic 1 signal 5 } 
	{ prod_1_d0 sc_out sc_lv 128 signal 5 } 
	{ prod_1_q0 sc_in sc_lv 128 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m1_0", "role": "address0" }} , 
 	{ "name": "m1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m1_0", "role": "ce0" }} , 
 	{ "name": "m1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0", "role": "q0" }} , 
 	{ "name": "m1_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m1_0", "role": "address1" }} , 
 	{ "name": "m1_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m1_0", "role": "ce1" }} , 
 	{ "name": "m1_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0", "role": "q1" }} , 
 	{ "name": "m1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m1_1", "role": "address0" }} , 
 	{ "name": "m1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m1_1", "role": "ce0" }} , 
 	{ "name": "m1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1", "role": "q0" }} , 
 	{ "name": "m1_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m1_1", "role": "address1" }} , 
 	{ "name": "m1_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m1_1", "role": "ce1" }} , 
 	{ "name": "m1_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1", "role": "q1" }} , 
 	{ "name": "m2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_0", "role": "address0" }} , 
 	{ "name": "m2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_0", "role": "ce0" }} , 
 	{ "name": "m2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_0", "role": "q0" }} , 
 	{ "name": "m2_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_0", "role": "address1" }} , 
 	{ "name": "m2_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_0", "role": "ce1" }} , 
 	{ "name": "m2_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_0", "role": "q1" }} , 
 	{ "name": "m2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_1", "role": "address0" }} , 
 	{ "name": "m2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_1", "role": "ce0" }} , 
 	{ "name": "m2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_1", "role": "q0" }} , 
 	{ "name": "m2_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_1", "role": "address1" }} , 
 	{ "name": "m2_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_1", "role": "ce1" }} , 
 	{ "name": "m2_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_1", "role": "q1" }} , 
 	{ "name": "prod_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prod_0", "role": "address0" }} , 
 	{ "name": "prod_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_0", "role": "ce0" }} , 
 	{ "name": "prod_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_0", "role": "we0" }} , 
 	{ "name": "prod_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_0", "role": "d0" }} , 
 	{ "name": "prod_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_0", "role": "q0" }} , 
 	{ "name": "prod_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prod_1", "role": "address0" }} , 
 	{ "name": "prod_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_1", "role": "ce0" }} , 
 	{ "name": "prod_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_1", "role": "we0" }} , 
 	{ "name": "prod_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_1", "role": "d0" }} , 
 	{ "name": "prod_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "gemm",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "88193", "EstimateLatencyMax" : "88193",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "m1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemm_Pipeline_middle_fu_1236", "Port" : "m2_0", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "m2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemm_Pipeline_middle_fu_1236", "Port" : "m2_1", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "prod_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemm_Pipeline_middle_fu_1236", "Port" : "prod_0", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "prod_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_gemm_Pipeline_middle_fu_1236", "Port" : "prod_1", "Inst_start_state" : "34", "Inst_end_state" : "35"}]}],
		"Loop" : [
			{"Name" : "outer", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "35", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state35"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74"],
		"CDFG" : "gemm_Pipeline_middle",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1344", "EstimateLatencyMax" : "1344",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "prod_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "m1_0_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln14_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_260", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m1_0_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "m2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m1_0_load_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_46", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_46", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_48", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_48", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_49", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_49", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_50", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_50", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_53", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_53", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_54", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_54", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_56", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_56", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_57", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_57", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_58", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_58", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_59", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_59", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_60", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_60", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_61", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_61", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_62", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_62", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_0_load_63", "Type" : "None", "Direction" : "I"},
			{"Name" : "m1_1_load_63", "Type" : "None", "Direction" : "I"},
			{"Name" : "tmp_258", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln17_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "prod_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "middle", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage14", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage14_subdone", "QuitState" : "ap_ST_fsm_pp0_stage14", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage14_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dadd_64ns_64ns_64_5_full_dsp_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dadd_64ns_64ns_64_5_full_dsp_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dadd_64ns_64ns_64_5_full_dsp_1_U3", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dadd_64ns_64ns_64_5_full_dsp_1_U4", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dmul_64ns_64ns_64_5_full_dsp_1_U5", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dmul_64ns_64ns_64_5_full_dsp_1_U6", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dmul_64ns_64ns_64_5_full_dsp_1_U7", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.dmul_64ns_64ns_64_5_full_dsp_1_U8", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U9", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U10", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U11", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U12", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U13", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U14", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U15", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U16", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U17", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U18", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U19", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U20", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U21", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U22", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U23", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U24", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U25", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U26", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U27", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U28", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U29", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U30", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U31", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U32", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U33", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U34", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U35", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U36", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U37", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U38", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U39", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U40", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U41", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U42", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U43", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U44", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U45", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U46", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U47", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U48", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U49", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U50", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U51", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U52", "Parent" : "1"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U53", "Parent" : "1"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U54", "Parent" : "1"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U55", "Parent" : "1"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U56", "Parent" : "1"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U57", "Parent" : "1"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U58", "Parent" : "1"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U59", "Parent" : "1"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U60", "Parent" : "1"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U61", "Parent" : "1"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U62", "Parent" : "1"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U63", "Parent" : "1"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U64", "Parent" : "1"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U65", "Parent" : "1"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U66", "Parent" : "1"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U67", "Parent" : "1"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U68", "Parent" : "1"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U69", "Parent" : "1"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U70", "Parent" : "1"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U71", "Parent" : "1"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.mux_21_64_1_1_U72", "Parent" : "1"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_gemm_Pipeline_middle_fu_1236.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	gemm {
		m1_0 {Type I LastRead 33 FirstWrite -1}
		m1_1 {Type I LastRead 33 FirstWrite -1}
		m2_0 {Type I LastRead 16 FirstWrite -1}
		m2_1 {Type I LastRead 10 FirstWrite -1}
		prod_0 {Type IO LastRead 320 FirstWrite 334}
		prod_1 {Type IO LastRead 320 FirstWrite 334}}
	gemm_Pipeline_middle {
		prod_0 {Type IO LastRead 320 FirstWrite 334}
		m1_0_load {Type I LastRead 0 FirstWrite -1}
		zext_ln14_15 {Type I LastRead 0 FirstWrite -1}
		m1_1_load {Type I LastRead 0 FirstWrite -1}
		tmp_260 {Type I LastRead 0 FirstWrite -1}
		m2_0 {Type I LastRead 16 FirstWrite -1}
		m1_0_load_1 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_1 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_2 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_2 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_3 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_3 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_4 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_4 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_5 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_5 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_6 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_6 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_7 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_7 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_8 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_8 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_9 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_9 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_10 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_10 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_11 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_11 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_12 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_12 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_13 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_13 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_14 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_14 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_15 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_15 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_16 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_16 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_17 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_17 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_18 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_18 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_19 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_19 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_20 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_20 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_21 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_21 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_22 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_22 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_23 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_23 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_24 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_24 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_25 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_25 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_26 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_26 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_27 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_27 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_28 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_28 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_29 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_29 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_30 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_30 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_31 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_31 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_32 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_32 {Type I LastRead 0 FirstWrite -1}
		m2_1 {Type I LastRead 10 FirstWrite -1}
		m1_0_load_33 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_33 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_34 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_34 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_35 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_35 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_36 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_36 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_37 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_37 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_38 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_38 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_39 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_39 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_40 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_40 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_41 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_41 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_42 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_42 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_43 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_43 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_44 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_44 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_45 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_45 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_46 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_46 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_47 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_47 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_48 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_48 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_49 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_49 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_50 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_50 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_51 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_51 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_52 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_52 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_53 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_53 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_54 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_54 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_55 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_55 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_56 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_56 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_57 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_57 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_58 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_58 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_59 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_59 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_60 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_60 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_61 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_61 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_62 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_62 {Type I LastRead 0 FirstWrite -1}
		m1_0_load_63 {Type I LastRead 0 FirstWrite -1}
		m1_1_load_63 {Type I LastRead 0 FirstWrite -1}
		tmp_258 {Type I LastRead 0 FirstWrite -1}
		p_cast {Type I LastRead 0 FirstWrite -1}
		trunc_ln17_1 {Type I LastRead 0 FirstWrite -1}
		prod_1 {Type IO LastRead 320 FirstWrite 334}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "88193", "Max" : "88193"}
	, {"Name" : "Interval", "Min" : "88194", "Max" : "88194"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	m1_0 { ap_memory {  { m1_0_address0 mem_address 1 10 }  { m1_0_ce0 mem_ce 1 1 }  { m1_0_q0 mem_dout 0 128 }  { m1_0_address1 MemPortADDR2 1 10 }  { m1_0_ce1 MemPortCE2 1 1 }  { m1_0_q1 MemPortDOUT2 0 128 } } }
	m1_1 { ap_memory {  { m1_1_address0 mem_address 1 10 }  { m1_1_ce0 mem_ce 1 1 }  { m1_1_q0 mem_dout 0 128 }  { m1_1_address1 MemPortADDR2 1 10 }  { m1_1_ce1 MemPortCE2 1 1 }  { m1_1_q1 MemPortDOUT2 0 128 } } }
	m2_0 { ap_memory {  { m2_0_address0 mem_address 1 10 }  { m2_0_ce0 mem_ce 1 1 }  { m2_0_q0 mem_dout 0 128 }  { m2_0_address1 MemPortADDR2 1 10 }  { m2_0_ce1 MemPortCE2 1 1 }  { m2_0_q1 MemPortDOUT2 0 128 } } }
	m2_1 { ap_memory {  { m2_1_address0 mem_address 1 10 }  { m2_1_ce0 mem_ce 1 1 }  { m2_1_q0 mem_dout 0 128 }  { m2_1_address1 MemPortADDR2 1 10 }  { m2_1_ce1 MemPortCE2 1 1 }  { m2_1_q1 MemPortDOUT2 0 128 } } }
	prod_0 { ap_memory {  { prod_0_address0 mem_address 1 10 }  { prod_0_ce0 mem_ce 1 1 }  { prod_0_we0 mem_we 1 1 }  { prod_0_d0 mem_din 1 128 }  { prod_0_q0 mem_dout 0 128 } } }
	prod_1 { ap_memory {  { prod_1_address0 mem_address 1 10 }  { prod_1_ce0 mem_ce 1 1 }  { prod_1_we0 mem_we 1 1 }  { prod_1_d0 mem_din 1 128 }  { prod_1_q0 mem_dout 0 128 } } }
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
