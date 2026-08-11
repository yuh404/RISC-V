`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2026 08:49:43 PM
// Design Name: 
// Module Name: reset_bridge
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


module reset_bridge(
    input  wire clk,      // clk_out1 từ Clock Wizard
    input  wire rst_n,    // Nút nhấn reset ngoài (Active Low)
    input  wire locked,   // Tín hiệu locked từ Clock Wizard
    output reg  sys_rst_n // Reset tổng cho hệ thống
);
    reg rst_stage1;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rst_stage1 <= 1'b0;
            sys_rst_n  <= 1'b0;
        end else begin
            // Chỉ giải phóng reset khi locked đã lên 1
            rst_stage1 <= locked;
            sys_rst_n  <= rst_stage1;
        end
    end
endmodule