`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 10:18:33 AM
// Design Name: 
// Module Name: Register_EM
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


module Register_EM(
    input wire clk, rst,
    input wire RegWriteE, MemWriteE,
    input wire [1:0] ResultSrcE,
    input wire [31:0] ALUResultE, WriteDataE, PCPlus4E, 
    input  wire [4:0]  RdE,
    
    output reg RegWriteM, MemWriteM,
    output reg [1:0] ResultSrcM,
    output reg [31:0] ALUResultM, WriteDataM, PCPlus4M,
    output reg  [4:0]  RdM

    );
    
    
    
    
    always@(posedge clk )begin
        if (rst) begin
            RegWriteM  <= 1'b0;
            MemWriteM  <= 1'b0;
            ResultSrcM <= 2'b00;

            ALUResultM <= 32'b0;
            WriteDataM <= 32'b0;
            PCPlus4M   <= 32'b0;
            RdM        <= 5'b0;
        end
        else begin
            RegWriteM  <= RegWriteE;
            MemWriteM  <= MemWriteE;
            ResultSrcM <= ResultSrcE;

            ALUResultM <= ALUResultE;
            WriteDataM <= WriteDataE;
            PCPlus4M   <= PCPlus4E;
            RdM        <= RdE;
        end
    end
    
endmodule
