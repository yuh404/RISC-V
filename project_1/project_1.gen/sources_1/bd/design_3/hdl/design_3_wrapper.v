//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Fri Jul  3 23:10:15 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_3_wrapper.bd
//Design      : design_3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_3_wrapper
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
  input clk_com;
  input clk_req;
  input [31:0]data_input_0;
  input [3:0]length_input_0;
  output locked_0_0;
  output locked_1_0;
  output locked_com;
  output locked_req;
  input read_input_signal_0;
  output rempty_0_0;
  output rempty_1_0;
  input reset_clk_com;
  input reset_clk_req;
  input rst_n_com;
  input rst_n_req;
  output wfull_0_0;
  output wfull_1_0;
  input wr_input_signal_0;

  wire [31:0]Completer_data_output_0;
  wire [31:0]Request_data_output_0;
  wire [3:0]addr_input_0;
  wire clk_com;
  wire clk_req;
  wire [31:0]data_input_0;
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

  design_3 design_3_i
       (.Completer_data_output_0(Completer_data_output_0),
        .Request_data_output_0(Request_data_output_0),
        .addr_input_0(addr_input_0),
        .clk_com(clk_com),
        .clk_req(clk_req),
        .data_input_0(data_input_0),
        .length_input_0(length_input_0),
        .locked_0_0(locked_0_0),
        .locked_1_0(locked_1_0),
        .locked_com(locked_com),
        .locked_req(locked_req),
        .read_input_signal_0(read_input_signal_0),
        .rempty_0_0(rempty_0_0),
        .rempty_1_0(rempty_1_0),
        .reset_clk_com(reset_clk_com),
        .reset_clk_req(reset_clk_req),
        .rst_n_com(rst_n_com),
        .rst_n_req(rst_n_req),
        .wfull_0_0(wfull_0_0),
        .wfull_1_0(wfull_1_0),
        .wr_input_signal_0(wr_input_signal_0));
endmodule
