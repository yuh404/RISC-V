`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 10:35:48 AM
// Design Name: 
// Module Name: Register_MW
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


module Register_MW(
    input wire clk, rst,
    input wire RegWriteM, 
    input wire [1:0] ResultSrcM,
    input wire [31:0] ALUResultM, RD, PCPlus4M, 
    input  wire [4:0]  RdM,
    
    output reg RegWriteW, 
    output reg [1:0] ResultSrcW,
    output reg [31:0] ALUResultW, RDOUT, PCPlus4W,
    output reg  [4:0]  RdW

    );

    
    always@(posedge clk) begin
        if (rst) begin
            RegWriteW  <= 1'b0;
            ResultSrcW <= 2'b00;

            ALUResultW <= 32'b0;
            RDOUT        <= 32'b0;
            PCPlus4W   <= 32'b0;
            RdW        <= 5'b0;
        end
        else begin
            RegWriteW  <= RegWriteM;
            ResultSrcW <= ResultSrcM;

            ALUResultW <= ALUResultM;
            RDOUT        <= RD;
            PCPlus4W   <= PCPlus4M;
            RdW        <= RdM;
        end
    end
    
endmodule
