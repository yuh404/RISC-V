-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
-- -------------------------------------------------------------------------------
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.

-- MODULE VLNV: amd.com:blockdesign:design_3:1.0

-- The following code must appear in the VHDL architecture header.

-- COMP_TAG     ------ Begin cut for COMPONENT Declaration ------
COMPONENT design_3
  PORT (
    Request_data_output_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_input_signal_0 : IN STD_LOGIC;
    read_input_signal_0 : IN STD_LOGIC;
    addr_input_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    length_input_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    data_input_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    Completer_data_output_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clk_req : IN STD_LOGIC;
    clk_com : IN STD_LOGIC;
    rst_n_com : IN STD_LOGIC;
    rst_n_req : IN STD_LOGIC;
    locked_com : OUT STD_LOGIC;
    locked_req : OUT STD_LOGIC;
    locked_0_0 : OUT STD_LOGIC;
    locked_1_0 : OUT STD_LOGIC;
    rempty_0_0 : OUT STD_LOGIC;
    rempty_1_0 : OUT STD_LOGIC;
    wfull_0_0 : OUT STD_LOGIC;
    wfull_1_0 : OUT STD_LOGIC;
    reset_clk_req : IN STD_LOGIC;
    reset_clk_com : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------  End cut for COMPONENT Declaration  ------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

-- INST_TAG     ------ Begin cut for INSTANTIATION Template ------
your_instance_name : design_3
  PORT MAP (
    Request_data_output_0 => Request_data_output_0,
    wr_input_signal_0 => wr_input_signal_0,
    read_input_signal_0 => read_input_signal_0,
    addr_input_0 => addr_input_0,
    length_input_0 => length_input_0,
    data_input_0 => data_input_0,
    Completer_data_output_0 => Completer_data_output_0,
    clk_req => clk_req,
    clk_com => clk_com,
    rst_n_com => rst_n_com,
    rst_n_req => rst_n_req,
    locked_com => locked_com,
    locked_req => locked_req,
    locked_0_0 => locked_0_0,
    locked_1_0 => locked_1_0,
    rempty_0_0 => rempty_0_0,
    rempty_1_0 => rempty_1_0,
    wfull_0_0 => wfull_0_0,
    wfull_1_0 => wfull_1_0,
    reset_clk_req => reset_clk_req,
    reset_clk_com => reset_clk_com
  );
-- INST_TAG_END ------  End cut for INSTANTIATION Template  ------

-- You must compile the wrapper file design_3.vhd when simulating
-- the module, design_3. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
