`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2026 06:19:14 PM
// Design Name: 
// Module Name: ALU
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


module ALU (
    input  wire [31:0] SrcA,
    input  wire [31:0] SrcB,
    input  wire [3:0]  ALUControl,

    output reg  [31:0] ALUResult,
    output reg         Carry,
    output reg         Overflow,
    output wire        Negative,
    output wire        Zero
);

    // Mã điều khiển ALU
    localparam ALU_ADD  = 4'b0000;
    localparam ALU_SUB  = 4'b0001;
    localparam ALU_AND  = 4'b0011;
    localparam ALU_OR   = 4'b0010;
    localparam ALU_XOR  = 4'b0100;
    localparam ALU_SLT  = 4'b0101;
    localparam ALU_SLTU = 4'b0110;
    localparam ALU_SLL  = 4'b0111;
    localparam ALU_SRL  = 4'b1000;
    localparam ALU_SRA  = 4'b1001;

    // Kết quả mở rộng 33 bit để lấy carry-out
    reg [32:0] ExtendedResult;

    always @(*) begin
        // Giá trị mặc định, tránh tạo latch
        ALUResult      = 32'b0;
        ExtendedResult = 33'b0;
        Carry          = 1'b0;
        Overflow       = 1'b0;

        case (ALUControl)

            // Phép cộng
            ALU_ADD: begin
                ExtendedResult =
                    {1'b0, SrcA} + {1'b0, SrcB};

                ALUResult = ExtendedResult[31:0];
                Carry     = ExtendedResult[32];

                // Hai toán hạng cùng dấu nhưng kết quả khác dấu
                Overflow =
                    (~(SrcA[31] ^ SrcB[31])) &
                     (ALUResult[31] ^ SrcA[31]);
            end

            // Phép trừ: SrcA - SrcB
            ALU_SUB: begin
                ExtendedResult =
                    {1'b0, SrcA}
                    + {1'b0, ~SrcB}
                    + 33'd1;

                ALUResult = ExtendedResult[31:0];

                // Carry = 1 nghĩa là không có borrow
                Carry = ExtendedResult[32];

                // Hai toán hạng khác dấu và kết quả khác dấu SrcA
                Overflow =
                    (SrcA[31] ^ SrcB[31]) &
                    (ALUResult[31] ^ SrcA[31]);
            end

            ALU_AND: begin
                ALUResult = SrcA & SrcB;
            end

            ALU_OR: begin
                ALUResult = SrcA | SrcB;
            end

            ALU_XOR: begin
                ALUResult = SrcA ^ SrcB;
            end

            // So sánh có dấu
            ALU_SLT: begin
                ALUResult =
                    ($signed(SrcA) < $signed(SrcB))
                    ? 32'd1
                    : 32'd0;
            end

            // So sánh không dấu
            ALU_SLTU: begin
                ALUResult =
                    (SrcA < SrcB)
                    ? 32'd1
                    : 32'd0;
            end

            // Dịch trái logic
            ALU_SLL: begin
                ALUResult = SrcA << SrcB[4:0];
            end

            // Dịch phải logic
            ALU_SRL: begin
                ALUResult = SrcA >> SrcB[4:0];
            end

            // Dịch phải số học
            ALU_SRA: begin
                ALUResult =
                    $signed(SrcA) >>> SrcB[4:0];
            end

            default: begin
                ALUResult = 32'b0;
                Carry     = 1'b0;
                Overflow  = 1'b0;
            end

        endcase
    end

    // Cờ Zero bằng 1 khi toàn bộ kết quả bằng 0
    assign Zero = (ALUResult == 32'b0);

    // Cờ Negative lấy bit cao nhất của kết quả
    assign Negative = ALUResult[31];

endmodule