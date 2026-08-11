`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 02:38:01 PM
// Design Name: 
// Module Name: Extend
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


module Extend(
    input wire [31:0] Instruction,
    input wire [1:0]ImmSrc,
    output wire [31:0] ImmExt

    );
    assign ImmExt= (ImmSrc == 2'b10)?{{19{Instruction[31]}},Instruction[31],Instruction[7],Instruction[30:25],Instruction[11:8],1'b0}
                :(ImmSrc == 2'b01)?{{20{Instruction[31]}},Instruction[31:25],Instruction[11:7]}
                :(ImmSrc == 2'b00)?{{20{Instruction[31]}},Instruction[31:20]}
                :(ImmSrc == 2'b11)?{{12{Instruction[31]}},Instruction[19:12],Instruction[20],Instruction[30:21],1'b0}:32'b0;
    
        
endmodule
