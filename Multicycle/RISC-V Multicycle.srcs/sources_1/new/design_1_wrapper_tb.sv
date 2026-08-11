`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2026 10:51:33 AM
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
    logic        clk_in1_0;
    logic        rst_0;
    logic [31:0] S10_0;

    wire         Carry_0;
    wire         Negative_0;
    wire         Overflow_0;
    wire [3:0]   StateDebug_0;
    wire         locked_0;

    design_1_wrapper dut (
        .Carry_0      (Carry_0),
        .Negative_0   (Negative_0),
        .Overflow_0   (Overflow_0),
        .S10_0        (S10_0),
        .StateDebug_0 (StateDebug_0),
        .clk_in1_0    (clk_in1_0),
        .locked_0     (locked_0),
        .rst_0        (rst_0)
    );

    // 100 MHz input clock
    initial begin
        clk_in1_0 = 1'b0;
        forever #5 clk_in1_0 = ~clk_in1_0;
    end

    // Constant 4 for ALUSrcB = 2'b10
    initial begin
        S10_0 = 32'd4;
    end

    function automatic string state_name(input logic [3:0] state);
        case (state)
            4'd0:  state_name = "FETCH";
            4'd1:  state_name = "DECODE";
            4'd2:  state_name = "MEM_ADR";
            4'd3:  state_name = "MEM_READ";
            4'd4:  state_name = "MEM_WB";
            4'd5:  state_name = "MEM_WRITE";
            4'd6:  state_name = "EXEC_R";
            4'd7:  state_name = "ALU_WB";
            4'd8:  state_name = "EXEC_I";
            4'd9:  state_name = "JAL";
            4'd10: state_name = "BEQ";
            default: state_name = "UNKNOWN";
        endcase
    endfunction

    initial begin
        #20_000;
        $fatal(1, "TIMEOUT: simulation exceeded 20 us.");
    end

    initial begin
        rst_0 = 1'b1;

        $display("======================================================");
        $display("Start RISC-V multicycle simulation");
        $display("======================================================");

        #100;
        rst_0 = 1'b0;

        $display("[%0t ns] External reset released.", $time);

        fork
            begin : wait_for_lock
                wait (locked_0 === 1'b1);
                $display("[%0t ns] Clock Wizard locked.", $time);
            end

            begin : lock_timeout
                #10_000;
                $fatal(1, "Clock Wizard did not lock within 10 us.");
            end
        join_any
        disable fork;

        // Allow Processor System Reset to release the CPU synchronously.
        repeat (20) @(posedge clk_in1_0);
        $display("[%0t ns] Finish releasing the CPU synchronously", $time);
        // Run long enough for the entire multicycle test program.
        repeat (400) @(posedge clk_in1_0);

        $display("======================================================");
        $display("Simulation finished.");
        $display("Expected: x1=5 x2=3 x3=8 x4=2 x5=1 x6=7");
        $display("          x7=1 x8=16 x9=8 x10=10");
        $display("          x11=0x00008038 x12=12 memory[4]=8");
        $display("Final flags: C=%b N=%b V=%b",
                 Carry_0, Negative_0, Overflow_0);
        $display("======================================================");

        $finish;
    end

    always @(posedge clk_in1_0) begin
        if (locked_0 === 1'b1) begin
            $display(
                "[%0t ns] state=%0d (%s) C=%b N=%b V=%b",
                $time,
                StateDebug_0,
                state_name(StateDebug_0),
                Carry_0,
                Negative_0,
                Overflow_0
            );
        end
    end

endmodule

