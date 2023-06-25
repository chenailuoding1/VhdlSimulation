
################################################################
# This is a generated script based on design: I1
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
# source I1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name I1

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
  set in_GCO_GI_Gyro_powe_on_inst_0_0 [ create_bd_port -dir I -from 31 -to 0 in_GCO_GI_Gyro_powe_on_inst_0_0 ]
  set in_SSCO_SSI_Sun_sens_powe_on_inst_0_0 [ create_bd_port -dir I -from 31 -to 0 in_SSCO_SSI_Sun_sens_powe_on_inst_0_0 ]
  set in_TPCO_TPI_Thru_powe_on_inst_0_0 [ create_bd_port -dir I -from 31 -to 0 in_TPCO_TPI_Thru_powe_on_inst_0_0 ]
  set out_32IT_32IT_32ms_inte_time_star_inst_0 [ create_bd_port -dir O -from 31 -to 0 out_32IT_32IT_32ms_inte_time_star_inst_0 ]
  set out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 [ create_bd_port -dir O out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0 ]
  set out_GCO_G_Gyro_powe_on_puls_0_0 [ create_bd_port -dir O -from 31 -to 0 out_GCO_G_Gyro_powe_on_puls_0_0 ]
  set out_MI_MR_Curr_mode_0 [ create_bd_port -dir O -from 31 -to 0 out_MI_MR_Curr_mode_0 ]
  set out_MI_MR_Curr_mode_stor_inst_0 [ create_bd_port -dir O out_MI_MR_Curr_mode_stor_inst_0 ]
  set out_SGPo_GI_Gyro_powe_on_inst_0_0 [ create_bd_port -dir O -from 31 -to 0 out_SGPo_GI_Gyro_powe_on_inst_0_0 ]
  set out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 [ create_bd_port -dir O out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0 ]
  set out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 [ create_bd_port -dir O out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0 ]
  set out_SSCO_SS_Sun_sens_powe_on_puls_0_0 [ create_bd_port -dir O -from 31 -to 0 out_SSCO_SS_Sun_sens_powe_on_puls_0_0 ]
  set out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 [ create_bd_port -dir O -from 31 -to 0 out_SSSP_SSI_Sun_sens_powe_on_inst_0_0 ]
  set out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 [ create_bd_port -dir O out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0 ]
  set out_STPo_TPI_Thru_powe_on_inst_0_0 [ create_bd_port -dir O -from 31 -to 0 out_STPo_TPI_Thru_powe_on_inst_0_0 ]
  set out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 [ create_bd_port -dir O out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0 ]
  set out_TPCO_TCT_Thru_powe_on_puls_0_0 [ create_bd_port -dir O -from 31 -to 0 out_TPCO_TCT_Thru_powe_on_puls_0_0 ]
  set out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 [ create_bd_port -dir O out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0 ]
  set rst_0 [ create_bd_port -dir I -type rst rst_0 ]
  set start_0 [ create_bd_port -dir I start_0 ]

  # Create instance: GI3_wrapper_0, and set properties
  set GI3_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:GI3_wrapper:1.0 GI3_wrapper_0 ]

  # Create instance: I1Dependency_0, and set properties
  set I1Dependency_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:I1Dependency:1.0 I1Dependency_0 ]

  # Create instance: ITI2_0, and set properties
  set ITI2_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ITI2:1.0 ITI2_0 ]

  # Create instance: MI12_0, and set properties
  set MI12_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:MI12:1.0 MI12_0 ]

  # Create instance: SSI6_wrapper_0, and set properties
  set SSI6_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SSI6_wrapper:1.0 SSI6_wrapper_0 ]

  # Create instance: TI9_wrapper_0, and set properties
  set TI9_wrapper_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:TI9_wrapper:1.0 TI9_wrapper_0 ]

  # Create port connections
  connect_bd_net -net GI3_wrapper_0_done_0 [get_bd_pins GI3_wrapper_0/done_0] [get_bd_pins I1Dependency_0/done1]
  connect_bd_net -net GI3_wrapper_0_out_GCO_GI_Gyro_powe_on_inst_load_inst_0 [get_bd_ports out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0] [get_bd_pins GI3_wrapper_0/out_GCO_GI_Gyro_powe_on_inst_load_inst_0]
  connect_bd_net -net GI3_wrapper_0_out_GCO_G_Gyro_powe_on_puls_0 [get_bd_ports out_GCO_G_Gyro_powe_on_puls_0_0] [get_bd_pins GI3_wrapper_0/out_GCO_G_Gyro_powe_on_puls_0]
  connect_bd_net -net GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_0 [get_bd_ports out_SGPo_GI_Gyro_powe_on_inst_0_0] [get_bd_pins GI3_wrapper_0/out_SGPo_GI_Gyro_powe_on_inst_0]
  connect_bd_net -net GI3_wrapper_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 [get_bd_ports out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0] [get_bd_pins GI3_wrapper_0/out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0]
  connect_bd_net -net I1Dependency_0_done [get_bd_ports done_0] [get_bd_pins I1Dependency_0/done]
  connect_bd_net -net I1Dependency_0_start0 [get_bd_pins I1Dependency_0/start0] [get_bd_pins ITI2_0/start]
  connect_bd_net -net I1Dependency_0_start1 [get_bd_pins GI3_wrapper_0/start_0] [get_bd_pins I1Dependency_0/start1]
  connect_bd_net -net I1Dependency_0_start2 [get_bd_pins I1Dependency_0/start2] [get_bd_pins SSI6_wrapper_0/start_0]
  connect_bd_net -net I1Dependency_0_start3 [get_bd_pins I1Dependency_0/start3] [get_bd_pins TI9_wrapper_0/start_0]
  connect_bd_net -net I1Dependency_0_start4 [get_bd_pins I1Dependency_0/start4] [get_bd_pins MI12_0/start]
  connect_bd_net -net ITI2_0_done [get_bd_pins I1Dependency_0/done0] [get_bd_pins ITI2_0/done]
  connect_bd_net -net ITI2_0_out_32IT_32IT_32ms_inte_time_star_inst [get_bd_ports out_32IT_32IT_32ms_inte_time_star_inst_0] [get_bd_pins ITI2_0/out_32IT_32IT_32ms_inte_time_star_inst]
  connect_bd_net -net MI12_0_done [get_bd_pins I1Dependency_0/done4] [get_bd_pins MI12_0/done]
  connect_bd_net -net MI12_0_out_MI_MR_Curr_mode [get_bd_ports out_MI_MR_Curr_mode_0] [get_bd_pins MI12_0/out_MI_MR_Curr_mode]
  connect_bd_net -net MI12_0_out_MI_MR_Curr_mode_stor_inst [get_bd_ports out_MI_MR_Curr_mode_stor_inst_0] [get_bd_pins MI12_0/out_MI_MR_Curr_mode_stor_inst]
  connect_bd_net -net SSI6_wrapper_0_done_0 [get_bd_pins I1Dependency_0/done2] [get_bd_pins SSI6_wrapper_0/done_0]
  connect_bd_net -net SSI6_wrapper_0_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 [get_bd_ports out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0] [get_bd_pins SSI6_wrapper_0/out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0]
  connect_bd_net -net SSI6_wrapper_0_out_SSCO_SS_Sun_sens_powe_on_puls_0 [get_bd_ports out_SSCO_SS_Sun_sens_powe_on_puls_0_0] [get_bd_pins SSI6_wrapper_0/out_SSCO_SS_Sun_sens_powe_on_puls_0]
  connect_bd_net -net SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_0 [get_bd_ports out_SSSP_SSI_Sun_sens_powe_on_inst_0_0] [get_bd_pins SSI6_wrapper_0/out_SSSP_SSI_Sun_sens_powe_on_inst_0]
  connect_bd_net -net SSI6_wrapper_0_out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 [get_bd_ports out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0] [get_bd_pins SSI6_wrapper_0/out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0]
  connect_bd_net -net TI9_wrapper_0_done_0 [get_bd_pins I1Dependency_0/done3] [get_bd_pins TI9_wrapper_0/done_0]
  connect_bd_net -net TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_0 [get_bd_ports out_STPo_TPI_Thru_powe_on_inst_0_0] [get_bd_pins TI9_wrapper_0/out_STPo_TPI_Thru_powe_on_inst_0]
  connect_bd_net -net TI9_wrapper_0_out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 [get_bd_ports out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0] [get_bd_pins TI9_wrapper_0/out_STPo_TPI_Thru_powe_on_inst_stor_inst_0]
  connect_bd_net -net TI9_wrapper_0_out_TPCO_TCT_Thru_powe_on_puls_0 [get_bd_ports out_TPCO_TCT_Thru_powe_on_puls_0_0] [get_bd_pins TI9_wrapper_0/out_TPCO_TCT_Thru_powe_on_puls_0]
  connect_bd_net -net TI9_wrapper_0_out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 [get_bd_ports out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0] [get_bd_pins TI9_wrapper_0/out_TPCO_TPI_Thru_powe_on_inst_load_inst_0]
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins GI3_wrapper_0/clk_0] [get_bd_pins I1Dependency_0/clk] [get_bd_pins ITI2_0/clk] [get_bd_pins MI12_0/clk] [get_bd_pins SSI6_wrapper_0/clk_0] [get_bd_pins TI9_wrapper_0/clk_0]
  connect_bd_net -net in_GCO_GI_Gyro_powe_on_inst_0_0_1 [get_bd_ports in_GCO_GI_Gyro_powe_on_inst_0_0] [get_bd_pins GI3_wrapper_0/in_GCO_GI_Gyro_powe_on_inst_0]
  connect_bd_net -net in_SSCO_SSI_Sun_sens_powe_on_inst_0_0_1 [get_bd_ports in_SSCO_SSI_Sun_sens_powe_on_inst_0_0] [get_bd_pins SSI6_wrapper_0/in_SSCO_SSI_Sun_sens_powe_on_inst_0]
  connect_bd_net -net in_TPCO_TPI_Thru_powe_on_inst_0_0_1 [get_bd_ports in_TPCO_TPI_Thru_powe_on_inst_0_0] [get_bd_pins TI9_wrapper_0/in_TPCO_TPI_Thru_powe_on_inst_0]
  connect_bd_net -net rst_0_1 [get_bd_ports rst_0] [get_bd_pins GI3_wrapper_0/rst_0] [get_bd_pins I1Dependency_0/rst] [get_bd_pins ITI2_0/rst] [get_bd_pins MI12_0/rst] [get_bd_pins SSI6_wrapper_0/rst_0] [get_bd_pins TI9_wrapper_0/rst_0]
  connect_bd_net -net start_0_1 [get_bd_ports start_0] [get_bd_pins I1Dependency_0/start]

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


