--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed May 31 09:50:46 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSS0_wrapper.bd
--Design      : SSS0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSS0_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    in_DMC_TIP_Tele_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    interruptsignal_0 : in STD_LOGIC;
    out_32IT_32IT_32ms_inte_time_star_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_G_Gyro_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0_0 : out STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_sens_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TP_DMC_Tele_data_tran_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC
  );
end SSS0_wrapper;

architecture STRUCTURE of SSS0_wrapper is
  component SSS0 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    in_DMC_TIP_Tele_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0_0 : out STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_sens_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_TP_DMC_Tele_data_tran_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_32IT_32IT_32ms_inte_time_star_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_G_Gyro_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TCT_Thru_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    interruptsignal_0 : in STD_LOGIC
  );
  end component SSS0;
begin
SSS0_i: component SSS0
     port map (
      clk_0 => clk_0,
      in_DMC_TIP_Tele_inst_0(31 downto 0) => in_DMC_TIP_Tele_inst_0(31 downto 0),
      in_GDA_G_Gyro_powe_stat_0_0(31 downto 0) => in_GDA_G_Gyro_powe_stat_0_0(31 downto 0),
      in_GDA_G_Puls_coun_0_0(31 downto 0) => in_GDA_G_Puls_coun_0_0(31 downto 0),
      in_SSDA_SS_Angl_anal_0_0(31 downto 0) => in_SSDA_SS_Angl_anal_0_0(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat_0_0(31 downto 0) => in_SSDA_SS_Sun_sens_powe_stat_0_0(31 downto 0),
      in_SSDA_SS_Sun_visi_sign_0_0(31 downto 0) => in_SSDA_SS_Sun_visi_sign_0_0(31 downto 0),
      in_TDA_TCT_Thru_powe_stat_0_0(31 downto 0) => in_TDA_TCT_Thru_powe_stat_0_0(31 downto 0),
      interruptsignal_0 => interruptsignal_0,
      out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0) => out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0),
      out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0) => out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst_0_0 => out_GDA_G_Gyro_powe_stat_perc_inst_0_0,
      out_GDA_G_Puls_coun_acqu_inst_0_0 => out_GDA_G_Puls_coun_acqu_inst_0_0,
      out_GD_GD_Gyro_powe_stat_0_0(31 downto 0) => out_GD_GD_Gyro_powe_stat_0_0(31 downto 0),
      out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0) => out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst_0_0 => out_SSDA_SS_Angl_anal_acqu_inst_0_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 => out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 => out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0,
      out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0) => out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 => out_TDA_TCT_Thru_powe_stat_perc_inst_0_0,
      out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0) => out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0),
      out_TP_DMC_Tele_data_tran_inst_0(31 downto 0) => out_TP_DMC_Tele_data_tran_inst_0(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0) => out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0),
      rst_0 => rst_0
    );
end STRUCTURE;
