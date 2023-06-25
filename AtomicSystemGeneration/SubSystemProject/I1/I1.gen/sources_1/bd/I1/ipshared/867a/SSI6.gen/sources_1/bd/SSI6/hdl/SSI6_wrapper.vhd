--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:04:46 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSI6_wrapper.bd
--Design      : SSI6_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSI6_wrapper is
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
end SSI6_wrapper;

architecture STRUCTURE of SSI6_wrapper is
  component SSI6 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component SSI6;
begin
SSI6_i: component SSI6
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0),
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 => out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0,
      out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0) => out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 => out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
