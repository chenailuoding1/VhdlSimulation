--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:39 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target DA14.bd
--Design      : DA14
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DA14 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of DA14 : entity is "DA14,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=DA14,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of DA14 : entity is "DA14.hwdef";
end DA14;

architecture STRUCTURE of DA14 is
  component DA14_DA14Dependency_0_0 is
  port (
    start0 : out STD_LOGIC;
    done0 : in STD_LOGIC;
    start1 : out STD_LOGIC;
    done1 : in STD_LOGIC;
    start2 : out STD_LOGIC;
    done2 : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component DA14_DA14Dependency_0_0;
  component DA14_TDA17_0_0 is
  port (
    in_TDA_TCT_Thru_powe_stat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component DA14_TDA17_0_0;
  component DA14_SSDA16_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_SSDA_SS_Sun_sens_powe_stat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_meas_angl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst : out STD_LOGIC
  );
  end component DA14_SSDA16_0_0;
  component DA14_GDA15_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_GDA_G_Puls_coun : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Puls_coun_acqu_inst : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst : out STD_LOGIC;
    out_GD_GD_Gyro_powe_stat : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component DA14_GDA15_0_0;
  signal DA14Dependency_0_done : STD_LOGIC;
  signal DA14Dependency_0_start0 : STD_LOGIC;
  signal DA14Dependency_0_start1 : STD_LOGIC;
  signal DA14Dependency_0_start2 : STD_LOGIC;
  signal GDA15_0_done : STD_LOGIC;
  signal GDA15_0_out_GDA_G_Gyro_powe_stat_perc_inst : STD_LOGIC;
  signal GDA15_0_out_GDA_G_Puls_coun_acqu_inst : STD_LOGIC;
  signal GDA15_0_out_GD_GD_Angu_velo_anal : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GDA15_0_out_GD_GD_Gyro_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSDA16_0_done : STD_LOGIC;
  signal SSDA16_0_out_SSDA_SS_Angl_anal_acqu_inst : STD_LOGIC;
  signal SSDA16_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst : STD_LOGIC;
  signal SSDA16_0_out_SSDA_SS_Sun_visi_sign_acqu_inst : STD_LOGIC;
  signal SSDA16_0_out_SSD_SSD_Sun_meas_angl : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSDA16_0_out_SSD_SSD_Sun_sens_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSDA16_0_out_SSD_SSD_Sun_visi_sign : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TDA17_0_done : STD_LOGIC;
  signal TDA17_0_out_TDA_TCT_Thru_powe_stat_perc_inst : STD_LOGIC;
  signal TDA17_0_out_TD_TD_Thru_powe_stat : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal in_GDA_G_Gyro_powe_stat_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_GDA_G_Puls_coun_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Angl_anal_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Sun_sens_powe_stat_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Sun_visi_sign_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_TDA_TCT_Thru_powe_stat_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN DA14_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= DA14Dependency_0_done;
  in_GDA_G_Gyro_powe_stat_0_1(31 downto 0) <= in_GDA_G_Gyro_powe_stat_0(31 downto 0);
  in_GDA_G_Puls_coun_0_1(31 downto 0) <= in_GDA_G_Puls_coun_0(31 downto 0);
  in_SSDA_SS_Angl_anal_0_1(31 downto 0) <= in_SSDA_SS_Angl_anal_0(31 downto 0);
  in_SSDA_SS_Sun_sens_powe_stat_0_1(31 downto 0) <= in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0);
  in_SSDA_SS_Sun_visi_sign_0_1(31 downto 0) <= in_SSDA_SS_Sun_visi_sign_0(31 downto 0);
  in_TDA_TCT_Thru_powe_stat_0_1(31 downto 0) <= in_TDA_TCT_Thru_powe_stat_0(31 downto 0);
  out_GDA_G_Gyro_powe_stat_perc_inst_0 <= GDA15_0_out_GDA_G_Gyro_powe_stat_perc_inst;
  out_GDA_G_Puls_coun_acqu_inst_0 <= GDA15_0_out_GDA_G_Puls_coun_acqu_inst;
  out_GD_GD_Angu_velo_anal_0(31 downto 0) <= GDA15_0_out_GD_GD_Angu_velo_anal(31 downto 0);
  out_GD_GD_Gyro_powe_stat_0(31 downto 0) <= GDA15_0_out_GD_GD_Gyro_powe_stat(31 downto 0);
  out_SSDA_SS_Angl_anal_acqu_inst_0 <= SSDA16_0_out_SSDA_SS_Angl_anal_acqu_inst;
  out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 <= SSDA16_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst;
  out_SSDA_SS_Sun_visi_sign_acqu_inst_0 <= SSDA16_0_out_SSDA_SS_Sun_visi_sign_acqu_inst;
  out_SSD_SSD_Sun_meas_angl_0(31 downto 0) <= SSDA16_0_out_SSD_SSD_Sun_meas_angl(31 downto 0);
  out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0) <= SSDA16_0_out_SSD_SSD_Sun_sens_powe_stat(31 downto 0);
  out_SSD_SSD_Sun_visi_sign_0(31 downto 0) <= SSDA16_0_out_SSD_SSD_Sun_visi_sign(31 downto 0);
  out_TDA_TCT_Thru_powe_stat_perc_inst_0 <= TDA17_0_out_TDA_TCT_Thru_powe_stat_perc_inst;
  out_TD_TD_Thru_powe_stat_0(31 downto 0) <= TDA17_0_out_TD_TD_Thru_powe_stat(31 downto 0);
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
DA14Dependency_0: component DA14_DA14Dependency_0_0
     port map (
      clk => clk_0_1,
      done => DA14Dependency_0_done,
      done0 => GDA15_0_done,
      done1 => SSDA16_0_done,
      done2 => TDA17_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => DA14Dependency_0_start0,
      start1 => DA14Dependency_0_start1,
      start2 => DA14Dependency_0_start2
    );
GDA15_0: component DA14_GDA15_0_0
     port map (
      clk => clk_0_1,
      done => GDA15_0_done,
      in_GDA_G_Gyro_powe_stat(31 downto 0) => in_GDA_G_Gyro_powe_stat_0_1(31 downto 0),
      in_GDA_G_Puls_coun(31 downto 0) => in_GDA_G_Puls_coun_0_1(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst => GDA15_0_out_GDA_G_Gyro_powe_stat_perc_inst,
      out_GDA_G_Puls_coun_acqu_inst => GDA15_0_out_GDA_G_Puls_coun_acqu_inst,
      out_GD_GD_Angu_velo_anal(31 downto 0) => GDA15_0_out_GD_GD_Angu_velo_anal(31 downto 0),
      out_GD_GD_Gyro_powe_stat(31 downto 0) => GDA15_0_out_GD_GD_Gyro_powe_stat(31 downto 0),
      rst => rst_0_1,
      start => DA14Dependency_0_start0
    );
SSDA16_0: component DA14_SSDA16_0_0
     port map (
      clk => clk_0_1,
      done => SSDA16_0_done,
      in_SSDA_SS_Angl_anal(31 downto 0) => in_SSDA_SS_Angl_anal_0_1(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat(31 downto 0) => in_SSDA_SS_Sun_sens_powe_stat_0_1(31 downto 0),
      in_SSDA_SS_Sun_visi_sign(31 downto 0) => in_SSDA_SS_Sun_visi_sign_0_1(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst => SSDA16_0_out_SSDA_SS_Angl_anal_acqu_inst,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst => SSDA16_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst,
      out_SSDA_SS_Sun_visi_sign_acqu_inst => SSDA16_0_out_SSDA_SS_Sun_visi_sign_acqu_inst,
      out_SSD_SSD_Sun_meas_angl(31 downto 0) => SSDA16_0_out_SSD_SSD_Sun_meas_angl(31 downto 0),
      out_SSD_SSD_Sun_sens_powe_stat(31 downto 0) => SSDA16_0_out_SSD_SSD_Sun_sens_powe_stat(31 downto 0),
      out_SSD_SSD_Sun_visi_sign(31 downto 0) => SSDA16_0_out_SSD_SSD_Sun_visi_sign(31 downto 0),
      rst => rst_0_1,
      start => DA14Dependency_0_start1
    );
TDA17_0: component DA14_TDA17_0_0
     port map (
      clk => clk_0_1,
      done => TDA17_0_done,
      in_TDA_TCT_Thru_powe_stat(31 downto 0) => in_TDA_TCT_Thru_powe_stat_0_1(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst => TDA17_0_out_TDA_TCT_Thru_powe_stat_perc_inst,
      out_TD_TD_Thru_powe_stat(31 downto 0) => TDA17_0_out_TD_TD_Thru_powe_stat(31 downto 0),
      rst => rst_0_1,
      start => DA14Dependency_0_start2
    );
end STRUCTURE;
