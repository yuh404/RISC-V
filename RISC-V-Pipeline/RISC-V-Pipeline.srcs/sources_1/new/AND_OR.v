`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 02:11:32 PM
// Design Name: 
// Module Name: AND_OR
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


module AND_OR(
    input wire ZeroE, BranchE, JumpE,
    output wire PCSrcE

    );
    assign PCSrcE = (ZeroE & BranchE) | JumpE;
    
endmodule
