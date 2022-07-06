set moduleName mvm_sa_Pipeline_read_x_loop
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
set C_modelName {mvm_sa_Pipeline_read_x_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ x_stream_V_data_V int 32 regular {axi_s 0 volatile  { x_stream Data } }  }
	{ x_stream_V_keep_V int 4 regular {axi_s 0 volatile  { x_stream Keep } }  }
	{ x_stream_V_strb_V int 4 regular {axi_s 0 volatile  { x_stream Strb } }  }
	{ x_stream_V_last_V int 1 regular {axi_s 0 volatile  { x_stream Last } }  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc int 32 regular {pointer 2} {global 2}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 int 32 regular {pointer 0} {global 0}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 int 32 regular {pointer 0} {global 0}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 int 32 regular {pointer 0} {global 0}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 int 32 regular {pointer 0} {global 0}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 int 32 regular {pointer 2} {global 2}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 int 32 regular {pointer 2} {global 2}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 int 32 regular {pointer 2} {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x_stream_TVALID sc_in sc_logic 1 invld 0 } 
	{ x_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ x_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ x_stream_TKEEP sc_in sc_lv 4 signal 1 } 
	{ x_stream_TSTRB sc_in sc_lv 4 signal 2 } 
	{ x_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_i sc_in sc_lv 32 signal 4 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o sc_out sc_lv 32 signal 4 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 sc_in sc_lv 32 signal 5 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 sc_in sc_lv 32 signal 6 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 sc_in sc_lv 32 signal 7 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 sc_in sc_lv 32 signal 8 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_i sc_in sc_lv 32 signal 9 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o sc_out sc_lv 32 signal 9 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_i sc_in sc_lv 32 signal 10 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o sc_out sc_lv 32 signal 10 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_i sc_in sc_lv 32 signal 11 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o sc_out sc_lv 32 signal 11 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "x_stream_V_data_V", "role": "default" }} , 
 	{ "name": "x_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_stream_V_data_V", "role": "default" }} , 
 	{ "name": "x_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "x_stream_V_last_V", "role": "default" }} , 
 	{ "name": "x_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "x_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "x_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_stream_V_last_V", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "role": "i" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "role": "o" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "role": "o_ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "role": "i" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "role": "o" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "role": "o_ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "role": "i" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "role": "o" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "role": "o_ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "role": "i" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "role": "o" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "role": "o_ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "mvm_sa_Pipeline_read_x_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x_stream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "x_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "x_stream_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "x_stream_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "x_stream_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "Type" : "OVld", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "read_x_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_32_1_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mvm_sa_Pipeline_read_x_loop {
		x_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc {Type IO LastRead 3 FirstWrite 3}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 {Type I LastRead 0 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 {Type I LastRead 0 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 {Type I LastRead 0 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 {Type I LastRead 0 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 {Type IO LastRead 0 FirstWrite 0}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 {Type IO LastRead 0 FirstWrite 0}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 {Type IO LastRead 0 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8", "Max" : "8"}
	, {"Name" : "Interval", "Min" : "8", "Max" : "8"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	x_stream_V_data_V { axis {  { x_stream_TVALID in_vld 0 1 }  { x_stream_TDATA in_data 0 32 } } }
	x_stream_V_keep_V { axis {  { x_stream_TKEEP in_data 0 4 } } }
	x_stream_V_strb_V { axis {  { x_stream_TSTRB in_data 0 4 } } }
	x_stream_V_last_V { axis {  { x_stream_TREADY in_acc 1 1 }  { x_stream_TLAST in_data 0 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc { ap_ovld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_i in_data 0 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 { ap_none {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 in_data 0 32 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 { ap_none {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 in_data 0 32 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 { ap_none {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 in_data 0 32 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 { ap_none {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 in_data 0 32 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 { ap_ovld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_i in_data 0 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 { ap_ovld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_i in_data 0 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 { ap_ovld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_i in_data 0 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o_ap_vld out_vld 1 1 } } }
}
