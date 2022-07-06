set moduleName mvm_sa
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mvm_sa}
set C_modelType { void 0 }
set C_modelArgList {
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
	{ "Name" : "x_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "x_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "y_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "y_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ x_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ x_stream_TVALID sc_in sc_logic 1 invld 3 } 
	{ x_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ x_stream_TKEEP sc_in sc_lv 4 signal 1 } 
	{ x_stream_TSTRB sc_in sc_lv 4 signal 2 } 
	{ x_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ y_stream_TDATA sc_out sc_lv 32 signal 4 } 
	{ y_stream_TVALID sc_out sc_logic 1 outvld 7 } 
	{ y_stream_TREADY sc_in sc_logic 1 outacc 7 } 
	{ y_stream_TKEEP sc_out sc_lv 4 signal 5 } 
	{ y_stream_TSTRB sc_out sc_lv 4 signal 6 } 
	{ y_stream_TLAST sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "mvm_sa",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "4",
		"VariableLatency" : "0", "ExactLatency" : "7", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
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
			{"Name" : "y_stream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "y_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "y_stream_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "y_stream_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "y_stream_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_x_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_y_stream_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mvm_sa {
		x_stream_V_data_V {Type I LastRead 3 FirstWrite -1}
		x_stream_V_keep_V {Type I LastRead 3 FirstWrite -1}
		x_stream_V_strb_V {Type I LastRead 3 FirstWrite -1}
		x_stream_V_last_V {Type I LastRead 3 FirstWrite -1}
		y_stream_V_data_V {Type O LastRead -1 FirstWrite 3}
		y_stream_V_keep_V {Type O LastRead -1 FirstWrite 3}
		y_stream_V_strb_V {Type O LastRead -1 FirstWrite 3}
		y_stream_V_last_V {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
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
