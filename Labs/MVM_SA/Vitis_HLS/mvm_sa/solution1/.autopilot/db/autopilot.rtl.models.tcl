set SynModuleInfo {
  {SRCNAME mvm_sa_Pipeline_read_x_loop MODELNAME mvm_sa_Pipeline_read_x_loop RTLNAME mvm_sa_mvm_sa_Pipeline_read_x_loop
    SUBMODULES {
      {MODELNAME mvm_sa_mux_42_32_1_1 RTLNAME mvm_sa_mux_42_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mvm_sa_mul_32s_32s_32_2_1 RTLNAME mvm_sa_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME mvm_sa_flow_control_loop_pipe_sequential_init RTLNAME mvm_sa_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mvm_sa_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mvm_sa_Pipeline_write_y_loop MODELNAME mvm_sa_Pipeline_write_y_loop RTLNAME mvm_sa_mvm_sa_Pipeline_write_y_loop}
  {SRCNAME mvm_sa_Pipeline_load_A_loop MODELNAME mvm_sa_Pipeline_load_A_loop RTLNAME mvm_sa_mvm_sa_Pipeline_load_A_loop}
  {SRCNAME mvm_sa MODELNAME mvm_sa RTLNAME mvm_sa IS_TOP 1
    SUBMODULES {
      {MODELNAME mvm_sa_regslice_both RTLNAME mvm_sa_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME mvm_sa_regslice_both_U}
    }
  }
}
