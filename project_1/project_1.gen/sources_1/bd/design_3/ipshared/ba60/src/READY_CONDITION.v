`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 12:25:11 PM
// Design Name: 
// Module Name: READY_CONDITION
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


module READY_CONDITION(
    input wire wfull, WR, rempty, RD, rinc,winc,
    output wire READY
    );
    assign READY = (!wfull & WR & rinc) | (!rempty & RD & winc);
    
endmodule
