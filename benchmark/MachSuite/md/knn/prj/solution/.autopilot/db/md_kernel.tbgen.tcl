set moduleName md_kernel
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
set C_modelName {md_kernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ force_x_0 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ force_x_1 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ force_y_0 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ force_y_1 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ force_z_0 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ force_z_1 int 128 regular {array 64 { 2 2 } 1 1 }  }
	{ position_x_0 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ position_x_1 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ position_y_0 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ position_y_1 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ position_z_0 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ position_z_1 int 128 regular {array 64 { 1 1 } 1 1 }  }
	{ NL_0 int 64 regular {array 1024 { 1 1 } 1 1 }  }
	{ NL_1 int 64 regular {array 1024 { 1 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "force_x_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "force_x_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "force_y_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "force_y_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "force_z_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "force_z_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "position_x_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "position_x_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "position_y_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "position_y_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "position_z_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "position_z_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "NL_0", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "NL_1", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 114
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ force_x_0_address0 sc_out sc_lv 6 signal 0 } 
	{ force_x_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ force_x_0_we0 sc_out sc_logic 1 signal 0 } 
	{ force_x_0_d0 sc_out sc_lv 128 signal 0 } 
	{ force_x_0_q0 sc_in sc_lv 128 signal 0 } 
	{ force_x_0_address1 sc_out sc_lv 6 signal 0 } 
	{ force_x_0_ce1 sc_out sc_logic 1 signal 0 } 
	{ force_x_0_we1 sc_out sc_logic 1 signal 0 } 
	{ force_x_0_d1 sc_out sc_lv 128 signal 0 } 
	{ force_x_0_q1 sc_in sc_lv 128 signal 0 } 
	{ force_x_1_address0 sc_out sc_lv 6 signal 1 } 
	{ force_x_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ force_x_1_we0 sc_out sc_logic 1 signal 1 } 
	{ force_x_1_d0 sc_out sc_lv 128 signal 1 } 
	{ force_x_1_q0 sc_in sc_lv 128 signal 1 } 
	{ force_x_1_address1 sc_out sc_lv 6 signal 1 } 
	{ force_x_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ force_x_1_we1 sc_out sc_logic 1 signal 1 } 
	{ force_x_1_d1 sc_out sc_lv 128 signal 1 } 
	{ force_x_1_q1 sc_in sc_lv 128 signal 1 } 
	{ force_y_0_address0 sc_out sc_lv 6 signal 2 } 
	{ force_y_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ force_y_0_we0 sc_out sc_logic 1 signal 2 } 
	{ force_y_0_d0 sc_out sc_lv 128 signal 2 } 
	{ force_y_0_q0 sc_in sc_lv 128 signal 2 } 
	{ force_y_0_address1 sc_out sc_lv 6 signal 2 } 
	{ force_y_0_ce1 sc_out sc_logic 1 signal 2 } 
	{ force_y_0_we1 sc_out sc_logic 1 signal 2 } 
	{ force_y_0_d1 sc_out sc_lv 128 signal 2 } 
	{ force_y_0_q1 sc_in sc_lv 128 signal 2 } 
	{ force_y_1_address0 sc_out sc_lv 6 signal 3 } 
	{ force_y_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ force_y_1_we0 sc_out sc_logic 1 signal 3 } 
	{ force_y_1_d0 sc_out sc_lv 128 signal 3 } 
	{ force_y_1_q0 sc_in sc_lv 128 signal 3 } 
	{ force_y_1_address1 sc_out sc_lv 6 signal 3 } 
	{ force_y_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ force_y_1_we1 sc_out sc_logic 1 signal 3 } 
	{ force_y_1_d1 sc_out sc_lv 128 signal 3 } 
	{ force_y_1_q1 sc_in sc_lv 128 signal 3 } 
	{ force_z_0_address0 sc_out sc_lv 6 signal 4 } 
	{ force_z_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ force_z_0_we0 sc_out sc_logic 1 signal 4 } 
	{ force_z_0_d0 sc_out sc_lv 128 signal 4 } 
	{ force_z_0_q0 sc_in sc_lv 128 signal 4 } 
	{ force_z_0_address1 sc_out sc_lv 6 signal 4 } 
	{ force_z_0_ce1 sc_out sc_logic 1 signal 4 } 
	{ force_z_0_we1 sc_out sc_logic 1 signal 4 } 
	{ force_z_0_d1 sc_out sc_lv 128 signal 4 } 
	{ force_z_0_q1 sc_in sc_lv 128 signal 4 } 
	{ force_z_1_address0 sc_out sc_lv 6 signal 5 } 
	{ force_z_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ force_z_1_we0 sc_out sc_logic 1 signal 5 } 
	{ force_z_1_d0 sc_out sc_lv 128 signal 5 } 
	{ force_z_1_q0 sc_in sc_lv 128 signal 5 } 
	{ force_z_1_address1 sc_out sc_lv 6 signal 5 } 
	{ force_z_1_ce1 sc_out sc_logic 1 signal 5 } 
	{ force_z_1_we1 sc_out sc_logic 1 signal 5 } 
	{ force_z_1_d1 sc_out sc_lv 128 signal 5 } 
	{ force_z_1_q1 sc_in sc_lv 128 signal 5 } 
	{ position_x_0_address0 sc_out sc_lv 6 signal 6 } 
	{ position_x_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ position_x_0_q0 sc_in sc_lv 128 signal 6 } 
	{ position_x_0_address1 sc_out sc_lv 6 signal 6 } 
	{ position_x_0_ce1 sc_out sc_logic 1 signal 6 } 
	{ position_x_0_q1 sc_in sc_lv 128 signal 6 } 
	{ position_x_1_address0 sc_out sc_lv 6 signal 7 } 
	{ position_x_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ position_x_1_q0 sc_in sc_lv 128 signal 7 } 
	{ position_x_1_address1 sc_out sc_lv 6 signal 7 } 
	{ position_x_1_ce1 sc_out sc_logic 1 signal 7 } 
	{ position_x_1_q1 sc_in sc_lv 128 signal 7 } 
	{ position_y_0_address0 sc_out sc_lv 6 signal 8 } 
	{ position_y_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ position_y_0_q0 sc_in sc_lv 128 signal 8 } 
	{ position_y_0_address1 sc_out sc_lv 6 signal 8 } 
	{ position_y_0_ce1 sc_out sc_logic 1 signal 8 } 
	{ position_y_0_q1 sc_in sc_lv 128 signal 8 } 
	{ position_y_1_address0 sc_out sc_lv 6 signal 9 } 
	{ position_y_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ position_y_1_q0 sc_in sc_lv 128 signal 9 } 
	{ position_y_1_address1 sc_out sc_lv 6 signal 9 } 
	{ position_y_1_ce1 sc_out sc_logic 1 signal 9 } 
	{ position_y_1_q1 sc_in sc_lv 128 signal 9 } 
	{ position_z_0_address0 sc_out sc_lv 6 signal 10 } 
	{ position_z_0_ce0 sc_out sc_logic 1 signal 10 } 
	{ position_z_0_q0 sc_in sc_lv 128 signal 10 } 
	{ position_z_0_address1 sc_out sc_lv 6 signal 10 } 
	{ position_z_0_ce1 sc_out sc_logic 1 signal 10 } 
	{ position_z_0_q1 sc_in sc_lv 128 signal 10 } 
	{ position_z_1_address0 sc_out sc_lv 6 signal 11 } 
	{ position_z_1_ce0 sc_out sc_logic 1 signal 11 } 
	{ position_z_1_q0 sc_in sc_lv 128 signal 11 } 
	{ position_z_1_address1 sc_out sc_lv 6 signal 11 } 
	{ position_z_1_ce1 sc_out sc_logic 1 signal 11 } 
	{ position_z_1_q1 sc_in sc_lv 128 signal 11 } 
	{ NL_0_address0 sc_out sc_lv 10 signal 12 } 
	{ NL_0_ce0 sc_out sc_logic 1 signal 12 } 
	{ NL_0_q0 sc_in sc_lv 64 signal 12 } 
	{ NL_0_address1 sc_out sc_lv 10 signal 12 } 
	{ NL_0_ce1 sc_out sc_logic 1 signal 12 } 
	{ NL_0_q1 sc_in sc_lv 64 signal 12 } 
	{ NL_1_address0 sc_out sc_lv 10 signal 13 } 
	{ NL_1_ce0 sc_out sc_logic 1 signal 13 } 
	{ NL_1_q0 sc_in sc_lv 64 signal 13 } 
	{ NL_1_address1 sc_out sc_lv 10 signal 13 } 
	{ NL_1_ce1 sc_out sc_logic 1 signal 13 } 
	{ NL_1_q1 sc_in sc_lv 64 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "force_x_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_x_0", "role": "address0" }} , 
 	{ "name": "force_x_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_0", "role": "ce0" }} , 
 	{ "name": "force_x_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_0", "role": "we0" }} , 
 	{ "name": "force_x_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_0", "role": "d0" }} , 
 	{ "name": "force_x_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_0", "role": "q0" }} , 
 	{ "name": "force_x_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_x_0", "role": "address1" }} , 
 	{ "name": "force_x_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_0", "role": "ce1" }} , 
 	{ "name": "force_x_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_0", "role": "we1" }} , 
 	{ "name": "force_x_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_0", "role": "d1" }} , 
 	{ "name": "force_x_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_0", "role": "q1" }} , 
 	{ "name": "force_x_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_x_1", "role": "address0" }} , 
 	{ "name": "force_x_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_1", "role": "ce0" }} , 
 	{ "name": "force_x_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_1", "role": "we0" }} , 
 	{ "name": "force_x_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_1", "role": "d0" }} , 
 	{ "name": "force_x_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_1", "role": "q0" }} , 
 	{ "name": "force_x_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_x_1", "role": "address1" }} , 
 	{ "name": "force_x_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_1", "role": "ce1" }} , 
 	{ "name": "force_x_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_x_1", "role": "we1" }} , 
 	{ "name": "force_x_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_1", "role": "d1" }} , 
 	{ "name": "force_x_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_x_1", "role": "q1" }} , 
 	{ "name": "force_y_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_y_0", "role": "address0" }} , 
 	{ "name": "force_y_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_0", "role": "ce0" }} , 
 	{ "name": "force_y_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_0", "role": "we0" }} , 
 	{ "name": "force_y_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_0", "role": "d0" }} , 
 	{ "name": "force_y_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_0", "role": "q0" }} , 
 	{ "name": "force_y_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_y_0", "role": "address1" }} , 
 	{ "name": "force_y_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_0", "role": "ce1" }} , 
 	{ "name": "force_y_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_0", "role": "we1" }} , 
 	{ "name": "force_y_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_0", "role": "d1" }} , 
 	{ "name": "force_y_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_0", "role": "q1" }} , 
 	{ "name": "force_y_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_y_1", "role": "address0" }} , 
 	{ "name": "force_y_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_1", "role": "ce0" }} , 
 	{ "name": "force_y_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_1", "role": "we0" }} , 
 	{ "name": "force_y_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_1", "role": "d0" }} , 
 	{ "name": "force_y_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_1", "role": "q0" }} , 
 	{ "name": "force_y_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_y_1", "role": "address1" }} , 
 	{ "name": "force_y_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_1", "role": "ce1" }} , 
 	{ "name": "force_y_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_y_1", "role": "we1" }} , 
 	{ "name": "force_y_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_1", "role": "d1" }} , 
 	{ "name": "force_y_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_y_1", "role": "q1" }} , 
 	{ "name": "force_z_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_z_0", "role": "address0" }} , 
 	{ "name": "force_z_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_0", "role": "ce0" }} , 
 	{ "name": "force_z_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_0", "role": "we0" }} , 
 	{ "name": "force_z_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_0", "role": "d0" }} , 
 	{ "name": "force_z_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_0", "role": "q0" }} , 
 	{ "name": "force_z_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_z_0", "role": "address1" }} , 
 	{ "name": "force_z_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_0", "role": "ce1" }} , 
 	{ "name": "force_z_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_0", "role": "we1" }} , 
 	{ "name": "force_z_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_0", "role": "d1" }} , 
 	{ "name": "force_z_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_0", "role": "q1" }} , 
 	{ "name": "force_z_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_z_1", "role": "address0" }} , 
 	{ "name": "force_z_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_1", "role": "ce0" }} , 
 	{ "name": "force_z_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_1", "role": "we0" }} , 
 	{ "name": "force_z_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_1", "role": "d0" }} , 
 	{ "name": "force_z_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_1", "role": "q0" }} , 
 	{ "name": "force_z_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "force_z_1", "role": "address1" }} , 
 	{ "name": "force_z_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_1", "role": "ce1" }} , 
 	{ "name": "force_z_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "force_z_1", "role": "we1" }} , 
 	{ "name": "force_z_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_1", "role": "d1" }} , 
 	{ "name": "force_z_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "force_z_1", "role": "q1" }} , 
 	{ "name": "position_x_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_x_0", "role": "address0" }} , 
 	{ "name": "position_x_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_x_0", "role": "ce0" }} , 
 	{ "name": "position_x_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_x_0", "role": "q0" }} , 
 	{ "name": "position_x_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_x_0", "role": "address1" }} , 
 	{ "name": "position_x_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_x_0", "role": "ce1" }} , 
 	{ "name": "position_x_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_x_0", "role": "q1" }} , 
 	{ "name": "position_x_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_x_1", "role": "address0" }} , 
 	{ "name": "position_x_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_x_1", "role": "ce0" }} , 
 	{ "name": "position_x_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_x_1", "role": "q0" }} , 
 	{ "name": "position_x_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_x_1", "role": "address1" }} , 
 	{ "name": "position_x_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_x_1", "role": "ce1" }} , 
 	{ "name": "position_x_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_x_1", "role": "q1" }} , 
 	{ "name": "position_y_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_y_0", "role": "address0" }} , 
 	{ "name": "position_y_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_y_0", "role": "ce0" }} , 
 	{ "name": "position_y_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_y_0", "role": "q0" }} , 
 	{ "name": "position_y_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_y_0", "role": "address1" }} , 
 	{ "name": "position_y_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_y_0", "role": "ce1" }} , 
 	{ "name": "position_y_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_y_0", "role": "q1" }} , 
 	{ "name": "position_y_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_y_1", "role": "address0" }} , 
 	{ "name": "position_y_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_y_1", "role": "ce0" }} , 
 	{ "name": "position_y_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_y_1", "role": "q0" }} , 
 	{ "name": "position_y_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_y_1", "role": "address1" }} , 
 	{ "name": "position_y_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_y_1", "role": "ce1" }} , 
 	{ "name": "position_y_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_y_1", "role": "q1" }} , 
 	{ "name": "position_z_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_z_0", "role": "address0" }} , 
 	{ "name": "position_z_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_z_0", "role": "ce0" }} , 
 	{ "name": "position_z_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_z_0", "role": "q0" }} , 
 	{ "name": "position_z_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_z_0", "role": "address1" }} , 
 	{ "name": "position_z_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_z_0", "role": "ce1" }} , 
 	{ "name": "position_z_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_z_0", "role": "q1" }} , 
 	{ "name": "position_z_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_z_1", "role": "address0" }} , 
 	{ "name": "position_z_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_z_1", "role": "ce0" }} , 
 	{ "name": "position_z_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_z_1", "role": "q0" }} , 
 	{ "name": "position_z_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "position_z_1", "role": "address1" }} , 
 	{ "name": "position_z_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_z_1", "role": "ce1" }} , 
 	{ "name": "position_z_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "position_z_1", "role": "q1" }} , 
 	{ "name": "NL_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "NL_0", "role": "address0" }} , 
 	{ "name": "NL_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NL_0", "role": "ce0" }} , 
 	{ "name": "NL_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "NL_0", "role": "q0" }} , 
 	{ "name": "NL_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "NL_0", "role": "address1" }} , 
 	{ "name": "NL_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NL_0", "role": "ce1" }} , 
 	{ "name": "NL_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "NL_0", "role": "q1" }} , 
 	{ "name": "NL_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "NL_1", "role": "address0" }} , 
 	{ "name": "NL_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NL_1", "role": "ce0" }} , 
 	{ "name": "NL_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "NL_1", "role": "q0" }} , 
 	{ "name": "NL_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "NL_1", "role": "address1" }} , 
 	{ "name": "NL_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "NL_1", "role": "ce1" }} , 
 	{ "name": "NL_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "NL_1", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177"],
		"CDFG" : "md_kernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2324", "EstimateLatencyMax" : "2324",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "force_x_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "force_x_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "force_y_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "force_y_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "force_z_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "force_z_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "position_x_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_x_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_y_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_y_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_z_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "position_z_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "NL_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "NL_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "loop_i", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage10", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage10_subdone", "QuitState" : "ap_ST_fsm_pp0_stage10", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage10_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_no_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dsub_64ns_64ns_64_4_no_dsp_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U9", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadddsub_64ns_64ns_64_5_full_dsp_1_U10", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U11", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U12", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U13", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U14", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U15", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U16", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U17", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U18", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U19", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U20", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U21", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U22", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U23", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U24", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U25", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U26", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U27", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U28", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U29", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U30", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U31", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_4_no_dsp_1_U32", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_max_dsp_1_U33", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_max_dsp_1_U34", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U35", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U36", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U37", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U38", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U39", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U40", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_22_no_dsp_1_U41", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ddiv_64ns_64ns_64_22_no_dsp_1_U42", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U43", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U44", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U45", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U46", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U47", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U48", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U49", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U50", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U51", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U52", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U53", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U54", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U55", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U56", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U57", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U58", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U59", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U60", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U61", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U62", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U63", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U64", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U65", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U66", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U67", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U68", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U69", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U70", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U71", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U72", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U73", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U74", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U75", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U76", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U77", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U78", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U79", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U80", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U81", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U82", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U83", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U84", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U85", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U86", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U87", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U88", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U89", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U90", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U91", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U92", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U93", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U94", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U95", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U96", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U97", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U98", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U99", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U100", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U101", "Parent" : "0"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U102", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U103", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U104", "Parent" : "0"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U105", "Parent" : "0"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U106", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U107", "Parent" : "0"},
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U108", "Parent" : "0"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U109", "Parent" : "0"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U110", "Parent" : "0"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U111", "Parent" : "0"},
	{"ID" : "112", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U112", "Parent" : "0"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U113", "Parent" : "0"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U114", "Parent" : "0"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U115", "Parent" : "0"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U116", "Parent" : "0"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U117", "Parent" : "0"},
	{"ID" : "118", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U118", "Parent" : "0"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U119", "Parent" : "0"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U120", "Parent" : "0"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U121", "Parent" : "0"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U122", "Parent" : "0"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U123", "Parent" : "0"},
	{"ID" : "124", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U124", "Parent" : "0"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U125", "Parent" : "0"},
	{"ID" : "126", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U126", "Parent" : "0"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U127", "Parent" : "0"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U128", "Parent" : "0"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U129", "Parent" : "0"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U130", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U131", "Parent" : "0"},
	{"ID" : "132", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U132", "Parent" : "0"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U133", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U134", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U135", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U136", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U137", "Parent" : "0"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U138", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U139", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U140", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U141", "Parent" : "0"},
	{"ID" : "142", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U142", "Parent" : "0"},
	{"ID" : "143", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U143", "Parent" : "0"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U144", "Parent" : "0"},
	{"ID" : "145", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U145", "Parent" : "0"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U146", "Parent" : "0"},
	{"ID" : "147", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U147", "Parent" : "0"},
	{"ID" : "148", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U148", "Parent" : "0"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U149", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U150", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U151", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U152", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U153", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U154", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U155", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U156", "Parent" : "0"},
	{"ID" : "157", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U157", "Parent" : "0"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U158", "Parent" : "0"},
	{"ID" : "159", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U159", "Parent" : "0"},
	{"ID" : "160", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U160", "Parent" : "0"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U161", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U162", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U163", "Parent" : "0"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_32_1_1_U164", "Parent" : "0"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U165", "Parent" : "0"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U166", "Parent" : "0"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U167", "Parent" : "0"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U168", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U169", "Parent" : "0"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U170", "Parent" : "0"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U171", "Parent" : "0"},
	{"ID" : "172", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U172", "Parent" : "0"},
	{"ID" : "173", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U173", "Parent" : "0"},
	{"ID" : "174", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U174", "Parent" : "0"},
	{"ID" : "175", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U175", "Parent" : "0"},
	{"ID" : "176", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_225_64_1_1_U176", "Parent" : "0"},
	{"ID" : "177", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	md_kernel {
		force_x_0 {Type IO LastRead 1 FirstWrite 158}
		force_x_1 {Type IO LastRead 1 FirstWrite 158}
		force_y_0 {Type IO LastRead 1 FirstWrite 159}
		force_y_1 {Type IO LastRead 1 FirstWrite 159}
		force_z_0 {Type IO LastRead 1 FirstWrite 160}
		force_z_1 {Type IO LastRead 1 FirstWrite 160}
		position_x_0 {Type I LastRead 19 FirstWrite -1}
		position_x_1 {Type I LastRead 19 FirstWrite -1}
		position_y_0 {Type I LastRead 19 FirstWrite -1}
		position_y_1 {Type I LastRead 19 FirstWrite -1}
		position_z_0 {Type I LastRead 19 FirstWrite -1}
		position_z_1 {Type I LastRead 19 FirstWrite -1}
		NL_0 {Type I LastRead 16 FirstWrite -1}
		NL_1 {Type I LastRead 16 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2324", "Max" : "2324"}
	, {"Name" : "Interval", "Min" : "2325", "Max" : "2325"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	force_x_0 { ap_memory {  { force_x_0_address0 mem_address 1 6 }  { force_x_0_ce0 mem_ce 1 1 }  { force_x_0_we0 mem_we 1 1 }  { force_x_0_d0 mem_din 1 128 }  { force_x_0_q0 mem_dout 0 128 }  { force_x_0_address1 MemPortADDR2 1 6 }  { force_x_0_ce1 MemPortCE2 1 1 }  { force_x_0_we1 MemPortWE2 1 1 }  { force_x_0_d1 MemPortDIN2 1 128 }  { force_x_0_q1 MemPortDOUT2 0 128 } } }
	force_x_1 { ap_memory {  { force_x_1_address0 mem_address 1 6 }  { force_x_1_ce0 mem_ce 1 1 }  { force_x_1_we0 mem_we 1 1 }  { force_x_1_d0 mem_din 1 128 }  { force_x_1_q0 mem_dout 0 128 }  { force_x_1_address1 MemPortADDR2 1 6 }  { force_x_1_ce1 MemPortCE2 1 1 }  { force_x_1_we1 MemPortWE2 1 1 }  { force_x_1_d1 MemPortDIN2 1 128 }  { force_x_1_q1 MemPortDOUT2 0 128 } } }
	force_y_0 { ap_memory {  { force_y_0_address0 mem_address 1 6 }  { force_y_0_ce0 mem_ce 1 1 }  { force_y_0_we0 mem_we 1 1 }  { force_y_0_d0 mem_din 1 128 }  { force_y_0_q0 mem_dout 0 128 }  { force_y_0_address1 MemPortADDR2 1 6 }  { force_y_0_ce1 MemPortCE2 1 1 }  { force_y_0_we1 MemPortWE2 1 1 }  { force_y_0_d1 MemPortDIN2 1 128 }  { force_y_0_q1 MemPortDOUT2 0 128 } } }
	force_y_1 { ap_memory {  { force_y_1_address0 mem_address 1 6 }  { force_y_1_ce0 mem_ce 1 1 }  { force_y_1_we0 mem_we 1 1 }  { force_y_1_d0 mem_din 1 128 }  { force_y_1_q0 mem_dout 0 128 }  { force_y_1_address1 MemPortADDR2 1 6 }  { force_y_1_ce1 MemPortCE2 1 1 }  { force_y_1_we1 MemPortWE2 1 1 }  { force_y_1_d1 MemPortDIN2 1 128 }  { force_y_1_q1 MemPortDOUT2 0 128 } } }
	force_z_0 { ap_memory {  { force_z_0_address0 mem_address 1 6 }  { force_z_0_ce0 mem_ce 1 1 }  { force_z_0_we0 mem_we 1 1 }  { force_z_0_d0 mem_din 1 128 }  { force_z_0_q0 mem_dout 0 128 }  { force_z_0_address1 MemPortADDR2 1 6 }  { force_z_0_ce1 MemPortCE2 1 1 }  { force_z_0_we1 MemPortWE2 1 1 }  { force_z_0_d1 MemPortDIN2 1 128 }  { force_z_0_q1 MemPortDOUT2 0 128 } } }
	force_z_1 { ap_memory {  { force_z_1_address0 mem_address 1 6 }  { force_z_1_ce0 mem_ce 1 1 }  { force_z_1_we0 mem_we 1 1 }  { force_z_1_d0 mem_din 1 128 }  { force_z_1_q0 mem_dout 0 128 }  { force_z_1_address1 MemPortADDR2 1 6 }  { force_z_1_ce1 MemPortCE2 1 1 }  { force_z_1_we1 MemPortWE2 1 1 }  { force_z_1_d1 MemPortDIN2 1 128 }  { force_z_1_q1 MemPortDOUT2 0 128 } } }
	position_x_0 { ap_memory {  { position_x_0_address0 mem_address 1 6 }  { position_x_0_ce0 mem_ce 1 1 }  { position_x_0_q0 in_data 0 128 }  { position_x_0_address1 MemPortADDR2 1 6 }  { position_x_0_ce1 MemPortCE2 1 1 }  { position_x_0_q1 in_data 0 128 } } }
	position_x_1 { ap_memory {  { position_x_1_address0 mem_address 1 6 }  { position_x_1_ce0 mem_ce 1 1 }  { position_x_1_q0 in_data 0 128 }  { position_x_1_address1 MemPortADDR2 1 6 }  { position_x_1_ce1 MemPortCE2 1 1 }  { position_x_1_q1 in_data 0 128 } } }
	position_y_0 { ap_memory {  { position_y_0_address0 mem_address 1 6 }  { position_y_0_ce0 mem_ce 1 1 }  { position_y_0_q0 in_data 0 128 }  { position_y_0_address1 MemPortADDR2 1 6 }  { position_y_0_ce1 MemPortCE2 1 1 }  { position_y_0_q1 in_data 0 128 } } }
	position_y_1 { ap_memory {  { position_y_1_address0 mem_address 1 6 }  { position_y_1_ce0 mem_ce 1 1 }  { position_y_1_q0 in_data 0 128 }  { position_y_1_address1 MemPortADDR2 1 6 }  { position_y_1_ce1 MemPortCE2 1 1 }  { position_y_1_q1 in_data 0 128 } } }
	position_z_0 { ap_memory {  { position_z_0_address0 mem_address 1 6 }  { position_z_0_ce0 mem_ce 1 1 }  { position_z_0_q0 in_data 0 128 }  { position_z_0_address1 MemPortADDR2 1 6 }  { position_z_0_ce1 MemPortCE2 1 1 }  { position_z_0_q1 in_data 0 128 } } }
	position_z_1 { ap_memory {  { position_z_1_address0 mem_address 1 6 }  { position_z_1_ce0 mem_ce 1 1 }  { position_z_1_q0 in_data 0 128 }  { position_z_1_address1 MemPortADDR2 1 6 }  { position_z_1_ce1 MemPortCE2 1 1 }  { position_z_1_q1 in_data 0 128 } } }
	NL_0 { ap_memory {  { NL_0_address0 mem_address 1 10 }  { NL_0_ce0 mem_ce 1 1 }  { NL_0_q0 in_data 0 64 }  { NL_0_address1 MemPortADDR2 1 10 }  { NL_0_ce1 MemPortCE2 1 1 }  { NL_0_q1 in_data 0 64 } } }
	NL_1 { ap_memory {  { NL_1_address0 mem_address 1 10 }  { NL_1_ce0 mem_ce 1 1 }  { NL_1_q0 in_data 0 64 }  { NL_1_address1 MemPortADDR2 1 10 }  { NL_1_ce1 MemPortCE2 1 1 }  { NL_1_q1 in_data 0 64 } } }
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
