// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:Register_DE:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_Register_DE_0_0 (
  clk,
  rst,
  FlushE,
  RegWriteD,
  MemWriteD,
  JumpD,
  BranchD,
  ALUSrcD,
  ResultSrcD,
  ALUControlD,
  RD1D,
  RD2D,
  PCD,
  ImmExtD,
  PCPlus4D,
  InstructionD,
  RegWriteE,
  MemWriteE,
  JumpE,
  BranchE,
  ALUSrcE,
  ResultSrcE,
  ALUControlE,
  RD1E,
  RD2E,
  PCE,
  ImmExtE,
  PCPlus4E,
  RdE,
  Rs1E,
  Rs2E
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire rst;
input wire FlushE;
input wire RegWriteD;
input wire MemWriteD;
input wire JumpD;
input wire BranchD;
input wire ALUSrcD;
input wire [1 : 0] ResultSrcD;
input wire [3 : 0] ALUControlD;
input wire [31 : 0] RD1D;
input wire [31 : 0] RD2D;
input wire [31 : 0] PCD;
input wire [31 : 0] ImmExtD;
input wire [31 : 0] PCPlus4D;
input wire [31 : 0] InstructionD;
output wire RegWriteE;
output wire MemWriteE;
output wire JumpE;
output wire BranchE;
output wire ALUSrcE;
output wire [1 : 0] ResultSrcE;
output wire [3 : 0] ALUControlE;
output wire [31 : 0] RD1E;
output wire [31 : 0] RD2E;
output wire [31 : 0] PCE;
output wire [31 : 0] ImmExtE;
output wire [31 : 0] PCPlus4E;
output wire [4 : 0] RdE;
output wire [4 : 0] Rs1E;
output wire [4 : 0] Rs2E;

  Register_DE inst (
    .clk(clk),
    .rst(rst),
    .FlushE(FlushE),
    .RegWriteD(RegWriteD),
    .MemWriteD(MemWriteD),
    .JumpD(JumpD),
    .BranchD(BranchD),
    .ALUSrcD(ALUSrcD),
    .ResultSrcD(ResultSrcD),
    .ALUControlD(ALUControlD),
    .RD1D(RD1D),
    .RD2D(RD2D),
    .PCD(PCD),
    .ImmExtD(ImmExtD),
    .PCPlus4D(PCPlus4D),
    .InstructionD(InstructionD),
    .RegWriteE(RegWriteE),
    .MemWriteE(MemWriteE),
    .JumpE(JumpE),
    .BranchE(BranchE),
    .ALUSrcE(ALUSrcE),
    .ResultSrcE(ResultSrcE),
    .ALUControlE(ALUControlE),
    .RD1E(RD1E),
    .RD2E(RD2E),
    .PCE(PCE),
    .ImmExtE(ImmExtE),
    .PCPlus4E(PCPlus4E),
    .RdE(RdE),
    .Rs1E(Rs1E),
    .Rs2E(Rs2E)
  );
endmodule
