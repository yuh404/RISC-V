transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../project_1.gen/sources_1/bd/design_FIFO_test/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_0_0" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_1_0" -l xpm -l xil_defaultlib \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../project_1.gen/sources_1/bd/design_FIFO_test/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_0_0" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_1_0" -l xpm -l xil_defaultlib \
"../../../project_1.srcs/sources_1/new/completer_1.v" \
"../../../project_1.srcs/sources_1/new/Requester.v" \
"../../bd/design_3/ip/design_3_completer_1_0_0/sim/design_3_completer_1_0_0.v" \
"../../bd/design_3/ip/design_3_Requester_0_0/sim/design_3_Requester_0_0.v" \
"../../bd/design_3/ip/design_3_clk_wiz_0/design_3_clk_wiz_0_clk_wiz.v" \
"../../bd/design_3/ip/design_3_clk_wiz_0/design_3_clk_wiz_0.v" \
"../../bd/design_3/ip/design_3_clk_wiz_1_0/design_3_clk_wiz_1_0_clk_wiz.v" \
"../../bd/design_3/ip/design_3_clk_wiz_1_0/design_3_clk_wiz_1_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_0_0/design_FIFO_test_clk_wiz_0_0_clk_wiz.v" \
"../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_0_0/design_FIFO_test_clk_wiz_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_1_0/design_FIFO_test_clk_wiz_1_0_clk_wiz.v" \
"../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_1_0/design_FIFO_test_clk_wiz_1_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/src/fifo2.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test_fifo2_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/src/LENGTH.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test_LENGTH_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/src/READY_CONDITION.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test_READY_CONDITION_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/src/STOP_WRINC.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test_STOP_WRINC_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test_fifo2_1_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/ipshared/50bd/sim/design_FIFO_test.v" \
"../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/sim/design_3_design_FIFO_test_0_0.v" \
"../../../project_1.gen/sources_1/bd/design_3/sim/design_3.v" \
"../../../project_1.gen/sources_1/bd/design_3/hdl/design_3_wrapper.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../project_1.gen/sources_1/bd/design_FIFO_test/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ipshared/a415" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_0_0" "+incdir+../../../project_1.gen/sources_1/bd/design_3/ip/design_3_design_FIFO_test_0_0/src/design_FIFO_test_clk_wiz_1_0" -l xpm -l xil_defaultlib \
"../../../project_1.srcs/sources_1/new/tb_system_sv.sv" \

vlog -work xil_defaultlib \
"glbl.v"

