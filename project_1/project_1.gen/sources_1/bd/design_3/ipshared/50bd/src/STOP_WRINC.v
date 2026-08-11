`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 08:44:24 PM
// Design Name: 
// Module Name: STOP_WRINC
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


module STOP_WRINC(
    input wire wfull, wr,
    output wire winc
    );
    assign winc = ~wfull & wr;
    
endmodule
