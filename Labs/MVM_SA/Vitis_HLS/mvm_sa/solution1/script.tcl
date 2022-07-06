############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mvm_sa
set_top mvm_sa
add_files mvm_sa.hpp
add_files mvm_sa.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./mvm_sa/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
