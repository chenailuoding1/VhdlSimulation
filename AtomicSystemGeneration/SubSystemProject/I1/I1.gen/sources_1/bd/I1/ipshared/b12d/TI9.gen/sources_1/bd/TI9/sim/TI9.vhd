--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:03 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TI9.bd
--Design      : TI9
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TI9 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of TI9 : entity is "TI9,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=TI9,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of TI9 : entity is "TI9.hwdef";
end TI9;

architecture STRUCTURE of TI9 is
  component TI9_TI9Dependency_0_0 is
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
  end component TI9_TI9Dependency_0_0;
  component TI9_TPCO11_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TI9_TPCO11_0_0;
  component TI9_STPoI10_0_0 is
  port (
    out_STPo_TPI_Thru_powe_on_inst_stor_inst : out STD_LOGIC;
    out_STPo_TPI_Thru_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component TI9_STPoI10_0_0;
  signal STPoI10_0_done : STD_LOGIC;
  signal STPoI10_0_out_STPo_TPI_Thru_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal STPoI10_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst : STD_LOGIC;
  signal TI9Dependency_0_done : STD_LOGIC;
  signal TI9Dependency_0_start0 : STD_LOGIC;
  signal TI9Dependency_0_start1 : STD_LOGIC;
  signal TPCO11_0_done : STD_LOGIC;
  signal TPCO11_0_out_TPCO_TCT_Thru_powe_on_puls : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TPCO11_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst : STD_LOGIC;
  signal clk_0_1 : STD_LOGIC;
  signal in_TPCO_TPI_Thru_powe_on_inst_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN TI9_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= TI9Dependency_0_done;
  in_TPCO_TPI_Thru_powe_on_inst_0_1(31 downto 0) <= in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0);
  out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0) <= STPoI10_0_out_STPo_TPI_Thru_powe_on_inst(31 downto 0);
  out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 <= STPoI10_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst;
  out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0) <= TPCO11_0_out_TPCO_TCT_Thru_powe_on_puls(31 downto 0);
  out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 <= TPCO11_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst;
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
STPoI10_0: component TI9_STPoI10_0_0
     port map (
      clk => clk_0_1,
      done => STPoI10_0_done,
      out_STPo_TPI_Thru_powe_on_inst(31 downto 0) => STPoI10_0_out_STPo_TPI_Thru_powe_on_inst(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst => STPoI10_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst,
      rst => rst_0_1,
      start => TI9Dependency_0_start0
    );
TI9Dependency_0: component TI9_TI9Dependency_0_0
     port map (
      clk => clk_0_1,
      done => TI9Dependency_0_done,
      done0 => STPoI10_0_done,
      done1 => TPCO11_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => TI9Dependency_0_start0,
      start1 => TI9Dependency_0_start1
    );
TPCO11_0: component TI9_TPCO11_0_0
     port map (
      clk => clk_0_1,
      done => TPCO11_0_done,
      in_TPCO_TPI_Thru_powe_on_inst(31 downto 0) => in_TPCO_TPI_Thru_powe_on_inst_0_1(31 downto 0),
      out_TPCO_TCT_Thru_powe_on_puls(31 downto 0) => TPCO11_0_out_TPCO_TCT_Thru_powe_on_puls(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst => TPCO11_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst,
      rst => rst_0_1,
      start => TI9Dependency_0_start1
    );
end STRUCTURE;
