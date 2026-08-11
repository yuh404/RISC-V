`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 06:38:56 PM
// Design Name: 
// Module Name: Main_FSM
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


module Main_FSM(
    input  wire       clk,
    input  wire       rst,
    input  wire [6:0] op,

    output reg        PCUpdate,
    output reg        Branch,
    output reg        RegWrite,
    output reg        MemWrite,
    output reg        IRWrite,
    output reg        AdrSrc,

    output reg [1:0]  ResultSrc,
    output reg [1:0]  ALUSrcA,
    output reg [1:0]  ALUSrcB,
    output reg [1:0]  ALUOp,

    output wire [3:0] StateDebug
    );
    
     // Opcode RV32I
    localparam OP_LW    = 7'b0000011;
    localparam OP_SW    = 7'b0100011;
    localparam OP_RTYPE = 7'b0110011;
    localparam OP_BEQ   = 7'b1100011;
    localparam OP_ITYPE = 7'b0010011;
    localparam OP_JAL   = 7'b1101111;

    // Mã trạng thái
    localparam S_FETCH     = 4'd0;
    localparam S_DECODE    = 4'd1;
    localparam S_MEM_ADR   = 4'd2;
    localparam S_MEM_READ  = 4'd3;
    localparam S_MEM_WB    = 4'd4;
    localparam S_MEM_WRITE = 4'd5;
    localparam S_EXEC_R    = 4'd6;
    localparam S_ALU_WB    = 4'd7;
    localparam S_EXEC_I    = 4'd8;
    localparam S_JAL       = 4'd9;
    localparam S_BEQ       = 4'd10;

    reg [3:0] current_state;
    reg [3:0] next_state;

    assign StateDebug = current_state;
    
    always@(posedge clk or posedge rst) begin 
        if(rst) current_state <= S_FETCH;
        else current_state <= next_state;
    end
    
    // =========================================================
    // Logic chuyển trạng thái
    // =========================================================
    
always @(*) begin
        next_state = S_FETCH;

        case (current_state)

            S_FETCH: begin
                next_state = S_DECODE;
            end

            S_DECODE: begin
                case (op)
                    OP_LW,
                    OP_SW: begin
                        next_state = S_MEM_ADR;
                    end

                    OP_RTYPE: begin
                        next_state = S_EXEC_R;
                    end

                    OP_ITYPE: begin
                        next_state = S_EXEC_I;
                    end

                    OP_JAL: begin
                        next_state = S_JAL;
                    end

                    OP_BEQ: begin
                        next_state = S_BEQ;
                    end

                    default: begin
                        next_state = S_FETCH;
                    end
                endcase
            end

            S_MEM_ADR: begin
                case (op)
                    OP_LW: next_state = S_MEM_READ;
                    OP_SW: next_state = S_MEM_WRITE;

                    default: next_state = S_FETCH;
                endcase
            end

            S_MEM_READ: begin
                next_state = S_MEM_WB;
            end

            S_MEM_WB: begin
                next_state = S_FETCH;
            end

            S_MEM_WRITE: begin
                next_state = S_FETCH;
            end

            S_EXEC_R: begin
                next_state = S_ALU_WB;
            end

            S_EXEC_I: begin
                next_state = S_ALU_WB;
            end

            S_ALU_WB: begin
                next_state = S_FETCH;
            end

            /*
             * Trong S_JAL:
             * - PC nhận địa chỉ đích đang nằm trong ALUOut
             * - ALU tính OldPC + 4
             *
             * Sang S_ALU_WB, OldPC + 4 được ghi vào rd.
             */
            S_JAL: begin
                next_state = S_ALU_WB;
            end

            S_BEQ: begin
                next_state = S_FETCH;
            end

            default: begin
                next_state = S_FETCH;
            end

        endcase
    end

    // =========================================================
    // Logic đầu ra của FSM
    // =========================================================
    always @(*) begin

        // Mặc định: tất cả tín hiệu ghi đều tắt
        PCUpdate  = 1'b0;
        Branch    = 1'b0;
        RegWrite  = 1'b0;
        MemWrite  = 1'b0;
        IRWrite   = 1'b0;
        AdrSrc    = 1'b0;

        ResultSrc = 2'b00;
        ALUSrcA   = 2'b00;
        ALUSrcB   = 2'b00;
        ALUOp     = 2'b00;

        case (current_state)

            // -------------------------------------------------
            // S0: Fetch
            //
            // Instr <- Mem[PC]
            // PC    <- PC + 4
            // -------------------------------------------------
            S_FETCH: begin
                AdrSrc    = 1'b0;   // Address = PC
                IRWrite   = 1'b1;

                ALUSrcA   = 2'b00;  // SrcA = PC
                ALUSrcB   = 2'b10;  // SrcB = 4
                ALUOp     = 2'b00;  // ADD

                ResultSrc = 2'b10;  // PC lấy ALUResult trực tiếp
                PCUpdate  = 1'b1;
            end

            // -------------------------------------------------
            // S1: Decode
            //
            // ALUOut <- OldPC + ImmExt = PCTarget
            // -------------------------------------------------
            S_DECODE: begin
                ALUSrcA = 2'b01;    // OldPC
                ALUSrcB = 2'b01;    // ImmExt
                ALUOp   = 2'b00;    // ADD
            end

            // -------------------------------------------------
            // S2: Tính địa chỉ cho lw/sw
            //
            // ALUOut <- rs1 + ImmExt
            // -------------------------------------------------
            S_MEM_ADR: begin
                ALUSrcA = 2'b10;    // A = rs1
                ALUSrcB = 2'b01;    // ImmExt
                ALUOp   = 2'b00;    // ADD
            end

            // -------------------------------------------------
            // S3: Đọc Data Memory
            //
            // Data <- Memory[ALUOut]
            // -------------------------------------------------
            S_MEM_READ: begin
                AdrSrc    = 1'b1;
                ResultSrc = 2'b00;   // Result = ALUOut
            end

            // -------------------------------------------------
            // S4: Ghi dữ liệu của lw vào rd
            // -------------------------------------------------
            S_MEM_WB: begin
                ResultSrc = 2'b01;   // Result = Data/MDR
                RegWrite  = 1'b1;
            end

            // -------------------------------------------------
            // S5: sw
            //
            // Memory[ALUOut] <- B
            // -------------------------------------------------
            S_MEM_WRITE: begin
                AdrSrc    = 1'b1;
                ResultSrc = 2'b00;   // Result = ALUOut
                MemWrite  = 1'b1;
            end

            // -------------------------------------------------
            // S6: R-type
            //
            // ALUOut <- rs1 op rs2
            // -------------------------------------------------
            S_EXEC_R: begin
                ALUSrcA = 2'b10;     // A = rs1
                ALUSrcB = 2'b00;     // B = rs2
                ALUOp   = 2'b10;     // Dùng funct3/funct7
            end

            // -------------------------------------------------
            // S7: Ghi kết quả ALUOut vào rd
            // -------------------------------------------------
            S_ALU_WB: begin
                ResultSrc = 2'b00;   // Result = ALUOut
                RegWrite  = 1'b1;
            end

            // -------------------------------------------------
            // S8: I-type ALU, ví dụ addi
            //
            // ALUOut <- rs1 op ImmExt
            // -------------------------------------------------
            S_EXEC_I: begin
                ALUSrcA = 2'b10;     // A = rs1
                ALUSrcB = 2'b01;     // ImmExt
                ALUOp   = 2'b10;
            end

            // -------------------------------------------------
            // S9: jal
            //
            // PC <- ALUOut, ALUOut đang giữ PCTarget
            // ALU đồng thời tính OldPC + 4
            // -------------------------------------------------
            S_JAL: begin
                ALUSrcA   = 2'b01;   // OldPC
                ALUSrcB   = 2'b10;   // 4
                ALUOp     = 2'b00;   // ADD

                ResultSrc = 2'b00;   // PC lấy PCTarget trong ALUOut
                PCUpdate  = 1'b1;
            end

            // -------------------------------------------------
            // S10: beq
            //
            // ALUResult = rs1 - rs2
            // Nếu Zero=1 thì PC <- ALUOut
            // -------------------------------------------------
            S_BEQ: begin
                ALUSrcA   = 2'b10;   // A = rs1
                ALUSrcB   = 2'b00;   // B = rs2
                ALUOp     = 2'b01;   // SUB

                ResultSrc = 2'b00;   // PC target trong ALUOut
                Branch    = 1'b1;
            end

            default: begin
                // Giữ giá trị mặc định
            end

        endcase
    end
    
endmodule
