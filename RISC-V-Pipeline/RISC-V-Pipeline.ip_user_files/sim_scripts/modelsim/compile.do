vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ipshared/a415" \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/MUX_PC.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/PC.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Instruction_Memory.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/PC_counter.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/Register_D.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Register_File.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Extend.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/ALU_Decoder.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Main_Decoder.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Control_Unit.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/Register_E.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/MUX_31.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Mux_ALUSrc.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/ALU.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/Register_EM.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Data_Memory.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/Register_MW.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/MUX_ResultSrc.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/AND_OR.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/PCTarget.v" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/Hazard_Unit.v" \
"../../bd/design_1/ip/design_1_MUX_PC_0_0/sim/design_1_MUX_PC_0_0.v" \
"../../bd/design_1/ip/design_1_PC_0_0/sim/design_1_PC_0_0.v" \
"../../bd/design_1/ip/design_1_Instruction_Memory_0_0/sim/design_1_Instruction_Memory_0_0.v" \
"../../bd/design_1/ip/design_1_PC_counter_0_0/sim/design_1_PC_counter_0_0.v" \
"../../bd/design_1/ip/design_1_Register_FD_0_0/sim/design_1_Register_FD_0_0.v" \
"../../bd/design_1/ip/design_1_Register_File_0_0/sim/design_1_Register_File_0_0.v" \
"../../bd/design_1/ip/design_1_Extend_0_0/sim/design_1_Extend_0_0.v" \
"../../bd/design_1/ip/design_1_Control_Unit_0_0/sim/design_1_Control_Unit_0_0.v" \
"../../bd/design_1/ip/design_1_Register_DE_0_0/sim/design_1_Register_DE_0_0.v" \
"../../bd/design_1/ip/design_1_MUX_31_0_0/sim/design_1_MUX_31_0_0.v" \
"../../bd/design_1/ip/design_1_MUX_31_1_0/sim/design_1_MUX_31_1_0.v" \
"../../bd/design_1/ip/design_1_Mux_ALUSrc_0_0/sim/design_1_Mux_ALUSrc_0_0.v" \
"../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ip/design_1_ALU_0_0/sim/design_1_ALU_0_0.v" \
"../../bd/design_1/ip/design_1_Register_EM_0_0/sim/design_1_Register_EM_0_0.v" \
"../../bd/design_1/ip/design_1_Data_Memory_0_0/sim/design_1_Data_Memory_0_0.v" \
"../../bd/design_1/ip/design_1_Register_MW_0_0/sim/design_1_Register_MW_0_0.v" \
"../../bd/design_1/ip/design_1_MUX_ResultSrc_0_0/sim/design_1_MUX_ResultSrc_0_0.v" \
"../../bd/design_1/ip/design_1_AND_OR_0_0/sim/design_1_AND_OR_0_0.v" \
"../../bd/design_1/ip/design_1_PCTarget_0_1/sim/design_1_PCTarget_0_1.v" \
"../../bd/design_1/ip/design_1_Hazard_Unit_0_0/sim/design_1_Hazard_Unit_0_0.v" \
"../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/sim/design_1.v" \
"../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V-Pipeline.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../RISC-V-Pipeline.srcs/sources_1/new/design_1_wrapper_tb.sv" \

vlog -work xil_defaultlib \
"glbl.v"

