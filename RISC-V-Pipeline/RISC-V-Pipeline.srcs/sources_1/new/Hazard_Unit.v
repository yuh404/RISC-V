`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 11:16:40 AM
// Design Name: 
// Module Name: Hazard_Unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Hazard_Unit(
    input  wire [4:0] Rs1E,
    input  wire [4:0] Rs2E,
    input  wire [4:0] RdM,
    input  wire [4:0] RdW,
    input  wire [4:0] RdE,

    input  wire [1:0] ResultSrcE,

    input  wire       RegWriteM,
    input  wire       RegWriteW,
    input  wire       PCSrcE,

    input  wire [31:0] InstructionD,

    output wire [1:0] ForwardAE,
    output wire [1:0] ForwardBE,

    output wire       StallF,
    output wire       StallD,
    output wire       FlushE,
    output wire       FlushD
);

    wire [4:0] Rs1D;
    wire [4:0] Rs2D;
    wire       lwStall;


    // =====================================================
    // Source register của instruction đang ở Decode
    // =====================================================
    assign Rs1D = InstructionD[19:15];
    assign Rs2D = InstructionD[24:20];


    // =====================================================
    // FORWARDING cho SrcA
    //
    // 00 -> RD1E
    // 01 -> ResultW
    // 10 -> ALUResultM
    // =====================================================
    assign ForwardAE =
        (RegWriteM &&
         (RdM != 5'd0) &&
         (Rs1E == RdM))
        ? 2'b10 :

        (RegWriteW &&
         (RdW != 5'd0) &&
         (Rs1E == RdW))
        ? 2'b01 :

          2'b00;


    // =====================================================
    // FORWARDING cho SrcB
    //
    // 00 -> RD2E
    // 01 -> ResultW
    // 10 -> ALUResultM
    // =====================================================
    assign ForwardBE =
        (RegWriteM &&
         (RdM != 5'd0) &&
         (Rs2E == RdM))
        ? 2'b10 :

        (RegWriteW &&
         (RdW != 5'd0) &&
         (Rs2E == RdW))
        ? 2'b01 :

          2'b00;


    // =====================================================
    // LOAD-USE HAZARD
    //
    // ResultSrcE = 01 đối với lw
    // => ResultSrcE[0] = 1
    // =====================================================
    assign lwStall =
        (RdE != 5'd0) &&
        (
            (Rs1D == RdE) ||
            (Rs2D == RdE)
        ) &&
        ResultSrcE[0];


    // =====================================================
    // STALL
    // =====================================================
    assign StallF = lwStall;
    assign StallD = lwStall;


    // =====================================================
    // FLUSH
    //
    // Branch/JAL taken:
    // PCSrcE = 1
    //
    // Load-use:
    // lwStall = 1
    // =====================================================
    assign FlushD = PCSrcE;
    assign FlushE = lwStall | PCSrcE;


endmodule
