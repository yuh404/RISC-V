`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2026 02:24:47 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File (
    input  wire        RegWrite,
    input  wire        clk,
    input  wire [31:0] Instruction,
    input  wire [31:0] WD3,
    input  wire [4:0]   A3,

    output wire [31:0] RD1,
    output wire [31:0] RD2
);

    wire [4:0] A1;
    wire [4:0] A2;
    

    reg [31:0] registers [0:31];

    assign A1 = Instruction[19:15];
    assign A2 = Instruction[24:20];
    

    assign RD1 = (A1 == 5'd0)
               ? 32'b0
               : registers[A1];

    assign RD2 = (A2 == 5'd0)
               ? 32'b0
               : registers[A2];

    always @(negedge clk) begin
        if (RegWrite && A3 != 5'd0)
            registers[A3] <= WD3;
    end

endmodule
