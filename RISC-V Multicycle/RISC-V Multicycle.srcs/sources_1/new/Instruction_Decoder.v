`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 06:53:38 PM
// Design Name: 
// Module Name: Instruction_Decoder
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


module Instruction_Decoder(
    input  wire [6:0] op,
    output reg  [1:0] ImmSrc
);

    localparam OP_LW    = 7'b0000011;
    localparam OP_SW    = 7'b0100011;
    localparam OP_RTYPE = 7'b0110011;
    localparam OP_BEQ   = 7'b1100011;
    localparam OP_ITYPE = 7'b0010011;
    localparam OP_JAL   = 7'b1101111;

    always @(*) begin
        case (op)

            OP_LW,
            OP_ITYPE: begin
                ImmSrc = 2'b00;
            end

            OP_SW: begin
                ImmSrc = 2'b01;
            end

            OP_BEQ: begin
                ImmSrc = 2'b10;
            end

            OP_JAL: begin
                ImmSrc = 2'b11;
            end

            // R-type không sử dụng immediate
            OP_RTYPE: begin
                ImmSrc = 2'b00;
            end

            default: begin
                ImmSrc = 2'b00;
            end

        endcase
    end

endmodule
