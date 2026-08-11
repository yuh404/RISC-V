`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2026 03:23:47 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input wire [31:0] PC_next,
    input wire clk, rst, StallF,
    output reg [31:0] PC

    );
    
    always@(posedge clk or posedge rst) begin
    if(rst == 1) begin
        PC <= 32'h0000_8000;
        end
    else if (!StallF) begin
            PC <= PC_next;
        end
    end
endmodule
