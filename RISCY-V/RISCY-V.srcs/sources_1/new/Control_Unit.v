`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 06:44:32 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit (
    input  wire [31:0] Instruction,

    output wire        RegWriteD,
    output wire [1:0]  ResultSrcD,
    output wire        MemWriteD,
    output wire        JumpD,
    output wire        BranchD,
    output wire [3:0]  ALUControlD,
    output wire        ALUSrcD,
    output wire [1:0]  ImmSrcD
);

    wire [1:0] ALUOp;

    Main_Decoder main_decoder_inst (
        .op        (Instruction[6:0]),

        .RegWrite  (RegWriteD),
        .ResultSrc (ResultSrcD),
        .MemWrite  (MemWriteD),
        .Jump      (JumpD),
        .Branch    (BranchD),
        .ALUSrc    (ALUSrcD),
        .ImmSrc    (ImmSrcD),
        .ALUOp     (ALUOp)
    );

    ALU_Decoder alu_decoder_inst (
        .ALUOp      (ALUOp),
        .funct3     (Instruction[14:12]),
        .funct7_5   (Instruction[30]),
        .op_5       (Instruction[5]),
        .ALUControl (ALUControlD)
    );

endmodule
