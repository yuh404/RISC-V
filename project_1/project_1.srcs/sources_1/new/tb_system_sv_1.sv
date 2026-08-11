`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2026 01:24:11 PM
// Design Name: 
// Module Name: tb_system_sv_1
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

interface bus_if(input logic clk);
    logic [31:0] data_in;
    logic [3:0]  len_in;
    logic [3:0]  addr_in;
    logic        rd_sig;
    logic        wr_sig;

    logic [3:0]  addr;
    logic [3:0]  length;
    logic        ready;
    logic        wr;
    logic [3:0]  wrdata;
    logic        rd;
    logic [3:0]  rddata;
    logic        rddatavalid;
    logic        rdready;
    
    logic [31:0] req_out;
    logic [31:0] comp_mem_monitor;
endinterface


module tb_system_sv_1(

    );
endmodule
