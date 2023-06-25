
################################################################
# This is a generated script based on design: GI3
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
# source GI3_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k70tfbv676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name GI3

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
  set in_GCO_GI_Gyro_powe_on_inst_0 [ create_bd_port -dir I -from 31 -to 0 in_GCO_GI_Gyro_powe_on_inst_0 ]
  set out_GCO_GI_Gyro_powe_on_inst_load_inst_0 [ create_bd_port -dir O out_GCO_GI_Gyro_powe_on_inst_load_inst_0 ]
  set out_GCO_G_Gyro_powe_on_puls_0 [ create_bd_port -dir O -from 31 -to 0 out_GCO_G_Gyro_powe_on_puls_0 ]
  set out_SGPo_GI_Gyro_powe_on_inst_0 [ create_bd_port -dir O -from 31 -to 0 out_SGPo_GI_Gyro_powe_on_inst_0 ]
  set out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 [ create_bd_port -dir O out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 ]
  set rst_0 [ create_bd_port -dir I -type rst rst_0 ]
  set start_0 [ create_bd_port -dir I start_0 ]

  # Create instance: GCO5_0, and set properties
  set GCO5_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:GCO5:1.0 GCO5_0 ]

  # Create instance: GI3Dependency_0, and set properties
  set GI3Dependency_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:GI3Dependency:1.0 GI3Dependency_0 ]

  # Create instance: SGPoI4_0, and set properties
  set SGPoI4_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SGPoI4:1.0 SGPoI4_0 ]

  # Create port connections
  connect_bd_net -net GCO5_0_done [get_bd_pins GCO5_0/done] [get_bd_pins GI3Dependency_0/done1]
  connect_bd_net -net GCO5_0_out_GCO_GI_Gyro_powe_on_inst_load_inst [get_bd_ports out_GCO_GI_Gyro_powe_on_inst_load_inst_0] [get_bd_pins GCO5_0/out_GCO_GI_Gyro_powe_on_inst_load_inst]
  connect_bd_net -net GCO5_0_out_GCO_G_Gyro_powe_on_puls [get_bd_ports out_GCO_G_Gyro_powe_on_puls_0] [get_bd_pins GCO5_0/out_GCO_G_Gyro_powe_on_puls]
  connect_bd_net -net GI3Dependency_0_done [get_bd_ports done_0] [get_bd_pins GI3Dependency_0/done]
  connect_bd_net -net GI3Dependency_0_start0 [get_bd_pins GI3Dependency_0/start0] [get_bd_pins SGPoI4_0/start]
  connect_bd_net -net GI3Dependency_0_start1 [get_bd_pins GCO5_0/start] [get_bd_pins GI3Dependency_0/start1]
  connect_bd_net -net SGPoI4_0_done [get_bd_pins GI3Dependency_0/done0] [get_bd_pins SGPoI4_0/done]
  connect_bd_net -net SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst [get_bd_ports out_SGPo_GI_Gyro_powe_on_inst_0] [get_bd_pins SGPoI4_0/out_SGPo_GI_Gyro_powe_on_inst]
  connect_bd_net -net SGPoI4_0_out_SGPo_GI_Gyro_powe_on_inst_stor_inst [get_bd_ports out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0] [get_bd_pins SGPoI4_0/out_SGPo_GI_Gyro_powe_on_inst_stor_inst]
  connect_bd_net -net clk_0_1 [get_bd_ports clk_0] [get_bd_pins GCO5_0/clk] [get_bd_pins GI3Dependency_0/clk] [get_bd_pins SGPoI4_0/clk]
  connect_bd_net -net in_GCO_GI_Gyro_powe_on_inst_0_1 [get_bd_ports in_GCO_GI_Gyro_powe_on_inst_0] [get_bd_pins GCO5_0/in_GCO_GI_Gyro_powe_on_inst]
  connect_bd_net -net rst_0_1 [get_bd_ports rst_0] [get_bd_pins GCO5_0/rst] [get_bd_pins GI3Dependency_0/rst] [get_bd_pins SGPoI4_0/rst]
  connect_bd_net -net start_0_1 [get_bd_ports start_0] [get_bd_pins GI3Dependency_0/start]

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


