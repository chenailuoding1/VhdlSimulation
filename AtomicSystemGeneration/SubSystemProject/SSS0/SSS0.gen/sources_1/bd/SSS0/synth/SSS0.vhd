--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed May 31 09:50:46 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSS0.bd
--Design      : SSS0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSS0 is
  port (
    clk_0 : in STD_LOGIC;
    in_DMC_TIP_Tele_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    interruptsignal_0 : in STD_LOGIC;
    out_32IT_32IT_32ms_inte_time_star_inst_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_G_Gyro_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0_0 : out STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_sens_powe_stat_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TP_DMC_Tele_data_tran_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SSS0 : entity is "SSS0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SSS0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=14,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SSS0 : entity is "SSS0.hwdef";
end SSS0;

architecture STRUCTURE of SSS0 is
  component SSS0_TPI_0_0 is
  port (
    in_TPCO_TPI_Thru_powe_on_inst_load_inst : in STD_LOGIC;
    in_STPo_TPI_Thru_powe_on_inst_stor_inst : in STD_LOGIC;
    in_STPo_TPI_Thru_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_TPI_0_0;
  component SSS0_AD18_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_AD_MR_Curr_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSD_SSD_Sun_meas_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GD_GD_Angu_velo_anal : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSD_SSD_Sun_visi_sign : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_ADR_ADR_Tria_angu_velo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_AD_MR_Curr_mode_load_inst : out STD_LOGIC;
    out_ADR_ADR_Tria_atti_angl : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_AD18_0_0;
  component SSS0_TCC20_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_TCC_MR_Targ_angu_velo : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_ADR_ADR_Tria_angu_velo : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TCC_MR_Targ_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_ADR_ADR_Tria_atti_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_CCR_CCR_Tria_cont_quan : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TCC_MR_Targ_angu_velo_load_inst : out STD_LOGIC;
    out_TCC_MR_Targ_angl_load_inst : out STD_LOGIC
  );
  end component SSS0_TCC20_0_0;
  component SSS0_TIP13_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_DMC_TIP_Tele_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TIP_MR_Next_cycl_mode_stor_inst : out STD_LOGIC;
    out_TIP_MR_Next_cycl_mode : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_TIP13_0_0;
  component SSS0_GI_0_0 is
  port (
    in_SGPo_GI_Gyro_powe_on_inst_stor_inst : in STD_LOGIC;
    in_SGPo_GI_Gyro_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GCO_GI_Gyro_powe_on_inst_load_inst : in STD_LOGIC;
    out_GCO_GI_Gyro_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_GI_0_0;
  component SSS0_DA14_wrapper_0_0 is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GDA_G_Gyro_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GD_GD_Gyro_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
  end component SSS0_DA14_wrapper_0_0;
  component SSS0_TP22_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_ADR_ADR_Tria_angu_velo : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TP_MR_Curr_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_ADR_ADR_Tria_atti_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TP_DMC_Tele_data_tran_inst : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TP_MR_Curr_mode_load_inst : out STD_LOGIC
  );
  end component SSS0_TP22_0_0;
  component SSS0_TDC21_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_CCR_CCR_Tria_cont_quan : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TD_TD_Thru_powe_stat : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDCR_TDCR_Thru_comb_logi : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_TDC21_0_0;
  component SSS0_I1_wrapper_0_0 is
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
  end component SSS0_I1_wrapper_0_0;
  component SSS0_SSI_0_0 is
  port (
    in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst : in STD_LOGIC;
    in_SSSP_SSI_Sun_sens_powe_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst : in STD_LOGIC;
    out_SSCO_SSI_Sun_sens_powe_on_inst : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_SSI_0_0;
  component SSS0_TTC23_wrapper_0_0 is
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
  end component SSS0_TTC23_wrapper_0_0;
  component SSS0_MR_0_0 is
  port (
    in_TP_MR_Curr_mode_load_inst : in STD_LOGIC;
    in_MI_MR_Curr_mode_stor_inst : in STD_LOGIC;
    in_MI_MR_Curr_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_AD_MR_Curr_mode_load_inst : in STD_LOGIC;
    in_TCC_MR_Targ_angl_load_inst : in STD_LOGIC;
    in_TCC_MR_Targ_angu_velo_load_inst : in STD_LOGIC;
    in_MSM_MR_Curr_mode_load_inst : in STD_LOGIC;
    in_MSM_MR_Curr_mode_work_time_load_inst : in STD_LOGIC;
    in_MSM_MR_Next_cycl_mode_stor_inst : in STD_LOGIC;
    in_MSM_MR_Next_cycl_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_MSM_MR_Curr_mode_work_time_stor_inst : in STD_LOGIC;
    in_MSM_MR_Curr_mode_work_time : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_MSM_MR_Targ_angl_stor_inst : in STD_LOGIC;
    in_MSM_MR_Targ_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_MSM_MR_Targ_angu_velo_stor_inst : in STD_LOGIC;
    in_MSM_MR_Targ_angu_velo : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TIP_MR_Next_cycl_mode_stor_inst : in STD_LOGIC;
    in_TIP_MR_Next_cycl_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TP_MR_Curr_mode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_AD_MR_Curr_mode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TCC_MR_Targ_angl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TCC_MR_Targ_angu_velo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Curr_mode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Curr_mode_work_time : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component SSS0_MR_0_0;
  component SSS0_MSM19_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    done : out STD_LOGIC;
    start : in STD_LOGIC;
    in_ADR_ADR_Tria_angu_velo : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_MSM_MR_Curr_mode_work_time : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSD_SSD_Sun_visi_sign : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_ADR_ADR_Tria_atti_angl : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_MSM_MR_Curr_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Curr_mode_load_inst : out STD_LOGIC;
    out_MSM_MR_Curr_mode_work_time : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Targ_angl_stor_inst : out STD_LOGIC;
    out_MSM_MR_Targ_angu_velo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Targ_angl : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Curr_mode_work_time_load_inst : out STD_LOGIC;
    out_MSM_MR_Next_cycl_mode : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_MSM_MR_Curr_mode_work_time_stor_inst : out STD_LOGIC;
    out_MSM_MR_Targ_angu_velo_stor_inst : out STD_LOGIC;
    out_MSM_MR_Next_cycl_mode_stor_inst : out STD_LOGIC
  );
  end component SSS0_MSM19_0_0;
  component SSS0_SSS0Dependency_0_0 is
  port (
    interruptsignal : in STD_LOGIC;
    start0 : out STD_LOGIC;
    done0 : in STD_LOGIC;
    start1 : out STD_LOGIC;
    done1 : in STD_LOGIC;
    start2 : out STD_LOGIC;
    done2 : in STD_LOGIC;
    start3 : out STD_LOGIC;
    done3 : in STD_LOGIC;
    start4 : out STD_LOGIC;
    done4 : in STD_LOGIC;
    start5 : out STD_LOGIC;
    done5 : in STD_LOGIC;
    start6 : out STD_LOGIC;
    done6 : in STD_LOGIC;
    start7 : out STD_LOGIC;
    done7 : in STD_LOGIC;
    start8 : out STD_LOGIC;
    done8 : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  end component SSS0_SSS0Dependency_0_0;
  signal AD18_0_done : STD_LOGIC;
  signal AD18_0_out_ADR_ADR_Tria_angu_velo : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AD18_0_out_ADR_ADR_Tria_atti_angl : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AD18_0_out_AD_MR_Curr_mode_load_inst : STD_LOGIC;
  signal DA14_wrapper_0_done_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_GD_GD_Angu_velo_anal_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DA14_wrapper_0_out_GD_GD_Gyro_powe_stat_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DA14_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_SSD_SSD_Sun_meas_angl_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DA14_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DA14_wrapper_0_out_SSD_SSD_Sun_visi_sign_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal DA14_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0 : STD_LOGIC;
  signal DA14_wrapper_0_out_TD_TD_Thru_powe_stat_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal GI_0_out_GCO_GI_Gyro_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_done_0 : STD_LOGIC;
  signal I1_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 : STD_LOGIC;
  signal I1_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_MI_MR_Curr_mode_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_MI_MR_Curr_mode_stor_inst_0 : STD_LOGIC;
  signal I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 : STD_LOGIC;
  signal I1_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 : STD_LOGIC;
  signal I1_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 : STD_LOGIC;
  signal I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 : STD_LOGIC;
  signal I1_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal I1_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 : STD_LOGIC;
  signal MR_0_out_AD_MR_Curr_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MR_0_out_MSM_MR_Curr_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MR_0_out_MSM_MR_Curr_mode_work_time : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MR_0_out_TCC_MR_Targ_angl : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MR_0_out_TCC_MR_Targ_angu_velo : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MR_0_out_TP_MR_Curr_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MSM19_0_done : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Curr_mode_load_inst : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Curr_mode_work_time : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MSM19_0_out_MSM_MR_Curr_mode_work_time_load_inst : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Curr_mode_work_time_stor_inst : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Next_cycl_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MSM19_0_out_MSM_MR_Next_cycl_mode_stor_inst : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Targ_angl : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MSM19_0_out_MSM_MR_Targ_angl_stor_inst : STD_LOGIC;
  signal MSM19_0_out_MSM_MR_Targ_angu_velo : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal MSM19_0_out_MSM_MR_Targ_angu_velo_stor_inst : STD_LOGIC;
  signal SSI_0_out_SSCO_SSI_Sun_sens_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SSS0Dependency_0_start0 : STD_LOGIC;
  signal SSS0Dependency_0_start1 : STD_LOGIC;
  signal SSS0Dependency_0_start2 : STD_LOGIC;
  signal SSS0Dependency_0_start3 : STD_LOGIC;
  signal SSS0Dependency_0_start4 : STD_LOGIC;
  signal SSS0Dependency_0_start5 : STD_LOGIC;
  signal SSS0Dependency_0_start6 : STD_LOGIC;
  signal SSS0Dependency_0_start7 : STD_LOGIC;
  signal SSS0Dependency_0_start8 : STD_LOGIC;
  signal TCC20_0_done : STD_LOGIC;
  signal TCC20_0_out_CCR_CCR_Tria_cont_quan : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TCC20_0_out_TCC_MR_Targ_angl_load_inst : STD_LOGIC;
  signal TCC20_0_out_TCC_MR_Targ_angu_velo_load_inst : STD_LOGIC;
  signal TDC21_0_done : STD_LOGIC;
  signal TDC21_0_out_TDCR_TDCR_Thru_comb_logi : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TIP13_0_done : STD_LOGIC;
  signal TIP13_0_out_TIP_MR_Next_cycl_mode : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TIP13_0_out_TIP_MR_Next_cycl_mode_stor_inst : STD_LOGIC;
  signal TP22_0_done : STD_LOGIC;
  signal TP22_0_out_TP_DMC_Tele_data_tran_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TP22_0_out_TP_MR_Curr_mode_load_inst : STD_LOGIC;
  signal TPI_0_out_TPCO_TPI_Thru_powe_on_inst : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TTC23_wrapper_0_done_0 : STD_LOGIC;
  signal TTC23_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TTC23_wrapper_0_out_TTI_TTI_Tria_cont_inst_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_0_1 : STD_LOGIC;
  signal in_DMC_TIP_Tele_inst_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_GDA_G_Gyro_powe_stat_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_GDA_G_Puls_coun_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Angl_anal_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Sun_sens_powe_stat_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_SSDA_SS_Sun_visi_sign_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal in_TDA_TCT_Thru_powe_stat_0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal interruptsignal_0_1 : STD_LOGIC;
  signal rst_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN SSS0_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst_0 : signal is "xilinx.com:signal:reset:1.0 RST.RST_0 RST";
  attribute X_INTERFACE_PARAMETER of rst_0 : signal is "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_0_1 <= clk_0;
  in_DMC_TIP_Tele_inst_0_1(31 downto 0) <= in_DMC_TIP_Tele_inst_0(31 downto 0);
  in_GDA_G_Gyro_powe_stat_0_0_1(31 downto 0) <= in_GDA_G_Gyro_powe_stat_0_0(31 downto 0);
  in_GDA_G_Puls_coun_0_0_1(31 downto 0) <= in_GDA_G_Puls_coun_0_0(31 downto 0);
  in_SSDA_SS_Angl_anal_0_0_1(31 downto 0) <= in_SSDA_SS_Angl_anal_0_0(31 downto 0);
  in_SSDA_SS_Sun_sens_powe_stat_0_0_1(31 downto 0) <= in_SSDA_SS_Sun_sens_powe_stat_0_0(31 downto 0);
  in_SSDA_SS_Sun_visi_sign_0_0_1(31 downto 0) <= in_SSDA_SS_Sun_visi_sign_0_0(31 downto 0);
  in_TDA_TCT_Thru_powe_stat_0_0_1(31 downto 0) <= in_TDA_TCT_Thru_powe_stat_0_0(31 downto 0);
  interruptsignal_0_1 <= interruptsignal_0;
  out_32IT_32IT_32ms_inte_time_star_inst_0_0(31 downto 0) <= I1_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0);
  out_GCO_G_Gyro_powe_on_puls_0_0_0(31 downto 0) <= I1_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0);
  out_GDA_G_Gyro_powe_stat_perc_inst_0_0 <= DA14_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0;
  out_GDA_G_Puls_coun_acqu_inst_0_0 <= DA14_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0;
  out_GD_GD_Gyro_powe_stat_0_0(31 downto 0) <= DA14_wrapper_0_out_GD_GD_Gyro_powe_stat_0(31 downto 0);
  out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0(31 downto 0) <= I1_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0);
  out_SSDA_SS_Angl_anal_acqu_inst_0_0 <= DA14_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0;
  out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 <= DA14_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0;
  out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 <= DA14_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0;
  out_SSD_SSD_Sun_sens_powe_stat_0_0(31 downto 0) <= DA14_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0);
  out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 <= DA14_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0;
  out_TPCO_TCT_Thru_powe_on_puls_0_0_0(31 downto 0) <= I1_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0);
  out_TP_DMC_Tele_data_tran_inst_0(31 downto 0) <= TP22_0_out_TP_DMC_Tele_data_tran_inst(31 downto 0);
  out_TTCO_TCT_Tria_cont_sign_0_0(31 downto 0) <= TTC23_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0(31 downto 0);
  rst_0_1 <= rst_0;
AD18_0: component SSS0_AD18_0_0
     port map (
      clk => clk_0_1,
      done => AD18_0_done,
      in_AD_MR_Curr_mode(31 downto 0) => MR_0_out_AD_MR_Curr_mode(31 downto 0),
      in_GD_GD_Angu_velo_anal(31 downto 0) => DA14_wrapper_0_out_GD_GD_Angu_velo_anal_0(31 downto 0),
      in_SSD_SSD_Sun_meas_angl(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_meas_angl_0(31 downto 0),
      in_SSD_SSD_Sun_visi_sign(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_visi_sign_0(31 downto 0),
      out_ADR_ADR_Tria_angu_velo(31 downto 0) => AD18_0_out_ADR_ADR_Tria_angu_velo(31 downto 0),
      out_ADR_ADR_Tria_atti_angl(31 downto 0) => AD18_0_out_ADR_ADR_Tria_atti_angl(31 downto 0),
      out_AD_MR_Curr_mode_load_inst => AD18_0_out_AD_MR_Curr_mode_load_inst,
      rst => rst_0_1,
      start => SSS0Dependency_0_start3
    );
DA14_wrapper_0: component SSS0_DA14_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => DA14_wrapper_0_done_0,
      in_GDA_G_Gyro_powe_stat_0(31 downto 0) => in_GDA_G_Gyro_powe_stat_0_0_1(31 downto 0),
      in_GDA_G_Puls_coun_0(31 downto 0) => in_GDA_G_Puls_coun_0_0_1(31 downto 0),
      in_SSDA_SS_Angl_anal_0(31 downto 0) => in_SSDA_SS_Angl_anal_0_0_1(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0) => in_SSDA_SS_Sun_sens_powe_stat_0_0_1(31 downto 0),
      in_SSDA_SS_Sun_visi_sign_0(31 downto 0) => in_SSDA_SS_Sun_visi_sign_0_0_1(31 downto 0),
      in_TDA_TCT_Thru_powe_stat_0(31 downto 0) => in_TDA_TCT_Thru_powe_stat_0_0_1(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst_0 => DA14_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0,
      out_GDA_G_Puls_coun_acqu_inst_0 => DA14_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0,
      out_GD_GD_Angu_velo_anal_0(31 downto 0) => DA14_wrapper_0_out_GD_GD_Angu_velo_anal_0(31 downto 0),
      out_GD_GD_Gyro_powe_stat_0(31 downto 0) => DA14_wrapper_0_out_GD_GD_Gyro_powe_stat_0(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst_0 => DA14_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 => DA14_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0 => DA14_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0,
      out_SSD_SSD_Sun_meas_angl_0(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_meas_angl_0(31 downto 0),
      out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0),
      out_SSD_SSD_Sun_visi_sign_0(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_visi_sign_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst_0 => DA14_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0,
      out_TD_TD_Thru_powe_stat_0(31 downto 0) => DA14_wrapper_0_out_TD_TD_Thru_powe_stat_0(31 downto 0),
      rst_0 => rst_0_1,
      start_0 => SSS0Dependency_0_start2
    );
GI_0: component SSS0_GI_0_0
     port map (
      in_GCO_GI_Gyro_powe_on_inst_load_inst => I1_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0,
      in_SGPo_GI_Gyro_powe_on_inst(31 downto 0) => I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0),
      in_SGPo_GI_Gyro_powe_on_inst_stor_inst => I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0,
      out_GCO_GI_Gyro_powe_on_inst(31 downto 0) => GI_0_out_GCO_GI_Gyro_powe_on_inst(31 downto 0)
    );
I1_wrapper_0: component SSS0_I1_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => I1_wrapper_0_done_0,
      in_GCO_GI_Gyro_powe_on_inst_0_0(31 downto 0) => GI_0_out_GCO_GI_Gyro_powe_on_inst(31 downto 0),
      in_SSCO_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0) => SSI_0_out_SSCO_SSI_Sun_sens_powe_on_inst(31 downto 0),
      in_TPCO_TPI_Thru_powe_on_inst_0_0(31 downto 0) => TPI_0_out_TPCO_TPI_Thru_powe_on_inst(31 downto 0),
      out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0) => I1_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 => I1_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0,
      out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0) => I1_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0(31 downto 0),
      out_MI_MR_Curr_mode_0(31 downto 0) => I1_wrapper_0_out_MI_MR_Curr_mode_0(31 downto 0),
      out_MI_MR_Curr_mode_stor_inst_0 => I1_wrapper_0_out_MI_MR_Curr_mode_stor_inst_0,
      out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0) => I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 => I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0,
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 => I1_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0,
      out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0) => I1_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0) => I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 => I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0,
      out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0) => I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 => I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0,
      out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0) => I1_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 => I1_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0,
      rst_0 => rst_0_1,
      start_0 => SSS0Dependency_0_start0
    );
MR_0: component SSS0_MR_0_0
     port map (
      in_AD_MR_Curr_mode_load_inst => AD18_0_out_AD_MR_Curr_mode_load_inst,
      in_MI_MR_Curr_mode(31 downto 0) => I1_wrapper_0_out_MI_MR_Curr_mode_0(31 downto 0),
      in_MI_MR_Curr_mode_stor_inst => I1_wrapper_0_out_MI_MR_Curr_mode_stor_inst_0,
      in_MSM_MR_Curr_mode_load_inst => MSM19_0_out_MSM_MR_Curr_mode_load_inst,
      in_MSM_MR_Curr_mode_work_time(31 downto 0) => MSM19_0_out_MSM_MR_Curr_mode_work_time(31 downto 0),
      in_MSM_MR_Curr_mode_work_time_load_inst => MSM19_0_out_MSM_MR_Curr_mode_work_time_load_inst,
      in_MSM_MR_Curr_mode_work_time_stor_inst => MSM19_0_out_MSM_MR_Curr_mode_work_time_stor_inst,
      in_MSM_MR_Next_cycl_mode(31 downto 0) => MSM19_0_out_MSM_MR_Next_cycl_mode(31 downto 0),
      in_MSM_MR_Next_cycl_mode_stor_inst => MSM19_0_out_MSM_MR_Next_cycl_mode_stor_inst,
      in_MSM_MR_Targ_angl(31 downto 0) => MSM19_0_out_MSM_MR_Targ_angl(31 downto 0),
      in_MSM_MR_Targ_angl_stor_inst => MSM19_0_out_MSM_MR_Targ_angl_stor_inst,
      in_MSM_MR_Targ_angu_velo(31 downto 0) => MSM19_0_out_MSM_MR_Targ_angu_velo(31 downto 0),
      in_MSM_MR_Targ_angu_velo_stor_inst => MSM19_0_out_MSM_MR_Targ_angu_velo_stor_inst,
      in_TCC_MR_Targ_angl_load_inst => TCC20_0_out_TCC_MR_Targ_angl_load_inst,
      in_TCC_MR_Targ_angu_velo_load_inst => TCC20_0_out_TCC_MR_Targ_angu_velo_load_inst,
      in_TIP_MR_Next_cycl_mode(31 downto 0) => TIP13_0_out_TIP_MR_Next_cycl_mode(31 downto 0),
      in_TIP_MR_Next_cycl_mode_stor_inst => TIP13_0_out_TIP_MR_Next_cycl_mode_stor_inst,
      in_TP_MR_Curr_mode_load_inst => TP22_0_out_TP_MR_Curr_mode_load_inst,
      out_AD_MR_Curr_mode(31 downto 0) => MR_0_out_AD_MR_Curr_mode(31 downto 0),
      out_MSM_MR_Curr_mode(31 downto 0) => MR_0_out_MSM_MR_Curr_mode(31 downto 0),
      out_MSM_MR_Curr_mode_work_time(31 downto 0) => MR_0_out_MSM_MR_Curr_mode_work_time(31 downto 0),
      out_TCC_MR_Targ_angl(31 downto 0) => MR_0_out_TCC_MR_Targ_angl(31 downto 0),
      out_TCC_MR_Targ_angu_velo(31 downto 0) => MR_0_out_TCC_MR_Targ_angu_velo(31 downto 0),
      out_TP_MR_Curr_mode(31 downto 0) => MR_0_out_TP_MR_Curr_mode(31 downto 0)
    );
MSM19_0: component SSS0_MSM19_0_0
     port map (
      clk => clk_0_1,
      done => MSM19_0_done,
      in_ADR_ADR_Tria_angu_velo(31 downto 0) => AD18_0_out_ADR_ADR_Tria_angu_velo(31 downto 0),
      in_ADR_ADR_Tria_atti_angl(31 downto 0) => AD18_0_out_ADR_ADR_Tria_atti_angl(31 downto 0),
      in_MSM_MR_Curr_mode(31 downto 0) => MR_0_out_MSM_MR_Curr_mode(31 downto 0),
      in_MSM_MR_Curr_mode_work_time(31 downto 0) => MR_0_out_MSM_MR_Curr_mode_work_time(31 downto 0),
      in_SSD_SSD_Sun_visi_sign(31 downto 0) => DA14_wrapper_0_out_SSD_SSD_Sun_visi_sign_0(31 downto 0),
      out_MSM_MR_Curr_mode_load_inst => MSM19_0_out_MSM_MR_Curr_mode_load_inst,
      out_MSM_MR_Curr_mode_work_time(31 downto 0) => MSM19_0_out_MSM_MR_Curr_mode_work_time(31 downto 0),
      out_MSM_MR_Curr_mode_work_time_load_inst => MSM19_0_out_MSM_MR_Curr_mode_work_time_load_inst,
      out_MSM_MR_Curr_mode_work_time_stor_inst => MSM19_0_out_MSM_MR_Curr_mode_work_time_stor_inst,
      out_MSM_MR_Next_cycl_mode(31 downto 0) => MSM19_0_out_MSM_MR_Next_cycl_mode(31 downto 0),
      out_MSM_MR_Next_cycl_mode_stor_inst => MSM19_0_out_MSM_MR_Next_cycl_mode_stor_inst,
      out_MSM_MR_Targ_angl(31 downto 0) => MSM19_0_out_MSM_MR_Targ_angl(31 downto 0),
      out_MSM_MR_Targ_angl_stor_inst => MSM19_0_out_MSM_MR_Targ_angl_stor_inst,
      out_MSM_MR_Targ_angu_velo(31 downto 0) => MSM19_0_out_MSM_MR_Targ_angu_velo(31 downto 0),
      out_MSM_MR_Targ_angu_velo_stor_inst => MSM19_0_out_MSM_MR_Targ_angu_velo_stor_inst,
      rst => rst_0_1,
      start => SSS0Dependency_0_start4
    );
SSI_0: component SSS0_SSI_0_0
     port map (
      in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst => I1_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0,
      in_SSSP_SSI_Sun_sens_powe_on_inst(31 downto 0) => I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(31 downto 0),
      in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst => I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0,
      out_SSCO_SSI_Sun_sens_powe_on_inst(31 downto 0) => SSI_0_out_SSCO_SSI_Sun_sens_powe_on_inst(31 downto 0)
    );
SSS0Dependency_0: component SSS0_SSS0Dependency_0_0
     port map (
      clk => clk_0_1,
      done0 => I1_wrapper_0_done_0,
      done1 => TIP13_0_done,
      done2 => DA14_wrapper_0_done_0,
      done3 => AD18_0_done,
      done4 => MSM19_0_done,
      done5 => TCC20_0_done,
      done6 => TDC21_0_done,
      done7 => TP22_0_done,
      done8 => TTC23_wrapper_0_done_0,
      interruptsignal => interruptsignal_0_1,
      rst => rst_0_1,
      start0 => SSS0Dependency_0_start0,
      start1 => SSS0Dependency_0_start1,
      start2 => SSS0Dependency_0_start2,
      start3 => SSS0Dependency_0_start3,
      start4 => SSS0Dependency_0_start4,
      start5 => SSS0Dependency_0_start5,
      start6 => SSS0Dependency_0_start6,
      start7 => SSS0Dependency_0_start7,
      start8 => SSS0Dependency_0_start8
    );
TCC20_0: component SSS0_TCC20_0_0
     port map (
      clk => clk_0_1,
      done => TCC20_0_done,
      in_ADR_ADR_Tria_angu_velo(31 downto 0) => AD18_0_out_ADR_ADR_Tria_angu_velo(31 downto 0),
      in_ADR_ADR_Tria_atti_angl(31 downto 0) => AD18_0_out_ADR_ADR_Tria_atti_angl(31 downto 0),
      in_TCC_MR_Targ_angl(31 downto 0) => MR_0_out_TCC_MR_Targ_angl(31 downto 0),
      in_TCC_MR_Targ_angu_velo(31 downto 0) => MR_0_out_TCC_MR_Targ_angu_velo(31 downto 0),
      out_CCR_CCR_Tria_cont_quan(31 downto 0) => TCC20_0_out_CCR_CCR_Tria_cont_quan(31 downto 0),
      out_TCC_MR_Targ_angl_load_inst => TCC20_0_out_TCC_MR_Targ_angl_load_inst,
      out_TCC_MR_Targ_angu_velo_load_inst => TCC20_0_out_TCC_MR_Targ_angu_velo_load_inst,
      rst => rst_0_1,
      start => SSS0Dependency_0_start5
    );
TDC21_0: component SSS0_TDC21_0_0
     port map (
      clk => clk_0_1,
      done => TDC21_0_done,
      in_CCR_CCR_Tria_cont_quan(31 downto 0) => TCC20_0_out_CCR_CCR_Tria_cont_quan(31 downto 0),
      in_TD_TD_Thru_powe_stat(31 downto 0) => DA14_wrapper_0_out_TD_TD_Thru_powe_stat_0(31 downto 0),
      out_TDCR_TDCR_Thru_comb_logi(31 downto 0) => TDC21_0_out_TDCR_TDCR_Thru_comb_logi(31 downto 0),
      rst => rst_0_1,
      start => SSS0Dependency_0_start6
    );
TIP13_0: component SSS0_TIP13_0_0
     port map (
      clk => clk_0_1,
      done => TIP13_0_done,
      in_DMC_TIP_Tele_inst(31 downto 0) => in_DMC_TIP_Tele_inst_0_1(31 downto 0),
      out_TIP_MR_Next_cycl_mode(31 downto 0) => TIP13_0_out_TIP_MR_Next_cycl_mode(31 downto 0),
      out_TIP_MR_Next_cycl_mode_stor_inst => TIP13_0_out_TIP_MR_Next_cycl_mode_stor_inst,
      rst => rst_0_1,
      start => SSS0Dependency_0_start1
    );
TP22_0: component SSS0_TP22_0_0
     port map (
      clk => clk_0_1,
      done => TP22_0_done,
      in_ADR_ADR_Tria_angu_velo(31 downto 0) => AD18_0_out_ADR_ADR_Tria_angu_velo(31 downto 0),
      in_ADR_ADR_Tria_atti_angl(31 downto 0) => AD18_0_out_ADR_ADR_Tria_atti_angl(31 downto 0),
      in_TP_MR_Curr_mode(31 downto 0) => MR_0_out_TP_MR_Curr_mode(31 downto 0),
      out_TP_DMC_Tele_data_tran_inst(31 downto 0) => TP22_0_out_TP_DMC_Tele_data_tran_inst(31 downto 0),
      out_TP_MR_Curr_mode_load_inst => TP22_0_out_TP_MR_Curr_mode_load_inst,
      rst => rst_0_1,
      start => SSS0Dependency_0_start7
    );
TPI_0: component SSS0_TPI_0_0
     port map (
      in_STPo_TPI_Thru_powe_on_inst(31 downto 0) => I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0_0(31 downto 0),
      in_STPo_TPI_Thru_powe_on_inst_stor_inst => I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0,
      in_TPCO_TPI_Thru_powe_on_inst_load_inst => I1_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0,
      out_TPCO_TPI_Thru_powe_on_inst(31 downto 0) => TPI_0_out_TPCO_TPI_Thru_powe_on_inst(31 downto 0)
    );
TTC23_wrapper_0: component SSS0_TTC23_wrapper_0_0
     port map (
      clk_0 => clk_0_1,
      done_0 => TTC23_wrapper_0_done_0,
      in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0) => TDC21_0_out_TDCR_TDCR_Thru_comb_logi(31 downto 0),
      in_TTI_TTI_Tria_cont_inst_0(31 downto 0) => TTC23_wrapper_0_out_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign_0(31 downto 0) => TTC23_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0(31 downto 0),
      out_TTI_TTI_Tria_cont_inst_0(31 downto 0) => TTC23_wrapper_0_out_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      rst_0 => rst_0_1,
      start_0 => SSS0Dependency_0_start8
    );
end STRUCTURE;
