--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:56 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TTC23.bd
--Design      : TTC23
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TTC23 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_TDCR_TDCR_Thru_comb_logi_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TTI_TTI_Tria_cont_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTI_TTI_Tria_cont_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of TTC23 : entity is "TTC23,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=TTC23,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of TTC23 : entity is "TTC23.hwdef";
end TTC23;

architecture STRUCTURE of TTC23 is
  component TTC23_TTC23Dependency_0_0 is
  port (
    start0 : out STD_LOGIC;
    done0 : in STD_LOGIC;
    start1 : out STD_LOGIC;
    done1 : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component TTC23_TTC23Dependency_0_0;
  component TTC23_TTCO25_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_TTI_TTI_Tria_cont_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TTC23_TTCO25_0_0;
  component TTC23_TTC24_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_TDCR_TDCR_Thru_comb_logi : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTI_TTI_Tria_cont_inst : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TTC23_TTC24_0_0;
  signal TTC23Dependency_0_done : STD_LOGIC;
  signal TTC23Dependency_0_start0 : STD_LOGIC;
  signal TTC23Dependency_0_start1 : STD_LOGIC;
  signal TTC24_0_done : STD_LOGIC;
  signal TTC24_0_out_TTI_TTI_Tria_cont_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TTCO25_0_done : STD_LOGIC;
  signal TTCO25_0_out_TTCO_TCT_Tria_cont_sign : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal in_TDCR_TDCR_Thru_comb_logi_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_TTI_TTI_Tria_cont_inst_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN TTC23_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= TTC23Dependency_0_done;
  in_TDCR_TDCR_Thru_comb_logi_0_1(31 downto 0) <= in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0);
  in_TTI_TTI_Tria_cont_inst_0_1(31 downto 0) <= in_TTI_TTI_Tria_cont_inst_0(31 downto 0);
  out_TTCO_TCT_Tria_cont_sign_0(31 downto 0) <= TTCO25_0_out_TTCO_TCT_Tria_cont_sign(31 downto 0);
  out_TTI_TTI_Tria_cont_inst_0(31 downto 0) <= TTC24_0_out_TTI_TTI_Tria_cont_inst(31 downto 0);
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
TTC23Dependency_0: component TTC23_TTC23Dependency_0_0
     port map (
      clk => clk_0_1,
      done => TTC23Dependency_0_done,
      done0 => TTC24_0_done,
      done1 => TTCO25_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => TTC23Dependency_0_start0,
      start1 => TTC23Dependency_0_start1
    );
TTC24_0: component TTC23_TTC24_0_0
     port map (
      clk => clk_0_1,
      done => TTC24_0_done,
      in_TDCR_TDCR_Thru_comb_logi(31 downto 0) => in_TDCR_TDCR_Thru_comb_logi_0_1(31 downto 0),
      out_TTI_TTI_Tria_cont_inst(31 downto 0) => TTC24_0_out_TTI_TTI_Tria_cont_inst(31 downto 0),
      rst => rst_0_1,
      start => TTC23Dependency_0_start0
    );
TTCO25_0: component TTC23_TTCO25_0_0
     port map (
      clk => clk_0_1,
      done => TTCO25_0_done,
      in_TTI_TTI_Tria_cont_inst(31 downto 0) => in_TTI_TTI_Tria_cont_inst_0_1(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign(31 downto 0) => TTCO25_0_out_TTCO_TCT_Tria_cont_sign(31 downto 0),
      rst => rst_0_1,
      start => TTC23Dependency_0_start1
    );
end STRUCTURE;
