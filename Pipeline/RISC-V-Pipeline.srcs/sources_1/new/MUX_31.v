`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 01:40:14 PM
// Design Name: 
// Module Name: MUX_31
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


module MUX_31(
    input wire [31:0] S00, S01, S10,
    input wire [1:0] Sel,
    output wire [31:0] Src

    );
    assign Src = (Sel == 2'b10)? S10 : 
                 (Sel == 2'b01)? S01 :
                 (Sel == 2'b00)? S00 :
                 32'b0;
    
endmodule
