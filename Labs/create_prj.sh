#!/bin/bash

PRJ_NAME=$1

echo "Create a project named as '${PRJ_NAME}'"

mkdir ${PRJ_NAME}

mkdir ${PRJ_NAME}/Vitis_HLS
mkdir ${PRJ_NAME}/Vitis_HLS/srcs
mkdir ${PRJ_NAME}/Vitis_HLS/IP

echo ".PHONY: all clean" > ${PRJ_NAME}/Vitis_HLS/Makefile
echo "" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo "all:" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo -e "\t-@vitis_hls -f ${PRJ_NAME}_prj.tcl" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo "" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo "clean:" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo -e "\t-@rm -rf ${PRJ_NAME}" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo -e "\t-@rm -rf IP/*" >> ${PRJ_NAME}/Vitis_HLS/Makefile
echo -e "\t-@rm -f *.log" >> ${PRJ_NAME}/Vitis_HLS/Makefile

echo "# create project" > ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "open_project -reset ${PRJ_NAME}" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "# set top function" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "set_top ${PRJ_NAME}" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "# add files" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "add_files ./srcs/${PRJ_NAME}.cpp" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "add_files ./srcs/${PRJ_NAME}.hpp" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "add_files -tb ./srcs/${PRJ_NAME}_test.cpp" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "# create solution" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "open_solution -reset -flow_target vivado solution1" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "set_part {xc7z020clg400-1}" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "create_clock -period 10 -name default" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "csynth_design" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "export_design -rtl verilog -format ip_catalog -output ./IP" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl
echo "exit" >> ${PRJ_NAME}/Vitis_HLS/${PRJ_NAME}_prj.tcl

echo "#ifndef __${PRJ_NAME}_HPP__" > ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}.hpp
echo "#define __${PRJ_NAME}_HPP__" >> ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}.hpp
echo "" >> ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}.hpp
echo "#endif" >> ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}.hpp
echo "#include \"${PRJ_NAME}.hpp\"" > ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}.cpp
echo "#include \"${PRJ_NAME}.hpp\"" > ${PRJ_NAME}/Vitis_HLS/srcs/${PRJ_NAME}_test.cpp
mkdir ${PRJ_NAME}/Vivado
