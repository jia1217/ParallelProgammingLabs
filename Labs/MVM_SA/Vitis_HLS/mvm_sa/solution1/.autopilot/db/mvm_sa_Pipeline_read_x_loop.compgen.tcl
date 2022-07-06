# This script segment is generated automatically by AutoPilot

set id 1
set name mvm_sa_mux_42_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 32
set din3_signed 0
set din4_width 2
set din4_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


set name mvm_sa_mul_32s_32s_32_2_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 5 \
    name x_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {x_stream} \
    metadata {  } \
    op interface \
    ports { x_stream_TVALID { I 1 bit } x_stream_TDATA { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 6 \
    name x_stream_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {x_stream} \
    metadata {  } \
    op interface \
    ports { x_stream_TKEEP { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 7 \
    name x_stream_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {x_stream} \
    metadata {  } \
    op interface \
    ports { x_stream_TSTRB { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 8 \
    name x_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {x_stream} \
    metadata {  } \
    op interface \
    ports { x_stream_TREADY { O 1 bit } x_stream_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'x_stream_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_i { I 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_i { I 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_i { I 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_i { I 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_acc_3_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName mvm_sa_flow_control_loop_pipe_sequential_init_U
set CompName mvm_sa_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix mvm_sa_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


