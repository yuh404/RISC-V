`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2026 04:01:47 PM
// Design Name: 
// Module Name: interconnect
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


module interconnect #(
    parameter DSIZE = 32,
    parameter ASIZE = 4
)(
    input wire clk_req,
    input wire clk_com,
    input wire [3:0] addr,
    input wire [3:0] length,
    input wire wr,
    input wire [3:0] wr_data,
    input wire rd,
    input wire [3:0] rddata,
    input wire rst_n_req,
    input wire rst_n_com,
    input wire rst_n,
    input wire rdready,
    
    output wire ready,
    output wire [3:0] rddata_out,
    output wire rddatavalid,
    output wire wr_out,
    
    output wire [3:0] wr_data_out,
    output wire rd_out,
    output wire [3:0] addr_out
    );
    wire [DSIZE-1:0] req_data_to_fifo, req_data_from_fifo;
    wire req_full, req_empty;
    wire req_wr_en, req_rd_en;

    wire wfull;
    wire rempty;
    wire winc;
    wire  rinc_from_length;
    assign addr_out = addr;
    
    
   LENGTH length_1(.clk(clk_completer),
    .rst_n(rst_n),
    .RD(rd),
    .WR(wr),
    .length(length),
    .rinc(rinc_from_length),
    .rd_out(rd_out),
    .wr_out(wr_out));
    
    
   fifo2 #(DSIZE, ASIZE) fifo_request( // Dữ liệu đầu ra cho bên nhận
    .wfull(wfull),             // Tín hiệu báo FIFO đầy[cite: 2]
    .rempty(),            // Tín hiệu báo FIFO trống[cite: 2]
    .wdata(wr_data), // Dữ liệu đầu vào từ bên gửi[cite: 2]
    .rdata(wr_data_out),
    .winc(winc), .wclk(clk_req), .wrst_n(rst_n_req), // Tín hiệu ghi, xung nhịp gửi, reset gửi[cite: 2]
    .rinc(rinc_from_length), .rclk(clk_com), .rrst_n(rst_n_com));
    
    
    
   fifo2 #(DSIZE, ASIZE) fifo_completer( // Dữ liệu đầu ra cho bên nhận
    .wfull(ready),             // Tín hiệu báo FIFO đầy[cite: 2]
    .rempty(rempty),            // Tín hiệu báo FIFO trống[cite: 2]
    .wdata(rddata), // Dữ liệu đầu vào từ bên gửi[cite: 2]
    .rdata(rddata_out),
    .winc(rinc_from_length), .wclk(clk_com), .wrst_n(rst_n_com), // Tín hiệu ghi, xung nhịp gửi, reset gửi[cite: 2]
    .rinc(rdready), .rclk(clk_req), .rrst_n(rst_n_req));
    
    READY_CONDITION ready_condition( .wfull(wfull), .WR(wr), .rempty(rempty), .RD(rd),
     .READY(ready));
    STOP_WRINC stop_wrinc( .wfull(wfull), .wr(wr),
     .winc(winc));
    
endmodule
