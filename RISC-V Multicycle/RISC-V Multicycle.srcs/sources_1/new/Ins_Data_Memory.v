`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 07:02:38 PM
// Design Name: 
// Module Name: Ins_Data_Memory
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


module Ins_Data_Memory(
    input  wire        clk,
    input  wire        WE,
    input  wire [31:0] Address,
    input  wire [31:0] WD,

    output wire [31:0] RD
);

    // 16384 word × 32 bit = 64 KiB
    reg [31:0] memory [0:16383];

    // Địa chỉ của một word trong mảng
    wire [13:0] word_index;

    integer i;

    /*
     * Address là địa chỉ byte.
     * Mỗi phần tử memory[] rộng 4 byte nên bỏ Address[1:0].
     *
     * Address = 0x0000_0000 → memory[0]
     * Address = 0x0000_0004 → memory[1]
     * Address = 0x0000_0010 → memory[4]
     * Address = 0x0000_8000 → memory[8192]
     */
    assign word_index = Address[15:2];

    // Đọc tổ hợp
    assign RD = memory[word_index];

    // Ghi đồng bộ tại cạnh lên clock
    always @(posedge clk) begin
        if (WE)
            memory[word_index] <= WD;
    end

    
    
    initial begin
        for (i = 0; i < 16384; i = i + 1)
            memory[i] = 32'h0000_0000;

        memory[8192] = 32'h0050_0093; // addi x1, x0, 5
        memory[8193] = 32'h0030_0113; // addi x2, x0, 3
        memory[8194] = 32'h0020_81B3; // add  x3, x1, x2
        memory[8195] = 32'h4020_8233; // sub  x4, x1, x2
        memory[8196] = 32'h0020_F2B3; // and  x5, x1, x2
        memory[8197] = 32'h0020_E333; // or   x6, x1, x2
        memory[8198] = 32'h0011_23B3; // slt  x7, x2, x1
        memory[8199] = 32'h0100_0413; // addi x8, x0, 16
        memory[8200] = 32'h0034_2023; // sw   x3, 0(x8)
        memory[8201] = 32'h0004_2483; // lw   x9, 0(x8)
        memory[8202] = 32'h0034_8463; // beq  x9, x3, +8
        memory[8203] = 32'h0630_0513; // addi x10, x0, 99 (skip)
        memory[8204] = 32'h00A0_0513; // addi x10, x0, 10
        memory[8205] = 32'h0080_05EF; // jal  x11, +8
        memory[8206] = 32'h0630_0613; // addi x12, x0, 99 (skip)
        memory[8207] = 32'h00C0_0613; // addi x12, x0, 12
        memory[8208] = 32'h0000_0063; // beq  x0, x0, 0
    end
    
endmodule
