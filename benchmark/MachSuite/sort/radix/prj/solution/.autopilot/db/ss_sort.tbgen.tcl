set moduleName ss_sort
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
set C_modelName {ss_sort}
set C_modelType { void 0 }
set C_modelArgList {
	{ a_0 int 64 regular {array 512 { 2 1 } 1 1 }  }
	{ a_1 int 64 regular {array 512 { 2 1 } 1 1 }  }
	{ b_0 int 64 regular {array 512 { 2 1 } 1 1 }  }
	{ b_1 int 64 regular {array 512 { 2 1 } 1 1 }  }
	{ bucket_0 int 64 regular {array 512 { 2 2 } 1 1 }  }
	{ bucket_1 int 64 regular {array 512 { 2 2 } 1 1 }  }
	{ sum_0 int 64 regular {array 32 { 2 1 } 1 1 }  }
	{ sum_1 int 64 regular {array 32 { 2 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "a_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "a_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "b_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "b_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "bucket_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "bucket_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "sum_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "sum_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ a_0_address0 sc_out sc_lv 9 signal 0 } 
	{ a_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ a_0_we0 sc_out sc_logic 1 signal 0 } 
	{ a_0_d0 sc_out sc_lv 64 signal 0 } 
	{ a_0_q0 sc_in sc_lv 64 signal 0 } 
	{ a_0_address1 sc_out sc_lv 9 signal 0 } 
	{ a_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ a_0_q1 sc_in sc_lv 64 signal 0 } 
	{ a_1_address0 sc_out sc_lv 9 signal 1 } 
	{ a_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ a_1_we0 sc_out sc_logic 1 signal 1 } 
	{ a_1_d0 sc_out sc_lv 64 signal 1 } 
	{ a_1_q0 sc_in sc_lv 64 signal 1 } 
	{ a_1_address1 sc_out sc_lv 9 signal 1 } 
	{ a_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ a_1_q1 sc_in sc_lv 64 signal 1 } 
	{ b_0_address0 sc_out sc_lv 9 signal 2 } 
	{ b_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ b_0_we0 sc_out sc_logic 1 signal 2 } 
	{ b_0_d0 sc_out sc_lv 64 signal 2 } 
	{ b_0_q0 sc_in sc_lv 64 signal 2 } 
	{ b_0_address1 sc_out sc_lv 9 signal 2 } 
	{ b_0_ce1 sc_out sc_logic 1 signal 2 } 
	{ b_0_q1 sc_in sc_lv 64 signal 2 } 
	{ b_1_address0 sc_out sc_lv 9 signal 3 } 
	{ b_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ b_1_we0 sc_out sc_logic 1 signal 3 } 
	{ b_1_d0 sc_out sc_lv 64 signal 3 } 
	{ b_1_q0 sc_in sc_lv 64 signal 3 } 
	{ b_1_address1 sc_out sc_lv 9 signal 3 } 
	{ b_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ b_1_q1 sc_in sc_lv 64 signal 3 } 
	{ bucket_0_address0 sc_out sc_lv 9 signal 4 } 
	{ bucket_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ bucket_0_we0 sc_out sc_logic 1 signal 4 } 
	{ bucket_0_d0 sc_out sc_lv 64 signal 4 } 
	{ bucket_0_q0 sc_in sc_lv 64 signal 4 } 
	{ bucket_0_address1 sc_out sc_lv 9 signal 4 } 
	{ bucket_0_ce1 sc_out sc_logic 1 signal 4 } 
	{ bucket_0_we1 sc_out sc_logic 1 signal 4 } 
	{ bucket_0_d1 sc_out sc_lv 64 signal 4 } 
	{ bucket_0_q1 sc_in sc_lv 64 signal 4 } 
	{ bucket_1_address0 sc_out sc_lv 9 signal 5 } 
	{ bucket_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ bucket_1_we0 sc_out sc_logic 1 signal 5 } 
	{ bucket_1_d0 sc_out sc_lv 64 signal 5 } 
	{ bucket_1_q0 sc_in sc_lv 64 signal 5 } 
	{ bucket_1_address1 sc_out sc_lv 9 signal 5 } 
	{ bucket_1_ce1 sc_out sc_logic 1 signal 5 } 
	{ bucket_1_we1 sc_out sc_logic 1 signal 5 } 
	{ bucket_1_d1 sc_out sc_lv 64 signal 5 } 
	{ bucket_1_q1 sc_in sc_lv 64 signal 5 } 
	{ sum_0_address0 sc_out sc_lv 5 signal 6 } 
	{ sum_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ sum_0_we0 sc_out sc_logic 1 signal 6 } 
	{ sum_0_d0 sc_out sc_lv 64 signal 6 } 
	{ sum_0_q0 sc_in sc_lv 64 signal 6 } 
	{ sum_0_address1 sc_out sc_lv 5 signal 6 } 
	{ sum_0_ce1 sc_out sc_logic 1 signal 6 } 
	{ sum_0_q1 sc_in sc_lv 64 signal 6 } 
	{ sum_1_address0 sc_out sc_lv 5 signal 7 } 
	{ sum_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ sum_1_we0 sc_out sc_logic 1 signal 7 } 
	{ sum_1_d0 sc_out sc_lv 64 signal 7 } 
	{ sum_1_q0 sc_in sc_lv 64 signal 7 } 
	{ sum_1_address1 sc_out sc_lv 5 signal 7 } 
	{ sum_1_ce1 sc_out sc_logic 1 signal 7 } 
	{ sum_1_q1 sc_in sc_lv 64 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "a_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "a_0", "role": "address0" }} , 
 	{ "name": "a_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_0", "role": "ce0" }} , 
 	{ "name": "a_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_0", "role": "we0" }} , 
 	{ "name": "a_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_0", "role": "d0" }} , 
 	{ "name": "a_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_0", "role": "q0" }} , 
 	{ "name": "a_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "a_0", "role": "address1" }} , 
 	{ "name": "a_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_0", "role": "ce1" }} , 
 	{ "name": "a_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_0", "role": "q1" }} , 
 	{ "name": "a_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "a_1", "role": "address0" }} , 
 	{ "name": "a_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_1", "role": "ce0" }} , 
 	{ "name": "a_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_1", "role": "we0" }} , 
 	{ "name": "a_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_1", "role": "d0" }} , 
 	{ "name": "a_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_1", "role": "q0" }} , 
 	{ "name": "a_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "a_1", "role": "address1" }} , 
 	{ "name": "a_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_1", "role": "ce1" }} , 
 	{ "name": "a_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "a_1", "role": "q1" }} , 
 	{ "name": "b_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "b_0", "role": "address0" }} , 
 	{ "name": "b_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_0", "role": "ce0" }} , 
 	{ "name": "b_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_0", "role": "we0" }} , 
 	{ "name": "b_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_0", "role": "d0" }} , 
 	{ "name": "b_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_0", "role": "q0" }} , 
 	{ "name": "b_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "b_0", "role": "address1" }} , 
 	{ "name": "b_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_0", "role": "ce1" }} , 
 	{ "name": "b_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_0", "role": "q1" }} , 
 	{ "name": "b_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "b_1", "role": "address0" }} , 
 	{ "name": "b_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_1", "role": "ce0" }} , 
 	{ "name": "b_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_1", "role": "we0" }} , 
 	{ "name": "b_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_1", "role": "d0" }} , 
 	{ "name": "b_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_1", "role": "q0" }} , 
 	{ "name": "b_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "b_1", "role": "address1" }} , 
 	{ "name": "b_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_1", "role": "ce1" }} , 
 	{ "name": "b_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "b_1", "role": "q1" }} , 
 	{ "name": "bucket_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bucket_0", "role": "address0" }} , 
 	{ "name": "bucket_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_0", "role": "ce0" }} , 
 	{ "name": "bucket_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_0", "role": "we0" }} , 
 	{ "name": "bucket_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_0", "role": "d0" }} , 
 	{ "name": "bucket_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_0", "role": "q0" }} , 
 	{ "name": "bucket_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bucket_0", "role": "address1" }} , 
 	{ "name": "bucket_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_0", "role": "ce1" }} , 
 	{ "name": "bucket_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_0", "role": "we1" }} , 
 	{ "name": "bucket_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_0", "role": "d1" }} , 
 	{ "name": "bucket_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_0", "role": "q1" }} , 
 	{ "name": "bucket_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bucket_1", "role": "address0" }} , 
 	{ "name": "bucket_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_1", "role": "ce0" }} , 
 	{ "name": "bucket_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_1", "role": "we0" }} , 
 	{ "name": "bucket_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_1", "role": "d0" }} , 
 	{ "name": "bucket_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_1", "role": "q0" }} , 
 	{ "name": "bucket_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bucket_1", "role": "address1" }} , 
 	{ "name": "bucket_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_1", "role": "ce1" }} , 
 	{ "name": "bucket_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bucket_1", "role": "we1" }} , 
 	{ "name": "bucket_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_1", "role": "d1" }} , 
 	{ "name": "bucket_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bucket_1", "role": "q1" }} , 
 	{ "name": "sum_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sum_0", "role": "address0" }} , 
 	{ "name": "sum_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_0", "role": "ce0" }} , 
 	{ "name": "sum_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_0", "role": "we0" }} , 
 	{ "name": "sum_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_0", "role": "d0" }} , 
 	{ "name": "sum_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_0", "role": "q0" }} , 
 	{ "name": "sum_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sum_0", "role": "address1" }} , 
 	{ "name": "sum_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_0", "role": "ce1" }} , 
 	{ "name": "sum_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_0", "role": "q1" }} , 
 	{ "name": "sum_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sum_1", "role": "address0" }} , 
 	{ "name": "sum_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_1", "role": "ce0" }} , 
 	{ "name": "sum_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_1", "role": "we0" }} , 
 	{ "name": "sum_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_1", "role": "d0" }} , 
 	{ "name": "sum_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_1", "role": "q0" }} , 
 	{ "name": "sum_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sum_1", "role": "address1" }} , 
 	{ "name": "sum_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sum_1", "role": "ce1" }} , 
 	{ "name": "sum_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "7", "14", "21", "26"],
		"CDFG" : "ss_sort",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "444881", "EstimateLatencyMax" : "444881",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "b_0", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "a_0", "Inst_start_state" : "15", "Inst_end_state" : "14"}]},
			{"Name" : "a_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "b_1", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "a_1", "Inst_start_state" : "15", "Inst_end_state" : "14"}]},
			{"Name" : "b_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "b_0", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "b_03", "Inst_start_state" : "15", "Inst_end_state" : "14"}]},
			{"Name" : "b_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "b_1", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "b_15", "Inst_start_state" : "15", "Inst_end_state" : "14"}]},
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_last_step_scan_1_fu_138", "Port" : "bucket_0", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "14", "SubInstance" : "grp_sum_scan_1_fu_126", "Port" : "bucket_0", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "bucket_0", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "7", "SubInstance" : "grp_local_scan_1_fu_118", "Port" : "bucket_0", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "bucket_0", "Inst_start_state" : "15", "Inst_end_state" : "14"},
					{"ID" : "1", "SubInstance" : "grp_init_1_fu_95", "Port" : "bucket_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_last_step_scan_1_fu_138", "Port" : "bucket_1", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "14", "SubInstance" : "grp_sum_scan_1_fu_126", "Port" : "bucket_1", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "3", "SubInstance" : "grp_hist_1_fu_103", "Port" : "bucket_1", "Inst_start_state" : "6", "Inst_end_state" : "5"},
					{"ID" : "7", "SubInstance" : "grp_local_scan_1_fu_118", "Port" : "bucket_1", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "26", "SubInstance" : "grp_update_1_fu_150", "Port" : "bucket_1", "Inst_start_state" : "15", "Inst_end_state" : "14"},
					{"ID" : "1", "SubInstance" : "grp_init_1_fu_95", "Port" : "bucket_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "sum_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_last_step_scan_1_fu_138", "Port" : "sum_0", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "14", "SubInstance" : "grp_sum_scan_1_fu_126", "Port" : "sum_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "sum_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_last_step_scan_1_fu_138", "Port" : "sum_1", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "14", "SubInstance" : "grp_sum_scan_1_fu_126", "Port" : "sum_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}],
		"Loop" : [
			{"Name" : "sort_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "15", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_init_1_fu_95", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "init_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2050", "EstimateLatencyMax" : "2050",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "init_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_init_1_fu_95.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hist_1_fu_103", "Parent" : "0", "Child" : ["4", "5", "6"],
		"CDFG" : "hist_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6146", "EstimateLatencyMax" : "6146",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "b_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "b_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "hist_1_hist_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hist_1_fu_103.mux_21_32_1_1_U3", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hist_1_fu_103.mux_22_32_1_1_U4", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hist_1_fu_103.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "local_scan_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6913", "EstimateLatencyMax" : "6913",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_local_scan_1_Pipeline_local_2_fu_44", "Port" : "bucket_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_local_scan_1_Pipeline_local_2_fu_44", "Port" : "bucket_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "local_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44", "Parent" : "7", "Child" : ["9", "10", "11", "12", "13"],
		"CDFG" : "local_scan_1_Pipeline_local_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "52", "EstimateLatencyMax" : "52",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln14", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln15_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "local_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44.mux_254_32_1_1_U12", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44.mux_254_32_1_1_U13", "Parent" : "8"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44.mux_254_32_1_1_U14", "Parent" : "8"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44.mux_254_32_1_1_U15", "Parent" : "8"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_local_scan_1_fu_118.grp_local_scan_1_Pipeline_local_2_fu_44.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126", "Parent" : "0", "Child" : ["15"],
		"CDFG" : "sum_scan_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "391", "EstimateLatencyMax" : "391",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_sum_scan_1_Pipeline_sum_1_fu_40", "Port" : "sum_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "sum_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_sum_scan_1_Pipeline_sum_1_fu_40", "Port" : "sum_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_sum_scan_1_Pipeline_sum_1_fu_40", "Port" : "bucket_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_sum_scan_1_Pipeline_sum_1_fu_40", "Port" : "bucket_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40", "Parent" : "14", "Child" : ["16", "17", "18", "19", "20"],
		"CDFG" : "sum_scan_1_Pipeline_sum_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "388", "EstimateLatencyMax" : "388",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sum_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "sum_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "sum_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40.mux_258_32_1_1_U24", "Parent" : "15"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40.mux_254_32_1_1_U25", "Parent" : "15"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40.mux_254_32_1_1_U26", "Parent" : "15"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40.mux_258_32_1_1_U27", "Parent" : "15"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_sum_scan_1_fu_126.grp_sum_scan_1_Pipeline_sum_1_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_last_step_scan_1_fu_138", "Parent" : "0", "Child" : ["22", "23", "24", "25"],
		"CDFG" : "last_step_scan_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6146", "EstimateLatencyMax" : "6146",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "sum_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "last_1_last_2", "PipelineType" : "NotSupport"}]},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_last_step_scan_1_fu_138.mux_21_32_1_1_U37", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_last_step_scan_1_fu_138.mux_21_32_1_1_U38", "Parent" : "21"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_last_step_scan_1_fu_138.mux_22_32_1_1_U39", "Parent" : "21"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_last_step_scan_1_fu_138.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150", "Parent" : "0", "Child" : ["27", "28", "29", "30", "31"],
		"CDFG" : "update_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6147", "EstimateLatencyMax" : "6147",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "a_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bucket_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "b_03", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "b_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "update_1_update_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150.mux_21_32_1_1_U44", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150.mux_22_32_1_1_U45", "Parent" : "26"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150.mux_21_32_1_1_U46", "Parent" : "26"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150.mux_21_32_1_1_U47", "Parent" : "26"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_update_1_fu_150.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"}]}


set ArgLastReadFirstWriteLatency {
	ss_sort {
		a_0 {Type IO LastRead 6 FirstWrite -1}
		a_1 {Type IO LastRead 6 FirstWrite -1}
		b_0 {Type IO LastRead 6 FirstWrite -1}
		b_1 {Type IO LastRead 6 FirstWrite -1}
		bucket_0 {Type IO LastRead 4 FirstWrite -1}
		bucket_1 {Type IO LastRead 4 FirstWrite -1}
		sum_0 {Type IO LastRead 4 FirstWrite -1}
		sum_1 {Type IO LastRead 4 FirstWrite -1}}
	init_1 {
		bucket_0 {Type IO LastRead 1 FirstWrite 1}
		bucket_1 {Type IO LastRead 1 FirstWrite 1}}
	hist_1 {
		bucket_0 {Type IO LastRead 1 FirstWrite 3}
		bucket_1 {Type IO LastRead 1 FirstWrite 3}
		b_0 {Type I LastRead 0 FirstWrite -1}
		b_1 {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}}
	local_scan_1 {
		bucket_0 {Type IO LastRead 4 FirstWrite 3}
		bucket_1 {Type IO LastRead 4 FirstWrite 3}}
	local_scan_1_Pipeline_local_2 {
		zext_ln14 {Type I LastRead 0 FirstWrite -1}
		trunc_ln15_2 {Type I LastRead 0 FirstWrite -1}
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		bucket_0 {Type IO LastRead 4 FirstWrite 3}
		bucket_1 {Type IO LastRead 4 FirstWrite 3}}
	sum_scan_1 {
		sum_0 {Type IO LastRead 4 FirstWrite 1}
		sum_1 {Type IO LastRead 4 FirstWrite 3}
		bucket_0 {Type I LastRead 2 FirstWrite -1}
		bucket_1 {Type I LastRead 2 FirstWrite -1}}
	sum_scan_1_Pipeline_sum_1 {
		sum_0 {Type IO LastRead 4 FirstWrite 3}
		sum_1 {Type IO LastRead 4 FirstWrite 3}
		bucket_0 {Type I LastRead 2 FirstWrite -1}
		bucket_1 {Type I LastRead 2 FirstWrite -1}}
	last_step_scan_1 {
		bucket_0 {Type IO LastRead 3 FirstWrite 2}
		bucket_1 {Type IO LastRead 3 FirstWrite 2}
		sum_0 {Type I LastRead 0 FirstWrite -1}
		sum_1 {Type I LastRead 0 FirstWrite -1}}
	update_1 {
		a_0 {Type IO LastRead 6 FirstWrite 4}
		a_1 {Type IO LastRead 6 FirstWrite 4}
		bucket_0 {Type IO LastRead 4 FirstWrite 3}
		bucket_1 {Type IO LastRead 4 FirstWrite 3}
		b_03 {Type I LastRead 1 FirstWrite -1}
		b_15 {Type I LastRead 1 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "444881", "Max" : "444881"}
	, {"Name" : "Interval", "Min" : "444882", "Max" : "444882"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	a_0 { ap_memory {  { a_0_address0 mem_address 1 9 }  { a_0_ce0 mem_ce 1 1 }  { a_0_we0 mem_we 1 1 }  { a_0_d0 mem_din 1 64 }  { a_0_q0 mem_dout 0 64 }  { a_0_address1 MemPortADDR2 1 9 }  { a_0_ce1 MemPortCE2 1 1 }  { a_0_q1 MemPortDOUT2 0 64 } } }
	a_1 { ap_memory {  { a_1_address0 mem_address 1 9 }  { a_1_ce0 mem_ce 1 1 }  { a_1_we0 mem_we 1 1 }  { a_1_d0 mem_din 1 64 }  { a_1_q0 mem_dout 0 64 }  { a_1_address1 MemPortADDR2 1 9 }  { a_1_ce1 MemPortCE2 1 1 }  { a_1_q1 MemPortDOUT2 0 64 } } }
	b_0 { ap_memory {  { b_0_address0 mem_address 1 9 }  { b_0_ce0 mem_ce 1 1 }  { b_0_we0 mem_we 1 1 }  { b_0_d0 mem_din 1 64 }  { b_0_q0 mem_dout 0 64 }  { b_0_address1 MemPortADDR2 1 9 }  { b_0_ce1 MemPortCE2 1 1 }  { b_0_q1 MemPortDOUT2 0 64 } } }
	b_1 { ap_memory {  { b_1_address0 mem_address 1 9 }  { b_1_ce0 mem_ce 1 1 }  { b_1_we0 mem_we 1 1 }  { b_1_d0 mem_din 1 64 }  { b_1_q0 mem_dout 0 64 }  { b_1_address1 MemPortADDR2 1 9 }  { b_1_ce1 MemPortCE2 1 1 }  { b_1_q1 MemPortDOUT2 0 64 } } }
	bucket_0 { ap_memory {  { bucket_0_address0 mem_address 1 9 }  { bucket_0_ce0 mem_ce 1 1 }  { bucket_0_we0 mem_we 1 1 }  { bucket_0_d0 mem_din 1 64 }  { bucket_0_q0 mem_dout 0 64 }  { bucket_0_address1 MemPortADDR2 1 9 }  { bucket_0_ce1 MemPortCE2 1 1 }  { bucket_0_we1 MemPortWE2 1 1 }  { bucket_0_d1 MemPortDIN2 1 64 }  { bucket_0_q1 MemPortDOUT2 0 64 } } }
	bucket_1 { ap_memory {  { bucket_1_address0 mem_address 1 9 }  { bucket_1_ce0 mem_ce 1 1 }  { bucket_1_we0 mem_we 1 1 }  { bucket_1_d0 mem_din 1 64 }  { bucket_1_q0 mem_dout 0 64 }  { bucket_1_address1 MemPortADDR2 1 9 }  { bucket_1_ce1 MemPortCE2 1 1 }  { bucket_1_we1 MemPortWE2 1 1 }  { bucket_1_d1 MemPortDIN2 1 64 }  { bucket_1_q1 MemPortDOUT2 0 64 } } }
	sum_0 { ap_memory {  { sum_0_address0 mem_address 1 5 }  { sum_0_ce0 mem_ce 1 1 }  { sum_0_we0 mem_we 1 1 }  { sum_0_d0 mem_din 1 64 }  { sum_0_q0 mem_dout 0 64 }  { sum_0_address1 MemPortADDR2 1 5 }  { sum_0_ce1 MemPortCE2 1 1 }  { sum_0_q1 MemPortDOUT2 0 64 } } }
	sum_1 { ap_memory {  { sum_1_address0 mem_address 1 5 }  { sum_1_ce0 mem_ce 1 1 }  { sum_1_we0 mem_we 1 1 }  { sum_1_d0 mem_din 1 64 }  { sum_1_q0 mem_dout 0 64 }  { sum_1_address1 MemPortADDR2 1 5 }  { sum_1_ce1 MemPortCE2 1 1 }  { sum_1_q1 MemPortDOUT2 0 64 } } }
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
