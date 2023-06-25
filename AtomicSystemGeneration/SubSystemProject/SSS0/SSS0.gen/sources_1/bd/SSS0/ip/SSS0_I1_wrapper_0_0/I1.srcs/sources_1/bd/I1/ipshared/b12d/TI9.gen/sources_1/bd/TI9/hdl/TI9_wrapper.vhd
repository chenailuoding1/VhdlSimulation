--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:03 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TI9_wrapper.bd
--Design      : TI9_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TI9_wrapper is
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
end TI9_wrapper;

architecture STRUCTURE of TI9_wrapper is
  component TI9 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TCT_Thru_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_STPo_TPI_Thru_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component TI9;
begin
TI9_i: component TI9
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0) => in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0) => out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 => out_STPo_TPI_Thru_powe_on_inst_stor_inst_0,
      out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0) => out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 => out_TPCO_TPI_Thru_powe_on_inst_load_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
