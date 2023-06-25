--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:20 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target I1.bd
--Design      : I1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity I1 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSCO_SSI_Sun_sens_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TPCO_TPI_Thru_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_32IT_32IT_32ms_inte_time_star_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MI_MR_Curr_mode_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MI_MR_Curr_mode_stor_inst_0 : out STD_LOGIC;
    out_SGPo_GI_Gyro_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    out_STPo_TPI_Thru_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of I1 : entity is "I1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=I1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of I1 : entity is "I1.hwdef";
end I1;

architecture STRUCTURE of I1 is
  component I1_I1Dependency_0_0 is
  port (
    start0 : out STD_LOGIC;
    done0 : in STD_LOGIC;
    start1 : out STD_LOGIC;
    done1 : in STD_LOGIC;
    start2 : out STD_LOGIC;
    done2 : in STD_LOGIC;
    start3 : out STD_LOGIC;
    done3 : in STD_LOGIC;
    start4 : out STD_LOGIC;
    done4 : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component I1_I1Dependency_0_0;
  component I1_MI12_0_0 is
  port (
    out_MI_MR_Curr_mode_stor_inst : out STD_LOGIC;
    out_MI_MR_Curr_mode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component I1_MI12_0_0;
  component I1_TI9_wrapper_0_0 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  end component I1_TI9_wrapper_0_0;
  component I1_SSI6_wrapper_0_0 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  end component I1_SSI6_wrapper_0_0;
  component I1_GI3_wrapper_0_0 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  end component I1_GI3_wrapper_0_0;
  component I1_ITI2_0_0 is
  port (
    out_32IT_32IT_32ms_inte_time_star_inst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component I1_ITI2_0_0;
  signal GI3_wrapper_0_done_0 : STD_LOGIC;
  signal GI3_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0 : STD_LOGIC;
  signal GI3_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 : STD_LOGIC;
  signal I1Dependency_0_done : STD_LOGIC;
  signal I1Dependency_0_start0 : STD_LOGIC;
  signal I1Dependency_0_start1 : STD_LOGIC;
  signal I1Dependency_0_start2 : STD_LOGIC;
  signal I1Dependency_0_start3 : STD_LOGIC;
  signal I1Dependency_0_start4 : STD_LOGIC;
  signal ITI2_0_done : STD_LOGIC;
  signal ITI2_0_out_32IT_32IT_32ms_inte_time_star_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MI12_0_done : STD_LOGIC;
  signal MI12_0_out_MI_MR_Curr_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MI12_0_out_MI_MR_Curr_mode_stor_inst : STD_LOGIC;
  signal SSI6_wrapper_0_done_0 : STD_LOGIC;
  signal SSI6_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 : STD_LOGIC;
  signal SSI6_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 : STD_LOGIC;
  signal TI9_wrapper_0_done_0 : STD_LOGIC;
  signal TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 : STD_LOGIC;
  signal TI9_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TI9_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 : STD_LOGIC;
  signal clk_0_1 : STD_LOGIC;
  signal in_GCO_GI_Gyro_powe_on_inst_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSCO_SSI_Sun_sens_powe_on_inst_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_TPCO_TPI_Thru_powe_on_inst_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN I1_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= I1Dependency_0_done;
  in_GCO_GI_Gyro_powe_on_inst_0_0_1(31 downto 0) <= in_GCO_GI_Gyro_powe_on_inst_0_0(31 downto 0);
  in_SSCO_SSI_Sun_sens_powe_on_inst_0_0_1(31 downto 0) <= in_SSCO_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0);
  in_TPCO_TPI_Thru_powe_on_inst_0_0_1(31 downto 0) <= in_TPCO_TPI_Thru_powe_on_inst_0_0(31 downto 0);
  out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0) <= ITI2_0_out_32IT_32IT_32ms_inte_time_star_inst(31 downto 0);
  out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 <= GI3_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0;
  out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0) <= GI3_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0(31 downto 0);
  out_MI_MR_Curr_mode_0(31 downto 0) <= MI12_0_out_MI_MR_Curr_mode(31 downto 0);
  out_MI_MR_Curr_mode_stor_inst_0 <= MI12_0_out_MI_MR_Curr_mode_stor_inst;
  out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0) <= GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0);
  out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 <= GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0;
  out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 <= SSI6_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0;
  out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0) <= SSI6_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0);
  out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0) <= SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0);
  out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 <= SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0;
  out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0) <= TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0);
  out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 <= TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0;
  out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0) <= TI9_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0);
  out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 <= TI9_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0;
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
GI3_wrapper_0: component I1_GI3_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => GI3_wrapper_0_done_0,
      in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0) => in_GCO_GI_Gyro_powe_on_inst_0_0_1(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst_0 => GI3_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0,
      out_GCO_G_Gyro_powe_on_puls_0(31 downto 0) => GI3_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0) => GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 => GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0,
      rst_0 => rst_0_1,
      start_0 => I1Dependency_0_start1
    );
I1Dependency_0: component I1_I1Dependency_0_0
     port map (
      clk => clk_0_1,
      done => I1Dependency_0_done,
      done0 => ITI2_0_done,
      done1 => GI3_wrapper_0_done_0,
      done2 => SSI6_wrapper_0_done_0,
      done3 => TI9_wrapper_0_done_0,
      done4 => MI12_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => I1Dependency_0_start0,
      start1 => I1Dependency_0_start1,
      start2 => I1Dependency_0_start2,
      start3 => I1Dependency_0_start3,
      start4 => I1Dependency_0_start4
    );
ITI2_0: component I1_ITI2_0_0
     port map (
      clk => clk_0_1,
      done => ITI2_0_done,
      out_32IT_32IT_32ms_inte_time_star_inst(31 downto 0) => ITI2_0_out_32IT_32IT_32ms_inte_time_star_inst(31 downto 0),
      rst => rst_0_1,
      start => I1Dependency_0_start0
    );
MI12_0: component I1_MI12_0_0
     port map (
      clk => clk_0_1,
      done => MI12_0_done,
      out_MI_MR_Curr_mode(31 downto 0) => MI12_0_out_MI_MR_Curr_mode(31 downto 0),
      out_MI_MR_Curr_mode_stor_inst => MI12_0_out_MI_MR_Curr_mode_stor_inst,
      rst => rst_0_1,
      start => I1Dependency_0_start4
    );
SSI6_wrapper_0: component I1_SSI6_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => SSI6_wrapper_0_done_0,
      in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => in_SSCO_SSI_Sun_sens_powe_on_inst_0_0_1(31 downto 0),
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 => SSI6_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0,
      out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0) => SSI6_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 => SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0,
      rst_0 => rst_0_1,
      start_0 => I1Dependency_0_start2
    );
TI9_wrapper_0: component I1_TI9_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => TI9_wrapper_0_done_0,
      in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0) => in_TPCO_TPI_Thru_powe_on_inst_0_0_1(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0) => TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 => TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0,
      out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0) => TI9_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 => TI9_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0,
      rst_0 => rst_0_1,
      start_0 => I1Dependency_0_start3
    );
end STRUCTURE;
