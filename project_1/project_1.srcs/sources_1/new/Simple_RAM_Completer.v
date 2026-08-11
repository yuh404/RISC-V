`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 03:09:27 PM
// Design Name: 
// Module Name: Simple_RAM_Completer
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


module Simple_RAM_Completer #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  wire                   clk,
    input  wire                   rst_n,

    // Giao diện Bus (Theo mô tả của bạn)
    input  wire [31:0]            addr,
    input  wire                   wr,         // Write Enable từ Requestor
    input  wire [DATA_WIDTH-1:0]  wrdata,     // Dữ liệu ghi
    input  wire                   rd,         // Read Request từ Requestor
    input  wire                   rddata_ready, // Requestor sẵn sàng nhận (Backpressure)
    
    output reg [DATA_WIDTH-1:0]   rddata,     // Dữ liệu đọc trả về
    output reg                    rddata_valid, // Completer báo dữ liệu đọc hợp lệ
    output wire                   ready       // Completer báo sẵn sàng nhận lệnh/ghi
);

    // Bộ nhớ nội bộ
    reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];
    
    // 1. Cơ chế Ready: Luôn sẵn sàng trừ khi đang Reset
    assign ready = rst_n;

    // 2. Logic Ghi (Write Phase) với Backpressure
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Khởi tạo bộ nhớ nếu cần (tùy chọn)
        end else if (wr && ready) begin
            // Chỉ ghi khi Requestor đưa WR lên cao VÀ Completer đang READY
            mem[addr[ADDR_WIDTH-1:0]] <= wrdata;
        end
    end

    // 3. Logic Đọc (Read Phase) với Backpressure
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rddata <= 0;
            rddata_valid <= 0;
        end else begin
            if (rd && ready) begin
                // Bắt đầu một giao dịch đọc mới
                rddata <= mem[addr[ADDR_WIDTH-1:0]];
                rddata_valid <= 1'b1;
            end 
            else if (rddata_valid && !rddata_ready) begin
                // BACKPRESSURE: Dữ liệu đã sẵn sàng nhưng Requestor chưa muốn lấy
                // Giữ nguyên rddata và rddata_valid cho đến khi rddata_ready = 1
                rddata_valid <= 1'b1;
            end 
            else begin
                // Giao dịch kết thúc hoặc không có yêu cầu mới
                rddata_valid <= 1'b0;
            end
        end
    end

endmodule
