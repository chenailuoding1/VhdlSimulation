set f_sys_ipname [split "ITI2,GI3_wrapper,SSI6_wrapper,TI9_wrapper,MI12" ","]
set f_clk_portname [split "ITI2_0/clk,GI3_wrapper_0/clk_0,SSI6_wrapper_0/clk_0,TI9_wrapper_0/clk_0,MI12_0/clk" ","]
set f_rst_portname [split "ITI2_0/rst,GI3_wrapper_0/rst_0,SSI6_wrapper_0/rst_0,TI9_wrapper_0/rst_0,MI12_0/rst" ","]
set f_done_portname [split "ITI2_0/done,GI3_wrapper_0/done_0,SSI6_wrapper_0/done_0,TI9_wrapper_0/done_0,MI12_0/done" ","]
set f_start_portname [split "ITI2_0/start,GI3_wrapper_0/start_0,SSI6_wrapper_0/start_0,TI9_wrapper_0/start_0,MI12_0/start" ","]
set wrappers "./AtomicSystemGeneration/SubSystemProject/I1/I1.srcs/sources_1/bd/I1/I1.bd"
set norecurses "./AtomicSystemGeneration/SubSystemProject/I1/I1.gen/sources_1/bd/I1/hdl/I1_wrapper.vhd"
set ippackages "./AtomicSystemGeneration/SubSystemProject/I1"
set f_sys_bdname "I1"
set f_sys_controlers "I1Dependency"
set ip_parent_path "./AtomicSystemGeneration/SubSystemProject/"
set allsystempath "./AtomicSystemGeneration"
#########





set path [format "%s%s"  $ip_parent_path $f_sys_bdname]

create_project $f_sys_bdname $path -part xc7k70tfbv676-1

set_property target_language VHDL [current_project]

set_property  ip_repo_paths  $allsystempath [current_project]

update_ip_catalog

#创建bd文件并命名

create_bd_design "$f_sys_bdname"

update_compile_order -fileset sources_1

#在bd文件中导入分控制器IP

startgroup

set bd_ipc_name [format "%s_0" $f_sys_controlers]

#bd_ipc_name=f_sys_controlers+_0 (InitializationControl_0=InitializationControl+_0)

create_bd_cell -type ip -vlnv xilinx.com:user:$f_sys_controlers:1.0 $bd_ipc_name

endgroup



#在bd文件中导入该分系统包含的原子系统或分系统

for {set j [llength $f_sys_ipname]} {$j>0} {incr j -1} {

    startgroup

    set bd_ip_name [format "%s_0" [lindex $f_sys_ipname [expr $j-1]]]

    create_bd_cell -type ip -vlnv xilinx.com:user:[lindex $f_sys_ipname [expr $j-1]]:1.0 $bd_ip_name

    endgroup

}

startgroup

set clk [format "%s/clk" $bd_ipc_name]

make_bd_pins_external  [get_bd_pins $clk]

endgroup

startgroup

set rst [format "%s/rst" $bd_ipc_name]

make_bd_pins_external  [get_bd_pins $rst]

endgroup

startgroup

set done [format "%s/done" $bd_ipc_name]

make_bd_pins_external  [get_bd_pins $done]

endgroup

startgroup

set start [format "%s/start" $bd_ipc_name]

make_bd_pins_external  [get_bd_pins $start]

endgroup

for {set k [llength $f_clk_portname]} {$k>0} {incr k -1} {



    set connect_clk [format "%s" [lindex $f_clk_portname [expr $k-1]]]

    connect_bd_net [get_bd_ports clk_0] [get_bd_pins $connect_clk]



}

for {set k [llength $f_rst_portname]} {$k>0} {incr k -1} {





    set connect_rst [format "%s" [lindex $f_rst_portname [expr $k-1]]]

    connect_bd_net [get_bd_ports rst_0] [get_bd_pins $connect_rst]







}

for {set k [llength $f_start_portname]} {$k>0} {incr k -1} {







    set connect_start_a [format "%s" [lindex $f_start_portname [expr $k-1]]]

    set connect_start_b [format "%s/start%d" $bd_ipc_name [expr $k-1]]

    connect_bd_net [get_bd_pins $connect_start_b] [get_bd_pins $connect_start_a]



}

for {set k [llength $f_done_portname]} {$k>0} {incr k -1} {







    set connect_done_a [format "%s" [lindex $f_done_portname [expr $k-1]]]

    set connect_done_b [format "%s/done%d" $bd_ipc_name [expr $k-1]]

    connect_bd_net [get_bd_pins $connect_done_b] [get_bd_pins $connect_done_a]



}



for {set n [llength $f_sys_ipname]} {$n>0} {incr n -1} {



    startgroup

    set ip_external [format "%s_0" [lindex $f_sys_ipname [expr $n-1]]]

    make_bd_pins_external  [get_bd_cells $ip_external]

    endgroup

}

save_bd_design

make_wrapper -files [get_files $wrappers ] -top

add_files -norecurse $norecurses

ipx::package_project -root_dir $ippackages -vendor xilinx.com -library user -taxonomy /UserIP

