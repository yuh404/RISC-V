`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2026 10:48:31 AM
// Design Name: 
// Module Name: RISC_V_wrapper_tb
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







module RISC_V_wrapper_tb;

    logic clk_in1_0;
    logic clk_rst;
    logic pc_rst;

    wire Carry_0;
    wire Negative_0;
    wire Overflow_0;
    wire locked_0;

    RISC_V_wrapper dut (
        .Carry_0    (Carry_0),
        .Negative_0 (Negative_0),
        .Overflow_0 (Overflow_0),
        .clk_in1_0  (clk_in1_0),
        .clk_rst    (clk_rst),
        .locked_0   (locked_0),
        .pc_rst     (pc_rst)
    );

    // =========================================================
    // Clock đầu vào 100 MHz
    // Chu kỳ 10 ns, nửa chu kỳ 5 ns
    // =========================================================
    initial begin
        clk_in1_0 = 1'b0;
        forever #5 clk_in1_0 = ~clk_in1_0;
    end

    // =========================================================
    // Timeout bảo vệ: 10 us
    // =========================================================
    initial begin
        #10_000;
        $fatal(1, "TIMEOUT: Mo phong vuot qua 10 us.");
    end

    // =========================================================
    // Trình tự reset
    // =========================================================
    initial begin
        // Ban đầu reset cả Clock Wizard và PC
        clk_rst = 1'b1;
        pc_rst  = 1'b1;

        $display("================================================");
        $display("Bat dau mo phong RISC-V");
        $display("Clock Wizard va PC dang reset");
        $display("================================================");

        // Giữ reset Clock Wizard 100 ns
        #100;

        // Nhả reset Clock Wizard
        clk_rst = 1'b0;

        $display("[%0t] Da nha clk_rst, cho Clock Wizard lock.",
                 $time);

        // Chờ locked nhưng có timeout riêng
        fork
            begin : wait_lock
                wait (locked_0 === 1'b1);

                $display("[%0t] Clock Wizard da locked.",
                         $time);
            end

            begin : lock_timeout
                #5_000;

                $fatal(
                    1,
                    "Clock Wizard khong lock sau 5 us."
                );
            end
        join_any

        disable fork;

        // Clock đã ổn định, vẫn giữ PC reset thêm vài chu kỳ
        repeat (5) @(posedge clk_in1_0);

        // Nhả reset PC tại cạnh xuống để tránh trùng cạnh lên
        @(negedge clk_in1_0);
        pc_rst = 1'b0;

        $display("[%0t] Da nha pc_rst, CPU bat dau chay.",
                 $time);

        // Cho CPU chạy 100 chu kỳ clock đầu vào
        repeat (100) @(posedge clk_in1_0);

        $display("================================================");
        $display("Ket thuc mo phong");
        $display(
            "Carry=%b, Negative=%b, Overflow=%b",
            Carry_0,
            Negative_0,
            Overflow_0
        );
        $display("================================================");

        $finish;
    end

    // =========================================================
    // Theo dõi tín hiệu bên ngoài wrapper
    // =========================================================
    always @(posedge clk_in1_0) begin
        $display(
            "[%0t] clk_rst=%b pc_rst=%b locked=%b C=%b N=%b V=%b",
            $time,
            clk_rst,
            pc_rst,
            locked_0,
            Carry_0,
            Negative_0,
            Overflow_0
        );
    end

    // Theo dõi thay đổi locked
    always @(locked_0) begin
        $display(
            "[%0t] locked_0 thay doi thanh %b",
            $time,
            locked_0
        );
    end

endmodule
