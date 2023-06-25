
################################################################
# This is a generated script based on design: SSS0
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2021.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source SSS0_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name SSS0

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk_0 [ create_bd_port -dir I -type clk clk_0 ]
  set in_DMC_TIP_Tele_inst_0 [ create_bd_port -dir I -from 31 -to 0 in_DMC_TIP_Tele_inst_0 ]
  set in_GDA_G_Gyro_powe_stat_0_0 [ create_bd_port -dir I -from 31 -to 0 in_GDA_G_Gyro_powe_stat_0_0 ]
  set in_GDA_G_Puls_coun_0_0 [ create_bd_port -dir I -from 31 -to 0 in_GDA_G_Puls_coun_0_0 ]
  set in_SSDA_SS_Angl_anal_0_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Angl_anal_0_0 ]
  set in_SSDA_SS_Sun_sens_powe_stat_0_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Sun_sens_powe_stat_0_0 ]
  set in_SSDA_SS_Sun_visi_sign_0_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Sun_visi_sign_0_0 ]
  set in_TDA_TCT_Thru_powe_stat_0_0 [ create_bd_port -dir I -from 31 -to 0 in_TDA_TCT_Thru_powe_stat_0_0 ]
  set interruptsignal_0 [ create_bd_port -dir I interruptsignal_0 ]
  set out_32IT_32IT_32ms_inte_time_star_inst_0_0 [ create_bd_port -dir O -from 31 -to 0 out_32IT_32IT_32ms_inte_time_star_inst_0_0 ]
  set out_GCO_G_Gyro_powe_on_puls_0_0_0 [ create_bd_port -dir O -from 31 -to 0 out_GCO_G_Gyro_powe_on_puls_0_0_0 ]
  set out_GDA_G_Gyro_powe_stat_perc_inst_0_0 [ create_bd_port -dir O out_GDA_G_Gyro_powe_stat_perc_inst_0_0 ]
  set out_GDA_G_Puls_coun_acqu_inst_0_0 [ create_bd_port -dir O out_GDA_G_Puls_coun_acqu_inst_0_0 ]
  set out_GD_GD_Gyro_powe_stat_0_0 [ create_bd_port -dir O -from 31 -to 0 out_GD_GD_Gyro_powe_stat_0_0 ]
  set out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 [ create_bd_port -dir O -from 31 -to 0 out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 ]
  set out_SSDA_SS_Angl_anal_acqu_inst_0_0 [ create_bd_port -dir O out_SSDA_SS_Angl_anal_acqu_inst_0_0 ]
  set out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 [ create_bd_port -dir O out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 ]
  set out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 [ create_bd_port -dir O out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 ]
  set out_SSD_SSD_Sun_sens_powe_stat_0_0 [ create_bd_port -dir O -from 31 -to 0 out_SSD_SSD_Sun_sens_powe_stat_0_0 ]
  set out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 [ create_bd_port -dir O out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 ]
  set out_TPCO_TCT_Thru_powe_on_puls_0_0_0 [ create_bd_port -dir O -from 31 -to 0 out_TPCO_TCT_Thru_powe_on_puls_0_0_0 ]
  set out_TP_DMC_Tele_data_tran_inst_0 [ create_bd_port -dir O -from 31 -to 0 out_TP_DMC_Tele_data_tran_inst_0 ]
  set out_TTCO_TCT_Tria_cont_sign_0_0 [ create_bd_port -dir O -from 31 -to 0 out_TTCO_TCT_Tria_cont_sign_0_0 ]
  set rst_0 [ create_bd_port -dir I -type rst rst_0 ]

  # Create instance: AD18_0, and set properties
  set AD18_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:AD18:1.0 AD18_0 ]

  # Create instance: DA14_wrapper_0, and set properties
  set DA14_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:DA14_wrapper:1.0 DA14_wrapper_0 ]

  # Create instance: GI_0, and set properties
  set GI_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:GI:1.0 GI_0 ]

  # Create instance: I1_wrapper_0, and set properties
  set I1_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:I1_wrapper:1.0 I1_wrapper_0 ]

  # Create instance: MR_0, and set properties
  set MR_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:MR:1.0 MR_0 ]

  # Create instance: MSM19_0, and set properties
  set MSM19_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:MSM19:1.0 MSM19_0 ]

  # Create instance: SSI_0, and set properties
  set SSI_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SSI:1.0 SSI_0 ]

  # Create instance: SSS0Dependency_0, and set properties
  set SSS0Dependency_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SSS0Dependency:1.0 SSS0Dependency_0 ]

  # Create instance: TCC20_0, and set properties
  set TCC20_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TCC20:1.0 TCC20_0 ]

  # Create instance: TDC21_0, and set properties
  set TDC21_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TDC21:1.0 TDC21_0 ]

  # Create instance: TIP13_0, and set properties
  set TIP13_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TIP13:1.0 TIP13_0 ]

  # Create instance: TP22_0, and set properties
  set TP22_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TP22:1.0 TP22_0 ]

  # Create instance: TPI_0, and set properties
  set TPI_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TPI:1.0 TPI_0 ]

  # Create instance: TTC23_wrapper_0, and set properties
  set TTC23_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TTC23_wrapper:1.0 TTC23_wrapper_0 ]

  # Create port connections
  connect_bd_net -net AD18_0_done [get_bd_pins AD18_0/done] [get_bd_pins SSS0Dependency_0/done3]
  connect_bd_net -net AD18_0_out_ADR_ADR_Tria_angu_velo [get_bd_pins AD18_0/out_ADR_ADR_Tria_angu_velo] [get_bd_pins MSM19_0/in_ADR_ADR_Tria_angu_velo] [get_bd_pins TCC20_0/in_ADR_ADR_Tria_angu_velo] [get_bd_pins TP22_0/in_ADR_ADR_Tria_angu_velo]
  connect_bd_net -net AD18_0_out_ADR_ADR_Tria_atti_angl [get_bd_pins AD18_0/out_ADR_ADR_Tria_atti_angl] [get_bd_pins MSM19_0/in_ADR_ADR_Tria_atti_angl] [get_bd_pins TCC20_0/in_ADR_ADR_Tria_atti_angl] [get_bd_pins TP22_0/in_ADR_ADR_Tria_atti_angl]
  connect_bd_net -net AD18_0_out_AD_MR_Curr_mode_load_inst [get_bd_pins AD18_0/out_AD_MR_Curr_mode_load_inst] [get_bd_pins MR_0/in_AD_MR_Curr_mode_load_inst]
  connect_bd_net -net DA14_wrapper_0_done_0 [get_bd_pins DA14_wrapper_0/done_0] [get_bd_pins SSS0Dependency_0/done2]
  connect_bd_net -net DA14_wrapper_0_out_GDA_G_Gyro_powe_stat_perc_inst_0 [get_bd_ports out_GDA_G_Gyro_powe_stat_perc_inst_0_0] [get_bd_pins DA14_wrapper_0/out_GDA_G_Gyro_powe_stat_perc_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_GDA_G_Puls_coun_acqu_inst_0 [get_bd_ports out_GDA_G_Puls_coun_acqu_inst_0_0] [get_bd_pins DA14_wrapper_0/out_GDA_G_Puls_coun_acqu_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_GD_GD_Angu_velo_anal_0 [get_bd_pins AD18_0/in_GD_GD_Angu_velo_anal] [get_bd_pins DA14_wrapper_0/out_GD_GD_Angu_velo_anal_0]
  connect_bd_net -net DA14_wrapper_0_out_GD_GD_Gyro_powe_stat_0 [get_bd_ports out_GD_GD_Gyro_powe_stat_0_0] [get_bd_pins DA14_wrapper_0/out_GD_GD_Gyro_powe_stat_0]
  connect_bd_net -net DA14_wrapper_0_out_SSDA_SS_Angl_anal_acqu_inst_0 [get_bd_ports out_SSDA_SS_Angl_anal_acqu_inst_0_0] [get_bd_pins DA14_wrapper_0/out_SSDA_SS_Angl_anal_acqu_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 [get_bd_ports out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0] [get_bd_pins DA14_wrapper_0/out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_SSDA_SS_Sun_visi_sign_acqu_inst_0 [get_bd_ports out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0] [get_bd_pins DA14_wrapper_0/out_SSDA_SS_Sun_visi_sign_acqu_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_SSD_SSD_Sun_meas_angl_0 [get_bd_pins AD18_0/in_SSD_SSD_Sun_meas_angl] [get_bd_pins DA14_wrapper_0/out_SSD_SSD_Sun_meas_angl_0]
  connect_bd_net -net DA14_wrapper_0_out_SSD_SSD_Sun_sens_powe_stat_0 [get_bd_ports out_SSD_SSD_Sun_sens_powe_stat_0_0] [get_bd_pins DA14_wrapper_0/out_SSD_SSD_Sun_sens_powe_stat_0]
  connect_bd_net -net DA14_wrapper_0_out_SSD_SSD_Sun_visi_sign_0 [get_bd_pins AD18_0/in_SSD_SSD_Sun_visi_sign] [get_bd_pins DA14_wrapper_0/out_SSD_SSD_Sun_visi_sign_0] [get_bd_pins MSM19_0/in_SSD_SSD_Sun_visi_sign]
  connect_bd_net -net DA14_wrapper_0_out_TDA_TCT_Thru_powe_stat_perc_inst_0 [get_bd_ports out_TDA_TCT_Thru_powe_stat_perc_inst_0_0] [get_bd_pins DA14_wrapper_0/out_TDA_TCT_Thru_powe_stat_perc_inst_0]
  connect_bd_net -net DA14_wrapper_0_out_TD_TD_Thru_powe_stat_0 [get_bd_pins DA14_wrapper_0/out_TD_TD_Thru_powe_stat_0] [get_bd_pins TDC21_0/in_TD_TD_Thru_powe_stat]
  connect_bd_net -net GI_0_out_GCO_GI_Gyro_powe_on_inst [get_bd_pins GI_0/out_GCO_GI_Gyro_powe_on_inst] [get_bd_pins I1_wrapper_0/in_GCO_GI_Gyro_powe_on_inst_0_0]
  connect_bd_net -net I1_wrapper_0_done_0 [get_bd_pins I1_wrapper_0/done_0] [get_bd_pins SSS0Dependency_0/done0]
  connect_bd_net -net I1_wrapper_0_out_32IT_32IT_32ms_inte_time_star_inst_0 [get_bd_ports out_32IT_32IT_32ms_inte_time_star_inst_0_0] [get_bd_pins I1_wrapper_0/out_32IT_32IT_32ms_inte_time_star_inst_0]
  connect_bd_net -net I1_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 [get_bd_pins GI_0/in_GCO_GI_Gyro_powe_on_inst_load_inst] [get_bd_pins I1_wrapper_0/out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0]
  connect_bd_net -net I1_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0_0 [get_bd_ports out_GCO_G_Gyro_powe_on_puls_0_0_0] [get_bd_pins I1_wrapper_0/out_GCO_G_Gyro_powe_on_puls_0_0]
  connect_bd_net -net I1_wrapper_0_out_MI_MR_Curr_mode_0 [get_bd_pins I1_wrapper_0/out_MI_MR_Curr_mode_0] [get_bd_pins MR_0/in_MI_MR_Curr_mode]
  connect_bd_net -net I1_wrapper_0_out_MI_MR_Curr_mode_stor_inst_0 [get_bd_pins I1_wrapper_0/out_MI_MR_Curr_mode_stor_inst_0] [get_bd_pins MR_0/in_MI_MR_Curr_mode_stor_inst]
  connect_bd_net -net I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0_0 [get_bd_pins GI_0/in_SGPo_GI_Gyro_powe_on_inst] [get_bd_pins I1_wrapper_0/out_SGPo_GI_Gyro_powe_on_inst_0_0]
  connect_bd_net -net I1_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 [get_bd_pins GI_0/in_SGPo_GI_Gyro_powe_on_inst_stor_inst] [get_bd_pins I1_wrapper_0/out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0]
  connect_bd_net -net I1_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 [get_bd_pins I1_wrapper_0/out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0] [get_bd_pins SSI_0/in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst]
  connect_bd_net -net I1_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0_0 [get_bd_ports out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0] [get_bd_pins I1_wrapper_0/out_SSCO_SS_Sun_sens_powe_on_puls_0_0]
  connect_bd_net -net I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 [get_bd_pins I1_wrapper_0/out_SSSP_SSI_Sun_sens_powe_on_inst_0_0] [get_bd_pins SSI_0/in_SSSP_SSI_Sun_sens_powe_on_inst]
  connect_bd_net -net I1_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 [get_bd_pins I1_wrapper_0/out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0] [get_bd_pins SSI_0/in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst]
  connect_bd_net -net I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0_0 [get_bd_pins I1_wrapper_0/out_STPo_TPI_Thru_powe_on_inst_0_0] [get_bd_pins TPI_0/in_STPo_TPI_Thru_powe_on_inst]
  connect_bd_net -net I1_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 [get_bd_pins I1_wrapper_0/out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0] [get_bd_pins TPI_0/in_STPo_TPI_Thru_powe_on_inst_stor_inst]
  connect_bd_net -net I1_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0_0 [get_bd_ports out_TPCO_TCT_Thru_powe_on_puls_0_0_0] [get_bd_pins I1_wrapper_0/out_TPCO_TCT_Thru_powe_on_puls_0_0]
  connect_bd_net -net I1_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 [get_bd_pins I1_wrapper_0/out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0] [get_bd_pins TPI_0/in_TPCO_TPI_Thru_powe_on_inst_load_inst]
  connect_bd_net -net MR_0_out_AD_MR_Curr_mode [get_bd_pins AD18_0/in_AD_MR_Curr_mode] [get_bd_pins MR_0/out_AD_MR_Curr_mode]
  connect_bd_net -net MR_0_out_MSM_MR_Curr_mode [get_bd_pins MR_0/out_MSM_MR_Curr_mode] [get_bd_pins MSM19_0/in_MSM_MR_Curr_mode]
  connect_bd_net -net MR_0_out_MSM_MR_Curr_mode_work_time [get_bd_pins MR_0/out_MSM_MR_Curr_mode_work_time] [get_bd_pins MSM19_0/in_MSM_MR_Curr_mode_work_time]
  connect_bd_net -net MR_0_out_TCC_MR_Targ_angl [get_bd_pins MR_0/out_TCC_MR_Targ_angl] [get_bd_pins TCC20_0/in_TCC_MR_Targ_angl]
  connect_bd_net -net MR_0_out_TCC_MR_Targ_angu_velo [get_bd_pins MR_0/out_TCC_MR_Targ_angu_velo] [get_bd_pins TCC20_0/in_TCC_MR_Targ_angu_velo]
  connect_bd_net -net MR_0_out_TP_MR_Curr_mode [get_bd_pins MR_0/out_TP_MR_Curr_mode] [get_bd_pins TP22_0/in_TP_MR_Curr_mode]
  connect_bd_net -net MSM19_0_done [get_bd_pins MSM19_0/done] [get_bd_pins SSS0Dependency_0/done4]
  connect_bd_net -net MSM19_0_out_MSM_MR_Curr_mode_load_inst [get_bd_pins MR_0/in_MSM_MR_Curr_mode_load_inst] [get_bd_pins MSM19_0/out_MSM_MR_Curr_mode_load_inst]
  connect_bd_net -net MSM19_0_out_MSM_MR_Curr_mode_work_time [get_bd_pins MR_0/in_MSM_MR_Curr_mode_work_time] [get_bd_pins MSM19_0/out_MSM_MR_Curr_mode_work_time]
  connect_bd_net -net MSM19_0_out_MSM_MR_Curr_mode_work_time_load_inst [get_bd_pins MR_0/in_MSM_MR_Curr_mode_work_time_load_inst] [get_bd_pins MSM19_0/out_MSM_MR_Curr_mode_work_time_load_inst]
  connect_bd_net -net MSM19_0_out_MSM_MR_Curr_mode_work_time_stor_inst [get_bd_pins MR_0/in_MSM_MR_Curr_mode_work_time_stor_inst] [get_bd_pins MSM19_0/out_MSM_MR_Curr_mode_work_time_stor_inst]
  connect_bd_net -net MSM19_0_out_MSM_MR_Next_cycl_mode [get_bd_pins MR_0/in_MSM_MR_Next_cycl_mode] [get_bd_pins MSM19_0/out_MSM_MR_Next_cycl_mode]
  connect_bd_net -net MSM19_0_out_MSM_MR_Next_cycl_mode_stor_inst [get_bd_pins MR_0/in_MSM_MR_Next_cycl_mode_stor_inst] [get_bd_pins MSM19_0/out_MSM_MR_Next_cycl_mode_stor_inst]
  connect_bd_net -net MSM19_0_out_MSM_MR_Targ_angl [get_bd_pins MR_0/in_MSM_MR_Targ_angl] [get_bd_pins MSM19_0/out_MSM_MR_Targ_angl]
  connect_bd_net -net MSM19_0_out_MSM_MR_Targ_angl_stor_inst [get_bd_pins MR_0/in_MSM_MR_Targ_angl_stor_inst] [get_bd_pins MSM19_0/out_MSM_MR_Targ_angl_stor_inst]
  connect_bd_net -net MSM19_0_out_MSM_MR_Targ_angu_velo [get_bd_pins MR_0/in_MSM_MR_Targ_angu_velo] [get_bd_pins MSM19_0/out_MSM_MR_Targ_angu_velo]
  connect_bd_net -net MSM19_0_out_MSM_MR_Targ_angu_velo_stor_inst [get_bd_pins MR_0/in_MSM_MR_Targ_angu_velo_stor_inst] [get_bd_pins MSM19_0/out_MSM_MR_Targ_angu_velo_stor_inst]
  connect_bd_net -net SSI_0_out_SSCO_SSI_Sun_sens_powe_on_inst [get_bd_pins I1_wrapper_0/in_SSCO_SSI_Sun_sens_powe_on_inst_0_0] [get_bd_pins SSI_0/out_SSCO_SSI_Sun_sens_powe_on_inst]
  connect_bd_net -net SSS0Dependency_0_start0 [get_bd_pins I1_wrapper_0/start_0] [get_bd_pins SSS0Dependency_0/start0]
  connect_bd_net -net SSS0Dependency_0_start1 [get_bd_pins SSS0Dependency_0/start1] [get_bd_pins TIP13_0/start]
  connect_bd_net -net SSS0Dependency_0_start2 [get_bd_pins DA14_wrapper_0/start_0] [get_bd_pins SSS0Dependency_0/start2]
  connect_bd_net -net SSS0Dependency_0_start3 [get_bd_pins AD18_0/start] [get_bd_pins SSS0Dependency_0/start3]
  connect_bd_net -net SSS0Dependency_0_start4 [get_bd_pins MSM19_0/start] [get_bd_pins SSS0Dependency_0/start4]
  connect_bd_net -net SSS0Dependency_0_start5 [get_bd_pins SSS0Dependency_0/start5] [get_bd_pins TCC20_0/start]
  connect_bd_net -net SSS0Dependency_0_start6 [get_bd_pins SSS0Dependency_0/start6] [get_bd_pins TDC21_0/start]
  connect_bd_net -net SSS0Dependency_0_start7 [get_bd_pins SSS0Dependency_0/start7] [get_bd_pins TP22_0/start]
  connect_bd_net -net SSS0Dependency_0_start8 [get_bd_pins SSS0Dependency_0/start8] [get_bd_pins TTC23_wrapper_0/start_0]
  connect_bd_net -net TCC20_0_done [get_bd_pins SSS0Dependency_0/done5] [get_bd_pins TCC20_0/done]
  connect_bd_net -net TCC20_0_out_CCR_CCR_Tria_cont_quan [get_bd_pins TCC20_0/out_CCR_CCR_Tria_cont_quan] [get_bd_pins TDC21_0/in_CCR_CCR_Tria_cont_quan]
  connect_bd_net -net TCC20_0_out_TCC_MR_Targ_angl_load_inst [get_bd_pins MR_0/in_TCC_MR_Targ_angl_load_inst] [get_bd_pins TCC20_0/out_TCC_MR_Targ_angl_load_inst]
  connect_bd_net -net TCC20_0_out_TCC_MR_Targ_angu_velo_load_inst [get_bd_pins MR_0/in_TCC_MR_Targ_angu_velo_load_inst] [get_bd_pins TCC20_0/out_TCC_MR_Targ_angu_velo_load_inst]
  connect_bd_net -net TDC21_0_done [get_bd_pins SSS0Dependency_0/done6] [get_bd_pins TDC21_0/done]
  connect_bd_net -net TDC21_0_out_TDCR_TDCR_Thru_comb_logi [get_bd_pins TDC21_0/out_TDCR_TDCR_Thru_comb_logi] [get_bd_pins TTC23_wrapper_0/in_TDCR_TDCR_Thru_comb_logi_0]
  connect_bd_net -net TIP13_0_done [get_bd_pins SSS0Dependency_0/done1] [get_bd_pins TIP13_0/done]
  connect_bd_net -net TIP13_0_out_TIP_MR_Next_cycl_mode [get_bd_pins MR_0/in_TIP_MR_Next_cycl_mode] [get_bd_pins TIP13_0/out_TIP_MR_Next_cycl_mode]
  connect_bd_net -net TIP13_0_out_TIP_MR_Next_cycl_mode_stor_inst [get_bd_pins MR_0/in_TIP_MR_Next_cycl_mode_stor_inst] [get_bd_pins TIP13_0/out_TIP_MR_Next_cycl_mode_stor_inst]
  connect_bd_net -net TP22_0_done [get_bd_pins SSS0Dependency_0/done7] [get_bd_pins TP22_0/done]
  connect_bd_net -net TP22_0_out_TP_DMC_Tele_data_tran_inst [get_bd_ports out_TP_DMC_Tele_data_tran_inst_0] [get_bd_pins TP22_0/out_TP_DMC_Tele_data_tran_inst]
  connect_bd_net -net TP22_0_out_TP_MR_Curr_mode_load_inst [get_bd_pins MR_0/in_TP_MR_Curr_mode_load_inst] [get_bd_pins TP22_0/out_TP_MR_Curr_mode_load_inst]
  connect_bd_net -net TPI_0_out_TPCO_TPI_Thru_powe_on_inst [get_bd_pins I1_wrapper_0/in_TPCO_TPI_Thru_powe_on_inst_0_0] [get_bd_pins TPI_0/out_TPCO_TPI_Thru_powe_on_inst]
  connect_bd_net -net TTC23_wrapper_0_done_0 [get_bd_pins SSS0Dependency_0/done8] [get_bd_pins TTC23_wrapper_0/done_0]
  connect_bd_net -net TTC23_wrapper_0_out_TTCO_TCT_Tria_cont_sign_0 [get_bd_ports out_TTCO_TCT_Tria_cont_sign_0_0] [get_bd_pins TTC23_wrapper_0/out_TTCO_TCT_Tria_cont_sign_0]
  connect_bd_net -net TTC23_wrapper_0_out_TTI_TTI_Tria_cont_inst_0 [get_bd_pins TTC23_wrapper_0/in_TTI_TTI_Tria_cont_inst_0] [get_bd_pins TTC23_wrapper_0/out_TTI_TTI_Tria_cont_inst_0]
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins AD18_0/clk] [get_bd_pins DA14_wrapper_0/clk_0] [get_bd_pins I1_wrapper_0/clk_0] [get_bd_pins MSM19_0/clk] [get_bd_pins SSS0Dependency_0/clk] [get_bd_pins TCC20_0/clk] [get_bd_pins TDC21_0/clk] [get_bd_pins TIP13_0/clk] [get_bd_pins TP22_0/clk] [get_bd_pins TTC23_wrapper_0/clk_0]
  connect_bd_net -net in_DMC_TIP_Tele_inst_0_1 [get_bd_ports in_DMC_TIP_Tele_inst_0] [get_bd_pins TIP13_0/in_DMC_TIP_Tele_inst]
  connect_bd_net -net in_GDA_G_Gyro_powe_stat_0_0_1 [get_bd_ports in_GDA_G_Gyro_powe_stat_0_0] [get_bd_pins DA14_wrapper_0/in_GDA_G_Gyro_powe_stat_0]
  connect_bd_net -net in_GDA_G_Puls_coun_0_0_1 [get_bd_ports in_GDA_G_Puls_coun_0_0] [get_bd_pins DA14_wrapper_0/in_GDA_G_Puls_coun_0]
  connect_bd_net -net in_SSDA_SS_Angl_anal_0_0_1 [get_bd_ports in_SSDA_SS_Angl_anal_0_0] [get_bd_pins DA14_wrapper_0/in_SSDA_SS_Angl_anal_0]
  connect_bd_net -net in_SSDA_SS_Sun_sens_powe_stat_0_0_1 [get_bd_ports in_SSDA_SS_Sun_sens_powe_stat_0_0] [get_bd_pins DA14_wrapper_0/in_SSDA_SS_Sun_sens_powe_stat_0]
  connect_bd_net -net in_SSDA_SS_Sun_visi_sign_0_0_1 [get_bd_ports in_SSDA_SS_Sun_visi_sign_0_0] [get_bd_pins DA14_wrapper_0/in_SSDA_SS_Sun_visi_sign_0]
  connect_bd_net -net in_TDA_TCT_Thru_powe_stat_0_0_1 [get_bd_ports in_TDA_TCT_Thru_powe_stat_0_0] [get_bd_pins DA14_wrapper_0/in_TDA_TCT_Thru_powe_stat_0]
  connect_bd_net -net interruptsignal_0_1 [get_bd_ports interruptsignal_0] [get_bd_pins SSS0Dependency_0/interruptsignal]
  connect_bd_net -net rst_0_1 [get_bd_ports rst_0] [get_bd_pins AD18_0/rst] [get_bd_pins DA14_wrapper_0/rst_0] [get_bd_pins I1_wrapper_0/rst_0] [get_bd_pins MSM19_0/rst] [get_bd_pins SSS0Dependency_0/rst] [get_bd_pins TCC20_0/rst] [get_bd_pins TDC21_0/rst] [get_bd_pins TIP13_0/rst] [get_bd_pins TP22_0/rst] [get_bd_pins TTC23_wrapper_0/rst_0]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


