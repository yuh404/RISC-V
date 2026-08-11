`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 10:06:29 AM
// Design Name: 
// Module Name: Register_D
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


module Register_FD(
    input wire [31:0] RD, PCF, PCPlus4F,
    input wire clk, StallD, FlushD, rst,
    output reg [31:0] InstructionD, PCD, PCPlus4D

    );
    
    always@(posedge clk) begin
        if (rst) begin
            InstructionD <= 32'h0000_0013; // NOP: addi x0,x0,0
            PCD          <= 32'b0;
            PCPlus4D     <= 32'b0;
        end

        else if (FlushD) begin
            InstructionD <= 32'h0000_0013;
            PCD          <= 32'b0;
            PCPlus4D     <= 32'b0;
        end

        else if (!StallD) begin
            InstructionD <= RD;
            PCD          <= PCF;
            PCPlus4D     <= PCPlus4F;
        end
    end
    
endmodule
