//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Thu Aug  6 11:26:03 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=17,numReposBlks=17,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=15,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (Carry_0,
    Negative_0,
    Overflow_0,
    S10_0,
    StateDebug_0,
    clk_in1_0,
    locked_0,
    rst_0);
  output Carry_0;
  output Negative_0;
  output Overflow_0;
  input [31:0]S10_0;
  output [3:0]StateDebug_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  output locked_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst_0;

  wire [31:0]ALU_0_ALUResult;
  wire ALU_0_Zero;
  wire Carry_0;
  wire [31:0]Extend_0_ImmExt;
  wire [31:0]Ins_Data_Memory_0_RD;
  wire [31:0]MUX_ALUSrc_0_Src;
  wire [31:0]MUX_ALUSrc_1_Src;
  wire [31:0]MUX_ResultSrc_0_Result;
  wire [3:0]Multicycle_Control_U_0_ALUControl;
  wire [1:0]Multicycle_Control_U_0_ALUSrcA;
  wire [1:0]Multicycle_Control_U_0_ALUSrcB;
  wire Multicycle_Control_U_0_AdrSrc;
  wire Multicycle_Control_U_0_IRWrite;
  wire [1:0]Multicycle_Control_U_0_ImmSrc;
  wire Multicycle_Control_U_0_MemWrite;
  wire Multicycle_Control_U_0_PCWrite;
  wire Multicycle_Control_U_0_RegWrite;
  wire [1:0]Multicycle_Control_U_0_ResultSrc;
  wire [31:0]Mux_AddSrc_0_OUT;
  wire Negative_0;
  wire Overflow_0;
  wire [31:0]PC_0_PC;
  wire [31:0]Register_0_Address;
  wire [31:0]Register_1_Address;
  wire [31:0]Register_2_Address;
  wire [31:0]Register_3_Address;
  wire [31:0]Register_File_0_RD1;
  wire [31:0]Register_File_0_RD2;
  wire [31:0]Register_IRWrite_1_Instruction;
  wire [31:0]Register_IRWrite_1_OldPC;
  wire [31:0]S10_0;
  wire [3:0]StateDebug_0;
  wire clk_in1_0;
  wire clk_wiz_0_clk_out1;
  wire locked_0;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire rst_0;

  design_1_ALU_0_0 ALU_0
       (.ALUControl(Multicycle_Control_U_0_ALUControl),
        .ALUResult(ALU_0_ALUResult),
        .Carry(Carry_0),
        .Negative(Negative_0),
        .Overflow(Overflow_0),
        .SrcA(MUX_ALUSrc_0_Src),
        .SrcB(MUX_ALUSrc_1_Src),
        .Zero(ALU_0_Zero));
  design_1_Extend_0_0 Extend_0
       (.ImmExt(Extend_0_ImmExt),
        .ImmSrc(Multicycle_Control_U_0_ImmSrc),
        .Instruction(Register_IRWrite_1_Instruction));
  design_1_Ins_Data_Memory_0_0 Ins_Data_Memory_0
       (.Address(Mux_AddSrc_0_OUT),
        .RD(Ins_Data_Memory_0_RD),
        .WD(Register_2_Address),
        .WE(Multicycle_Control_U_0_MemWrite),
        .clk(clk_wiz_0_clk_out1));
  design_1_MUX_ALUSrc_0_0 MUX_ALUSrc_0
       (.ALUSrc(Multicycle_Control_U_0_ALUSrcA),
        .S00(PC_0_PC),
        .S01(Register_IRWrite_1_OldPC),
        .S10(Register_1_Address),
        .Src(MUX_ALUSrc_0_Src));
  design_1_MUX_ALUSrc_1_0 MUX_ALUSrc_1
       (.ALUSrc(Multicycle_Control_U_0_ALUSrcB),
        .S00(Register_2_Address),
        .S01(Extend_0_ImmExt),
        .S10(S10_0),
        .Src(MUX_ALUSrc_1_Src));
  design_1_MUX_ResultSrc_0_0 MUX_ResultSrc_0
       (.ALUResult(Register_3_Address),
        .PC(ALU_0_ALUResult),
        .ReadData(Register_0_Address),
        .Result(MUX_ResultSrc_0_Result),
        .ResultSrc(Multicycle_Control_U_0_ResultSrc));
  design_1_Multicycle_Control_U_0_0 Multicycle_Control_U_0
       (.ALUControl(Multicycle_Control_U_0_ALUControl),
        .ALUSrcA(Multicycle_Control_U_0_ALUSrcA),
        .ALUSrcB(Multicycle_Control_U_0_ALUSrcB),
        .AdrSrc(Multicycle_Control_U_0_AdrSrc),
        .IRWrite(Multicycle_Control_U_0_IRWrite),
        .ImmSrc(Multicycle_Control_U_0_ImmSrc),
        .Instruction(Register_IRWrite_1_Instruction),
        .MemWrite(Multicycle_Control_U_0_MemWrite),
        .PCWrite(Multicycle_Control_U_0_PCWrite),
        .RegWrite(Multicycle_Control_U_0_RegWrite),
        .ResultSrc(Multicycle_Control_U_0_ResultSrc),
        .StateDebug(StateDebug_0),
        .Zero(ALU_0_Zero),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_Mux_AddSrc_0_0 Mux_AddSrc_0
       (.ADR(Mux_AddSrc_0_OUT),
        .AdrSrc(Multicycle_Control_U_0_AdrSrc),
        .PC(PC_0_PC),
        .ResultSrc(MUX_ResultSrc_0_Result));
  design_1_PC_0_0 PC_0
       (.PC(PC_0_PC),
        .PCWrite(Multicycle_Control_U_0_PCWrite),
        .PC_next(MUX_ResultSrc_0_Result),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_Register_0_0 Register_0
       (.Address(Register_0_Address),
        .RD(Ins_Data_Memory_0_RD),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_1_0 Register_1
       (.Address(Register_1_Address),
        .RD(Register_File_0_RD1),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_2_0 Register_2
       (.Address(Register_2_Address),
        .RD(Register_File_0_RD2),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_3_0 Register_3
       (.Address(Register_3_Address),
        .RD(ALU_0_ALUResult),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_File_0_0 Register_File_0
       (.Instruction(Register_IRWrite_1_Instruction),
        .RD1(Register_File_0_RD1),
        .RD2(Register_File_0_RD2),
        .RegWrite(Multicycle_Control_U_0_RegWrite),
        .WD3(MUX_ResultSrc_0_Result),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_IRWrite_1_0 Register_IRWrite_1
       (.IRWrite(Multicycle_Control_U_0_IRWrite),
        .Instruction(Register_IRWrite_1_Instruction),
        .OldPC(Register_IRWrite_1_OldPC),
        .PC(PC_0_PC),
        .RD(Ins_Data_Memory_0_RD),
        .clk(clk_wiz_0_clk_out1));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(locked_0),
        .reset(rst_0));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(locked_0),
        .ext_reset_in(rst_0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
endmodule
