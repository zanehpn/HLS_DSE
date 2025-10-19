set moduleName gemm_Pipeline_middle
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
set C_modelName {gemm_Pipeline_middle}
set C_modelType { void 0 }
set C_modelArgList {
	{ prod_0 int 128 regular {array 1024 { 2 3 } 1 1 }  }
	{ m1_0_load int 128 regular  }
	{ zext_ln14_15 int 7 regular  }
	{ m1_1_load int 128 regular  }
	{ tmp_260 int 1 regular  }
	{ m2_0 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ m1_0_load_1 int 128 regular  }
	{ m1_1_load_1 int 128 regular  }
	{ m1_0_load_2 int 128 regular  }
	{ m1_1_load_2 int 128 regular  }
	{ m1_0_load_3 int 128 regular  }
	{ m1_1_load_3 int 128 regular  }
	{ m1_0_load_4 int 128 regular  }
	{ m1_1_load_4 int 128 regular  }
	{ m1_0_load_5 int 128 regular  }
	{ m1_1_load_5 int 128 regular  }
	{ m1_0_load_6 int 128 regular  }
	{ m1_1_load_6 int 128 regular  }
	{ m1_0_load_7 int 128 regular  }
	{ m1_1_load_7 int 128 regular  }
	{ m1_0_load_8 int 128 regular  }
	{ m1_1_load_8 int 128 regular  }
	{ m1_0_load_9 int 128 regular  }
	{ m1_1_load_9 int 128 regular  }
	{ m1_0_load_10 int 128 regular  }
	{ m1_1_load_10 int 128 regular  }
	{ m1_0_load_11 int 128 regular  }
	{ m1_1_load_11 int 128 regular  }
	{ m1_0_load_12 int 128 regular  }
	{ m1_1_load_12 int 128 regular  }
	{ m1_0_load_13 int 128 regular  }
	{ m1_1_load_13 int 128 regular  }
	{ m1_0_load_14 int 128 regular  }
	{ m1_1_load_14 int 128 regular  }
	{ m1_0_load_15 int 128 regular  }
	{ m1_1_load_15 int 128 regular  }
	{ m1_0_load_16 int 128 regular  }
	{ m1_1_load_16 int 128 regular  }
	{ m1_0_load_17 int 128 regular  }
	{ m1_1_load_17 int 128 regular  }
	{ m1_0_load_18 int 128 regular  }
	{ m1_1_load_18 int 128 regular  }
	{ m1_0_load_19 int 128 regular  }
	{ m1_1_load_19 int 128 regular  }
	{ m1_0_load_20 int 128 regular  }
	{ m1_1_load_20 int 128 regular  }
	{ m1_0_load_21 int 128 regular  }
	{ m1_1_load_21 int 128 regular  }
	{ m1_0_load_22 int 128 regular  }
	{ m1_1_load_22 int 128 regular  }
	{ m1_0_load_23 int 128 regular  }
	{ m1_1_load_23 int 128 regular  }
	{ m1_0_load_24 int 128 regular  }
	{ m1_1_load_24 int 128 regular  }
	{ m1_0_load_25 int 128 regular  }
	{ m1_1_load_25 int 128 regular  }
	{ m1_0_load_26 int 128 regular  }
	{ m1_1_load_26 int 128 regular  }
	{ m1_0_load_27 int 128 regular  }
	{ m1_1_load_27 int 128 regular  }
	{ m1_0_load_28 int 128 regular  }
	{ m1_1_load_28 int 128 regular  }
	{ m1_0_load_29 int 128 regular  }
	{ m1_1_load_29 int 128 regular  }
	{ m1_0_load_30 int 128 regular  }
	{ m1_1_load_30 int 128 regular  }
	{ m1_0_load_31 int 128 regular  }
	{ m1_1_load_31 int 128 regular  }
	{ m1_0_load_32 int 128 regular  }
	{ m1_1_load_32 int 128 regular  }
	{ m2_1 int 128 regular {array 1024 { 1 1 } 1 1 }  }
	{ m1_0_load_33 int 128 regular  }
	{ m1_1_load_33 int 128 regular  }
	{ m1_0_load_34 int 128 regular  }
	{ m1_1_load_34 int 128 regular  }
	{ m1_0_load_35 int 128 regular  }
	{ m1_1_load_35 int 128 regular  }
	{ m1_0_load_36 int 128 regular  }
	{ m1_1_load_36 int 128 regular  }
	{ m1_0_load_37 int 128 regular  }
	{ m1_1_load_37 int 128 regular  }
	{ m1_0_load_38 int 128 regular  }
	{ m1_1_load_38 int 128 regular  }
	{ m1_0_load_39 int 128 regular  }
	{ m1_1_load_39 int 128 regular  }
	{ m1_0_load_40 int 128 regular  }
	{ m1_1_load_40 int 128 regular  }
	{ m1_0_load_41 int 128 regular  }
	{ m1_1_load_41 int 128 regular  }
	{ m1_0_load_42 int 128 regular  }
	{ m1_1_load_42 int 128 regular  }
	{ m1_0_load_43 int 128 regular  }
	{ m1_1_load_43 int 128 regular  }
	{ m1_0_load_44 int 128 regular  }
	{ m1_1_load_44 int 128 regular  }
	{ m1_0_load_45 int 128 regular  }
	{ m1_1_load_45 int 128 regular  }
	{ m1_0_load_46 int 128 regular  }
	{ m1_1_load_46 int 128 regular  }
	{ m1_0_load_47 int 128 regular  }
	{ m1_1_load_47 int 128 regular  }
	{ m1_0_load_48 int 128 regular  }
	{ m1_1_load_48 int 128 regular  }
	{ m1_0_load_49 int 128 regular  }
	{ m1_1_load_49 int 128 regular  }
	{ m1_0_load_50 int 128 regular  }
	{ m1_1_load_50 int 128 regular  }
	{ m1_0_load_51 int 128 regular  }
	{ m1_1_load_51 int 128 regular  }
	{ m1_0_load_52 int 128 regular  }
	{ m1_1_load_52 int 128 regular  }
	{ m1_0_load_53 int 128 regular  }
	{ m1_1_load_53 int 128 regular  }
	{ m1_0_load_54 int 128 regular  }
	{ m1_1_load_54 int 128 regular  }
	{ m1_0_load_55 int 128 regular  }
	{ m1_1_load_55 int 128 regular  }
	{ m1_0_load_56 int 128 regular  }
	{ m1_1_load_56 int 128 regular  }
	{ m1_0_load_57 int 128 regular  }
	{ m1_1_load_57 int 128 regular  }
	{ m1_0_load_58 int 128 regular  }
	{ m1_1_load_58 int 128 regular  }
	{ m1_0_load_59 int 128 regular  }
	{ m1_1_load_59 int 128 regular  }
	{ m1_0_load_60 int 128 regular  }
	{ m1_1_load_60 int 128 regular  }
	{ m1_0_load_61 int 128 regular  }
	{ m1_1_load_61 int 128 regular  }
	{ m1_0_load_62 int 128 regular  }
	{ m1_1_load_62 int 128 regular  }
	{ m1_0_load_63 int 128 regular  }
	{ m1_1_load_63 int 128 regular  }
	{ tmp_258 int 12 regular  }
	{ p_cast int 10 regular  }
	{ trunc_ln17_1 int 11 regular  }
	{ prod_1 int 128 regular {array 1024 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "prod_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} , 
 	{ "Name" : "m1_0_load", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln14_15", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_260", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m2_0", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_1", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_1", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_2", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_2", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_3", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_3", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_4", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_4", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_5", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_5", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_6", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_6", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_7", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_7", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_8", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_8", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_9", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_9", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_10", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_10", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_11", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_11", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_12", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_12", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_13", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_13", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_14", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_14", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_15", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_15", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_16", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_16", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_17", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_17", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_18", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_18", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_19", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_19", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_20", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_20", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_21", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_21", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_22", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_22", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_23", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_23", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_24", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_24", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_25", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_25", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_26", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_26", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_27", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_27", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_28", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_28", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_29", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_29", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_30", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_30", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_31", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_31", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_32", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_32", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m2_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_33", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_33", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_34", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_34", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_35", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_35", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_36", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_36", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_37", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_37", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_38", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_38", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_39", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_39", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_40", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_40", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_41", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_41", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_42", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_42", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_43", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_43", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_44", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_44", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_45", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_45", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_46", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_46", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_47", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_47", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_48", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_48", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_49", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_49", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_50", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_50", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_51", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_51", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_52", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_52", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_53", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_53", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_54", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_54", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_55", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_55", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_56", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_56", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_57", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_57", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_58", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_58", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_59", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_59", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_60", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_60", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_61", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_61", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_62", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_62", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_0_load_63", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "m1_1_load_63", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "tmp_258", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "p_cast", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln17_1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "prod_1", "interface" : "memory", "bitwidth" : 128, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 161
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ prod_0_address0 sc_out sc_lv 10 signal 0 } 
	{ prod_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ prod_0_we0 sc_out sc_logic 1 signal 0 } 
	{ prod_0_d0 sc_out sc_lv 128 signal 0 } 
	{ prod_0_q0 sc_in sc_lv 128 signal 0 } 
	{ m1_0_load sc_in sc_lv 128 signal 1 } 
	{ zext_ln14_15 sc_in sc_lv 7 signal 2 } 
	{ m1_1_load sc_in sc_lv 128 signal 3 } 
	{ tmp_260 sc_in sc_lv 1 signal 4 } 
	{ m2_0_address0 sc_out sc_lv 10 signal 5 } 
	{ m2_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ m2_0_q0 sc_in sc_lv 128 signal 5 } 
	{ m2_0_address1 sc_out sc_lv 10 signal 5 } 
	{ m2_0_ce1 sc_out sc_logic 1 signal 5 } 
	{ m2_0_q1 sc_in sc_lv 128 signal 5 } 
	{ m1_0_load_1 sc_in sc_lv 128 signal 6 } 
	{ m1_1_load_1 sc_in sc_lv 128 signal 7 } 
	{ m1_0_load_2 sc_in sc_lv 128 signal 8 } 
	{ m1_1_load_2 sc_in sc_lv 128 signal 9 } 
	{ m1_0_load_3 sc_in sc_lv 128 signal 10 } 
	{ m1_1_load_3 sc_in sc_lv 128 signal 11 } 
	{ m1_0_load_4 sc_in sc_lv 128 signal 12 } 
	{ m1_1_load_4 sc_in sc_lv 128 signal 13 } 
	{ m1_0_load_5 sc_in sc_lv 128 signal 14 } 
	{ m1_1_load_5 sc_in sc_lv 128 signal 15 } 
	{ m1_0_load_6 sc_in sc_lv 128 signal 16 } 
	{ m1_1_load_6 sc_in sc_lv 128 signal 17 } 
	{ m1_0_load_7 sc_in sc_lv 128 signal 18 } 
	{ m1_1_load_7 sc_in sc_lv 128 signal 19 } 
	{ m1_0_load_8 sc_in sc_lv 128 signal 20 } 
	{ m1_1_load_8 sc_in sc_lv 128 signal 21 } 
	{ m1_0_load_9 sc_in sc_lv 128 signal 22 } 
	{ m1_1_load_9 sc_in sc_lv 128 signal 23 } 
	{ m1_0_load_10 sc_in sc_lv 128 signal 24 } 
	{ m1_1_load_10 sc_in sc_lv 128 signal 25 } 
	{ m1_0_load_11 sc_in sc_lv 128 signal 26 } 
	{ m1_1_load_11 sc_in sc_lv 128 signal 27 } 
	{ m1_0_load_12 sc_in sc_lv 128 signal 28 } 
	{ m1_1_load_12 sc_in sc_lv 128 signal 29 } 
	{ m1_0_load_13 sc_in sc_lv 128 signal 30 } 
	{ m1_1_load_13 sc_in sc_lv 128 signal 31 } 
	{ m1_0_load_14 sc_in sc_lv 128 signal 32 } 
	{ m1_1_load_14 sc_in sc_lv 128 signal 33 } 
	{ m1_0_load_15 sc_in sc_lv 128 signal 34 } 
	{ m1_1_load_15 sc_in sc_lv 128 signal 35 } 
	{ m1_0_load_16 sc_in sc_lv 128 signal 36 } 
	{ m1_1_load_16 sc_in sc_lv 128 signal 37 } 
	{ m1_0_load_17 sc_in sc_lv 128 signal 38 } 
	{ m1_1_load_17 sc_in sc_lv 128 signal 39 } 
	{ m1_0_load_18 sc_in sc_lv 128 signal 40 } 
	{ m1_1_load_18 sc_in sc_lv 128 signal 41 } 
	{ m1_0_load_19 sc_in sc_lv 128 signal 42 } 
	{ m1_1_load_19 sc_in sc_lv 128 signal 43 } 
	{ m1_0_load_20 sc_in sc_lv 128 signal 44 } 
	{ m1_1_load_20 sc_in sc_lv 128 signal 45 } 
	{ m1_0_load_21 sc_in sc_lv 128 signal 46 } 
	{ m1_1_load_21 sc_in sc_lv 128 signal 47 } 
	{ m1_0_load_22 sc_in sc_lv 128 signal 48 } 
	{ m1_1_load_22 sc_in sc_lv 128 signal 49 } 
	{ m1_0_load_23 sc_in sc_lv 128 signal 50 } 
	{ m1_1_load_23 sc_in sc_lv 128 signal 51 } 
	{ m1_0_load_24 sc_in sc_lv 128 signal 52 } 
	{ m1_1_load_24 sc_in sc_lv 128 signal 53 } 
	{ m1_0_load_25 sc_in sc_lv 128 signal 54 } 
	{ m1_1_load_25 sc_in sc_lv 128 signal 55 } 
	{ m1_0_load_26 sc_in sc_lv 128 signal 56 } 
	{ m1_1_load_26 sc_in sc_lv 128 signal 57 } 
	{ m1_0_load_27 sc_in sc_lv 128 signal 58 } 
	{ m1_1_load_27 sc_in sc_lv 128 signal 59 } 
	{ m1_0_load_28 sc_in sc_lv 128 signal 60 } 
	{ m1_1_load_28 sc_in sc_lv 128 signal 61 } 
	{ m1_0_load_29 sc_in sc_lv 128 signal 62 } 
	{ m1_1_load_29 sc_in sc_lv 128 signal 63 } 
	{ m1_0_load_30 sc_in sc_lv 128 signal 64 } 
	{ m1_1_load_30 sc_in sc_lv 128 signal 65 } 
	{ m1_0_load_31 sc_in sc_lv 128 signal 66 } 
	{ m1_1_load_31 sc_in sc_lv 128 signal 67 } 
	{ m1_0_load_32 sc_in sc_lv 128 signal 68 } 
	{ m1_1_load_32 sc_in sc_lv 128 signal 69 } 
	{ m2_1_address0 sc_out sc_lv 10 signal 70 } 
	{ m2_1_ce0 sc_out sc_logic 1 signal 70 } 
	{ m2_1_q0 sc_in sc_lv 128 signal 70 } 
	{ m2_1_address1 sc_out sc_lv 10 signal 70 } 
	{ m2_1_ce1 sc_out sc_logic 1 signal 70 } 
	{ m2_1_q1 sc_in sc_lv 128 signal 70 } 
	{ m1_0_load_33 sc_in sc_lv 128 signal 71 } 
	{ m1_1_load_33 sc_in sc_lv 128 signal 72 } 
	{ m1_0_load_34 sc_in sc_lv 128 signal 73 } 
	{ m1_1_load_34 sc_in sc_lv 128 signal 74 } 
	{ m1_0_load_35 sc_in sc_lv 128 signal 75 } 
	{ m1_1_load_35 sc_in sc_lv 128 signal 76 } 
	{ m1_0_load_36 sc_in sc_lv 128 signal 77 } 
	{ m1_1_load_36 sc_in sc_lv 128 signal 78 } 
	{ m1_0_load_37 sc_in sc_lv 128 signal 79 } 
	{ m1_1_load_37 sc_in sc_lv 128 signal 80 } 
	{ m1_0_load_38 sc_in sc_lv 128 signal 81 } 
	{ m1_1_load_38 sc_in sc_lv 128 signal 82 } 
	{ m1_0_load_39 sc_in sc_lv 128 signal 83 } 
	{ m1_1_load_39 sc_in sc_lv 128 signal 84 } 
	{ m1_0_load_40 sc_in sc_lv 128 signal 85 } 
	{ m1_1_load_40 sc_in sc_lv 128 signal 86 } 
	{ m1_0_load_41 sc_in sc_lv 128 signal 87 } 
	{ m1_1_load_41 sc_in sc_lv 128 signal 88 } 
	{ m1_0_load_42 sc_in sc_lv 128 signal 89 } 
	{ m1_1_load_42 sc_in sc_lv 128 signal 90 } 
	{ m1_0_load_43 sc_in sc_lv 128 signal 91 } 
	{ m1_1_load_43 sc_in sc_lv 128 signal 92 } 
	{ m1_0_load_44 sc_in sc_lv 128 signal 93 } 
	{ m1_1_load_44 sc_in sc_lv 128 signal 94 } 
	{ m1_0_load_45 sc_in sc_lv 128 signal 95 } 
	{ m1_1_load_45 sc_in sc_lv 128 signal 96 } 
	{ m1_0_load_46 sc_in sc_lv 128 signal 97 } 
	{ m1_1_load_46 sc_in sc_lv 128 signal 98 } 
	{ m1_0_load_47 sc_in sc_lv 128 signal 99 } 
	{ m1_1_load_47 sc_in sc_lv 128 signal 100 } 
	{ m1_0_load_48 sc_in sc_lv 128 signal 101 } 
	{ m1_1_load_48 sc_in sc_lv 128 signal 102 } 
	{ m1_0_load_49 sc_in sc_lv 128 signal 103 } 
	{ m1_1_load_49 sc_in sc_lv 128 signal 104 } 
	{ m1_0_load_50 sc_in sc_lv 128 signal 105 } 
	{ m1_1_load_50 sc_in sc_lv 128 signal 106 } 
	{ m1_0_load_51 sc_in sc_lv 128 signal 107 } 
	{ m1_1_load_51 sc_in sc_lv 128 signal 108 } 
	{ m1_0_load_52 sc_in sc_lv 128 signal 109 } 
	{ m1_1_load_52 sc_in sc_lv 128 signal 110 } 
	{ m1_0_load_53 sc_in sc_lv 128 signal 111 } 
	{ m1_1_load_53 sc_in sc_lv 128 signal 112 } 
	{ m1_0_load_54 sc_in sc_lv 128 signal 113 } 
	{ m1_1_load_54 sc_in sc_lv 128 signal 114 } 
	{ m1_0_load_55 sc_in sc_lv 128 signal 115 } 
	{ m1_1_load_55 sc_in sc_lv 128 signal 116 } 
	{ m1_0_load_56 sc_in sc_lv 128 signal 117 } 
	{ m1_1_load_56 sc_in sc_lv 128 signal 118 } 
	{ m1_0_load_57 sc_in sc_lv 128 signal 119 } 
	{ m1_1_load_57 sc_in sc_lv 128 signal 120 } 
	{ m1_0_load_58 sc_in sc_lv 128 signal 121 } 
	{ m1_1_load_58 sc_in sc_lv 128 signal 122 } 
	{ m1_0_load_59 sc_in sc_lv 128 signal 123 } 
	{ m1_1_load_59 sc_in sc_lv 128 signal 124 } 
	{ m1_0_load_60 sc_in sc_lv 128 signal 125 } 
	{ m1_1_load_60 sc_in sc_lv 128 signal 126 } 
	{ m1_0_load_61 sc_in sc_lv 128 signal 127 } 
	{ m1_1_load_61 sc_in sc_lv 128 signal 128 } 
	{ m1_0_load_62 sc_in sc_lv 128 signal 129 } 
	{ m1_1_load_62 sc_in sc_lv 128 signal 130 } 
	{ m1_0_load_63 sc_in sc_lv 128 signal 131 } 
	{ m1_1_load_63 sc_in sc_lv 128 signal 132 } 
	{ tmp_258 sc_in sc_lv 12 signal 133 } 
	{ p_cast sc_in sc_lv 10 signal 134 } 
	{ trunc_ln17_1 sc_in sc_lv 11 signal 135 } 
	{ prod_1_address0 sc_out sc_lv 10 signal 136 } 
	{ prod_1_ce0 sc_out sc_logic 1 signal 136 } 
	{ prod_1_we0 sc_out sc_logic 1 signal 136 } 
	{ prod_1_d0 sc_out sc_lv 128 signal 136 } 
	{ prod_1_q0 sc_in sc_lv 128 signal 136 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "prod_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prod_0", "role": "address0" }} , 
 	{ "name": "prod_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_0", "role": "ce0" }} , 
 	{ "name": "prod_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_0", "role": "we0" }} , 
 	{ "name": "prod_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_0", "role": "d0" }} , 
 	{ "name": "prod_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_0", "role": "q0" }} , 
 	{ "name": "m1_0_load", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load", "role": "default" }} , 
 	{ "name": "zext_ln14_15", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "zext_ln14_15", "role": "default" }} , 
 	{ "name": "m1_1_load", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load", "role": "default" }} , 
 	{ "name": "tmp_260", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tmp_260", "role": "default" }} , 
 	{ "name": "m2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_0", "role": "address0" }} , 
 	{ "name": "m2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_0", "role": "ce0" }} , 
 	{ "name": "m2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_0", "role": "q0" }} , 
 	{ "name": "m2_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_0", "role": "address1" }} , 
 	{ "name": "m2_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_0", "role": "ce1" }} , 
 	{ "name": "m2_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_0", "role": "q1" }} , 
 	{ "name": "m1_0_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_1", "role": "default" }} , 
 	{ "name": "m1_1_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_1", "role": "default" }} , 
 	{ "name": "m1_0_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_2", "role": "default" }} , 
 	{ "name": "m1_1_load_2", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_2", "role": "default" }} , 
 	{ "name": "m1_0_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_3", "role": "default" }} , 
 	{ "name": "m1_1_load_3", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_3", "role": "default" }} , 
 	{ "name": "m1_0_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_4", "role": "default" }} , 
 	{ "name": "m1_1_load_4", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_4", "role": "default" }} , 
 	{ "name": "m1_0_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_5", "role": "default" }} , 
 	{ "name": "m1_1_load_5", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_5", "role": "default" }} , 
 	{ "name": "m1_0_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_6", "role": "default" }} , 
 	{ "name": "m1_1_load_6", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_6", "role": "default" }} , 
 	{ "name": "m1_0_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_7", "role": "default" }} , 
 	{ "name": "m1_1_load_7", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_7", "role": "default" }} , 
 	{ "name": "m1_0_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_8", "role": "default" }} , 
 	{ "name": "m1_1_load_8", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_8", "role": "default" }} , 
 	{ "name": "m1_0_load_9", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_9", "role": "default" }} , 
 	{ "name": "m1_1_load_9", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_9", "role": "default" }} , 
 	{ "name": "m1_0_load_10", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_10", "role": "default" }} , 
 	{ "name": "m1_1_load_10", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_10", "role": "default" }} , 
 	{ "name": "m1_0_load_11", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_11", "role": "default" }} , 
 	{ "name": "m1_1_load_11", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_11", "role": "default" }} , 
 	{ "name": "m1_0_load_12", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_12", "role": "default" }} , 
 	{ "name": "m1_1_load_12", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_12", "role": "default" }} , 
 	{ "name": "m1_0_load_13", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_13", "role": "default" }} , 
 	{ "name": "m1_1_load_13", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_13", "role": "default" }} , 
 	{ "name": "m1_0_load_14", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_14", "role": "default" }} , 
 	{ "name": "m1_1_load_14", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_14", "role": "default" }} , 
 	{ "name": "m1_0_load_15", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_15", "role": "default" }} , 
 	{ "name": "m1_1_load_15", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_15", "role": "default" }} , 
 	{ "name": "m1_0_load_16", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_16", "role": "default" }} , 
 	{ "name": "m1_1_load_16", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_16", "role": "default" }} , 
 	{ "name": "m1_0_load_17", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_17", "role": "default" }} , 
 	{ "name": "m1_1_load_17", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_17", "role": "default" }} , 
 	{ "name": "m1_0_load_18", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_18", "role": "default" }} , 
 	{ "name": "m1_1_load_18", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_18", "role": "default" }} , 
 	{ "name": "m1_0_load_19", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_19", "role": "default" }} , 
 	{ "name": "m1_1_load_19", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_19", "role": "default" }} , 
 	{ "name": "m1_0_load_20", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_20", "role": "default" }} , 
 	{ "name": "m1_1_load_20", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_20", "role": "default" }} , 
 	{ "name": "m1_0_load_21", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_21", "role": "default" }} , 
 	{ "name": "m1_1_load_21", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_21", "role": "default" }} , 
 	{ "name": "m1_0_load_22", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_22", "role": "default" }} , 
 	{ "name": "m1_1_load_22", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_22", "role": "default" }} , 
 	{ "name": "m1_0_load_23", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_23", "role": "default" }} , 
 	{ "name": "m1_1_load_23", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_23", "role": "default" }} , 
 	{ "name": "m1_0_load_24", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_24", "role": "default" }} , 
 	{ "name": "m1_1_load_24", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_24", "role": "default" }} , 
 	{ "name": "m1_0_load_25", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_25", "role": "default" }} , 
 	{ "name": "m1_1_load_25", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_25", "role": "default" }} , 
 	{ "name": "m1_0_load_26", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_26", "role": "default" }} , 
 	{ "name": "m1_1_load_26", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_26", "role": "default" }} , 
 	{ "name": "m1_0_load_27", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_27", "role": "default" }} , 
 	{ "name": "m1_1_load_27", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_27", "role": "default" }} , 
 	{ "name": "m1_0_load_28", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_28", "role": "default" }} , 
 	{ "name": "m1_1_load_28", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_28", "role": "default" }} , 
 	{ "name": "m1_0_load_29", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_29", "role": "default" }} , 
 	{ "name": "m1_1_load_29", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_29", "role": "default" }} , 
 	{ "name": "m1_0_load_30", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_30", "role": "default" }} , 
 	{ "name": "m1_1_load_30", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_30", "role": "default" }} , 
 	{ "name": "m1_0_load_31", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_31", "role": "default" }} , 
 	{ "name": "m1_1_load_31", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_31", "role": "default" }} , 
 	{ "name": "m1_0_load_32", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_32", "role": "default" }} , 
 	{ "name": "m1_1_load_32", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_32", "role": "default" }} , 
 	{ "name": "m2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_1", "role": "address0" }} , 
 	{ "name": "m2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_1", "role": "ce0" }} , 
 	{ "name": "m2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_1", "role": "q0" }} , 
 	{ "name": "m2_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "m2_1", "role": "address1" }} , 
 	{ "name": "m2_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m2_1", "role": "ce1" }} , 
 	{ "name": "m2_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m2_1", "role": "q1" }} , 
 	{ "name": "m1_0_load_33", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_33", "role": "default" }} , 
 	{ "name": "m1_1_load_33", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_33", "role": "default" }} , 
 	{ "name": "m1_0_load_34", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_34", "role": "default" }} , 
 	{ "name": "m1_1_load_34", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_34", "role": "default" }} , 
 	{ "name": "m1_0_load_35", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_35", "role": "default" }} , 
 	{ "name": "m1_1_load_35", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_35", "role": "default" }} , 
 	{ "name": "m1_0_load_36", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_36", "role": "default" }} , 
 	{ "name": "m1_1_load_36", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_36", "role": "default" }} , 
 	{ "name": "m1_0_load_37", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_37", "role": "default" }} , 
 	{ "name": "m1_1_load_37", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_37", "role": "default" }} , 
 	{ "name": "m1_0_load_38", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_38", "role": "default" }} , 
 	{ "name": "m1_1_load_38", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_38", "role": "default" }} , 
 	{ "name": "m1_0_load_39", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_39", "role": "default" }} , 
 	{ "name": "m1_1_load_39", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_39", "role": "default" }} , 
 	{ "name": "m1_0_load_40", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_40", "role": "default" }} , 
 	{ "name": "m1_1_load_40", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_40", "role": "default" }} , 
 	{ "name": "m1_0_load_41", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_41", "role": "default" }} , 
 	{ "name": "m1_1_load_41", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_41", "role": "default" }} , 
 	{ "name": "m1_0_load_42", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_42", "role": "default" }} , 
 	{ "name": "m1_1_load_42", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_42", "role": "default" }} , 
 	{ "name": "m1_0_load_43", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_43", "role": "default" }} , 
 	{ "name": "m1_1_load_43", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_43", "role": "default" }} , 
 	{ "name": "m1_0_load_44", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_44", "role": "default" }} , 
 	{ "name": "m1_1_load_44", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_44", "role": "default" }} , 
 	{ "name": "m1_0_load_45", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_45", "role": "default" }} , 
 	{ "name": "m1_1_load_45", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_45", "role": "default" }} , 
 	{ "name": "m1_0_load_46", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_46", "role": "default" }} , 
 	{ "name": "m1_1_load_46", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_46", "role": "default" }} , 
 	{ "name": "m1_0_load_47", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_47", "role": "default" }} , 
 	{ "name": "m1_1_load_47", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_47", "role": "default" }} , 
 	{ "name": "m1_0_load_48", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_48", "role": "default" }} , 
 	{ "name": "m1_1_load_48", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_48", "role": "default" }} , 
 	{ "name": "m1_0_load_49", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_49", "role": "default" }} , 
 	{ "name": "m1_1_load_49", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_49", "role": "default" }} , 
 	{ "name": "m1_0_load_50", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_50", "role": "default" }} , 
 	{ "name": "m1_1_load_50", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_50", "role": "default" }} , 
 	{ "name": "m1_0_load_51", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_51", "role": "default" }} , 
 	{ "name": "m1_1_load_51", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_51", "role": "default" }} , 
 	{ "name": "m1_0_load_52", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_52", "role": "default" }} , 
 	{ "name": "m1_1_load_52", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_52", "role": "default" }} , 
 	{ "name": "m1_0_load_53", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_53", "role": "default" }} , 
 	{ "name": "m1_1_load_53", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_53", "role": "default" }} , 
 	{ "name": "m1_0_load_54", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_54", "role": "default" }} , 
 	{ "name": "m1_1_load_54", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_54", "role": "default" }} , 
 	{ "name": "m1_0_load_55", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_55", "role": "default" }} , 
 	{ "name": "m1_1_load_55", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_55", "role": "default" }} , 
 	{ "name": "m1_0_load_56", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_56", "role": "default" }} , 
 	{ "name": "m1_1_load_56", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_56", "role": "default" }} , 
 	{ "name": "m1_0_load_57", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_57", "role": "default" }} , 
 	{ "name": "m1_1_load_57", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_57", "role": "default" }} , 
 	{ "name": "m1_0_load_58", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_58", "role": "default" }} , 
 	{ "name": "m1_1_load_58", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_58", "role": "default" }} , 
 	{ "name": "m1_0_load_59", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_59", "role": "default" }} , 
 	{ "name": "m1_1_load_59", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_59", "role": "default" }} , 
 	{ "name": "m1_0_load_60", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_60", "role": "default" }} , 
 	{ "name": "m1_1_load_60", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_60", "role": "default" }} , 
 	{ "name": "m1_0_load_61", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_61", "role": "default" }} , 
 	{ "name": "m1_1_load_61", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_61", "role": "default" }} , 
 	{ "name": "m1_0_load_62", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_62", "role": "default" }} , 
 	{ "name": "m1_1_load_62", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_62", "role": "default" }} , 
 	{ "name": "m1_0_load_63", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_0_load_63", "role": "default" }} , 
 	{ "name": "m1_1_load_63", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "m1_1_load_63", "role": "default" }} , 
 	{ "name": "tmp_258", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "tmp_258", "role": "default" }} , 
 	{ "name": "p_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_cast", "role": "default" }} , 
 	{ "name": "trunc_ln17_1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "trunc_ln17_1", "role": "default" }} , 
 	{ "name": "prod_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "prod_1", "role": "address0" }} , 
 	{ "name": "prod_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_1", "role": "ce0" }} , 
 	{ "name": "prod_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prod_1", "role": "we0" }} , 
 	{ "name": "prod_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_1", "role": "d0" }} , 
 	{ "name": "prod_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "prod_1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dadd_64ns_64ns_64_5_full_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dmul_64ns_64ns_64_5_full_dsp_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U9", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U10", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U11", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U12", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U13", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U14", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U15", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U16", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U17", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U18", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U19", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U20", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U21", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U22", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U23", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U24", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U25", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U26", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U27", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U28", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U29", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U30", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U31", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U32", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U33", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U34", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U35", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U36", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U37", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U38", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U39", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U40", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U41", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U42", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U43", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U44", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U45", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U46", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U47", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U48", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U49", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U50", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U51", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U52", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U53", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U54", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U55", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U56", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U57", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U58", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U59", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U60", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U61", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U62", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U63", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U64", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U65", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U66", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U67", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U68", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U69", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U70", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U71", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_64_1_1_U72", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "1344", "Max" : "1344"}
	, {"Name" : "Interval", "Min" : "1344", "Max" : "1344"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	prod_0 { ap_memory {  { prod_0_address0 mem_address 1 10 }  { prod_0_ce0 mem_ce 1 1 }  { prod_0_we0 mem_we 1 1 }  { prod_0_d0 mem_din 1 128 }  { prod_0_q0 mem_dout 0 128 } } }
	m1_0_load { ap_none {  { m1_0_load in_data 0 128 } } }
	zext_ln14_15 { ap_none {  { zext_ln14_15 in_data 0 7 } } }
	m1_1_load { ap_none {  { m1_1_load in_data 0 128 } } }
	tmp_260 { ap_none {  { tmp_260 in_data 0 1 } } }
	m2_0 { ap_memory {  { m2_0_address0 mem_address 1 10 }  { m2_0_ce0 mem_ce 1 1 }  { m2_0_q0 in_data 0 128 }  { m2_0_address1 MemPortADDR2 1 10 }  { m2_0_ce1 MemPortCE2 1 1 }  { m2_0_q1 in_data 0 128 } } }
	m1_0_load_1 { ap_none {  { m1_0_load_1 in_data 0 128 } } }
	m1_1_load_1 { ap_none {  { m1_1_load_1 in_data 0 128 } } }
	m1_0_load_2 { ap_none {  { m1_0_load_2 in_data 0 128 } } }
	m1_1_load_2 { ap_none {  { m1_1_load_2 in_data 0 128 } } }
	m1_0_load_3 { ap_none {  { m1_0_load_3 in_data 0 128 } } }
	m1_1_load_3 { ap_none {  { m1_1_load_3 in_data 0 128 } } }
	m1_0_load_4 { ap_none {  { m1_0_load_4 in_data 0 128 } } }
	m1_1_load_4 { ap_none {  { m1_1_load_4 in_data 0 128 } } }
	m1_0_load_5 { ap_none {  { m1_0_load_5 in_data 0 128 } } }
	m1_1_load_5 { ap_none {  { m1_1_load_5 in_data 0 128 } } }
	m1_0_load_6 { ap_none {  { m1_0_load_6 in_data 0 128 } } }
	m1_1_load_6 { ap_none {  { m1_1_load_6 in_data 0 128 } } }
	m1_0_load_7 { ap_none {  { m1_0_load_7 in_data 0 128 } } }
	m1_1_load_7 { ap_none {  { m1_1_load_7 in_data 0 128 } } }
	m1_0_load_8 { ap_none {  { m1_0_load_8 in_data 0 128 } } }
	m1_1_load_8 { ap_none {  { m1_1_load_8 in_data 0 128 } } }
	m1_0_load_9 { ap_none {  { m1_0_load_9 in_data 0 128 } } }
	m1_1_load_9 { ap_none {  { m1_1_load_9 in_data 0 128 } } }
	m1_0_load_10 { ap_none {  { m1_0_load_10 in_data 0 128 } } }
	m1_1_load_10 { ap_none {  { m1_1_load_10 in_data 0 128 } } }
	m1_0_load_11 { ap_none {  { m1_0_load_11 in_data 0 128 } } }
	m1_1_load_11 { ap_none {  { m1_1_load_11 in_data 0 128 } } }
	m1_0_load_12 { ap_none {  { m1_0_load_12 in_data 0 128 } } }
	m1_1_load_12 { ap_none {  { m1_1_load_12 in_data 0 128 } } }
	m1_0_load_13 { ap_none {  { m1_0_load_13 in_data 0 128 } } }
	m1_1_load_13 { ap_none {  { m1_1_load_13 in_data 0 128 } } }
	m1_0_load_14 { ap_none {  { m1_0_load_14 in_data 0 128 } } }
	m1_1_load_14 { ap_none {  { m1_1_load_14 in_data 0 128 } } }
	m1_0_load_15 { ap_none {  { m1_0_load_15 in_data 0 128 } } }
	m1_1_load_15 { ap_none {  { m1_1_load_15 in_data 0 128 } } }
	m1_0_load_16 { ap_none {  { m1_0_load_16 in_data 0 128 } } }
	m1_1_load_16 { ap_none {  { m1_1_load_16 in_data 0 128 } } }
	m1_0_load_17 { ap_none {  { m1_0_load_17 in_data 0 128 } } }
	m1_1_load_17 { ap_none {  { m1_1_load_17 in_data 0 128 } } }
	m1_0_load_18 { ap_none {  { m1_0_load_18 in_data 0 128 } } }
	m1_1_load_18 { ap_none {  { m1_1_load_18 in_data 0 128 } } }
	m1_0_load_19 { ap_none {  { m1_0_load_19 in_data 0 128 } } }
	m1_1_load_19 { ap_none {  { m1_1_load_19 in_data 0 128 } } }
	m1_0_load_20 { ap_none {  { m1_0_load_20 in_data 0 128 } } }
	m1_1_load_20 { ap_none {  { m1_1_load_20 in_data 0 128 } } }
	m1_0_load_21 { ap_none {  { m1_0_load_21 in_data 0 128 } } }
	m1_1_load_21 { ap_none {  { m1_1_load_21 in_data 0 128 } } }
	m1_0_load_22 { ap_none {  { m1_0_load_22 in_data 0 128 } } }
	m1_1_load_22 { ap_none {  { m1_1_load_22 in_data 0 128 } } }
	m1_0_load_23 { ap_none {  { m1_0_load_23 in_data 0 128 } } }
	m1_1_load_23 { ap_none {  { m1_1_load_23 in_data 0 128 } } }
	m1_0_load_24 { ap_none {  { m1_0_load_24 in_data 0 128 } } }
	m1_1_load_24 { ap_none {  { m1_1_load_24 in_data 0 128 } } }
	m1_0_load_25 { ap_none {  { m1_0_load_25 in_data 0 128 } } }
	m1_1_load_25 { ap_none {  { m1_1_load_25 in_data 0 128 } } }
	m1_0_load_26 { ap_none {  { m1_0_load_26 in_data 0 128 } } }
	m1_1_load_26 { ap_none {  { m1_1_load_26 in_data 0 128 } } }
	m1_0_load_27 { ap_none {  { m1_0_load_27 in_data 0 128 } } }
	m1_1_load_27 { ap_none {  { m1_1_load_27 in_data 0 128 } } }
	m1_0_load_28 { ap_none {  { m1_0_load_28 in_data 0 128 } } }
	m1_1_load_28 { ap_none {  { m1_1_load_28 in_data 0 128 } } }
	m1_0_load_29 { ap_none {  { m1_0_load_29 in_data 0 128 } } }
	m1_1_load_29 { ap_none {  { m1_1_load_29 in_data 0 128 } } }
	m1_0_load_30 { ap_none {  { m1_0_load_30 in_data 0 128 } } }
	m1_1_load_30 { ap_none {  { m1_1_load_30 in_data 0 128 } } }
	m1_0_load_31 { ap_none {  { m1_0_load_31 in_data 0 128 } } }
	m1_1_load_31 { ap_none {  { m1_1_load_31 in_data 0 128 } } }
	m1_0_load_32 { ap_none {  { m1_0_load_32 in_data 0 128 } } }
	m1_1_load_32 { ap_none {  { m1_1_load_32 in_data 0 128 } } }
	m2_1 { ap_memory {  { m2_1_address0 mem_address 1 10 }  { m2_1_ce0 mem_ce 1 1 }  { m2_1_q0 in_data 0 128 }  { m2_1_address1 MemPortADDR2 1 10 }  { m2_1_ce1 MemPortCE2 1 1 }  { m2_1_q1 in_data 0 128 } } }
	m1_0_load_33 { ap_none {  { m1_0_load_33 in_data 0 128 } } }
	m1_1_load_33 { ap_none {  { m1_1_load_33 in_data 0 128 } } }
	m1_0_load_34 { ap_none {  { m1_0_load_34 in_data 0 128 } } }
	m1_1_load_34 { ap_none {  { m1_1_load_34 in_data 0 128 } } }
	m1_0_load_35 { ap_none {  { m1_0_load_35 in_data 0 128 } } }
	m1_1_load_35 { ap_none {  { m1_1_load_35 in_data 0 128 } } }
	m1_0_load_36 { ap_none {  { m1_0_load_36 in_data 0 128 } } }
	m1_1_load_36 { ap_none {  { m1_1_load_36 in_data 0 128 } } }
	m1_0_load_37 { ap_none {  { m1_0_load_37 in_data 0 128 } } }
	m1_1_load_37 { ap_none {  { m1_1_load_37 in_data 0 128 } } }
	m1_0_load_38 { ap_none {  { m1_0_load_38 in_data 0 128 } } }
	m1_1_load_38 { ap_none {  { m1_1_load_38 in_data 0 128 } } }
	m1_0_load_39 { ap_none {  { m1_0_load_39 in_data 0 128 } } }
	m1_1_load_39 { ap_none {  { m1_1_load_39 in_data 0 128 } } }
	m1_0_load_40 { ap_none {  { m1_0_load_40 in_data 0 128 } } }
	m1_1_load_40 { ap_none {  { m1_1_load_40 in_data 0 128 } } }
	m1_0_load_41 { ap_none {  { m1_0_load_41 in_data 0 128 } } }
	m1_1_load_41 { ap_none {  { m1_1_load_41 in_data 0 128 } } }
	m1_0_load_42 { ap_none {  { m1_0_load_42 in_data 0 128 } } }
	m1_1_load_42 { ap_none {  { m1_1_load_42 in_data 0 128 } } }
	m1_0_load_43 { ap_none {  { m1_0_load_43 in_data 0 128 } } }
	m1_1_load_43 { ap_none {  { m1_1_load_43 in_data 0 128 } } }
	m1_0_load_44 { ap_none {  { m1_0_load_44 in_data 0 128 } } }
	m1_1_load_44 { ap_none {  { m1_1_load_44 in_data 0 128 } } }
	m1_0_load_45 { ap_none {  { m1_0_load_45 in_data 0 128 } } }
	m1_1_load_45 { ap_none {  { m1_1_load_45 in_data 0 128 } } }
	m1_0_load_46 { ap_none {  { m1_0_load_46 in_data 0 128 } } }
	m1_1_load_46 { ap_none {  { m1_1_load_46 in_data 0 128 } } }
	m1_0_load_47 { ap_none {  { m1_0_load_47 in_data 0 128 } } }
	m1_1_load_47 { ap_none {  { m1_1_load_47 in_data 0 128 } } }
	m1_0_load_48 { ap_none {  { m1_0_load_48 in_data 0 128 } } }
	m1_1_load_48 { ap_none {  { m1_1_load_48 in_data 0 128 } } }
	m1_0_load_49 { ap_none {  { m1_0_load_49 in_data 0 128 } } }
	m1_1_load_49 { ap_none {  { m1_1_load_49 in_data 0 128 } } }
	m1_0_load_50 { ap_none {  { m1_0_load_50 in_data 0 128 } } }
	m1_1_load_50 { ap_none {  { m1_1_load_50 in_data 0 128 } } }
	m1_0_load_51 { ap_none {  { m1_0_load_51 in_data 0 128 } } }
	m1_1_load_51 { ap_none {  { m1_1_load_51 in_data 0 128 } } }
	m1_0_load_52 { ap_none {  { m1_0_load_52 in_data 0 128 } } }
	m1_1_load_52 { ap_none {  { m1_1_load_52 in_data 0 128 } } }
	m1_0_load_53 { ap_none {  { m1_0_load_53 in_data 0 128 } } }
	m1_1_load_53 { ap_none {  { m1_1_load_53 in_data 0 128 } } }
	m1_0_load_54 { ap_none {  { m1_0_load_54 in_data 0 128 } } }
	m1_1_load_54 { ap_none {  { m1_1_load_54 in_data 0 128 } } }
	m1_0_load_55 { ap_none {  { m1_0_load_55 in_data 0 128 } } }
	m1_1_load_55 { ap_none {  { m1_1_load_55 in_data 0 128 } } }
	m1_0_load_56 { ap_none {  { m1_0_load_56 in_data 0 128 } } }
	m1_1_load_56 { ap_none {  { m1_1_load_56 in_data 0 128 } } }
	m1_0_load_57 { ap_none {  { m1_0_load_57 in_data 0 128 } } }
	m1_1_load_57 { ap_none {  { m1_1_load_57 in_data 0 128 } } }
	m1_0_load_58 { ap_none {  { m1_0_load_58 in_data 0 128 } } }
	m1_1_load_58 { ap_none {  { m1_1_load_58 in_data 0 128 } } }
	m1_0_load_59 { ap_none {  { m1_0_load_59 in_data 0 128 } } }
	m1_1_load_59 { ap_none {  { m1_1_load_59 in_data 0 128 } } }
	m1_0_load_60 { ap_none {  { m1_0_load_60 in_data 0 128 } } }
	m1_1_load_60 { ap_none {  { m1_1_load_60 in_data 0 128 } } }
	m1_0_load_61 { ap_none {  { m1_0_load_61 in_data 0 128 } } }
	m1_1_load_61 { ap_none {  { m1_1_load_61 in_data 0 128 } } }
	m1_0_load_62 { ap_none {  { m1_0_load_62 in_data 0 128 } } }
	m1_1_load_62 { ap_none {  { m1_1_load_62 in_data 0 128 } } }
	m1_0_load_63 { ap_none {  { m1_0_load_63 in_data 0 128 } } }
	m1_1_load_63 { ap_none {  { m1_1_load_63 in_data 0 128 } } }
	tmp_258 { ap_none {  { tmp_258 in_data 0 12 } } }
	p_cast { ap_none {  { p_cast in_data 0 10 } } }
	trunc_ln17_1 { ap_none {  { trunc_ln17_1 in_data 0 11 } } }
	prod_1 { ap_memory {  { prod_1_address0 mem_address 1 10 }  { prod_1_ce0 mem_ce 1 1 }  { prod_1_we0 mem_we 1 1 }  { prod_1_d0 mem_din 1 128 }  { prod_1_q0 mem_dout 0 128 } } }
}
