--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:04:30 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target GI3_wrapper.bd
--Design      : GI3_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GI3_wrapper is
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
end GI3_wrapper;

architecture STRUCTURE of GI3_wrapper is
  component GI3 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component GI3;
begin
GI3_i: component GI3
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0) => in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst_0 => out_GCO_GI_Gyro_powe_on_inst_load_inst_0,
      out_GCO_G_Gyro_powe_on_puls_0(31 downto 0) => out_GCO_G_Gyro_powe_on_puls_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0) => out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 => out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
