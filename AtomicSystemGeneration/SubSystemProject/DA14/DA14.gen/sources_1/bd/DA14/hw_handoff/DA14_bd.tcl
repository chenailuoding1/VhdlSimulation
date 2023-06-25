
################################################################
# This is a generated script based on design: DA14
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
# source DA14_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name DA14

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
  set done_0 [ create_bd_port -dir O done_0 ]
  set in_GDA_G_Gyro_powe_stat_0 [ create_bd_port -dir I -from 31 -to 0 in_GDA_G_Gyro_powe_stat_0 ]
  set in_GDA_G_Puls_coun_0 [ create_bd_port -dir I -from 31 -to 0 in_GDA_G_Puls_coun_0 ]
  set in_SSDA_SS_Angl_anal_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Angl_anal_0 ]
  set in_SSDA_SS_Sun_sens_powe_stat_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Sun_sens_powe_stat_0 ]
  set in_SSDA_SS_Sun_visi_sign_0 [ create_bd_port -dir I -from 31 -to 0 in_SSDA_SS_Sun_visi_sign_0 ]
  set in_TDA_TCT_Thru_powe_stat_0 [ create_bd_port -dir I -from 31 -to 0 in_TDA_TCT_Thru_powe_stat_0 ]
  set out_GDA_G_Gyro_powe_stat_perc_inst_0 [ create_bd_port -dir O out_GDA_G_Gyro_powe_stat_perc_inst_0 ]
  set out_GDA_G_Puls_coun_acqu_inst_0 [ create_bd_port -dir O out_GDA_G_Puls_coun_acqu_inst_0 ]
  set out_GD_GD_Angu_velo_anal_0 [ create_bd_port -dir O -from 31 -to 0 out_GD_GD_Angu_velo_anal_0 ]
  set out_GD_GD_Gyro_powe_stat_0 [ create_bd_port -dir O -from 31 -to 0 out_GD_GD_Gyro_powe_stat_0 ]
  set out_SSDA_SS_Angl_anal_acqu_inst_0 [ create_bd_port -dir O out_SSDA_SS_Angl_anal_acqu_inst_0 ]
  set out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 [ create_bd_port -dir O out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 ]
  set out_SSDA_SS_Sun_visi_sign_acqu_inst_0 [ create_bd_port -dir O out_SSDA_SS_Sun_visi_sign_acqu_inst_0 ]
  set out_SSD_SSD_Sun_meas_angl_0 [ create_bd_port -dir O -from 31 -to 0 out_SSD_SSD_Sun_meas_angl_0 ]
  set out_SSD_SSD_Sun_sens_powe_stat_0 [ create_bd_port -dir O -from 31 -to 0 out_SSD_SSD_Sun_sens_powe_stat_0 ]
  set out_SSD_SSD_Sun_visi_sign_0 [ create_bd_port -dir O -from 31 -to 0 out_SSD_SSD_Sun_visi_sign_0 ]
  set out_TDA_TCT_Thru_powe_stat_perc_inst_0 [ create_bd_port -dir O out_TDA_TCT_Thru_powe_stat_perc_inst_0 ]
  set out_TD_TD_Thru_powe_stat_0 [ create_bd_port -dir O -from 31 -to 0 out_TD_TD_Thru_powe_stat_0 ]
  set rst_0 [ create_bd_port -dir I -type rst rst_0 ]
  set start_0 [ create_bd_port -dir I start_0 ]

  # Create instance: DA14Dependency_0, and set properties
  set DA14Dependency_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:DA14Dependency:1.0 DA14Dependency_0 ]

  # Create instance: GDA15_0, and set properties
  set GDA15_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:GDA15:1.0 GDA15_0 ]

  # Create instance: SSDA16_0, and set properties
  set SSDA16_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SSDA16:1.0 SSDA16_0 ]

  # Create instance: TDA17_0, and set properties
  set TDA17_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TDA17:1.0 TDA17_0 ]

  # Create port connections
  connect_bd_net -net DA14Dependency_0_done [get_bd_ports done_0] [get_bd_pins DA14Dependency_0/done]
  connect_bd_net -net DA14Dependency_0_start0 [get_bd_pins DA14Dependency_0/start0] [get_bd_pins GDA15_0/start]
  connect_bd_net -net DA14Dependency_0_start1 [get_bd_pins DA14Dependency_0/start1] [get_bd_pins SSDA16_0/start]
  connect_bd_net -net DA14Dependency_0_start2 [get_bd_pins DA14Dependency_0/start2] [get_bd_pins TDA17_0/start]
  connect_bd_net -net GDA15_0_done [get_bd_pins DA14Dependency_0/done0] [get_bd_pins GDA15_0/done]
  connect_bd_net -net GDA15_0_out_GDA_G_Gyro_powe_stat_perc_inst [get_bd_ports out_GDA_G_Gyro_powe_stat_perc_inst_0] [get_bd_pins GDA15_0/out_GDA_G_Gyro_powe_stat_perc_inst]
  connect_bd_net -net GDA15_0_out_GDA_G_Puls_coun_acqu_inst [get_bd_ports out_GDA_G_Puls_coun_acqu_inst_0] [get_bd_pins GDA15_0/out_GDA_G_Puls_coun_acqu_inst]
  connect_bd_net -net GDA15_0_out_GD_GD_Angu_velo_anal [get_bd_ports out_GD_GD_Angu_velo_anal_0] [get_bd_pins GDA15_0/out_GD_GD_Angu_velo_anal]
  connect_bd_net -net GDA15_0_out_GD_GD_Gyro_powe_stat [get_bd_ports out_GD_GD_Gyro_powe_stat_0] [get_bd_pins GDA15_0/out_GD_GD_Gyro_powe_stat]
  connect_bd_net -net SSDA16_0_done [get_bd_pins DA14Dependency_0/done1] [get_bd_pins SSDA16_0/done]
  connect_bd_net -net SSDA16_0_out_SSDA_SS_Angl_anal_acqu_inst [get_bd_ports out_SSDA_SS_Angl_anal_acqu_inst_0] [get_bd_pins SSDA16_0/out_SSDA_SS_Angl_anal_acqu_inst]
  connect_bd_net -net SSDA16_0_out_SSDA_SS_Sun_sens_powe_stat_perc_inst [get_bd_ports out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0] [get_bd_pins SSDA16_0/out_SSDA_SS_Sun_sens_powe_stat_perc_inst]
  connect_bd_net -net SSDA16_0_out_SSDA_SS_Sun_visi_sign_acqu_inst [get_bd_ports out_SSDA_SS_Sun_visi_sign_acqu_inst_0] [get_bd_pins SSDA16_0/out_SSDA_SS_Sun_visi_sign_acqu_inst]
  connect_bd_net -net SSDA16_0_out_SSD_SSD_Sun_meas_angl [get_bd_ports out_SSD_SSD_Sun_meas_angl_0] [get_bd_pins SSDA16_0/out_SSD_SSD_Sun_meas_angl]
  connect_bd_net -net SSDA16_0_out_SSD_SSD_Sun_sens_powe_stat [get_bd_ports out_SSD_SSD_Sun_sens_powe_stat_0] [get_bd_pins SSDA16_0/out_SSD_SSD_Sun_sens_powe_stat]
  connect_bd_net -net SSDA16_0_out_SSD_SSD_Sun_visi_sign [get_bd_ports out_SSD_SSD_Sun_visi_sign_0] [get_bd_pins SSDA16_0/out_SSD_SSD_Sun_visi_sign]
  connect_bd_net -net TDA17_0_done [get_bd_pins DA14Dependency_0/done2] [get_bd_pins TDA17_0/done]
  connect_bd_net -net TDA17_0_out_TDA_TCT_Thru_powe_stat_perc_inst [get_bd_ports out_TDA_TCT_Thru_powe_stat_perc_inst_0] [get_bd_pins TDA17_0/out_TDA_TCT_Thru_powe_stat_perc_inst]
  connect_bd_net -net TDA17_0_out_TD_TD_Thru_powe_stat [get_bd_ports out_TD_TD_Thru_powe_stat_0] [get_bd_pins TDA17_0/out_TD_TD_Thru_powe_stat]
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins DA14Dependency_0/clk] [get_bd_pins GDA15_0/clk] [get_bd_pins SSDA16_0/clk] [get_bd_pins TDA17_0/clk]
  connect_bd_net -net in_GDA_G_Gyro_powe_stat_0_1 [get_bd_ports in_GDA_G_Gyro_powe_stat_0] [get_bd_pins GDA15_0/in_GDA_G_Gyro_powe_stat]
  connect_bd_net -net in_GDA_G_Puls_coun_0_1 [get_bd_ports in_GDA_G_Puls_coun_0] [get_bd_pins GDA15_0/in_GDA_G_Puls_coun]
  connect_bd_net -net in_SSDA_SS_Angl_anal_0_1 [get_bd_ports in_SSDA_SS_Angl_anal_0] [get_bd_pins SSDA16_0/in_SSDA_SS_Angl_anal]
  connect_bd_net -net in_SSDA_SS_Sun_sens_powe_stat_0_1 [get_bd_ports in_SSDA_SS_Sun_sens_powe_stat_0] [get_bd_pins SSDA16_0/in_SSDA_SS_Sun_sens_powe_stat]
  connect_bd_net -net in_SSDA_SS_Sun_visi_sign_0_1 [get_bd_ports in_SSDA_SS_Sun_visi_sign_0] [get_bd_pins SSDA16_0/in_SSDA_SS_Sun_visi_sign]
  connect_bd_net -net in_TDA_TCT_Thru_powe_stat_0_1 [get_bd_ports in_TDA_TCT_Thru_powe_stat_0] [get_bd_pins TDA17_0/in_TDA_TCT_Thru_powe_stat]
  connect_bd_net -net rst_0_1 [get_bd_ports rst_0] [get_bd_pins DA14Dependency_0/rst] [get_bd_pins GDA15_0/rst] [get_bd_pins SSDA16_0/rst] [get_bd_pins TDA17_0/rst]
  connect_bd_net -net start_0_1 [get_bd_ports start_0] [get_bd_pins DA14Dependency_0/start]

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


