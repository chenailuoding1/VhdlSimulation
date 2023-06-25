--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:56 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TTC23_wrapper.bd
--Design      : TTC23_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TTC23_wrapper is
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
end TTC23_wrapper;

architecture STRUCTURE of TTC23_wrapper is
  component TTC23 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TTI_TTI_Tria_cont_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDCR_TDCR_Thru_comb_logi_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTI_TTI_Tria_cont_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TTC23;
begin
TTC23_i: component TTC23
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0) => in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0),
      in_TTI_TTI_Tria_cont_inst_0(31 downto 0) => in_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign_0(31 downto 0) => out_TTCO_TCT_Tria_cont_sign_0(31 downto 0),
      out_TTI_TTI_Tria_cont_inst_0(31 downto 0) => out_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
