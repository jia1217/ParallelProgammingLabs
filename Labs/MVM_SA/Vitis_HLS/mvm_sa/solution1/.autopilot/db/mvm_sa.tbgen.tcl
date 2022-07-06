set moduleName mvm_sa
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mvm_sa}
set C_modelType { void 0 }
set C_modelArgList {
	{ A_stream_V_data_V int 32 regular {axi_s 0 volatile  { A_stream Data } }  }
	{ A_stream_V_keep_V int 4 regular {axi_s 0 volatile  { A_stream Keep } }  }
	{ A_stream_V_strb_V int 4 regular {axi_s 0 volatile  { A_stream Strb } }  }
	{ A_stream_V_last_V int 1 regular {axi_s 0 volatile  { A_stream Last } }  }
	{ x_stream_V_data_V int 32 regular {axi_s 0 volatile  { x_stream Data } }  }
	{ x_stream_V_keep_V int 4 regular {axi_s 0 volatile  { x_stream Keep } }  }
	{ x_stream_V_strb_V int 4 regular {axi_s 0 volatile  { x_stream Strb } }  }
	{ x_stream_V_last_V int 1 regular {axi_s 0 volatile  { x_stream Last } }  }
	{ y_stream_V_data_V int 32 regular {axi_s 1 volatile  { y_stream Data } }  }
	{ y_stream_V_keep_V int 4 regular {axi_s 1 volatile  { y_stream Keep } }  }
	{ y_stream_V_strb_V int 4 regular {axi_s 1 volatile  { y_stream Strb } }  }
	{ y_stream_V_last_V int 1 regular {axi_s 1 volatile  { y_stream Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ A_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ A_stream_TVALID sc_in sc_logic 1 invld 3 } 
	{ A_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ A_stream_TKEEP sc_in sc_lv 4 signal 1 } 
	{ A_stream_TSTRB sc_in sc_lv 4 signal 2 } 
	{ A_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ x_stream_TDATA sc_in sc_lv 32 signal 4 } 
	{ x_stream_TVALID sc_in sc_logic 1 invld 7 } 
	{ x_stream_TREADY sc_out sc_logic 1 inacc 7 } 
	{ x_stream_TKEEP sc_in sc_lv 4 signal 5 } 
	{ x_stream_TSTRB sc_in sc_lv 4 signal 6 } 
	{ x_stream_TLAST sc_in sc_lv 1 signal 7 } 
	{ y_stream_TDATA sc_out sc_lv 32 signal 8 } 
	{ y_stream_TVALID sc_out sc_logic 1 outvld 11 } 
	{ y_stream_TREADY sc_in sc_logic 1 outacc 11 } 
	{ y_stream_TKEEP sc_out sc_lv 4 signal 9 } 
	{ y_stream_TSTRB sc_out sc_lv 4 signal 10 } 
	{ y_stream_TLAST sc_out sc_lv 1 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "A_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_stream_V_data_V", "role": "default" }} , 
 	{ "name": "A_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "A_stream_V_last_V", "role": "default" }} , 
 	{ "name": "A_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "A_stream_V_last_V", "role": "default" }} , 
 	{ "name": "A_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "A_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "A_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "A_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "A_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "A_stream_V_last_V", "role": "default" }} , 
 	{ "name": "x_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x_stream_V_data_V", "role": "default" }} , 
 	{ "name": "x_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "x_stream_V_last_V", "role": "default" }} , 
 	{ "name": "x_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "x_stream_V_last_V", "role": "default" }} , 
 	{ "name": "x_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "x_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "x_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "x_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x_stream_V_last_V", "role": "default" }} , 
 	{ "name": "y_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y_stream_V_data_V", "role": "default" }} , 
 	{ "name": "y_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "y_stream_V_last_V", "role": "default" }} , 
 	{ "name": "y_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "y_stream_V_last_V", "role": "default" }} , 
 	{ "name": "y_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "y_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "y_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "y_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "y_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y_stream_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "5", "7", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"],
		"CDFG" : "mvm_sa",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "20", "EstimateLatencyMax" : "21",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A_stream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "A_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "A_stream_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "A_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "A_stream_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "A_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "A_stream_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "A_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "7"}]},
			{"Name" : "x_stream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "x_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "x_stream_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "x_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "x_stream_V_strb_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "x_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "x_stream_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "x_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "y_stream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "y_stream_V_data_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "y_stream_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "y_stream_V_keep_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "y_stream_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "y_stream_V_strb_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "y_stream_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "y_stream_V_last_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "Inst_start_state" : "2", "Inst_end_state" : "7"},
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "Inst_start_state" : "2", "Inst_end_state" : "7"},
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "Inst_start_state" : "2", "Inst_end_state" : "7"},
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "Inst_start_state" : "2", "Inst_end_state" : "7"},
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "7", "SubInstance" : "grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Port" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_read_x_loop_fu_84", "Parent" : "0", "Child" : ["2", "3", "4"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_read_x_loop_fu_84.mux_42_32_1_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_read_x_loop_fu_84.mul_32s_32s_32_2_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_read_x_loop_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_load_A_loop_fu_112", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "mvm_sa_Pipeline_load_A_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "18",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A_stream_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "A_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "A_stream_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "A_stream_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "A_stream_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "load_A_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_load_A_loop_fu_112.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_write_y_loop_fu_132", "Parent" : "0", "Child" : ["8", "9"],
		"CDFG" : "mvm_sa_Pipeline_write_y_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "y_stream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "y_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "y_stream_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "y_stream_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "y_stream_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "write_y_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_write_y_loop_fu_132.mux_42_32_1_1_U17", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mvm_sa_Pipeline_write_y_loop_fu_132.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_A_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_A_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_A_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_A_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mvm_sa {
		A_stream_V_data_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_keep_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_strb_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_last_V {Type I LastRead 1 FirstWrite -1}
		x_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		x_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		y_stream_V_data_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_keep_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_strb_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_last_V {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 {Type IO LastRead -1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 {Type IO LastRead -1 FirstWrite -1}}
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
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 {Type IO LastRead 0 FirstWrite 0}}
	mvm_sa_Pipeline_load_A_loop {
		A_stream_V_data_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_keep_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_strb_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_last_V {Type I LastRead 1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 {Type O LastRead -1 FirstWrite 1}}
	mvm_sa_Pipeline_write_y_loop {
		y_stream_V_data_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_keep_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_strb_V {Type O LastRead -1 FirstWrite 1}
		y_stream_V_last_V {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc {Type I LastRead 1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 {Type I LastRead 1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 {Type I LastRead 1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "20", "Max" : "21"}
	, {"Name" : "Interval", "Min" : "21", "Max" : "22"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A_stream_V_data_V { axis {  { A_stream_TDATA in_data 0 32 } } }
	A_stream_V_keep_V { axis {  { A_stream_TKEEP in_data 0 4 } } }
	A_stream_V_strb_V { axis {  { A_stream_TSTRB in_data 0 4 } } }
	A_stream_V_last_V { axis {  { A_stream_TVALID in_vld 0 1 }  { A_stream_TREADY in_acc 1 1 }  { A_stream_TLAST in_data 0 1 } } }
	x_stream_V_data_V { axis {  { x_stream_TDATA in_data 0 32 } } }
	x_stream_V_keep_V { axis {  { x_stream_TKEEP in_data 0 4 } } }
	x_stream_V_strb_V { axis {  { x_stream_TSTRB in_data 0 4 } } }
	x_stream_V_last_V { axis {  { x_stream_TVALID in_vld 0 1 }  { x_stream_TREADY in_acc 1 1 }  { x_stream_TLAST in_data 0 1 } } }
	y_stream_V_data_V { axis {  { y_stream_TDATA out_data 1 32 } } }
	y_stream_V_keep_V { axis {  { y_stream_TKEEP out_data 1 4 } } }
	y_stream_V_strb_V { axis {  { y_stream_TSTRB out_data 1 4 } } }
	y_stream_V_last_V { axis {  { y_stream_TVALID out_vld 1 1 }  { y_stream_TREADY out_acc 0 1 }  { y_stream_TLAST out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

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
