set moduleName mvm_sa_Pipeline_load_A_loop
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
set C_modelName {mvm_sa_Pipeline_load_A_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ A_stream_V_data_V int 32 regular {axi_s 0 volatile  { A_stream Data } }  }
	{ A_stream_V_keep_V int 4 regular {axi_s 0 volatile  { A_stream Keep } }  }
	{ A_stream_V_strb_V int 4 regular {axi_s 0 volatile  { A_stream Strb } }  }
	{ A_stream_V_last_V int 1 regular {axi_s 0 volatile  { A_stream Last } }  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 int 32 regular {pointer 1} {global 1}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 int 32 regular {pointer 1} {global 1}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 int 32 regular {pointer 1} {global 1}  }
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 int 32 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "A_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_stream_TVALID sc_in sc_logic 1 invld 0 } 
	{ A_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ A_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ A_stream_TKEEP sc_in sc_lv 4 signal 1 } 
	{ A_stream_TSTRB sc_in sc_lv 4 signal 2 } 
	{ A_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 sc_out sc_lv 32 signal 4 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 sc_out sc_lv 32 signal 5 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 sc_out sc_lv 32 signal 6 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 sc_out sc_lv 32 signal 7 } 
	{ mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "A_stream_V_data_V", "role": "default" }} , 
 	{ "name": "A_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_stream_V_data_V", "role": "default" }} , 
 	{ "name": "A_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "A_stream_V_last_V", "role": "default" }} , 
 	{ "name": "A_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "A_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "A_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "A_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "A_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "A_stream_V_last_V", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0", "role": "ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11", "role": "ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22", "role": "ap_vld" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "role": "default" }} , 
 	{ "name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mvm_sa_Pipeline_load_A_loop {
		A_stream_V_data_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_keep_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_strb_V {Type I LastRead 1 FirstWrite -1}
		A_stream_V_last_V {Type I LastRead 1 FirstWrite -1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 {Type O LastRead -1 FirstWrite 1}
		mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "18", "Max" : "18"}
	, {"Name" : "Interval", "Min" : "18", "Max" : "18"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	A_stream_V_data_V { axis {  { A_stream_TVALID in_vld 0 1 }  { A_stream_TDATA in_data 0 32 } } }
	A_stream_V_keep_V { axis {  { A_stream_TKEEP in_data 0 4 } } }
	A_stream_V_strb_V { axis {  { A_stream_TSTRB in_data 0 4 } } }
	A_stream_V_last_V { axis {  { A_stream_TREADY in_acc 1 1 }  { A_stream_TLAST in_data 0 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 { ap_vld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 { ap_vld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 { ap_vld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22_ap_vld out_vld 1 1 } } }
	mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 { ap_vld {  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 out_data 1 32 }  { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33_ap_vld out_vld 1 1 } } }
}
