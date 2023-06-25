--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun May 14 11:05:20 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target I1_wrapper.bd
--Design      : I1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity I1_wrapper is
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
end I1_wrapper;

architecture STRUCTURE of I1_wrapper is
  component I1 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    out_MI_MR_Curr_mode_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MI_MR_Curr_mode_stor_inst_0 : out STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 : out STD_LOGIC;
    out_32IT_32IT_32ms_inte_time_star_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component I1;
begin
I1_i: component I1
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GCO_GI_Gyro_powe_on_inst_0_0(31 downto 0) => in_GCO_GI_Gyro_powe_on_inst_0_0(31 downto 0),
      in_SSCO_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0) => in_SSCO_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0),
      in_TPCO_TPI_Thru_powe_on_inst_0_0(31 downto 0) => in_TPCO_TPI_Thru_powe_on_inst_0_0(31 downto 0),
      out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0) => out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 => out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0,
      out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0) => out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0),
      out_MI_MR_Curr_mode_0(31 downto 0) => out_MI_MR_Curr_mode_0(31 downto 0),
      out_MI_MR_Curr_mode_stor_inst_0 => out_MI_MR_Curr_mode_stor_inst_0,
      out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0) => out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 => out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0,
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 => out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0,
      out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0) => out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0) => out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 => out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0,
      out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0) => out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 => out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0,
      out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0) => out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 => out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;
