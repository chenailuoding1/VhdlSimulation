--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Mon Jun 12 22:46:56 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSS0all.bd
--Design      : SSS0all
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSS0all is
  port (
    clk_0_0 : in STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SSS0all : entity is "SSS0all,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SSS0all,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SSS0all : entity is "SSS0all.hwdef";
end SSS0all;

architecture STRUCTURE of SSS0all is
  component SSS0all_G_0_0 is
  port (
    in_GDA_G_Puls_coun_acqu_inst : in STD_LOGIC;
    in_GDA_G_Gyro_powe_stat_perc_inst : in STD_LOGIC;
    in_GCO_G_Gyro_powe_on_puls : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Puls_coun : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0all_G_0_0;
  component SSS0all_SS_0_0 is
  port (
    in_SSDA_SS_Sun_visi_sign_acqu_inst : in STD_LOGIC;
    in_SSDA_SS_Angl_anal_acqu_inst : in STD_LOGIC;
    in_SSDA_SS_Sun_sens_powe_stat_perc_inst : in STD_LOGIC;
    in_SSCO_SS_Sun_sens_powe_on_puls : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Sun_visi_sign : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Sun_sens_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0all_SS_0_0;
  component SSS0all_DMC_0_0 is
  port (
    in_TP_DMC_Tele_data_tran_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_DMC_TIP_Tele_inst : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0all_DMC_0_0;
  component SSS0all_TCT_0_0 is
  port (
    in_TPCO_TCT_Thru_powe_on_puls : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_perc_inst : in STD_LOGIC;
    in_TTCO_TCT_Tria_cont_sign : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0all_TCT_0_0;
  component SSS0all_IT_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    in_32IT_32IT_32ms_inte_time_star_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    interruptsignal : out STD_LOGIC
  );
  end component SSS0all_IT_0_0;
  component SSS0all_SSS0_wrapper_0_0 is
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
  end component SSS0all_SSS0_wrapper_0_0;
  signal DMC_0_out_DMC_TIP_Tele_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal G_0_out_GDA_G_Gyro_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal G_0_out_GDA_G_Puls_coun : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal IT_0_interruptsignal : STD_LOGIC;
  signal SSS0_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_GD_GD_Gyro_powe_stat_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 : STD_LOGIC;
  signal SSS0_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_TP_DMC_Tele_data_tran_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SS_0_out_SSDA_SS_Angl_anal : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SS_0_out_SSDA_SS_Sun_sens_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SS_0_out_SSDA_SS_Sun_visi_sign : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TCT_0_out_TDA_TCT_Thru_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_0_0_1 : STD_LOGIC;
  signal rst_0_0_1 : STD_LOGIC;
begin
  clk_0_0_1 <= clk_0_0;
  out_GD_GD_Gyro_powe_stat_0_0_0(31 downto 0) <= SSS0_wrapper_0_out_GD_GD_Gyro_powe_stat_0_0(31 downto 0);
  out_SSD_SSD_Sun_sens_powe_stat_0_0_0(31 downto 0) <= SSS0_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0);
  rst_0_0_1 <= rst_0_0;
DMC_0: component SSS0all_DMC_0_0
     port map (
      in_TP_DMC_Tele_data_tran_inst(31 downto 0) => SSS0_wrapper_0_out_TP_DMC_Tele_data_tran_inst_0(31 downto 0),
      out_DMC_TIP_Tele_inst(31 downto 0) => DMC_0_out_DMC_TIP_Tele_inst(31 downto 0)
    );
G_0: component SSS0all_G_0_0
     port map (
      in_GCO_G_Gyro_powe_on_puls(31 downto 0) => SSS0_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0),
      in_GDA_G_Gyro_powe_stat_perc_inst => SSS0_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0_0,
      in_GDA_G_Puls_coun_acqu_inst => SSS0_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0_0,
      out_GDA_G_Gyro_powe_stat(31 downto 0) => G_0_out_GDA_G_Gyro_powe_stat(31 downto 0),
      out_GDA_G_Puls_coun(31 downto 0) => G_0_out_GDA_G_Puls_coun(31 downto 0)
    );
IT_0: component SSS0all_IT_0_0
     port map (
      clk => clk_0_0_1,
      in_32IT_32IT_32ms_inte_time_star_inst(31 downto 0) => SSS0_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0),
      interruptsignal => IT_0_interruptsignal,
      reset => rst_0_0_1
    );
SSS0_wrapper_0: component SSS0all_SSS0_wrapper_0_0
     port map (
      clk_0 => clk_0_0_1,
      in_DMC_TIP_Tele_inst_0(31 downto 0) => DMC_0_out_DMC_TIP_Tele_inst(31 downto 0),
      in_GDA_G_Gyro_powe_stat_0_0(31 downto 0) => G_0_out_GDA_G_Gyro_powe_stat(31 downto 0),
      in_GDA_G_Puls_coun_0_0(31 downto 0) => G_0_out_GDA_G_Puls_coun(31 downto 0),
      in_SSDA_SS_Angl_anal_0_0(31 downto 0) => SS_0_out_SSDA_SS_Angl_anal(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat_0_0(31 downto 0) => SS_0_out_SSDA_SS_Sun_sens_powe_stat(31 downto 0),
      in_SSDA_SS_Sun_visi_sign_0_0(31 downto 0) => SS_0_out_SSDA_SS_Sun_visi_sign(31 downto 0),
      in_TDA_TCT_Thru_powe_stat_0_0(31 downto 0) => TCT_0_out_TDA_TCT_Thru_powe_stat(31 downto 0),
      interruptsignal_0 => IT_0_interruptsignal,
      out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0) => SSS0_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0),
      out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0) => SSS0_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst_0_0 => SSS0_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0_0,
      out_GDA_G_Puls_coun_acqu_inst_0_0 => SSS0_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0_0,
      out_GD_GD_Gyro_powe_stat_0_0(31 downto 0) => SSS0_wrapper_0_out_GD_GD_Gyro_powe_stat_0_0(31 downto 0),
      out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0) => SSS0_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst_0_0 => SSS0_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 => SSS0_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 => SSS0_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0,
      out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0) => SSS0_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 => SSS0_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0_0,
      out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0) => SSS0_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0),
      out_TP_DMC_Tele_data_tran_inst_0(31 downto 0) => SSS0_wrapper_0_out_TP_DMC_Tele_data_tran_inst_0(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0) => SSS0_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0),
      rst_0 => rst_0_0_1
    );
SS_0: component SSS0all_SS_0_0
     port map (
      in_SSCO_SS_Sun_sens_powe_on_puls(31 downto 0) => SSS0_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0),
      in_SSDA_SS_Angl_anal_acqu_inst => SSS0_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0_0,
      in_SSDA_SS_Sun_sens_powe_stat_perc_inst => SSS0_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0,
      in_SSDA_SS_Sun_visi_sign_acqu_inst => SSS0_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0,
      out_SSDA_SS_Angl_anal(31 downto 0) => SS_0_out_SSDA_SS_Angl_anal(31 downto 0),
      out_SSDA_SS_Sun_sens_powe_stat(31 downto 0) => SS_0_out_SSDA_SS_Sun_sens_powe_stat(31 downto 0),
      out_SSDA_SS_Sun_visi_sign(31 downto 0) => SS_0_out_SSDA_SS_Sun_visi_sign(31 downto 0)
    );
TCT_0: component SSS0all_TCT_0_0
     port map (
      in_TDA_TCT_Thru_powe_stat_perc_inst => SSS0_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0_0,
      in_TPCO_TCT_Thru_powe_on_puls(31 downto 0) => SSS0_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0),
      in_TTCO_TCT_Tria_cont_sign(31 downto 0) => SSS0_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat(31 downto 0) => TCT_0_out_TDA_TCT_Thru_powe_stat(31 downto 0)
    );
end STRUCTURE;
