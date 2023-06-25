--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:04:30 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target GI3.bd
--Design      : GI3
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GI3 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of GI3 : entity is "GI3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=GI3,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of GI3 : entity is "GI3.hwdef";
end GI3;

architecture STRUCTURE of GI3 is
  component GI3_GI3Dependency_0_0 is
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
  end component GI3_GI3Dependency_0_0;
  component GI3_GCO5_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component GI3_GCO5_0_0;
  component GI3_SGPoI4_0_0 is
  port (
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst : out STD_LOGIC;
    out_SGPo_GI_Gyro_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    start : in STD_LOGIC;
    done : out STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component GI3_SGPoI4_0_0;
  signal GCO5_0_done : STD_LOGIC;
  signal GCO5_0_out_GCO_GI_Gyro_powe_on_inst_load_inst : STD_LOGIC;
  signal GCO5_0_out_GCO_G_Gyro_powe_on_puls : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GI3Dependency_0_done : STD_LOGIC;
  signal GI3Dependency_0_start0 : STD_LOGIC;
  signal GI3Dependency_0_start1 : STD_LOGIC;
  signal SGPoI4_0_done : STD_LOGIC;
  signal SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst : STD_LOGIC;
  signal clk_0_1 : STD_LOGIC;
  signal in_GCO_GI_Gyro_powe_on_inst_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_0_1 : STD_LOGIC;
  signal start_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN GI3_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  done_0 <= GI3Dependency_0_done;
  in_GCO_GI_Gyro_powe_on_inst_0_1(31 downto 0) <= in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0);
  out_GCO_GI_Gyro_powe_on_inst_load_inst_0 <= GCO5_0_out_GCO_GI_Gyro_powe_on_inst_load_inst;
  out_GCO_G_Gyro_powe_on_puls_0(31 downto 0) <= GCO5_0_out_GCO_G_Gyro_powe_on_puls(31 downto 0);
  out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0) <= SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst(31 downto 0);
  out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 <= SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst;
  rst_0_1 <= rst_0;
  start_0_1 <= start_0;
GCO5_0: component GI3_GCO5_0_0
     port map (
      clk => clk_0_1,
      done => GCO5_0_done,
      in_GCO_GI_Gyro_powe_on_inst(31 downto 0) => in_GCO_GI_Gyro_powe_on_inst_0_1(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst => GCO5_0_out_GCO_GI_Gyro_powe_on_inst_load_inst,
      out_GCO_G_Gyro_powe_on_puls(31 downto 0) => GCO5_0_out_GCO_G_Gyro_powe_on_puls(31 downto 0),
      rst => rst_0_1,
      start => GI3Dependency_0_start1
    );
GI3Dependency_0: component GI3_GI3Dependency_0_0
     port map (
      clk => clk_0_1,
      done => GI3Dependency_0_done,
      done0 => SGPoI4_0_done,
      done1 => GCO5_0_done,
      rst => rst_0_1,
      start => start_0_1,
      start0 => GI3Dependency_0_start0,
      start1 => GI3Dependency_0_start1
    );
SGPoI4_0: component GI3_SGPoI4_0_0
     port map (
      clk => clk_0_1,
      done => SGPoI4_0_done,
      out_SGPo_GI_Gyro_powe_on_inst(31 downto 0) => SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst => SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst,
      rst => rst_0_1,
      start => GI3Dependency_0_start0
    );
end STRUCTURE;
