`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 10:11:35 AM
// Design Name: 
// Module Name: Register_E
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


module Register_DE(
    input wire clk, rst, FlushE,
    input wire RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcD,
    input wire [1:0] ResultSrcD,
    input wire [3:0] ALUControlD,
    input wire [31:0] RD1D, RD2D, PCD, ImmExtD, PCPlus4D, InstructionD,
    

    output reg RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE,
    output reg [1:0] ResultSrcE,
    output reg [3:0] ALUControlE,
    output reg [31:0] RD1E, RD2E, PCE, ImmExtE, PCPlus4E,
    output reg [4:0] RdE, Rs1E, Rs2E
    );
    
    wire [4:0] RdD, Rs1D, Rs2D;
    
    
    assign RdD = InstructionD[11:7];
    assign Rs1D = InstructionD[19:15];
    assign Rs2D = InstructionD[24:20];
    
    always@(posedge clk) begin
        if (rst) begin
            RegWriteE   <= 1'b0;
            MemWriteE   <= 1'b0;
            JumpE       <= 1'b0;
            BranchE     <= 1'b0;
            ALUSrcE     <= 1'b0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 3'b000;

            RD1E        <= 32'b0;
            RD2E        <= 32'b0;
            PCE         <= 32'b0;
            ImmExtE     <= 32'b0;
            PCPlus4E    <= 32'b0;

            RdE         <= 5'b0;
            Rs1E        <= 5'b0;
            Rs2E        <= 5'b0;
        end

        else if (FlushE) begin
            // Bubble: vô hiệu hóa mọi side effect
            RegWriteE   <= 1'b0;
            MemWriteE   <= 1'b0;
            JumpE       <= 1'b0;
            BranchE     <= 1'b0;
            ALUSrcE     <= 1'b0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 3'b000;

            RD1E        <= 32'b0;
            RD2E        <= 32'b0;
            PCE         <= 32'b0;
            ImmExtE     <= 32'b0;
            PCPlus4E    <= 32'b0;

            RdE         <= 5'b0;
            Rs1E        <= 5'b0;
            Rs2E        <= 5'b0;
        end

        else begin
            RegWriteE   <= RegWriteD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUSrcE     <= ALUSrcD;
            ResultSrcE  <= ResultSrcD;
            ALUControlE <= ALUControlD;

            RD1E        <= RD1D;
            RD2E        <= RD2D;
            PCE         <= PCD;
            ImmExtE     <= ImmExtD;
            PCPlus4E    <= PCPlus4D;

            RdE         <= RdD;
            Rs1E        <= Rs1D;
            Rs2E        <= Rs2D;
        end
    end
    
endmodule
