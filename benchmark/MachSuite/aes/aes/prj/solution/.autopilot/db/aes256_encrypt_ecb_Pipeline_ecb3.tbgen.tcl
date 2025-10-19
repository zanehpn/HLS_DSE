set moduleName aes256_encrypt_ecb_Pipeline_ecb3
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
set C_modelName {aes256_encrypt_ecb_Pipeline_ecb3}
set C_modelType { void 0 }
set C_modelArgList {
	{ buf_0 int 16 regular {array 4 { 2 2 } 1 1 }  }
	{ buf_1 int 16 regular {array 4 { 2 2 } 1 1 }  }
	{ ctx int 768 regular {pointer 2}  }
	{ rcon_1_out int 8 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "buf_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "ctx", "interface" : "wire", "bitwidth" : 768, "direction" : "READWRITE"} , 
 	{ "Name" : "rcon_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 40
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
	{ ctx_i sc_in sc_lv 768 signal 2 } 
	{ ctx_o sc_out sc_lv 768 signal 2 } 
	{ ctx_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ rcon_1_out sc_out sc_lv 8 signal 3 } 
	{ rcon_1_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ grp_aes_expandEncKey_fu_135_p_din1 sc_out sc_lv 768 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_din2 sc_out sc_lv 10 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_din3 sc_out sc_lv 8 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_dout0_0 sc_in sc_lv 768 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_dout0_1 sc_in sc_lv 8 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_aes_expandEncKey_fu_135_p_idle sc_in sc_logic 1 signal -1 } 
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
 	{ "name": "buf_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "buf_1", "role": "q1" }} , 
 	{ "name": "ctx_i", "direction": "in", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ctx", "role": "i" }} , 
 	{ "name": "ctx_o", "direction": "out", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ctx", "role": "o" }} , 
 	{ "name": "ctx_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ctx", "role": "o_ap_vld" }} , 
 	{ "name": "rcon_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "rcon_1_out", "role": "default" }} , 
 	{ "name": "rcon_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rcon_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_din1", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_din2", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_din3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_din3", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_dout0_0", "direction": "in", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_dout0_0", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_dout0_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_dout0_1", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_start", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_ready", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_done", "role": "default" }} , 
 	{ "name": "grp_aes_expandEncKey_fu_135_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_aes_expandEncKey_fu_135_p_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "4", "5", "6"],
		"CDFG" : "aes256_encrypt_ecb_Pipeline_ecb3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "330", "EstimateLatencyMax" : "330",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_aes_shiftRows_1_fu_109", "Port" : "buf_0", "Inst_start_state" : "15", "Inst_end_state" : "17"},
					{"ID" : "1", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "buf_0", "Inst_start_state" : "5", "Inst_end_state" : "14"},
					{"ID" : "5", "SubInstance" : "grp_aes_addRoundKey_1_fu_125", "Port" : "buf_0", "Inst_start_state" : "26", "Inst_end_state" : "29"},
					{"ID" : "4", "SubInstance" : "grp_aes_mixColumns_1_fu_117", "Port" : "buf_0", "Inst_start_state" : "18", "Inst_end_state" : "21"}]},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_aes_shiftRows_1_fu_109", "Port" : "buf_1", "Inst_start_state" : "15", "Inst_end_state" : "17"},
					{"ID" : "1", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "buf_1", "Inst_start_state" : "5", "Inst_end_state" : "14"},
					{"ID" : "5", "SubInstance" : "grp_aes_addRoundKey_1_fu_125", "Port" : "buf_1", "Inst_start_state" : "26", "Inst_end_state" : "29"},
					{"ID" : "4", "SubInstance" : "grp_aes_mixColumns_1_fu_117", "Port" : "buf_1", "Inst_start_state" : "18", "Inst_end_state" : "21"}]},
			{"Name" : "ctx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rcon_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "sbox", "Inst_start_state" : "5", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "ecb3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_subBytes_1_fu_99", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "aes_subBytes_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "10",
		"VariableLatency" : "0", "ExactLatency" : "9", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "9",
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
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes_subBytes_1_fu_99.sbox_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_shiftRows_1_fu_109", "Parent" : "0",
		"CDFG" : "aes_shiftRows_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "3",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_mixColumns_1_fu_117", "Parent" : "0",
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
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_addRoundKey_1_fu_125", "Parent" : "0",
		"CDFG" : "aes_addRoundKey_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "4",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_idx", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	aes256_encrypt_ecb_Pipeline_ecb3 {
		buf_0 {Type IO LastRead 2 FirstWrite 1}
		buf_1 {Type IO LastRead 2 FirstWrite 1}
		ctx {Type IO LastRead 1 FirstWrite 25}
		rcon_1_out {Type O LastRead -1 FirstWrite 3}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes_subBytes_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 8}
		buf_1 {Type IO LastRead 2 FirstWrite 4}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes_shiftRows_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 1}
		buf_1 {Type IO LastRead 2 FirstWrite 1}}
	aes_mixColumns_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 2}
		buf_1 {Type IO LastRead 2 FirstWrite 2}}
	aes_addRoundKey_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 2}
		buf_1 {Type IO LastRead 2 FirstWrite 2}
		p_read {Type I LastRead 1 FirstWrite -1}
		key_idx {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "330", "Max" : "330"}
	, {"Name" : "Interval", "Min" : "330", "Max" : "330"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	buf_0 { ap_memory {  { buf_0_address0 mem_address 1 2 }  { buf_0_ce0 mem_ce 1 1 }  { buf_0_we0 mem_we 1 1 }  { buf_0_d0 mem_din 1 16 }  { buf_0_q0 mem_dout 0 16 }  { buf_0_address1 MemPortADDR2 1 2 }  { buf_0_ce1 MemPortCE2 1 1 }  { buf_0_we1 MemPortWE2 1 1 }  { buf_0_d1 MemPortDIN2 1 16 }  { buf_0_q1 MemPortDOUT2 0 16 } } }
	buf_1 { ap_memory {  { buf_1_address0 mem_address 1 2 }  { buf_1_ce0 mem_ce 1 1 }  { buf_1_we0 mem_we 1 1 }  { buf_1_d0 mem_din 1 16 }  { buf_1_q0 mem_dout 0 16 }  { buf_1_address1 MemPortADDR2 1 2 }  { buf_1_ce1 MemPortCE2 1 1 }  { buf_1_we1 MemPortWE2 1 1 }  { buf_1_d1 MemPortDIN2 1 16 }  { buf_1_q1 MemPortDOUT2 0 16 } } }
	ctx { ap_ovld {  { ctx_i in_data 0 768 }  { ctx_o out_data 1 768 }  { ctx_o_ap_vld out_vld 1 1 } } }
	rcon_1_out { ap_vld {  { rcon_1_out out_data 1 8 }  { rcon_1_out_ap_vld out_vld 1 1 } } }
}
