-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:user:DA14_wrapper:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SSS0_DA14_wrapper_0_0 IS
  PORT (
    clk_0 : IN STD_LOGIC;
    done_0 : OUT STD_LOGIC;
    in_GDA_G_Gyro_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_GDA_G_Puls_coun_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_SSDA_SS_Angl_anal_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_SSDA_SS_Sun_sens_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_SSDA_SS_Sun_visi_sign_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    in_TDA_TCT_Thru_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : OUT STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : OUT STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_GD_GD_Gyro_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_SSDA_SS_Angl_anal_acqu_inst_0 : OUT STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : OUT STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : OUT STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_SSD_SSD_Sun_sens_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_SSD_SSD_Sun_visi_sign_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : OUT STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    rst_0 : IN STD_LOGIC;
    start_0 : IN STD_LOGIC
  );
END SSS0_DA14_wrapper_0_0;

ARCHITECTURE SSS0_DA14_wrapper_0_0_arch OF SSS0_DA14_wrapper_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SSS0_DA14_wrapper_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT DA14_wrapper IS
    PORT (
      clk_0 : IN STD_LOGIC;
      done_0 : OUT STD_LOGIC;
      in_GDA_G_Gyro_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_GDA_G_Puls_coun_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_SSDA_SS_Angl_anal_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_SSDA_SS_Sun_sens_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_SSDA_SS_Sun_visi_sign_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      in_TDA_TCT_Thru_powe_stat_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_GDA_G_Gyro_powe_stat_perc_inst_0 : OUT STD_LOGIC;
      out_GDA_G_Puls_coun_acqu_inst_0 : OUT STD_LOGIC;
      out_GD_GD_Angu_velo_anal_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_GD_GD_Gyro_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_SSDA_SS_Angl_anal_acqu_inst_0 : OUT STD_LOGIC;
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : OUT STD_LOGIC;
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : OUT STD_LOGIC;
      out_SSD_SSD_Sun_meas_angl_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_SSD_SSD_Sun_sens_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_SSD_SSD_Sun_visi_sign_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      out_TDA_TCT_Thru_powe_stat_perc_inst_0 : OUT STD_LOGIC;
      out_TD_TD_Thru_powe_stat_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      rst_0 : IN STD_LOGIC;
      start_0 : IN STD_LOGIC
    );
  END COMPONENT DA14_wrapper;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF SSS0_DA14_wrapper_0_0_arch: ARCHITECTURE IS "package_project";
BEGIN
  U0 : DA14_wrapper
    PORT MAP (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GDA_G_Gyro_powe_stat_0 => in_GDA_G_Gyro_powe_stat_0,
      in_GDA_G_Puls_coun_0 => in_GDA_G_Puls_coun_0,
      in_SSDA_SS_Angl_anal_0 => in_SSDA_SS_Angl_anal_0,
      in_SSDA_SS_Sun_sens_powe_stat_0 => in_SSDA_SS_Sun_sens_powe_stat_0,
      in_SSDA_SS_Sun_visi_sign_0 => in_SSDA_SS_Sun_visi_sign_0,
      in_TDA_TCT_Thru_powe_stat_0 => in_TDA_TCT_Thru_powe_stat_0,
      out_GDA_G_Gyro_powe_stat_perc_inst_0 => out_GDA_G_Gyro_powe_stat_perc_inst_0,
      out_GDA_G_Puls_coun_acqu_inst_0 => out_GDA_G_Puls_coun_acqu_inst_0,
      out_GD_GD_Angu_velo_anal_0 => out_GD_GD_Angu_velo_anal_0,
      out_GD_GD_Gyro_powe_stat_0 => out_GD_GD_Gyro_powe_stat_0,
      out_SSDA_SS_Angl_anal_acqu_inst_0 => out_SSDA_SS_Angl_anal_acqu_inst_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 => out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0 => out_SSDA_SS_Sun_visi_sign_acqu_inst_0,
      out_SSD_SSD_Sun_meas_angl_0 => out_SSD_SSD_Sun_meas_angl_0,
      out_SSD_SSD_Sun_sens_powe_stat_0 => out_SSD_SSD_Sun_sens_powe_stat_0,
      out_SSD_SSD_Sun_visi_sign_0 => out_SSD_SSD_Sun_visi_sign_0,
      out_TDA_TCT_Thru_powe_stat_perc_inst_0 => out_TDA_TCT_Thru_powe_stat_perc_inst_0,
      out_TD_TD_Thru_powe_stat_0 => out_TD_TD_Thru_powe_stat_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
END SSS0_DA14_wrapper_0_0_arch;
