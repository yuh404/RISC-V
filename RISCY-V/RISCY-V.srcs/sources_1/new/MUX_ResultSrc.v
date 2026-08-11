`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 03:09:40 PM
// Design Name: 
// Module Name: MUX_ResultSrc
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


module MUX_ResultSrc(
    input  wire [1:0]  ResultSrc,
    input  wire [31:0] ALUResult,
    input  wire [31:0] ReadData,
    input  wire [31:0] PC,
    output wire [31:0] Result
);

    assign Result = (ResultSrc == 2'b00) ? ALUResult :
                    (ResultSrc == 2'b01) ? ReadData  :
                    (ResultSrc == 2'b10) ? PC   :
                                           32'b0;

endmodule
