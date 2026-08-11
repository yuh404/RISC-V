`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2026 03:15:36 PM
// Design Name: 
// Module Name: PC_counter
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


module PC_counter(
    input wire [31:0] PC,
    output wire [31:0] PC_next
    );
    
    assign PC_next = PC + 32'd4;
endmodule
