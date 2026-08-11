`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 03:23:24 PM
// Design Name: 
// Module Name: MUX_PC
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


module MUX_PC(
    input wire [31:0] PCPlus4, PCTarget,
    input wire PCSrc,
    output wire [31:0] PCNext

    );
    assign PCNext = (PCSrc == 1'b1)? PCTarget: PCPlus4;
    
endmodule
