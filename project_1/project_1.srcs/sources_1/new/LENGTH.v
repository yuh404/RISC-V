`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 12:07:51 PM
// Design Name: 
// Module Name: LENGTH
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


module LENGTH (
    input wire clk,
    input wire rst_n,
    input wire RD,
    input wire WR,
    input wire rempty,
    input wire wfull,
    
    input wire [3:0] length,
    output wire rinc,
    output wire winc,
    output reg rd_out,
    output reg wr_out
);
    
    reg [3:0] mem_length;
    wire [3:0] mem_length_next;
    
    // 1. Khối Tuần tự (Sequential): Chỉ xử lý Reset và Cập nhật thanh ghi
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            mem_length <= 4'h0;
//            rd_out     <= 1'b0;
//            wr_out     <= 1'b0;
//        end else begin
//            mem_length <= mem_length_next;
            
//            // Xử lý rd_out và wr_out
//            if (RD) rd_out <= 1'b1;
//            else if (WR) wr_out <= 1'b1;
//            else begin
//                rd_out <= 1'b0; // Nên có logic hạ xuống 0 nếu không RD/WR
//                wr_out <= 1'b0;
//            end
//        end
//    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mem_length <= 4'h0;
            rd_out     <= 1'b0;
            wr_out     <= 1'b0;
        end else begin
            // Cập nhật bộ đếm như bình thường
            mem_length <= mem_length_next;
            
            // --- XỬ LÝ rd_out ---
            if (RD) begin
                rd_out <= 1'b1; // Kích hoạt khi có lệnh RD ban đầu
            end else if (mem_length_next == 4'h0) begin
                rd_out <= 1'b0; // Chỉ hạ xuống 0 khi bộ đếm chuẩn bị về chu kỳ cuối cùng
            end
            // Nếu không có RD và bộ đếm vẫn đang chạy (mem_length_next > 0), rd_out tự động giữ mức 1

            // --- XỬ LÝ wr_out ---
            if (WR) begin
                wr_out <= 1'b1; // Kích hoạt khi có lệnh WR ban đầu
            end else if (mem_length_next == 4'h0) begin
                wr_out <= 1'b0; // Chỉ hạ xuống 0 khi bộ đếm chuẩn bị về chu kỳ cuối cùng
            end
            // Nếu không có WR và bộ đếm vẫn đang chạy (mem_length_next > 0), wr_out tự động giữ mức 1
        end
    end
    
// 2. Khối Tổ hợp (Combinational): Tính toán giá trị tiếp theo
   assign mem_length_next = 
        // Trường hợp 1: Nạp độ dài mới khi rảnh rỗi (mem_length == 0) và có length đầu vào
        (mem_length == 4'h0 && length != 4'h0) ? length :
        
        // Trường hợp 2: Đang đếm (mem_length > 0)
        // - Đang ĐỌC (RD) và FIFO KHÔNG TRỐNG (!rempty)
        // - HOẶC Đang GHI (WR) và FIFO KHÔNG ĐẦY (!wfull)
        // -> Cho phép trừ đi 1
        (mem_length > 4'h0 && ( (WR && !rempty) || (RD && !wfull) )) ? (mem_length - 4'h1) :
        
        // Trường hợp 3: Tất cả các tình huống còn lại (chờ dữ liệu hoặc chờ chỗ trống)
        // -> GIỮ NGUYÊN trạng thái hiện tại (mem_length) để đợi
        mem_length;


//   assign mem_length_next = 
//        // Trường hợp 1: Nạp độ dài mới khi rảnh rỗi (mem_length == 0) và có length đầu vào
//        (mem_length == 4'h0 && length != 4'h0) ? length :
        
//        // Trường hợp 2: Đang đếm (mem_length > 0)
//        // - Đang ĐỌC (RD) và FIFO KHÔNG TRỐNG (!rempty)
//        // - HOẶC Đang GHI (WR) và FIFO KHÔNG ĐẦY (!wfull)
//        // -> Cho phép trừ đi 1
//        (mem_length > 4'h0 && ( (rd_out) || (wr_out) )) ? (mem_length - 4'h1) :
        
//        // Trường hợp 3: Tất cả các tình huống còn lại (chờ dữ liệu hoặc chờ chỗ trống)
//        // -> GIỮ NGUYÊN trạng thái hiện tại (mem_length) để đợi
//        mem_length;
        
        
        
    // 3. Tín hiệu đầu ra rinc
    // rinc sẽ tự động bằng 1 miễn là mem_length còn lớn hơn 0
    assign rinc = (mem_length > 4'h0 && !rempty && WR) ? 1'b1 : 1'b0;
    
    // Bật winc KHI VÀ CHỈ KHI: Đang có độ dài đếm > 0, đang có lệnh Ghi (WR), và FIFO không đầy
    assign winc = (mem_length > 4'h0 && !wfull && RD) ? 1'b1 : 1'b0;
    
//      assign rinc = (mem_length > 4'h0 && wr_out) ? 1'b1 : 1'b0;
    
//    // Bật winc KHI VÀ CHỈ KHI: Đang có độ dài đếm > 0, đang có lệnh Ghi (WR), và FIFO không đầy
//      assign winc = (mem_length > 4'h0 && rd_out) ? 1'b1 : 1'b0;
 
endmodule
