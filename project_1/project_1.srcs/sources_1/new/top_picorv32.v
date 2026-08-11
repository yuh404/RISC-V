`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 12:51:34 PM
// Design Name: 
// Module Name: top_picorv32
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


module top_picorv32(
    input  wire clk,
    input  wire resetn,
    output reg  [7:0] led
);

    // =========================
    // PicoRV32 memory interface
    // =========================
    wire        mem_valid;
    wire        mem_instr;
    reg         mem_ready;

    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [ 3:0] mem_wstrb;

    reg  [31:0] mem_rdata;

    // =========================
    // Simple RAM
    // =========================
    reg [31:0] memory [0:1023];

    initial begin
        // Load firmware
        $readmemh("firmware.hex", memory);
    end

    // =========================
    // PicoRV32 instance
    // =========================
    picorv32 cpu (
        .clk         (clk),
        .resetn      (resetn),

        .mem_valid   (mem_valid),
        .mem_instr   (mem_instr),
        .mem_ready   (mem_ready),

        .mem_addr    (mem_addr),
        .mem_wdata   (mem_wdata),
        .mem_wstrb   (mem_wstrb),
        .mem_rdata   (mem_rdata),

        // Không dùng IRQ/QSPI
        .irq         (32'b0),
        .eoi         (),
        .trap        ()
    );

    // =========================
    // Memory map
    // =========================
    //
    // RAM  : 0x0000_0000
    // LED  : 0x4000_0000
    //
    // =========================

    always @(posedge clk) begin

        mem_ready <= 0;

        if (mem_valid && !mem_ready) begin
            mem_ready <= 1;

            // =====================
            // RAM ACCESS
            // =====================
            if (mem_addr < 4096) begin

                // READ
                mem_rdata <= memory[mem_addr[11:2]];

                // WRITE
                if (mem_wstrb[0])
                    memory[mem_addr[11:2]][7:0] <= mem_wdata[7:0];

                if (mem_wstrb[1])
                    memory[mem_addr[11:2]][15:8] <= mem_wdata[15:8];

                if (mem_wstrb[2])
                    memory[mem_addr[11:2]][23:16] <= mem_wdata[23:16];

                if (mem_wstrb[3])
                    memory[mem_addr[11:2]][31:24] <= mem_wdata[31:24];
            end

            // =====================
            // LED GPIO
            // =====================
            else if (mem_addr == 32'h4000_0000) begin

                if (|mem_wstrb)
                    led <= mem_wdata[7:0];

                mem_rdata <= {24'b0, led};
            end

            // =====================
            // DEFAULT
            // =====================
            else begin
                mem_rdata <= 32'h00000000;
            end
        end
    end

endmodule
