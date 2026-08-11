//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
//Date        : Mon Aug  3 12:15:44 2026
//Host        : vanhuy running 64-bit major release  (build 9200)
//Command     : generate_target RISC_V_wrapper.bd
//Design      : RISC_V_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module RISC_V_wrapper
   (Carry_0,
    Negative_0,
    Overflow_0,
    clk_in1_0,
    clk_rst,
    locked_0,
    pc_rst);
  output Carry_0;
  output Negative_0;
  output Overflow_0;
  input clk_in1_0;
  input clk_rst;
  output locked_0;
  input pc_rst;

  wire Carry_0;
  wire Negative_0;
  wire Overflow_0;
  wire clk_in1_0;
  wire clk_rst;
  wire locked_0;
  wire pc_rst;

  RISC_V RISC_V_i
       (.Carry_0(Carry_0),
        .Negative_0(Negative_0),
        .Overflow_0(Overflow_0),
        .clk_in1_0(clk_in1_0),
        .clk_rst(clk_rst),
        .locked_0(locked_0),
        .pc_rst(pc_rst));
endmodule
