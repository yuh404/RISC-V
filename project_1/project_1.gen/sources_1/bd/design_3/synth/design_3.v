//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Fri Jul  3 23:10:15 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_3.bd
//Design      : design_3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=1,bdsource=USER,da_clkrst_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_3.hwdef" *) 
module design_3
   (Completer_data_output_0,
    Request_data_output_0,
    addr_input_0,
    clk_com,
    clk_req,
    data_input_0,
    length_input_0,
    locked_0_0,
    locked_1_0,
    locked_com,
    locked_req,
    read_input_signal_0,
    rempty_0_0,
    rempty_1_0,
    reset_clk_com,
    reset_clk_req,
    rst_n_com,
    rst_n_req,
    wfull_0_0,
    wfull_1_0,
    wr_input_signal_0);
  output [31:0]Completer_data_output_0;
  output [31:0]Request_data_output_0;
  input [3:0]addr_input_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_COM CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_COM, CLK_DOMAIN design_3_clk_in1_1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_com;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_REQ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_REQ, CLK_DOMAIN design_3_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_req;
  input [31:0]data_input_0;
  input [3:0]length_input_0;
  output locked_0_0;
  output locked_1_0;
  output locked_com;
  output locked_req;
  input read_input_signal_0;
  output rempty_0_0;
  output rempty_1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_CLK_COM RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_CLK_COM, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_clk_com;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_CLK_REQ RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_CLK_REQ, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_clk_req;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N_COM RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N_COM, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n_com;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N_REQ RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N_REQ, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n_req;
  output wfull_0_0;
  output wfull_1_0;
  input wr_input_signal_0;

  wire [31:0]Completer_data_output_0;
  wire [31:0]Request_data_output_0;
  wire [3:0]Requester_0_addr;
  wire [3:0]Requester_0_length;
  wire Requester_0_rd;
  wire Requester_0_rdready;
  wire Requester_0_wr;
  wire [7:0]Requester_0_wrdata;
  wire [3:0]addr_input_0;
  wire clk_com;
  wire clk_req;
  wire clk_wiz_1_clk_out1;
  wire clk_wiz_clk_out1;
  wire [7:0]completer_1_0_rddata;
  wire [31:0]data_input_0;
  wire design_FIFO_test_0_READY_0;
  wire design_FIFO_test_0_rd_out_0;
  wire [7:0]design_FIFO_test_0_rdata_0;
  wire [7:0]design_FIFO_test_0_rdata_1;
  wire design_FIFO_test_0_wr_out_0;
  wire [3:0]length_input_0;
  wire locked_0_0;
  wire locked_1_0;
  wire locked_com;
  wire locked_req;
  wire read_input_signal_0;
  wire rempty_0_0;
  wire rempty_1_0;
  wire reset_clk_com;
  wire reset_clk_req;
  wire rst_n_com;
  wire rst_n_req;
  wire wfull_0_0;
  wire wfull_1_0;
  wire wr_input_signal_0;

  design_3_Requester_0_0 Requester_0
       (.Request_data_output(Request_data_output_0),
        .addr(Requester_0_addr),
        .addr_input(addr_input_0),
        .clk(clk_wiz_1_clk_out1),
        .data_input(data_input_0),
        .length(Requester_0_length),
        .length_input(length_input_0),
        .rd(Requester_0_rd),
        .rddata(design_FIFO_test_0_rdata_1),
        .rddatavalid(wfull_1_0),
        .rdready(Requester_0_rdready),
        .read_input_signal(read_input_signal_0),
        .ready(design_FIFO_test_0_READY_0),
        .rst_n(rst_n_req),
        .wr(Requester_0_wr),
        .wr_input_signal(wr_input_signal_0),
        .wrdata(Requester_0_wrdata));
  design_3_clk_wiz_0 clk_wiz
       (.clk_in1(clk_com),
        .clk_out1(clk_wiz_clk_out1),
        .locked(locked_com),
        .resetn(reset_clk_com));
  design_3_clk_wiz_1_0 clk_wiz_1
       (.clk_in1(clk_req),
        .clk_out1(clk_wiz_1_clk_out1),
        .locked(locked_req),
        .resetn(reset_clk_req));
  design_3_completer_1_0_0 completer_1_0
       (.Completer_data_output(Completer_data_output_0),
        .addr(Requester_0_addr),
        .clk(clk_wiz_clk_out1),
        .rd(design_FIFO_test_0_rd_out_0),
        .rddata(completer_1_0_rddata),
        .rst_n(rst_n_com),
        .wr(design_FIFO_test_0_wr_out_0),
        .wrdata(design_FIFO_test_0_rdata_0));
  design_3_design_FIFO_test_0_0 design_FIFO_test_0
       (.RD_0(Requester_0_rd),
        .READY_0(design_FIFO_test_0_READY_0),
        .clk_100MHz(clk_req),
        .clk_50MHz_1(clk_com),
        .length_0(Requester_0_length),
        .locked_0(locked_0_0),
        .locked_1(locked_1_0),
        .rd_out_0(design_FIFO_test_0_rd_out_0),
        .rdata_0(design_FIFO_test_0_rdata_0),
        .rdata_1(design_FIFO_test_0_rdata_1),
        .rempty_0(rempty_0_0),
        .rempty_1(rempty_1_0),
        .reset_rtl_0(reset_clk_req),
        .reset_rtl_0_0(reset_clk_com),
        .rinc_0(Requester_0_rdready),
        .rrst_n_0(rst_n_com),
        .wdata_0(Requester_0_wrdata),
        .wdata_1(completer_1_0_rddata),
        .wfull_0(wfull_0_0),
        .wfull_1(wfull_1_0),
        .winc_0(Requester_0_wr),
        .wr_out_0(design_FIFO_test_0_wr_out_0),
        .wrst_n_0(rst_n_req));
endmodule
