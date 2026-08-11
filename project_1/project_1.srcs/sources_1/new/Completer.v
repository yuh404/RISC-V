`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 03:30:30 PM
// Design Name: 
// Module Name: Completer
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


module Completer(
    input  wire        clk,
    input  wire        rst_n,
    
    input  wire [3:0]  addr,
    output wire        ready,        // Ready = 0 khi đang bận xử lý Burst
    input  wire [3:0]  length,
    input  wire        wr,
    input  wire [3:0]  wrdata,
    input  wire        rd,
    output reg  [3:0]  rddata,
    output reg         rddatavalid,
    output wire [31:0] Completer_data_output,  
    input  wire        rdready       
);

    reg [31:0] mem;
    reg [3:0]  length_internal;
    reg [3:0]  addr_ptr;
    reg        is_reading; // Cờ báo đang bận trong chu kỳ đọc burst

    // Ready thấp khi đang trong trạng thái đọc Burst (đang bận trả data dần dần)
    assign ready = rst_n && !is_reading;
    assign Completer_data_output = mem;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rddata          <= 4'h0;
            rddatavalid     <= 1'b0;
            length_internal <= 0;
            addr_ptr        <= 0;
            mem             <= 32'h0;
            is_reading      <= 1'b0;
        end else begin
            
            // --- LOGIC GHI (WRITE) ---
            // Tự động tăng địa chỉ mỗi lần có data mới (wr = 1)
            if (wr && ready) begin
                // Nếu nhịp đầu tiên của wr (vừa thoát rảnh), bắt đầu từ addr của requester
                // Những nhịp sau đó wr vẫn cao thì dùng addr_ptr tự tăng
                if (addr_ptr == 0 && !is_reading) begin
                     mem <= mem | (wrdata << (addr * 4));
                     addr_ptr <= addr + 1;
                end else begin
                     
                     if (addr_ptr >= 8) addr_ptr <= 0; // Tràn thì quay về 0
                     else begin addr_ptr <= addr_ptr + 1; mem <= mem | (wrdata << (addr_ptr * 4)); end
                end
            end 
            // Nếu requester ngừng gửi (wr=0) và không bận đọc, reset con trỏ ghi
            else if (!wr && !is_reading) begin
                addr_ptr <= 0;
            end

            // --- LOGIC ĐỌC (READ) ---
            if (rd && ready) begin
                rddata          <= mem >> (addr * 4);
                rddatavalid     <= 1'b1;
                addr_ptr        <= addr + 1;
                length_internal <= length;
                is_reading      <= 1'b1; // Kéo bận Ready
            end 
            else if (rddatavalid && rdready) begin
                if (length_internal == 0 || addr_ptr > 7) begin
                    rddatavalid     <= 1'b0;
                    is_reading      <= 1'b0; // Giải phóng Ready
                    addr_ptr        <= 0;
                end else begin
                    rddata          <= mem >> (addr_ptr * 4);
                    addr_ptr        <= addr_ptr + 1;
                    length_internal <= length_internal - 1;
                    rddatavalid     <= 1'b1;
                end
            end
            else if (!rdready && rddatavalid) begin
                // Backpressure: Giữ nguyên dữ liệu
                rddatavalid <= 1'b1;
            end
        end
    end
endmodule
