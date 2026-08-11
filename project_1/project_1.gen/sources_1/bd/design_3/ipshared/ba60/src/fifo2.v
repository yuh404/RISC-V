`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2026 03:18:36 PM
// Design Name: 
// Module Name: fifo2
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


// Module chính kết nối các thành phần của FIFO
module fifo2 #(
    parameter DSIZE = 8, // Độ rộng dữ liệu (ví dụ: 8-bit hoặc 32-bit)
    parameter ASIZE = 4  // Độ rộng địa chỉ (2^4 = 16 ô nhớ)
)(
    output [DSIZE-1:0] rdata, // Dữ liệu đầu ra cho bên nhận
    output wfull,             // Tín hiệu báo FIFO đầy[cite: 2]
    output rempty,            // Tín hiệu báo FIFO trống[cite: 2]
    input  [DSIZE-1:0] wdata, // Dữ liệu đầu vào từ bên gửi[cite: 2]
    input  winc, wclk, wrst_n, // Tín hiệu ghi, xung nhịp gửi, reset gửi[cite: 2]
    input  rinc, rclk, rrst_n  // Tín hiệu đọc, xung nhịp nhận, reset nhận[cite: 2]
);
    wire [ASIZE-1:0] wptr, rptr;
    wire aempty_n, afull_n;

    // Khối so sánh không đồng bộ để xác định trạng thái[cite: 2]
    async_cmp #(ASIZE) async_cmp_inst (
        .aempty_n(aempty_n), .afull_n(afull_n),
        .wptr(wptr), .rptr(rptr), .wrst_n(wrst_n)
    );

    // Khối bộ nhớ lưu trữ dữ liệu[cite: 2]
    fifomem #(DSIZE, ASIZE) fifomem_inst (
        .rdata(rdata), .wdata(wdata),
        .waddr(wptr), .raddr(rptr),
        .wclken(winc), .wclk(wclk)
    );

    // Quản lý con trỏ đọc và trạng thái trống[cite: 2]
    rptr_empty #(ASIZE) rptr_empty_inst (
        .rempty(rempty), .rptr(rptr),
        .aempty_n(aempty_n), .rinc(rinc),
        .rclk(rclk), .rrst_n(rrst_n)
    );

    // Quản lý con trỏ ghi và trạng thái đầy[cite: 2]
    wptr_full #(ASIZE) wptr_full_inst (
        .wfull(wfull), .wptr(wptr),
        .afull_n(afull_n), .winc(winc),
        .wclk(wclk), .wrst_n(wrst_n)
    );
endmodule

// Module bộ nhớ Dual-Port RAM[cite: 2]
module fifomem #(parameter DATASIZE = 8, parameter ADDRSIZE = 4) (
    output [DATASIZE-1:0] rdata,
    input  [DATASIZE-1:0] wdata,
    input  [ADDRSIZE-1:0] waddr, raddr,
    input  wclken, wclk
);
    localparam DEPTH = 1 << ADDRSIZE;
    reg [DATASIZE-1:0] MEM [0:DEPTH-1];

    assign rdata = MEM[raddr];

    always @(posedge wclk)
        if (wclken) MEM[waddr] <= wdata;
endmodule

// Khối so sánh trạng thái đầy/trống dựa trên mã Gray[cite: 2]
module async_cmp #(parameter ADDRSIZE = 4) (
    output aempty_n, afull_n,
    input [ADDRSIZE-1:0] wptr, rptr,
    input wrst_n
);
    localparam N = ADDRSIZE-1;
    reg direction;
    wire high = 1'b1;

    // Xác định hướng di chuyển của con trỏ để phân biệt đầy/trống[cite: 2]
    wire dirset_n = ~( (wptr[N]^rptr[N-1]) & ~(wptr[N-1]^rptr[N]));
    wire dirclr_n = ~((~(wptr[N]^rptr[N-1]) & (wptr[N-1]^rptr[N])) | ~wrst_n);

    always @(posedge high or negedge dirset_n or negedge dirclr_n)
        if (!dirclr_n) direction <= 1'b0;
        else if (!dirset_n) direction <= 1'b1;
        else direction <= high;

    assign aempty_n = ~((wptr == rptr) && !direction);
    assign afull_n  = ~((wptr == rptr) &&  direction);
endmodule

// Quản lý con trỏ đọc (Read Pointer)[cite: 2]
module rptr_empty #(parameter ADDRSIZE = 4) (
    output reg rempty,
    output reg [ADDRSIZE-1:0] rptr,
    input aempty_n, rinc, rclk, rrst_n
);
    reg [ADDRSIZE-1:0] rbin;
    reg rempty2;
    wire [ADDRSIZE-1:0] rgnext, rbnext;

    always @(posedge rclk or negedge rrst_n)
        if (!rrst_n) begin rbin <= 0; rptr <= 0; end
        else begin rbin <= rbnext; rptr <= rgnext; end

    assign rbnext = !rempty ? rbin + rinc : rbin;
    assign rgnext = (rbnext >> 1) ^ rbnext; // Chuyển sang mã Gray[cite: 2]

    always @(posedge rclk or negedge aempty_n)
        if (!aempty_n) {rempty, rempty2} <= 2'b11;
        else {rempty, rempty2} <= {rempty2, ~aempty_n};
endmodule

// Quản lý con trỏ ghi (Write Pointer)[cite: 2]
module wptr_full #(parameter ADDRSIZE = 4) (
    output reg wfull,
    output reg [ADDRSIZE-1:0] wptr,
    input afull_n, winc, wclk, wrst_n
);
    reg [ADDRSIZE-1:0] wbin;
    reg wfull2;
    wire [ADDRSIZE-1:0] wgnext, wbnext;

    always @(posedge wclk or negedge wrst_n)
        if (!wrst_n) begin wbin <= 0; wptr <= 0; end
        else begin wbin <= wbnext; wptr <= wgnext; end

    assign wbnext = !wfull ? wbin + winc : wbin;
    assign wgnext = (wbnext >> 1) ^ wbnext; // Chuyển sang mã Gray[cite: 2]

    always @(posedge wclk or negedge wrst_n or negedge afull_n)
        if (!wrst_n) {wfull, wfull2} <= 2'b00;
        else if (!afull_n) {wfull, wfull2} <= 2'b11;
        else {wfull, wfull2} <= {wfull2, ~afull_n};
endmodule
