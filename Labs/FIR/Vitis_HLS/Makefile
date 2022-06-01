IMPL ?= fir_2.1.cpp

.PHONY: all clean

all:
	-@cp srcs/Archive/$(IMPL) srcs/fir.cpp
	-@vitis_hls -f fir_prj.tcl
	-@cd ./IP && unzip export.zip

clean:
	-@rm -rf fir
	-@rm -rf IP/*
	-@rm -rf *.log
