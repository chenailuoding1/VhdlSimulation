--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:39 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target DA14_wrapper.bd
--Design      : DA14_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DA14_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GDA_G_Gyro_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GD_GD_Gyro_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end DA14_wrapper;

architecture STRUCTURE of DA14_wrapper is
  component DA14 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TDA_TCT_Thru_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GD_GD_Gyro_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component DA14;
begin
DA14_i: component DA14
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GDA_G_Gyro_powe_stat_0(31 downto 0) => in_GDA_G_Gyro_powe_stat_0(31 downto 0),
      in_GDA_G_Puls_coun_0(31 downto 0) => in_GDA_G_Puls_coun_0(31 downto 0),
      in_SSDA_SS_Angl_anal_0(31 downto 0) => in_SSDA_SS_Angl_anal_0(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0) => in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0),
      in_SSDA_SS_Sun_visi_sign_0(31 downto 0) => in_SSDA_SS_Sun_visi_sign_0(31 downto 0),
      in_TDA_TCT_Thru_powe_stat_0(31 downto 0) => in_TDA_TCT_Thru_powe_stat_0(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst_0 => out_GDA_G_Gyro_powe_stat_perc_inst_0,
      out_GDA_G_Puls_coun_acqu_inst_0 => out_GDA_G_Puls_coun_acqu_inst_0,
      out_GD_GD_Angu_velo_anal_0(31 downto 0) => out_GD_GD_Angu_velo_anal_0(31 downto 0),
      out_GD_GD_Gyro_powe_stat_0(31 downto 0) => out_GD_GD_Gyro_powe_stat_0(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst_0 => out_SSDA_SS_Angl_anal_acqu_inst_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 => out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0 => out_SSDA_SS_Sun_visi_sign_acqu_inst_0,
      out_SSD_SSD_Sun_meas_angl_0(31 downto 0) => out_SSD_SSD_Sun_meas_angl_0(31 downto 0),
      out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0) => out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0),
      out_SSD_SSD_Sun_visi_sign_0(31 downto 0) => out_SSD_SSD_Sun_visi_sign_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst_0 => out_TDA_TCT_Thru_powe_stat_perc_inst_0,
      out_TD_TD_Thru_powe_stat_0(31 downto 0) => out_TD_TD_Thru_powe_stat_0(31 downto 0),
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
