`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 06:16:44 PM
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder (
    input  wire [6:0] op,

    output reg        RegWrite,
    output reg [1:0]  ImmSrc,
    output reg        ALUSrc,
    output reg        MemWrite,
    output reg [1:0]  ResultSrc,
    output reg        Branch,
    output reg [1:0]  ALUOp,
    output reg        Jump
);

   // =====================================================
    // RV32I Opcodes
    // =====================================================
    localparam OP_LW    = 7'b0000011;
    localparam OP_SW    = 7'b0100011;
    localparam OP_RTYPE = 7'b0110011;
    localparam OP_BEQ   = 7'b1100011;
    localparam OP_ITYPE = 7'b0010011;
    localparam OP_JAL   = 7'b1101111;


    always @(*) begin

        // =================================================
        // Default values
        // =================================================
        RegWrite  = 1'b0;
        ResultSrc = 2'b00;
        MemWrite  = 1'b0;
        Jump      = 1'b0;
        Branch    = 1'b0;
        ALUSrc    = 1'b0;
        ImmSrc    = 2'b00;
        ALUOp     = 2'b00;


        case (op)

            // =================================================
            // LW
            //
            // rd <- Memory[rs1 + imm]
            // =================================================
            OP_LW: begin
                RegWrite  = 1'b1;
                ResultSrc = 2'b01;   // Data Memory
                MemWrite  = 1'b0;

                Jump      = 1'b0;
                Branch    = 1'b0;

                ALUSrc    = 1'b1;    // ImmExt
                ImmSrc    = 2'b00;   // I-type

                ALUOp     = 2'b00;   // ADD
            end


            // =================================================
            // SW
            //
            // Memory[rs1 + imm] <- rs2
            // =================================================
            OP_SW: begin
                RegWrite  = 1'b0;
                ResultSrc = 2'b00;
                MemWrite  = 1'b1;

                Jump      = 1'b0;
                Branch    = 1'b0;

                ALUSrc    = 1'b1;
                ImmSrc    = 2'b01;   // S-type

                ALUOp     = 2'b00;   // ADD
            end


            // =================================================
            // R-type
            //
            // add, sub, and, or, slt...
            // =================================================
            OP_RTYPE: begin
                RegWrite  = 1'b1;
                ResultSrc = 2'b00;   // ALUResult
                MemWrite  = 1'b0;

                Jump      = 1'b0;
                Branch    = 1'b0;

                ALUSrc    = 1'b0;    // RD2
                ImmSrc    = 2'b00;   // don't care

                ALUOp     = 2'b10;   // Decode funct3/funct7
            end


            // =================================================
            // BEQ
            //
            // if (rs1 == rs2)
            //     PC <- PC + ImmExt
            // =================================================
            OP_BEQ: begin
                RegWrite  = 1'b0;
                ResultSrc = 2'b00;
                MemWrite  = 1'b0;

                Jump      = 1'b0;
                Branch    = 1'b1;

                ALUSrc    = 1'b0;    // RD2
                ImmSrc    = 2'b10;   // B-type

                ALUOp     = 2'b01;   // SUB
            end


            // =================================================
            // I-type ALU
            //
            // addi, slti, ori, andi...
            // =================================================
            OP_ITYPE: begin
                RegWrite  = 1'b1;
                ResultSrc = 2'b00;   // ALUResult
                MemWrite  = 1'b0;

                Jump      = 1'b0;
                Branch    = 1'b0;

                ALUSrc    = 1'b1;    // ImmExt
                ImmSrc    = 2'b00;   // I-type

                ALUOp     = 2'b10;
            end


            // =================================================
            // JAL
            //
            // rd <- PC + 4
            // PC <- PC + ImmExt
            // =================================================
            OP_JAL: begin
                RegWrite  = 1'b1;
                ResultSrc = 2'b10;   // PC + 4
                MemWrite  = 1'b0;

                Jump      = 1'b1;
                Branch    = 1'b0;

                ALUSrc    = 1'b0;    // don't care
                ImmSrc    = 2'b11;   // J-type

                ALUOp     = 2'b00;   // don't care
            end


            default: begin
                RegWrite  = 1'b0;
                ResultSrc = 2'b00;
                MemWrite  = 1'b0;
                Jump      = 1'b0;
                Branch    = 1'b0;
                ALUSrc    = 1'b0;
                ImmSrc    = 2'b00;
                ALUOp     = 2'b00;
            end

        endcase
    end

endmodule
