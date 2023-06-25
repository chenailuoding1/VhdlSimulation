--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:04:46 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSI6.bd
--Design      : SSI6
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSI6 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SSI6 : entity is "SSI6,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SSI6,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SSI6 : entity is "SSI6.hwdef";
end SSI6;

architecture STRUCTURE of SSI6 is
  component SSI6_SSI6Dependency_0_0 is
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
  end component SSI6_SSI6Dependency_0_0;
  component SSI6_SSCO8_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SS_Sun_sens_powe_on_puls : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst : out STD_LOGIC
  );
  end component SSI6_SSCO8_0_0;
  component SSI6_SSSPoI7_0_0 is
  port (
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst : out STD_LOGIC;
    out_SSSP_SSI_Sun_sens_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component SSI6_SSSPoI7_0_0;
  signal SSCO8_0_done : STD_LOGIC;
  signal SSCO8_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst : STD_LOGIC;
  signal SSCO8_0_out_SSCO_SS_Sun_sens_powe_on_puls : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSI6Dependency_0_done : STD_LOGIC;
  signal SSI6Dependency_0_start0 : STD_LOGIC;
  signal SSI6Dependency_0_start1 : STD_LOGIC;
  signal SSSPoI7_0_done : STD_LOGIC;
  signal SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst : STD_LOGIC;
  signal clk_0_1 : STD_LOGIC;
  signal in_SSCO_SSI_Sun_sens_powe_on_inst_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN SSI6_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= SSI6Dependency_0_done;
  in_SSCO_SSI_Sun_sens_powe_on_inst_0_1(31 downto 0) <= in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0);
  out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 <= SSCO8_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst;
  out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0) <= SSCO8_0_out_SSCO_SS_Sun_sens_powe_on_puls(31 downto 0);
  out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0) <= SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst(31 downto 0);
  out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 <= SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst;
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
SSCO8_0: component SSI6_SSCO8_0_0
     port map (
      clk => clk_0_1,
      done => SSCO8_0_done,
      in_SSCO_SSI_Sun_sens_powe_on_inst(31 downto 0) => in_SSCO_SSI_Sun_sens_powe_on_inst_0_1(31 downto 0),
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst => SSCO8_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst,
      out_SSCO_SS_Sun_sens_powe_on_puls(31 downto 0) => SSCO8_0_out_SSCO_SS_Sun_sens_powe_on_puls(31 downto 0),
      rst => rst_0_1,
      start => SSI6Dependency_0_start1
    );
SSI6Dependency_0: component SSI6_SSI6Dependency_0_0
     port map (
      clk => clk_0_1,
      done => SSI6Dependency_0_done,
      done0 => SSSPoI7_0_done,
      done1 => SSCO8_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => SSI6Dependency_0_start0,
      start1 => SSI6Dependency_0_start1
    );
SSSPoI7_0: component SSI6_SSSPoI7_0_0
     port map (
      clk => clk_0_1,
      done => SSSPoI7_0_done,
      out_SSSP_SSI_Sun_sens_powe_on_inst(31 downto 0) => SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst => SSSPoI7_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst,
      rst => rst_0_1,
      start => SSI6Dependency_0_start0
    );
end STRUCTURE;
