`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 03:07:16 PM
// Design Name: 
// Module Name: Mux_ALUSrc
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


module Mux_ALUSrc(
    input wire ALUSrc,
    input wire [31:0] RD2, Extned,
    output wire [31:0] SrcB

    );
    assign SrcB = (ALUSrc == 1'b1)?Extned:RD2;
    
endmodule
