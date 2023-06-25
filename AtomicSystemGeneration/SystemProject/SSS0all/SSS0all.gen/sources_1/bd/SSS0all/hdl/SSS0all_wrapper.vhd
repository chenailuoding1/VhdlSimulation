--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Mon Jun 12 22:46:56 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSS0all_wrapper.bd
--Design      : SSS0all_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSS0all_wrapper is
  port (
    clk_0_0 : in STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0_0 : in STD_LOGIC
  );
end SSS0all_wrapper;

architecture STRUCTURE of SSS0all_wrapper is
  component SSS0all is
  port (
    clk_0_0 : in STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0_0 : in STD_LOGIC
  );
  end component SSS0all;
begin
SSS0all_i: component SSS0all
     port map (
      clk_0_0 => clk_0_0,
      out_GD_GD_Gyro_powe_stat_0_0_0(31 downto 0) => out_GD_GD_Gyro_powe_stat_0_0_0(31 downto 0),
      out_SSD_SSD_Sun_sens_powe_stat_0_0_0(31 downto 0) => out_SSD_SSD_Sun_sens_powe_stat_0_0_0(31 downto 0),
      rst_0_0 => rst_0_0
    );
end STRUCTURE;
