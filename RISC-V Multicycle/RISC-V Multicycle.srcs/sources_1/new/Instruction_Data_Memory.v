`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2026 11:51:30 AM
// Design Name: 
// Module Name: Instruction_Data_Memory
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


module Instruction_Data_Memory(
    input  wire        clk,
    input  wire        WE,
    input  wire [31:0] Address,
    input  wire [31:0] WD,

    output wire [31:0] RD
    );
    
    reg [31:0] memory [0:16383];
    wire [13:0] word_index;
    
    integer i;
    
    assign word_index = Address[15:2];
    assign RD = memory[word_index];
    
    always@(posedge clk) begin
        if(WE) memory[word_index] <= WD;
    
    end
    
    initial begin
    for (i = 0; i < 16384; i=i+1) 
            memory[i] = 32'b0; 
        end
    
endmodule
