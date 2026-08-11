vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ipshared/a415" \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"D:/SoC/2025.2/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/PC.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/AddSrc.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Ins_Data_Memory.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Register.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Register_IRWrite.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Register_File.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/Extend.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/MUX_ALUSrc.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/ALU.v" \
"../../../../RISCY-V/RISCY-V.srcs/sources_1/new/MUX_ResultSrc.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/ALU_Decoder_Multicycle.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Instruction_Decoder.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Main_FSM.v" \
"../../../RISC-V Multicycle.srcs/sources_1/new/Multicycle_Control_Unit.v" \
"../../bd/design_1/ip/design_1_PC_0_0/sim/design_1_PC_0_0.v" \
"../../bd/design_1/ip/design_1_Mux_AddSrc_0_0/sim/design_1_Mux_AddSrc_0_0.v" \
"../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ip/design_1_Ins_Data_Memory_0_0/sim/design_1_Ins_Data_Memory_0_0.v" \
"../../bd/design_1/ip/design_1_Register_0_0/sim/design_1_Register_0_0.v" \
"../../bd/design_1/ip/design_1_Register_IRWrite_1_0/sim/design_1_Register_IRWrite_1_0.v" \
"../../bd/design_1/ip/design_1_Register_File_0_0/sim/design_1_Register_File_0_0.v" \
"../../bd/design_1/ip/design_1_Extend_0_0/sim/design_1_Extend_0_0.v" \
"../../bd/design_1/ip/design_1_Register_1_0/sim/design_1_Register_1_0.v" \
"../../bd/design_1/ip/design_1_Register_2_0/sim/design_1_Register_2_0.v" \
"../../bd/design_1/ip/design_1_MUX_ALUSrc_0_0/sim/design_1_MUX_ALUSrc_0_0.v" \
"../../bd/design_1/ip/design_1_MUX_ALUSrc_1_0/sim/design_1_MUX_ALUSrc_1_0.v" \
"../../bd/design_1/ip/design_1_ALU_0_0/sim/design_1_ALU_0_0.v" \
"../../bd/design_1/ip/design_1_Register_3_0/sim/design_1_Register_3_0.v" \
"../../bd/design_1/ip/design_1_MUX_ResultSrc_0_0/sim/design_1_MUX_ResultSrc_0_0.v" \
"../../bd/design_1/ip/design_1_Multicycle_Control_U_0_0/sim/design_1_Multicycle_Control_U_0_0.v" \
"../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../RISC-V Multicycle.gen/sources_1/bd/design_1/sim/design_1.v" \
"../../../RISC-V Multicycle.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv "+incdir+../../../../../SoC/2025.2/Vivado/data/rsb/busdef" "+incdir+../../../RISC-V Multicycle.gen/sources_1/bd/design_1/ipshared/a415" \
"../../../RISC-V Multicycle.srcs/sources_1/new/design_1_wrapper_tb.sv" \

vlog -work xil_defaultlib \
"glbl.v"

