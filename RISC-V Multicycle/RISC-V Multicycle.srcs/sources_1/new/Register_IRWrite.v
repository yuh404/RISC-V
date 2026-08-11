`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2026 12:28:59 PM
// Design Name: 
// Module Name: Register_IRWrite
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


module Register_IRWrite(
    input wire clk, IRWrite,
    input wire [31:0] RD, PC,
    output reg [31:0] Instruction, OldPC

    );
    always@(posedge clk) begin
        if(IRWrite) begin Instruction <= RD; OldPC <= PC; end
    
    end
    
endmodule
