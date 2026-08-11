// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: amd.com:blockdesign:design_FIFO_test:1.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module design_FIFO_test_sv (
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [7:0] wdata_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire winc_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire wrst_n_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire rrst_n_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [7:0] rdata_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire wfull_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire rempty_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire clk_100MHz,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire reset_rtl_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire clk_50MHz_1,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire reset_rtl_0_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire locked_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire locked_1,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire RD_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] length_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire rd_out_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire wr_out_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire READY_0,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [7:0] wdata_1,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire rinc_0,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [7:0] rdata_1,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire wfull_1,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire rempty_1
);

  design_FIFO_test inst (
    .wdata_0(wdata_0),
    .winc_0(winc_0),
    .wrst_n_0(wrst_n_0),
    .rrst_n_0(rrst_n_0),
    .rdata_0(rdata_0),
    .wfull_0(wfull_0),
    .rempty_0(rempty_0),
    .clk_100MHz(clk_100MHz),
    .reset_rtl_0(reset_rtl_0),
    .clk_50MHz_1(clk_50MHz_1),
    .reset_rtl_0_0(reset_rtl_0_0),
    .locked_0(locked_0),
    .locked_1(locked_1),
    .RD_0(RD_0),
    .length_0(length_0),
    .rd_out_0(rd_out_0),
    .wr_out_0(wr_out_0),
    .READY_0(READY_0),
    .wdata_1(wdata_1),
    .rinc_0(rinc_0),
    .rdata_1(rdata_1),
    .wfull_1(wfull_1),
    .rempty_1(rempty_1)
  );

endmodule
