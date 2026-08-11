//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Mon Aug  3 12:15:44 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target RISC_V.bd
//Design      : RISC_V
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "RISC_V,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=RISC_V,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=12,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "RISC_V.hwdef" *) 
module RISC_V
   (Carry_0,
    Negative_0,
    Overflow_0,
    clk_in1_0,
    clk_rst,
    locked_0,
    pc_rst);
  output Carry_0;
  output Negative_0;
  output Overflow_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN RISC_V_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CLK_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CLK_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input clk_rst;
  output locked_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PC_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PC_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input pc_rst;

  wire [31:0]ALU_0_ALUResult;
  wire ALU_0_Zero;
  wire Carry_0;
  wire [3:0]Control_Unit_0_ALUControl;
  wire Control_Unit_0_ALUSrc;
  wire [1:0]Control_Unit_0_ImmSrc;
  wire Control_Unit_0_MemWrite;
  wire Control_Unit_0_PCSrc;
  wire Control_Unit_0_RegWrite;
  wire [1:0]Control_Unit_0_ResultSrc;
  wire [31:0]Data_Memory_0_RD;
  wire [31:0]Extend_0_ImmExt;
  wire [31:0]Instruction_Memory_0_RD;
  wire [31:0]MUX_PC_0_PCNext;
  wire [31:0]MUX_ResultSrc_0_WD;
  wire [31:0]Mux_ALUSrc_0_SrcB;
  wire Negative_0;
  wire Overflow_0;
  wire [31:0]PCTarget_0_PCTarget;
  wire [31:0]PC_0_PC;
  wire [31:0]PC_counter_0_PC_next;
  wire [31:0]Register_File_0_RD1;
  wire [31:0]Register_File_0_RD2;
  wire clk_in1_0;
  wire clk_rst;
  wire clk_wiz_0_clk_out1;
  wire locked_0;
  wire pc_rst;

  RISC_V_ALU_0_0 ALU_0
       (.ALUControl(Control_Unit_0_ALUControl),
        .ALUResult(ALU_0_ALUResult),
        .Carry(Carry_0),
        .Negative(Negative_0),
        .Overflow(Overflow_0),
        .SrcA(Register_File_0_RD1),
        .SrcB(Mux_ALUSrc_0_SrcB),
        .Zero(ALU_0_Zero));
  RISC_V_Control_Unit_0_0 Control_Unit_0
       (.ALUControl(Control_Unit_0_ALUControl),
        .ALUSrc(Control_Unit_0_ALUSrc),
        .ImmSrc(Control_Unit_0_ImmSrc),
        .Instruction(Instruction_Memory_0_RD),
        .MemWrite(Control_Unit_0_MemWrite),
        .PCSrc(Control_Unit_0_PCSrc),
        .RegWrite(Control_Unit_0_RegWrite),
        .ResultSrc(Control_Unit_0_ResultSrc),
        .Zero(ALU_0_Zero));
  RISC_V_Data_Memory_0_0 Data_Memory_0
       (.Address(ALU_0_ALUResult),
        .RD(Data_Memory_0_RD),
        .WD(Register_File_0_RD2),
        .WE(Control_Unit_0_MemWrite),
        .clk(clk_wiz_0_clk_out1));
  RISC_V_Extend_0_0 Extend_0
       (.ImmExt(Extend_0_ImmExt),
        .ImmSrc(Control_Unit_0_ImmSrc),
        .Instruction(Instruction_Memory_0_RD));
  RISC_V_Instruction_Memory_0_0 Instruction_Memory_0
       (.Address(PC_0_PC),
        .RD(Instruction_Memory_0_RD));
  RISC_V_MUX_PC_0_0 MUX_PC_0
       (.PCNext(MUX_PC_0_PCNext),
        .PCPlus4(PC_counter_0_PC_next),
        .PCSrc(Control_Unit_0_PCSrc),
        .PCTarget(PCTarget_0_PCTarget));
  RISC_V_MUX_ResultSrc_0_0 MUX_ResultSrc_0
       (.ALUResult(ALU_0_ALUResult),
        .PCPlus4(PC_counter_0_PC_next),
        .ReadData(Data_Memory_0_RD),
        .Result(MUX_ResultSrc_0_WD),
        .ResultSrc(Control_Unit_0_ResultSrc));
  RISC_V_Mux_ALUSrc_0_0 Mux_ALUSrc_0
       (.ALUSrc(Control_Unit_0_ALUSrc),
        .Extned(Extend_0_ImmExt),
        .RD2(Register_File_0_RD2),
        .SrcB(Mux_ALUSrc_0_SrcB));
  RISC_V_PCTarget_0_0 PCTarget_0
       (.Extend(Extend_0_ImmExt),
        .PC(PC_0_PC),
        .PCTarget(PCTarget_0_PCTarget));
  RISC_V_PC_0_0 PC_0
       (.PC(PC_0_PC),
        .PC_next(MUX_PC_0_PCNext),
        .clk(clk_wiz_0_clk_out1),
        .rst(pc_rst));
  RISC_V_PC_counter_0_0 PC_counter_0
       (.PC(PC_0_PC),
        .PC_next(PC_counter_0_PC_next));
  RISC_V_Register_File_0_0 Register_File_0
       (.Instruction(Instruction_Memory_0_RD),
        .RD1(Register_File_0_RD1),
        .RD2(Register_File_0_RD2),
        .RegWrite(Control_Unit_0_RegWrite),
        .WD3(MUX_ResultSrc_0_WD),
        .clk(clk_wiz_0_clk_out1));
  RISC_V_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(locked_0),
        .reset(clk_rst));
endmodule
