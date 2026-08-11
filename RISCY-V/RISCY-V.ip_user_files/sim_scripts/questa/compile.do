vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISCY-V.gen/sources_1/bd/RISC_V/ipshared/a415" \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISCY-V.gen/sources_1/bd/RISC_V/ipshared/a415" \
"../../../RISCY-V.srcs/sources_1/new/ALU_Decoder.v" \
"../../../RISCY-V.srcs/sources_1/new/Main_Decoder.v" \
"../../../RISCY-V.srcs/sources_1/new/Control_Unit.v" \
"../../../RISCY-V.srcs/sources_1/new/ALU.v" \
"../../../RISCY-V.srcs/sources_1/new/Data_Memory.v" \
"../../../RISCY-V.srcs/sources_1/new/Extend.v" \
"../../../RISCY-V.srcs/sources_1/new/Instruction_Memory.v" \
"../../../RISCY-V.srcs/sources_1/new/MUX_PC.v" \
"../../../RISCY-V.srcs/sources_1/new/MUX_ResultSrc.v" \
"../../../RISCY-V.srcs/sources_1/new/Mux_ALUSrc.v" \
"../../../RISCY-V.srcs/sources_1/new/PC.v" \
"../../../RISCY-V.srcs/sources_1/new/PCTarget.v" \
"../../../RISCY-V.srcs/sources_1/new/PC_counter.v" \
"../../../RISCY-V.srcs/sources_1/new/Register_File.v" \
"../../../RISCY-V.gen/sources_1/bd/RISC_V/ip/RISC_V_Control_Unit_0_0/sim/RISC_V_Control_Unit_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_ALU_0_0/sim/RISC_V_ALU_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_Data_Memory_0_0/sim/RISC_V_Data_Memory_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_Extend_0_0/sim/RISC_V_Extend_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_Instruction_Memory_0_0/sim/RISC_V_Instruction_Memory_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_MUX_PC_0_0/sim/RISC_V_MUX_PC_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_MUX_ResultSrc_0_0/sim/RISC_V_MUX_ResultSrc_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_Mux_ALUSrc_0_0/sim/RISC_V_Mux_ALUSrc_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_PC_0_0/sim/RISC_V_PC_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_PCTarget_0_0/sim/RISC_V_PCTarget_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_PC_counter_0_0/sim/RISC_V_PC_counter_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_Register_File_0_0/sim/RISC_V_Register_File_0_0.v" \
"../../bd/RISC_V/ip/RISC_V_clk_wiz_0_0/RISC_V_clk_wiz_0_0_clk_wiz.v" \
"../../bd/RISC_V/ip/RISC_V_clk_wiz_0_0/RISC_V_clk_wiz_0_0.v" \
"../../bd/RISC_V/sim/RISC_V.v" \
"../../../RISCY-V.gen/sources_1/bd/RISC_V/hdl/RISC_V_wrapper.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISCY-V.gen/sources_1/bd/RISC_V/ipshared/a415" \
"../../../RISCY-V.srcs/sources_1/new/RISC_V_wrapper_tb.sv" \

vlog -work xil_defaultlib \
"glbl.v"

