set netconnect "SSS0_wrapper_0/in_TDA_TCT_Thru_powe_stat_0_0 TCT_0/out_TDA_TCT_Thru_powe_stat SSS0_wrapper_0/in_DMC_TIP_Tele_inst_0 DMC_0/out_DMC_TIP_Tele_inst SSS0_wrapper_0/in_SSDA_SS_Sun_visi_sign_0_0 SS_0/out_SSDA_SS_Sun_visi_sign SSS0_wrapper_0/in_SSDA_SS_Angl_anal_0_0 SS_0/out_SSDA_SS_Angl_anal SSS0_wrapper_0/in_SSDA_SS_Sun_sens_powe_stat_0_0 SS_0/out_SSDA_SS_Sun_sens_powe_stat SSS0_wrapper_0/in_GDA_G_Puls_coun_0_0 G_0/out_GDA_G_Puls_coun SSS0_wrapper_0/in_GDA_G_Gyro_powe_stat_0_0 G_0/out_GDA_G_Gyro_powe_stat IT_0/in_32IT_32IT_32ms_inte_time_star_inst SSS0_wrapper_0/out_32IT_32IT_32ms_inte_time_star_inst_0_0 G_0/in_GCO_G_Gyro_powe_on_puls SSS0_wrapper_0/out_GCO_G_Gyro_powe_on_puls_0_0_0 G_0/in_GDA_G_Gyro_powe_stat_perc_inst SSS0_wrapper_0/out_GDA_G_Gyro_powe_stat_perc_inst_0_0 G_0/in_GDA_G_Puls_coun_acqu_inst SSS0_wrapper_0/out_GDA_G_Puls_coun_acqu_inst_0_0 SS_0/in_SSCO_SS_Sun_sens_powe_on_puls SSS0_wrapper_0/out_SSCO_SS_Sun_sens_powe_on_puls_0_0_0 SS_0/in_SSDA_SS_Angl_anal_acqu_inst SSS0_wrapper_0/out_SSDA_SS_Angl_anal_acqu_inst_0_0 SS_0/in_SSDA_SS_Sun_sens_powe_stat_perc_inst SSS0_wrapper_0/out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0_0 SS_0/in_SSDA_SS_Sun_visi_sign_acqu_inst SSS0_wrapper_0/out_SSDA_SS_Sun_visi_sign_acqu_inst_0_0 TCT_0/in_TDA_TCT_Thru_powe_stat_perc_inst SSS0_wrapper_0/out_TDA_TCT_Thru_powe_stat_perc_inst_0_0 TCT_0/in_TPCO_TCT_Thru_powe_on_puls SSS0_wrapper_0/out_TPCO_TCT_Thru_powe_on_puls_0_0_0 DMC_0/in_TP_DMC_Tele_data_tran_inst SSS0_wrapper_0/out_TP_DMC_Tele_data_tran_inst_0 TCT_0/in_TTCO_TCT_Tria_cont_sign SSS0_wrapper_0/out_TTCO_TCT_Tria_cont_sign_0_0 "
set f_all_ipname [split "TCT,IT,DMC,SS,G,SSS0_wrapper" ","]
set wrappers "./AtomicSystemGeneration/SystemProject/SSS0all/SSS0all.srcs/sources_1/bd/SSS0all/SSS0all.bd"
set norecurses "./AtomicSystemGeneration/SystemProject/SSS0all/SSS0all.gen/sources_1/bd/SSS0all/hdl/SSS0all_wrapper.vhd"
set ippackages "./AtomicSystemGeneration/SystemProject/SSS0all"
set f_sys_bdname "SSS0all"
set ip_parent_path "./AtomicSystemGeneration/SystemProject/"
set allsystempath "./AtomicSystemGeneration"
######





set path [format "%s%s"  $ip_parent_path $f_sys_bdname]



create_project $f_sys_bdname $path -part xc7k70tfbv676-1



set_property target_language VHDL [current_project]



set_property  ip_repo_paths  $allsystempath [current_project]



update_ip_catalog



#创建bd文件并命名



create_bd_design "$f_sys_bdname"



update_compile_order -fileset sources_1











#在bd文件中导入该分系统包含的原子系统或分系统和数据存储



for {set j [llength $f_all_ipname]} {$j>0} {incr j -1} {



    startgroup



    set bd_ip_name [format "%s_0" [lindex $f_all_ipname [expr $j-1]]]



    create_bd_cell -type ip -vlnv xilinx.com:user:[lindex $f_all_ipname [expr $j-1]]:1.0 $bd_ip_name



    endgroup



}









for {set m [llength $netconnect]} {$m>0} {incr m -2} {

            set port_net1 [lindex $netconnect [expr $m-1]]

            set port_net2 [lindex $netconnect [expr $m-2]]

            connect_bd_net [get_bd_pins $port_net1] [get_bd_pins $port_net2]

}





for {set n [llength $f_all_ipname]} {$n>0} {incr n -1} {







    startgroup



    set ip_external [format "%s_0" [lindex $f_all_ipname [expr $n-1]]]



    make_bd_pins_external  [get_bd_cells $ip_external]



    endgroup



}



save_bd_design



make_wrapper -files [get_files $wrappers ] -top



add_files -norecurse $norecurses



ipx::package_project -root_dir $ippackages -vendor xilinx.com -library user -taxonomy /UserIP
