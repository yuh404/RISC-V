`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2026 12:38:55 PM
// Design Name: 
// Module Name: AddSrc
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


module Mux_AddSrc(
    input wire [31:0] PC, ResultSrc,
    input wire AdrSrc,
    output wire [31:0] ADR

    );
    assign ADR = (AdrSrc == 1'b1)? ResultSrc : PC;
    
endmodule
