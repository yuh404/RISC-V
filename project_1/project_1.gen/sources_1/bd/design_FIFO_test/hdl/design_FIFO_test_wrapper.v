//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Fri Jul  3 23:09:48 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_FIFO_test_wrapper.bd
//Design      : design_FIFO_test_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_FIFO_test_wrapper
   (RD_0,
    READY_0,
    clk_100MHz,
    clk_50MHz_1,
    length_0,
    locked_0,
    locked_1,
    rd_out_0,
    rdata_0,
    rdata_1,
    rempty_0,
    rempty_1,
    reset_rtl_0,
    reset_rtl_0_0,
    rinc_0,
    rrst_n_0,
    wdata_0,
    wdata_1,
    wfull_0,
    wfull_1,
    winc_0,
    wr_out_0,
    wrst_n_0);
  input RD_0;
  output READY_0;
  input clk_100MHz;
  input clk_50MHz_1;
  input [3:0]length_0;
  output locked_0;
  output locked_1;
  output rd_out_0;
  output [7:0]rdata_0;
  output [7:0]rdata_1;
  output rempty_0;
  output rempty_1;
  input reset_rtl_0;
  input reset_rtl_0_0;
  input rinc_0;
  input rrst_n_0;
  input [7:0]wdata_0;
  input [7:0]wdata_1;
  output wfull_0;
  output wfull_1;
  input winc_0;
  output wr_out_0;
  input wrst_n_0;

  wire RD_0;
  wire READY_0;
  wire clk_100MHz;
  wire clk_50MHz_1;
  wire [3:0]length_0;
  wire locked_0;
  wire locked_1;
  wire rd_out_0;
  wire [7:0]rdata_0;
  wire [7:0]rdata_1;
  wire rempty_0;
  wire rempty_1;
  wire reset_rtl_0;
  wire reset_rtl_0_0;
  wire rinc_0;
  wire rrst_n_0;
  wire [7:0]wdata_0;
  wire [7:0]wdata_1;
  wire wfull_0;
  wire wfull_1;
  wire winc_0;
  wire wr_out_0;
  wire wrst_n_0;

  design_FIFO_test design_FIFO_test_i
       (.RD_0(RD_0),
        .READY_0(READY_0),
        .clk_100MHz(clk_100MHz),
        .clk_50MHz_1(clk_50MHz_1),
        .length_0(length_0),
        .locked_0(locked_0),
        .locked_1(locked_1),
        .rd_out_0(rd_out_0),
        .rdata_0(rdata_0),
        .rdata_1(rdata_1),
        .rempty_0(rempty_0),
        .rempty_1(rempty_1),
        .reset_rtl_0(reset_rtl_0),
        .reset_rtl_0_0(reset_rtl_0_0),
        .rinc_0(rinc_0),
        .rrst_n_0(rrst_n_0),
        .wdata_0(wdata_0),
        .wdata_1(wdata_1),
        .wfull_0(wfull_0),
        .wfull_1(wfull_1),
        .winc_0(winc_0),
        .wr_out_0(wr_out_0),
        .wrst_n_0(wrst_n_0));
endmodule
