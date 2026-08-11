//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Sun Aug  9 22:39:38 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=22,numReposBlks=22,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=20,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (Carry_0,
    Negative_0,
    Overflow_0,
    clk_in1_0,
    locked_0,
    reset_0);
  output Carry_0;
  output Negative_0;
  output Overflow_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  output locked_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_0;

  wire [31:0]ALU_0_ALUResult;
  wire ALU_0_Zero;
  wire AND_OR_0_PCSrcE;
  wire Carry_0;
  wire [3:0]Control_Unit_0_ALUControlD;
  wire Control_Unit_0_ALUSrcD;
  wire Control_Unit_0_BranchD;
  wire [1:0]Control_Unit_0_ImmSrcD;
  wire Control_Unit_0_JumpD;
  wire Control_Unit_0_MemWriteD;
  wire Control_Unit_0_RegWriteD;
  wire [1:0]Control_Unit_0_ResultSrcD;
  wire [31:0]Data_Memory_0_RD;
  wire [31:0]Extend_0_ImmExt;
  wire Hazard_Unit_0_FlushD;
  wire Hazard_Unit_0_FlushE;
  wire [1:0]Hazard_Unit_0_ForwardAE;
  wire [1:0]Hazard_Unit_0_ForwardBE;
  wire Hazard_Unit_0_StallD;
  wire Hazard_Unit_0_StallF;
  wire [31:0]Instruction_Memory_0_RD;
  wire [31:0]MUX_31_0_Src;
  wire [31:0]MUX_31_1_Src;
  wire [31:0]MUX_PC_0_PCNext;
  wire [31:0]MUX_ResultSrc_0_Result;
  wire [31:0]Mux_ALUSrc_0_SrcB;
  wire Negative_0;
  wire [31:0]Net;
  wire Overflow_0;
  wire [31:0]PCTarget_0_PCTarget;
  wire [31:0]PC_0_PC;
  wire [31:0]PC_counter_0_PC_next;
  wire [3:0]Register_DE_0_ALUControlE;
  wire Register_DE_0_ALUSrcE;
  wire Register_DE_0_BranchE;
  wire [31:0]Register_DE_0_ImmExtE;
  wire Register_DE_0_JumpE;
  wire Register_DE_0_MemWriteE;
  wire [31:0]Register_DE_0_PCE;
  wire [31:0]Register_DE_0_PCPlus4E;
  wire [31:0]Register_DE_0_RD1E;
  wire [31:0]Register_DE_0_RD2E;
  wire [4:0]Register_DE_0_RdE;
  wire Register_DE_0_RegWriteE;
  wire [1:0]Register_DE_0_ResultSrcE;
  wire [4:0]Register_DE_0_Rs1E;
  wire [4:0]Register_DE_0_Rs2E;
  wire [31:0]Register_EM_0_ALUResultM;
  wire Register_EM_0_MemWriteM;
  wire [31:0]Register_EM_0_PCPlus4M;
  wire [4:0]Register_EM_0_RdM;
  wire Register_EM_0_RegWriteM;
  wire [1:0]Register_EM_0_ResultSrcM;
  wire [31:0]Register_EM_0_WriteDataM;
  wire [31:0]Register_FD_0_PCD;
  wire [31:0]Register_FD_0_PCPlus4D;
  wire [31:0]Register_File_0_RD1;
  wire [31:0]Register_File_0_RD2;
  wire [31:0]Register_MW_0_ALUResultW;
  wire [31:0]Register_MW_0_PCPlus4W;
  wire [31:0]Register_MW_0_RDOUT;
  wire [4:0]Register_MW_0_RdW;
  wire Register_MW_0_RegWriteW;
  wire [1:0]Register_MW_0_ResultSrcW;
  wire clk_in1_0;
  wire clk_wiz_0_clk_out1;
  wire locked_0;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire reset_0;

  design_1_ALU_0_0 ALU_0
       (.ALUControl(Register_DE_0_ALUControlE),
        .ALUResult(ALU_0_ALUResult),
        .Carry(Carry_0),
        .Negative(Negative_0),
        .Overflow(Overflow_0),
        .SrcA(MUX_31_0_Src),
        .SrcB(Mux_ALUSrc_0_SrcB),
        .Zero(ALU_0_Zero));
  design_1_AND_OR_0_0 AND_OR_0
       (.BranchE(Register_DE_0_BranchE),
        .JumpE(Register_DE_0_JumpE),
        .PCSrcE(AND_OR_0_PCSrcE),
        .ZeroE(ALU_0_Zero));
  design_1_Control_Unit_0_0 Control_Unit_0
       (.ALUControlD(Control_Unit_0_ALUControlD),
        .ALUSrcD(Control_Unit_0_ALUSrcD),
        .BranchD(Control_Unit_0_BranchD),
        .ImmSrcD(Control_Unit_0_ImmSrcD),
        .Instruction(Net),
        .JumpD(Control_Unit_0_JumpD),
        .MemWriteD(Control_Unit_0_MemWriteD),
        .RegWriteD(Control_Unit_0_RegWriteD),
        .ResultSrcD(Control_Unit_0_ResultSrcD));
  design_1_Data_Memory_0_0 Data_Memory_0
       (.Address(Register_EM_0_ALUResultM),
        .RD(Data_Memory_0_RD),
        .WD(Register_EM_0_WriteDataM),
        .WE(Register_EM_0_MemWriteM),
        .clk(clk_wiz_0_clk_out1));
  design_1_Extend_0_0 Extend_0
       (.ImmExt(Extend_0_ImmExt),
        .ImmSrc(Control_Unit_0_ImmSrcD),
        .Instruction(Net));
  design_1_Hazard_Unit_0_0 Hazard_Unit_0
       (.FlushD(Hazard_Unit_0_FlushD),
        .FlushE(Hazard_Unit_0_FlushE),
        .ForwardAE(Hazard_Unit_0_ForwardAE),
        .ForwardBE(Hazard_Unit_0_ForwardBE),
        .InstructionD(Net),
        .PCSrcE(AND_OR_0_PCSrcE),
        .RdE(Register_DE_0_RdE),
        .RdM(Register_EM_0_RdM),
        .RdW(Register_MW_0_RdW),
        .RegWriteM(Register_EM_0_RegWriteM),
        .RegWriteW(Register_MW_0_RegWriteW),
        .ResultSrcE(Register_DE_0_ResultSrcE),
        .Rs1E(Register_DE_0_Rs1E),
        .Rs2E(Register_DE_0_Rs2E),
        .StallD(Hazard_Unit_0_StallD),
        .StallF(Hazard_Unit_0_StallF));
  design_1_Instruction_Memory_0_0 Instruction_Memory_0
       (.Address(PC_0_PC),
        .RD(Instruction_Memory_0_RD));
  design_1_MUX_31_0_0 MUX_31_0
       (.S00(Register_DE_0_RD1E),
        .S01(MUX_ResultSrc_0_Result),
        .S10(Register_EM_0_ALUResultM),
        .Sel(Hazard_Unit_0_ForwardAE),
        .Src(MUX_31_0_Src));
  design_1_MUX_31_1_0 MUX_31_1
       (.S00(Register_DE_0_RD2E),
        .S01(MUX_ResultSrc_0_Result),
        .S10(Register_EM_0_ALUResultM),
        .Sel(Hazard_Unit_0_ForwardBE),
        .Src(MUX_31_1_Src));
  design_1_MUX_PC_0_0 MUX_PC_0
       (.PCNext(MUX_PC_0_PCNext),
        .PCPlus4(PC_counter_0_PC_next),
        .PCSrc(AND_OR_0_PCSrcE),
        .PCTarget(PCTarget_0_PCTarget));
  design_1_MUX_ResultSrc_0_0 MUX_ResultSrc_0
       (.ALUResult(Register_MW_0_ALUResultW),
        .PC(Register_MW_0_PCPlus4W),
        .ReadData(Register_MW_0_RDOUT),
        .Result(MUX_ResultSrc_0_Result),
        .ResultSrc(Register_MW_0_ResultSrcW));
  design_1_Mux_ALUSrc_0_0 Mux_ALUSrc_0
       (.ALUSrc(Register_DE_0_ALUSrcE),
        .Extned(Register_DE_0_ImmExtE),
        .RD2(MUX_31_1_Src),
        .SrcB(Mux_ALUSrc_0_SrcB));
  design_1_PCTarget_0_1 PCTarget_0
       (.Extend(Register_DE_0_ImmExtE),
        .PC(Register_DE_0_PCE),
        .PCTarget(PCTarget_0_PCTarget));
  design_1_PC_0_0 PC_0
       (.PC(PC_0_PC),
        .PC_next(MUX_PC_0_PCNext),
        .StallF(Hazard_Unit_0_StallF),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_PC_counter_0_0 PC_counter_0
       (.PC(PC_0_PC),
        .PC_next(PC_counter_0_PC_next));
  design_1_Register_DE_0_0 Register_DE_0
       (.ALUControlD(Control_Unit_0_ALUControlD),
        .ALUControlE(Register_DE_0_ALUControlE),
        .ALUSrcD(Control_Unit_0_ALUSrcD),
        .ALUSrcE(Register_DE_0_ALUSrcE),
        .BranchD(Control_Unit_0_BranchD),
        .BranchE(Register_DE_0_BranchE),
        .FlushE(Hazard_Unit_0_FlushE),
        .ImmExtD(Extend_0_ImmExt),
        .ImmExtE(Register_DE_0_ImmExtE),
        .InstructionD(Net),
        .JumpD(Control_Unit_0_JumpD),
        .JumpE(Register_DE_0_JumpE),
        .MemWriteD(Control_Unit_0_MemWriteD),
        .MemWriteE(Register_DE_0_MemWriteE),
        .PCD(Register_FD_0_PCD),
        .PCE(Register_DE_0_PCE),
        .PCPlus4D(Register_FD_0_PCPlus4D),
        .PCPlus4E(Register_DE_0_PCPlus4E),
        .RD1D(Register_File_0_RD1),
        .RD1E(Register_DE_0_RD1E),
        .RD2D(Register_File_0_RD2),
        .RD2E(Register_DE_0_RD2E),
        .RdE(Register_DE_0_RdE),
        .RegWriteD(Control_Unit_0_RegWriteD),
        .RegWriteE(Register_DE_0_RegWriteE),
        .ResultSrcD(Control_Unit_0_ResultSrcD),
        .ResultSrcE(Register_DE_0_ResultSrcE),
        .Rs1E(Register_DE_0_Rs1E),
        .Rs2E(Register_DE_0_Rs2E),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_Register_EM_0_0 Register_EM_0
       (.ALUResultE(ALU_0_ALUResult),
        .ALUResultM(Register_EM_0_ALUResultM),
        .MemWriteE(Register_DE_0_MemWriteE),
        .MemWriteM(Register_EM_0_MemWriteM),
        .PCPlus4E(Register_DE_0_PCPlus4E),
        .PCPlus4M(Register_EM_0_PCPlus4M),
        .RdE(Register_DE_0_RdE),
        .RdM(Register_EM_0_RdM),
        .RegWriteE(Register_DE_0_RegWriteE),
        .RegWriteM(Register_EM_0_RegWriteM),
        .ResultSrcE(Register_DE_0_ResultSrcE),
        .ResultSrcM(Register_EM_0_ResultSrcM),
        .WriteDataE(MUX_31_1_Src),
        .WriteDataM(Register_EM_0_WriteDataM),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_Register_FD_0_0 Register_FD_0
       (.FlushD(Hazard_Unit_0_FlushD),
        .InstructionD(Net),
        .PCD(Register_FD_0_PCD),
        .PCF(PC_0_PC),
        .PCPlus4D(Register_FD_0_PCPlus4D),
        .PCPlus4F(PC_counter_0_PC_next),
        .RD(Instruction_Memory_0_RD),
        .StallD(Hazard_Unit_0_StallD),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_Register_File_0_0 Register_File_0
       (.A3(Register_MW_0_RdW),
        .Instruction(Net),
        .RD1(Register_File_0_RD1),
        .RD2(Register_File_0_RD2),
        .RegWrite(Register_MW_0_RegWriteW),
        .WD3(MUX_ResultSrc_0_Result),
        .clk(clk_wiz_0_clk_out1));
  design_1_Register_MW_0_0 Register_MW_0
       (.ALUResultM(Register_EM_0_ALUResultM),
        .ALUResultW(Register_MW_0_ALUResultW),
        .PCPlus4M(Register_EM_0_PCPlus4M),
        .PCPlus4W(Register_MW_0_PCPlus4W),
        .RD(Data_Memory_0_RD),
        .RDOUT(Register_MW_0_RDOUT),
        .RdM(Register_EM_0_RdM),
        .RdW(Register_MW_0_RdW),
        .RegWriteM(Register_EM_0_RegWriteM),
        .RegWriteW(Register_MW_0_RegWriteW),
        .ResultSrcM(Register_EM_0_ResultSrcM),
        .ResultSrcW(Register_MW_0_ResultSrcW),
        .clk(clk_wiz_0_clk_out1),
        .rst(proc_sys_reset_0_peripheral_reset));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(locked_0),
        .reset(reset_0));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(locked_0),
        .ext_reset_in(reset_0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
endmodule
