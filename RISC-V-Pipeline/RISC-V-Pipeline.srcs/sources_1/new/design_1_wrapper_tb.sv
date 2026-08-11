`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2026 04:33:18 PM
// Design Name: 
// Module Name: design_1_wrapper_tb
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


module design_1_wrapper_tb;
    reg clk_in1_0;
    reg reset_0;

    wire Carry_0;
    wire Negative_0;
    wire Overflow_0;
    wire locked_0;


    // =========================================================
    // DUT
    // =========================================================
    design_1_wrapper dut (
        .Carry_0    (Carry_0),
        .Negative_0 (Negative_0),
        .Overflow_0 (Overflow_0),
        .clk_in1_0  (clk_in1_0),
        .locked_0   (locked_0),
        .reset_0    (reset_0)
    );


    // =========================================================
    // CLOCK
    //
    // 100 MHz
    // Period = 10 ns
    // =========================================================
    initial begin
        clk_in1_0 = 1'b0;
        forever #5 clk_in1_0 = ~clk_in1_0;
    end


    // =========================================================
    // TIME FORMAT
    // =========================================================
    initial begin
        $timeformat(-9, 1, " ns", 10);
    end


    // =========================================================
    // MAIN TEST
    // =========================================================
    initial begin

        reset_0 = 1'b1;

        $display("==================================================");
        $display("     RISC-V 5-STAGE PIPELINE TEST");
        $display("==================================================");

        $display("[%0t] Assert reset", $time);


        // Giữ reset ngoài
        #100;

        reset_0 = 1'b0;

        $display("[%0t] Release external reset", $time);


        // =====================================================
        // Chờ Clock Wizard lock
        // =====================================================
        $display("[%0t] Waiting for Clock Wizard...", $time);

        wait (locked_0 === 1'b1);

        $display("[%0t] Clock Wizard LOCKED", $time);


        /*
         * Nếu bạn đang dùng Processor System Reset,
         * reset CPU có thể còn được giữ thêm vài chu kỳ
         * sau khi locked = 1.
         *
         * Cho chờ thêm một khoảng an toàn.
         */
        repeat (20) @(posedge clk_in1_0);

        $display("[%0t] Start CPU execution", $time);


        // =====================================================
        // Cho CPU chạy
        // =====================================================
        repeat (300) @(posedge clk_in1_0);


        // =====================================================
        // Expected results
        // =====================================================
        $display("");
        $display("==================================================");
        $display("Simulation finished at %0t", $time);
        $display("==================================================");

        $display("Expected Register File:");
        $display("x1  = 5");
        $display("x2  = 3");
        $display("x3  = 8");
        $display("x4  = 5");
        $display("x5  = 0");
        $display("x6  = 7");
        $display("x7  = 1");
        $display("x8  = 16");
        $display("x9  = 8");
        $display("x10 = 10");
        $display("x11 = 0x0000803C");
        $display("x12 = 12");
        $display("x13 = 13");

        $display("");

        $display("Expected Data Memory:");
        $display("memory[4] = 8");

        $display("");

        $display(
            "Final ALU flags: C=%b N=%b V=%b",
            Carry_0,
            Negative_0,
            Overflow_0
        );

        $display("==================================================");

        $finish;
    end


    // =========================================================
    // LOCK TIMEOUT
    // =========================================================
    initial begin

        #10_000;

        if (locked_0 !== 1'b1) begin
            $fatal(
                1,
                "ERROR: Clock Wizard did not lock within 10 us"
            );
        end

    end


    // =========================================================
    // GLOBAL SIMULATION TIMEOUT
    // =========================================================
    initial begin

        #20_000;

        $fatal(
            1,
            "ERROR: Simulation timeout"
        );

    end


    // =========================================================
    // MONITOR
    // =========================================================
    always @(posedge clk_in1_0) begin

        if ((reset_0 == 1'b0) &&
            (locked_0 == 1'b1)) begin

            $display(
                "[%0t] locked=%b C=%b N=%b V=%b",
                $time,
                locked_0,
                Carry_0,
                Negative_0,
                Overflow_0
            );

        end

    end

endmodule
