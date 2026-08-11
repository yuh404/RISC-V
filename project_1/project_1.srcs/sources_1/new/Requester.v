`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 03:29:21 PM
// Design Name: 
// Module Name: Requester
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


module Requester(
    input  wire        clk,
    input  wire        rst_n,
    
    input  wire [31:0] data_input,
    input  wire [3:0]  length_input,
    input  wire [3:0]  addr_input,
    
    input  wire        read_input_signal,
    input  wire        wr_input_signal,
    
    output reg  [3:0]  addr,
    output reg  [3:0]  length,
    input  wire        ready,        
    output reg         wr,           
    output reg  [7:0]  wrdata,      // Gửi 4 bit mỗi lần
    output reg         rd,
    input  wire [7:0]  rddata,      // Nhận 4 bit mỗi lần
    input  wire        rddatavalid,  
    output reg  [31:0] Request_data_output,
    output reg         rdready
);

    reg [3:0] length_internal; 
    reg [5:0] shift;
    reg [31:0] mem ;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr      <= 0;
            rd      <= 0;
            rdready <= 0;
            addr    <= 0;
            length  <= 0;
            wrdata  <= 0;
            length_internal <= 0;
            shift   <= 0;
            Request_data_output <= 0;
            mem <= 0;
        end else begin
            // 1. Kích hoạt giao dịch GHI
            if (wr_input_signal && !wr && !rd) begin
                wr      <= 1;
                addr    <= addr_input;
                length  <= length_input;
                wrdata  <= data_input[7:0]; // Lấy 4 bit đầu tiên
                mem <= data_input;
                length_internal <= length_input;
                shift   <= 8; // Chuẩn bị dịch cho nhịp sau
            end 
            // 2. Logic xử lý khi đang GHI (Burst Write)
            else if (wr && ready) begin
                length <= 0;
                if (length_internal <= 1) begin
                    wr <= 0;
                    shift <= 0;
                    mem <= 0;
                end else begin
                    length_internal <= length_internal - 1;
                    // Lấy 4 bit tiếp theo từ dữ liệu đầu vào dựa trên shift
                    wrdata <= mem >> shift; 
                    shift  <= shift + 8;
                end
            end

            // 3. Kích hoạt giao dịch ĐỌC
            if (read_input_signal && !rd && !wr) begin
                rd      <= 1;
                rdready <= 1;
                addr    <= addr_input;
                length  <= length_input;
                length_internal <= length_input;
                shift   <= 0;
                Request_data_output <= 0; // Xóa dữ liệu cũ trước khi đọc mới
            end
            else if (rd && ready) begin 
                rd <= 0; 
            end
            
            // 4. Logic ghép dữ liệu ĐỌC (Backpressure chiều đọc)
            if (rdready && !rddatavalid) begin
                // Ghép 4 bit nhận được vào đúng vị trí trong 32-bit
                Request_data_output <= (Request_data_output<< shift) | rddata ;
                
                if (length_internal <= 1) begin
                    rdready <= 0;
                    shift   <= 0;
                end else begin
                    length_internal <= length_internal - 1;
                    shift <= shift + 8;
                end
            end
        end
    end
endmodule
