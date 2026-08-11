`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 06:52:20 PM
// Design Name: 
// Module Name: ALU_Decoder_Multicycle
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


module ALU_Decoder_Multicycle(
    input  wire [1:0] ALUOp,
    input  wire [2:0] funct3,
    input  wire       funct7_5,
    input  wire       op_5,

    output reg  [3:0] ALUControl
);

    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b0001;
    localparam ALU_OR  = 4'b0010;
    localparam ALU_AND = 4'b0011;
    localparam ALU_SLT = 4'b0101;

    always @(*) begin
        ALUControl = ALU_ADD;

        case (ALUOp)

            // Fetch, Decode, lw, sw, jal
            2'b00: begin
                ALUControl = ALU_ADD;
            end

            // beq
            2'b01: begin
                ALUControl = ALU_SUB;
            end

            // R-type hoặc I-type ALU
            2'b10: begin
                case (funct3)

                    // add, sub, addi
                    3'b000: begin
                        if (op_5 && funct7_5)
                            ALUControl = ALU_SUB;
                        else
                            ALUControl = ALU_ADD;
                    end

                    // slt
                    3'b010: begin
                        ALUControl = ALU_SLT;
                    end

                    // or
                    3'b110: begin
                        ALUControl = ALU_OR;
                    end

                    // and
                    3'b111: begin
                        ALUControl = ALU_AND;
                    end

                    default: begin
                        ALUControl = ALU_ADD;
                    end

                endcase
            end

            default: begin
                ALUControl = ALU_ADD;
            end

        endcase
    end

endmodule