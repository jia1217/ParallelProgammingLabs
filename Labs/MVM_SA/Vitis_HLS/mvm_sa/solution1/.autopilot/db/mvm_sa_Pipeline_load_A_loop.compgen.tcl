# This script segment is generated automatically by AutoPilot

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
    id 26 \
    name A_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {A_stream} \
    metadata {  } \
    op interface \
    ports { A_stream_TVALID { I 1 bit } A_stream_TDATA { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 27 \
    name A_stream_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {A_stream} \
    metadata {  } \
    op interface \
    ports { A_stream_TKEEP { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 28 \
    name A_stream_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {A_stream} \
    metadata {  } \
    op interface \
    ports { A_stream_TSTRB { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 29 \
    name A_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {A_stream} \
    metadata {  } \
    op interface \
    ports { A_stream_TREADY { O 1 bit } A_stream_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'A_stream_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0 { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11 { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22 { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 \
    op interface \
    ports { mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33 { O 32 vector } mvm_sa_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_stream_axis_int_0ul_0ul_0ul_0_A_local_33_ap_vld { O 1 bit } } \
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


