`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 06:54:27 PM
// Design Name: 
// Module Name: Multicycle_Control_Unit
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


module Multicycle_Control_Unit(
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] Instruction,
    input  wire        Zero,

    output wire        PCWrite,
    output wire        AdrSrc,
    output wire        MemWrite,
    output wire        IRWrite,
    output wire        RegWrite,

    output wire [1:0]  ResultSrc,
    output wire [1:0]  ALUSrcA,
    output wire [1:0]  ALUSrcB,
    output wire [1:0]  ImmSrc,

    output wire [3:0]  ALUControl,
    output wire [3:0]  StateDebug
);

    wire [6:0] op;
    wire [2:0] funct3;
    wire       funct7_5;
    wire       op_5;

    wire       PCUpdate;
    wire       Branch;
    wire [1:0] ALUOp;

    assign op       = Instruction[6:0];
    assign funct3   = Instruction[14:12];
    assign funct7_5 = Instruction[30];
    assign op_5     = Instruction[5];

    // =========================================================
    // Main FSM
    // =========================================================
    Main_FSM main_fsm_inst (
        .clk        (clk),
        .rst        (rst),
        .op         (op),

        .PCUpdate   (PCUpdate),
        .Branch     (Branch),
        .RegWrite   (RegWrite),
        .MemWrite   (MemWrite),
        .IRWrite    (IRWrite),
        .AdrSrc     (AdrSrc),

        .ResultSrc  (ResultSrc),
        .ALUSrcA    (ALUSrcA),
        .ALUSrcB    (ALUSrcB),
        .ALUOp      (ALUOp),

        .StateDebug (StateDebug)
    );

    // =========================================================
    // Immediate Decoder
    // =========================================================
    Instruction_Decoder instr_decoder_inst (
        .op     (op),
        .ImmSrc (ImmSrc)
    );

    // =========================================================
    // ALU Decoder
    // =========================================================
    ALU_Decoder_Multicycle alu_decoder_inst (
        .ALUOp      (ALUOp),
        .funct3     (funct3),
        .funct7_5   (funct7_5),
        .op_5       (op_5),
        .ALUControl (ALUControl)
    );

    // =========================================================
    // PC enable logic
    //
    // Fetch/JAL:
    // PCUpdate = 1 → luôn ghi PC
    //
    // BEQ:
    // Branch = 1 và Zero = 1 → ghi PC
    // =========================================================
    assign PCWrite = PCUpdate | (Branch & Zero);

endmodule
