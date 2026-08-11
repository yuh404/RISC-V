//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Thu Aug  6 11:26:03 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (Carry_0,
    Negative_0,
    Overflow_0,
    S10_0,
    StateDebug_0,
    clk_in1_0,
    locked_0,
    rst_0);
  output Carry_0;
  output Negative_0;
  output Overflow_0;
  input [31:0]S10_0;
  output [3:0]StateDebug_0;
  input clk_in1_0;
  output locked_0;
  input rst_0;

  wire Carry_0;
  wire Negative_0;
  wire Overflow_0;
  wire [31:0]S10_0;
  wire [3:0]StateDebug_0;
  wire clk_in1_0;
  wire locked_0;
  wire rst_0;

  design_1 design_1_i
       (.Carry_0(Carry_0),
        .Negative_0(Negative_0),
        .Overflow_0(Overflow_0),
        .S10_0(S10_0),
        .StateDebug_0(StateDebug_0),
        .clk_in1_0(clk_in1_0),
        .locked_0(locked_0),
        .rst_0(rst_0));
endmodule
