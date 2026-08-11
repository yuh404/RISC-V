//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Sat Jun 27 14:10:54 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_FIFO_test.bd
//Design      : design_FIFO_test
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_FIFO_test,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_FIFO_test,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_board_cnt=4,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_FIFO_test.hwdef" *) 
module design_FIFO_test
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_FIFO_test_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_50MHZ_1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_50MHZ_1, CLK_DOMAIN design_FIFO_test_clk_100MHz_1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_50MHz_1;
  input [3:0]length_0;
  output locked_0;
  output locked_1;
  output rd_out_0;
  output [7:0]rdata_0;
  output [7:0]rdata_1;
  output rempty_0;
  output rempty_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL_0_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_rtl_0_0;
  input rinc_0;
  input rrst_n_0;
  input [7:0]wdata_0;
  input [7:0]wdata_1;
  output wfull_0;
  output wfull_1;
  input winc_0;
  output wr_out_0;
  input wrst_n_0;

  wire LENGTH_0_rinc;
  wire LENGTH_0_winc;
  wire RD_0;
  wire READY_0;
  wire STOP_WRINC_0_winc;
  wire clk_100MHz;
  wire clk_50MHz_1;
  wire clk_wiz_com_clk_out1;
  wire clk_wiz_req_clk_out1;
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

  design_FIFO_test_LENGTH_0_0 LENGTH_0
       (.RD(RD_0),
        .WR(winc_0),
        .clk(clk_wiz_com_clk_out1),
        .length(length_0),
        .rd_out(rd_out_0),
        .rempty(rempty_0),
        .rinc(LENGTH_0_rinc),
        .rst_n(wrst_n_0),
        .wfull(wfull_1),
        .winc(LENGTH_0_winc),
        .wr_out(wr_out_0));
  design_FIFO_test_READY_CONDITION_0_0 READY_CONDITION_0
       (.RD(RD_0),
        .READY(READY_0),
        .WR(winc_0),
        .rempty(rempty_1),
        .rinc(LENGTH_0_rinc),
        .wfull(wfull_0),
        .winc(LENGTH_0_winc));
  design_FIFO_test_STOP_WRINC_0_0 STOP_WRINC_0
       (.wfull(wfull_0),
        .winc(STOP_WRINC_0_winc),
        .wr(winc_0));
  design_FIFO_test_clk_wiz_1_0 clk_wiz_com
       (.clk_in1(clk_50MHz_1),
        .clk_out1(clk_wiz_com_clk_out1),
        .locked(locked_1),
        .resetn(reset_rtl_0_0));
  design_FIFO_test_clk_wiz_0_0 clk_wiz_req
       (.clk_in1(clk_100MHz),
        .clk_out1(clk_wiz_req_clk_out1),
        .locked(locked_0),
        .resetn(reset_rtl_0));
  design_FIFO_test_fifo2_0_0 fifo2_0
       (.rclk(clk_wiz_com_clk_out1),
        .rdata(rdata_0),
        .rempty(rempty_0),
        .rinc(LENGTH_0_rinc),
        .rrst_n(rrst_n_0),
        .wclk(clk_wiz_req_clk_out1),
        .wdata(wdata_0),
        .wfull(wfull_0),
        .winc(STOP_WRINC_0_winc),
        .wrst_n(wrst_n_0));
  design_FIFO_test_fifo2_1_0 fifo2_1
       (.rclk(clk_100MHz),
        .rdata(rdata_1),
        .rempty(rempty_1),
        .rinc(rinc_0),
        .rrst_n(rrst_n_0),
        .wclk(clk_50MHz_1),
        .wdata(wdata_1),
        .wfull(wfull_1),
        .winc(LENGTH_0_winc),
        .wrst_n(wrst_n_0));
endmodule
