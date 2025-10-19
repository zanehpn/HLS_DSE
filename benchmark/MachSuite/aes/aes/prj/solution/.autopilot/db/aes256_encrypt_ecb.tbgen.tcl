set moduleName aes256_encrypt_ecb
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
set C_modelName {aes256_encrypt_ecb}
set C_modelType { void 0 }
set C_modelArgList {
	{ ctx int 768 regular {pointer 2}  }
	{ k_0 int 16 regular {array 8 { 1 1 } 1 1 }  }
	{ k_1 int 16 regular {array 8 { 1 1 } 1 1 }  }
	{ buf_0 int 16 regular {array 4 { 2 2 } 1 1 }  }
	{ buf_1 int 16 regular {array 4 { 2 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ctx", "interface" : "wire", "bitwidth" : 768, "direction" : "READWRITE"} , 
 	{ "Name" : "k_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "k_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "buf_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} , 
 	{ "Name" : "buf_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 41
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ctx_i sc_in sc_lv 768 signal 0 } 
	{ ctx_o sc_out sc_lv 768 signal 0 } 
	{ ctx_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ k_0_address0 sc_out sc_lv 3 signal 1 } 
	{ k_0_ce0 sc_out sc_logic 1 signal 1 } 
	{ k_0_q0 sc_in sc_lv 16 signal 1 } 
	{ k_0_address1 sc_out sc_lv 3 signal 1 } 
	{ k_0_ce1 sc_out sc_logic 1 signal 1 } 
	{ k_0_q1 sc_in sc_lv 16 signal 1 } 
	{ k_1_address0 sc_out sc_lv 3 signal 2 } 
	{ k_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ k_1_q0 sc_in sc_lv 16 signal 2 } 
	{ k_1_address1 sc_out sc_lv 3 signal 2 } 
	{ k_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ k_1_q1 sc_in sc_lv 16 signal 2 } 
	{ buf_0_address0 sc_out sc_lv 2 signal 3 } 
	{ buf_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ buf_0_we0 sc_out sc_logic 1 signal 3 } 
	{ buf_0_d0 sc_out sc_lv 16 signal 3 } 
	{ buf_0_q0 sc_in sc_lv 16 signal 3 } 
	{ buf_0_address1 sc_out sc_lv 2 signal 3 } 
	{ buf_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ buf_0_we1 sc_out sc_logic 1 signal 3 } 
	{ buf_0_d1 sc_out sc_lv 16 signal 3 } 
	{ buf_0_q1 sc_in sc_lv 16 signal 3 } 
	{ buf_1_address0 sc_out sc_lv 2 signal 4 } 
	{ buf_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ buf_1_we0 sc_out sc_logic 1 signal 4 } 
	{ buf_1_d0 sc_out sc_lv 16 signal 4 } 
	{ buf_1_q0 sc_in sc_lv 16 signal 4 } 
	{ buf_1_address1 sc_out sc_lv 2 signal 4 } 
	{ buf_1_ce1 sc_out sc_logic 1 signal 4 } 
	{ buf_1_we1 sc_out sc_logic 1 signal 4 } 
	{ buf_1_d1 sc_out sc_lv 16 signal 4 } 
	{ buf_1_q1 sc_in sc_lv 16 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ctx_i", "direction": "in", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ctx", "role": "i" }} , 
 	{ "name": "ctx_o", "direction": "out", "datatype": "sc_lv", "bitwidth":768, "type": "signal", "bundle":{"name": "ctx", "role": "o" }} , 
 	{ "name": "ctx_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ctx", "role": "o_ap_vld" }} , 
 	{ "name": "k_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_0", "role": "address0" }} , 
 	{ "name": "k_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_0", "role": "ce0" }} , 
 	{ "name": "k_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "k_0", "role": "q0" }} , 
 	{ "name": "k_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_0", "role": "address1" }} , 
 	{ "name": "k_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_0", "role": "ce1" }} , 
 	{ "name": "k_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "k_0", "role": "q1" }} , 
 	{ "name": "k_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_1", "role": "address0" }} , 
 	{ "name": "k_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_1", "role": "ce0" }} , 
 	{ "name": "k_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "k_1", "role": "q0" }} , 
 	{ "name": "k_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_1", "role": "address1" }} , 
 	{ "name": "k_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_1", "role": "ce1" }} , 
 	{ "name": "k_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "k_1", "role": "q1" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "5", "7", "10", "17", "19", "21", "22"],
		"CDFG" : "aes256_encrypt_ecb",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "582", "EstimateLatencyMax" : "582",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ctx", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb2_fu_92", "Port" : "ctx", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "10", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112", "Port" : "ctx", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "k_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81", "Port" : "k_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "k_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81", "Port" : "k_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "buf_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_aes_addRoundKey_cpy_1_fu_102", "Port" : "buf_0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "22", "SubInstance" : "grp_aes_addRoundKey_1_fu_154", "Port" : "buf_0", "Inst_start_state" : "34", "Inst_end_state" : "37"},
					{"ID" : "17", "SubInstance" : "grp_aes_subBytes_1_fu_125", "Port" : "buf_0", "Inst_start_state" : "10", "Inst_end_state" : "19"},
					{"ID" : "10", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112", "Port" : "buf_0", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "21", "SubInstance" : "grp_aes_shiftRows_1_fu_146", "Port" : "buf_0", "Inst_start_state" : "20", "Inst_end_state" : "22"}]},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_aes_addRoundKey_cpy_1_fu_102", "Port" : "buf_1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "22", "SubInstance" : "grp_aes_addRoundKey_1_fu_154", "Port" : "buf_1", "Inst_start_state" : "34", "Inst_end_state" : "37"},
					{"ID" : "17", "SubInstance" : "grp_aes_subBytes_1_fu_125", "Port" : "buf_1", "Inst_start_state" : "10", "Inst_end_state" : "19"},
					{"ID" : "10", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112", "Port" : "buf_1", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "21", "SubInstance" : "grp_aes_shiftRows_1_fu_146", "Port" : "buf_1", "Inst_start_state" : "20", "Inst_end_state" : "22"}]},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb2_fu_92", "Port" : "sbox", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "17", "SubInstance" : "grp_aes_subBytes_1_fu_125", "Port" : "sbox", "Inst_start_state" : "10", "Inst_end_state" : "19"},
					{"ID" : "10", "SubInstance" : "grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112", "Port" : "sbox", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "19", "SubInstance" : "grp_aes_expandEncKey_fu_135", "Port" : "sbox", "Inst_start_state" : "10", "Inst_end_state" : "34"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81", "Parent" : "0", "Child" : ["2", "3", "4"],
		"CDFG" : "aes256_encrypt_ecb_Pipeline_ecb1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ctx_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "k_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "ecb1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81.mux_21_8_1_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81.mux_21_8_1_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb1_fu_81.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb2_fu_92", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "aes256_encrypt_ecb_Pipeline_ecb2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "178", "EstimateLatencyMax" : "178",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "ctx", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ctx5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ecb2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb2_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_addRoundKey_cpy_1_fu_102", "Parent" : "0", "Child" : ["8", "9"],
		"CDFG" : "aes_addRoundKey_cpy_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19", "EstimateLatencyMax" : "19",
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
			{"Name" : "ctx_read", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "cpkey", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes_addRoundKey_cpy_1_fu_102.mux_21_8_1_1_U15", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes_addRoundKey_cpy_1_fu_102.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112", "Parent" : "0", "Child" : ["11", "13", "14", "15", "16"],
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
					{"ID" : "13", "SubInstance" : "grp_aes_shiftRows_1_fu_109", "Port" : "buf_0", "Inst_start_state" : "15", "Inst_end_state" : "17"},
					{"ID" : "11", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "buf_0", "Inst_start_state" : "5", "Inst_end_state" : "14"},
					{"ID" : "15", "SubInstance" : "grp_aes_addRoundKey_1_fu_125", "Port" : "buf_0", "Inst_start_state" : "26", "Inst_end_state" : "29"},
					{"ID" : "14", "SubInstance" : "grp_aes_mixColumns_1_fu_117", "Port" : "buf_0", "Inst_start_state" : "18", "Inst_end_state" : "21"}]},
			{"Name" : "buf_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_aes_shiftRows_1_fu_109", "Port" : "buf_1", "Inst_start_state" : "15", "Inst_end_state" : "17"},
					{"ID" : "11", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "buf_1", "Inst_start_state" : "5", "Inst_end_state" : "14"},
					{"ID" : "15", "SubInstance" : "grp_aes_addRoundKey_1_fu_125", "Port" : "buf_1", "Inst_start_state" : "26", "Inst_end_state" : "29"},
					{"ID" : "14", "SubInstance" : "grp_aes_mixColumns_1_fu_117", "Port" : "buf_1", "Inst_start_state" : "18", "Inst_end_state" : "21"}]},
			{"Name" : "ctx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rcon_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_aes_subBytes_1_fu_99", "Port" : "sbox", "Inst_start_state" : "5", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "ecb3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "25", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.grp_aes_subBytes_1_fu_99", "Parent" : "10", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.grp_aes_subBytes_1_fu_99.sbox_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.grp_aes_shiftRows_1_fu_109", "Parent" : "10",
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
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.grp_aes_mixColumns_1_fu_117", "Parent" : "10",
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
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.grp_aes_addRoundKey_1_fu_125", "Parent" : "10",
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
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes256_encrypt_ecb_Pipeline_ecb3_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_subBytes_1_fu_125", "Parent" : "0", "Child" : ["18"],
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes_subBytes_1_fu_125.sbox_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_expandEncKey_fu_135", "Parent" : "0", "Child" : ["20"],
		"CDFG" : "aes_expandEncKey",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "24", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "ctx_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "rc_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "sbox", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_aes_expandEncKey_fu_135.sbox_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_shiftRows_1_fu_146", "Parent" : "0",
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
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_aes_addRoundKey_1_fu_154", "Parent" : "0",
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
			{"Name" : "key_idx", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	aes256_encrypt_ecb {
		ctx {Type IO LastRead 9 FirstWrite 2}
		k_0 {Type I LastRead 1 FirstWrite -1}
		k_1 {Type I LastRead 1 FirstWrite -1}
		buf_0 {Type IO LastRead 2 FirstWrite 1}
		buf_1 {Type IO LastRead 2 FirstWrite 1}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes256_encrypt_ecb_Pipeline_ecb1 {
		ctx_load {Type I LastRead 0 FirstWrite -1}
		k_0 {Type I LastRead 1 FirstWrite -1}
		k_1 {Type I LastRead 1 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}
	aes256_encrypt_ecb_Pipeline_ecb2 {
		p_reload {Type I LastRead 0 FirstWrite -1}
		ctx {Type O LastRead -1 FirstWrite 25}
		ctx5_out {Type O LastRead -1 FirstWrite 1}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes_addRoundKey_cpy_1 {
		buf_0 {Type IO LastRead 1 FirstWrite 2}
		buf_1 {Type IO LastRead 1 FirstWrite 2}
		ctx_read {Type I LastRead 0 FirstWrite -1}}
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
		key_idx {Type I LastRead 1 FirstWrite -1}}
	aes_subBytes_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 8}
		buf_1 {Type IO LastRead 2 FirstWrite 4}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes_expandEncKey {
		ctx_read {Type I LastRead 0 FirstWrite -1}
		k_idx {Type I LastRead 0 FirstWrite -1}
		rc_read {Type I LastRead 0 FirstWrite -1}
		sbox {Type I LastRead -1 FirstWrite -1}}
	aes_shiftRows_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 1}
		buf_1 {Type IO LastRead 2 FirstWrite 1}}
	aes_addRoundKey_1 {
		buf_0 {Type IO LastRead 2 FirstWrite 2}
		buf_1 {Type IO LastRead 2 FirstWrite 2}
		p_read {Type I LastRead 1 FirstWrite -1}
		key_idx {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "582", "Max" : "582"}
	, {"Name" : "Interval", "Min" : "583", "Max" : "583"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ctx { ap_ovld {  { ctx_i in_data 0 768 }  { ctx_o out_data 1 768 }  { ctx_o_ap_vld out_vld 1 1 } } }
	k_0 { ap_memory {  { k_0_address0 mem_address 1 3 }  { k_0_ce0 mem_ce 1 1 }  { k_0_q0 mem_dout 0 16 }  { k_0_address1 MemPortADDR2 1 3 }  { k_0_ce1 MemPortCE2 1 1 }  { k_0_q1 MemPortDOUT2 0 16 } } }
	k_1 { ap_memory {  { k_1_address0 mem_address 1 3 }  { k_1_ce0 mem_ce 1 1 }  { k_1_q0 mem_dout 0 16 }  { k_1_address1 MemPortADDR2 1 3 }  { k_1_ce1 MemPortCE2 1 1 }  { k_1_q1 MemPortDOUT2 0 16 } } }
	buf_0 { ap_memory {  { buf_0_address0 mem_address 1 2 }  { buf_0_ce0 mem_ce 1 1 }  { buf_0_we0 mem_we 1 1 }  { buf_0_d0 mem_din 1 16 }  { buf_0_q0 mem_dout 0 16 }  { buf_0_address1 MemPortADDR2 1 2 }  { buf_0_ce1 MemPortCE2 1 1 }  { buf_0_we1 MemPortWE2 1 1 }  { buf_0_d1 MemPortDIN2 1 16 }  { buf_0_q1 MemPortDOUT2 0 16 } } }
	buf_1 { ap_memory {  { buf_1_address0 mem_address 1 2 }  { buf_1_ce0 mem_ce 1 1 }  { buf_1_we0 mem_we 1 1 }  { buf_1_d0 mem_din 1 16 }  { buf_1_q0 mem_dout 0 16 }  { buf_1_address1 MemPortADDR2 1 2 }  { buf_1_ce1 MemPortCE2 1 1 }  { buf_1_we1 MemPortWE2 1 1 }  { buf_1_d1 MemPortDIN2 1 16 }  { buf_1_q1 MemPortDOUT2 0 16 } } }
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
