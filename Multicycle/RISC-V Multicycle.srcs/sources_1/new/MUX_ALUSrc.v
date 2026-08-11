`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2026 12:50:07 PM
// Design Name: 
// Module Name: MUX_ALUSrc
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


module MUX_ALUSrc(
    input wire [31:0] S00, S01, S10,
    input wire [1:0] ALUSrc,
    output wire [31:0] Src

    );
    assign Src = (ALUSrc == 2'b10)? S10 : 
                 (ALUSrc == 2'b01)? S01 :
                 (ALUSrc == 2'b00)? S00 :
                 32'b0;
    
endmodule
