create_project Sun ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GI.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GI is
port(
    in_Gyr_pow_on_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GI;
architecture Behavioral of GI is
signal RAM_Gyr_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Gyr_pow_on_ins_sto_ins)
	begin
		if in_Gyr_pow_on_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Gyr_pow_on_ins <= in_Gyr_pow_on_ins;
		end if;
	end process;process(in_Gyr_pow_on_ins_loa_ins)
	begin
		if in_Gyr_pow_on_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Gyr_pow_on_ins <= RAM_Gyr_pow_on_ins;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MR.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MR.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MR.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MR is
port(
    in_Nex_cyc_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end MR;
architecture Behavioral of MR is
signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Cur_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Cur_mod_wor_tim: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tar_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tar_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Nex_cyc_mod_sto_ins)
	begin
		if in_Nex_cyc_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Nex_cyc_mod <= in_Nex_cyc_mod;
		end if;
	end process;process(in_Cur_mod_sto_ins)
	begin
		if in_Cur_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Cur_mod <= in_Cur_mod;
		end if;
	end process;process(in_Nex_cyc_mod_sto_ins)
	begin
		if in_Nex_cyc_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Nex_cyc_mod <= in_Nex_cyc_mod;
		end if;
	end process;process(in_Cur_mod_wor_tim_sto_ins)
	begin
		if in_Cur_mod_wor_tim_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Cur_mod_wor_tim <= in_Cur_mod_wor_tim;
		end if;
	end process;process(in_Tar_ang_sto_ins)
	begin
		if in_Tar_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tar_ang <= in_Tar_ang;
		end if;
	end process;process(in_Tar_ang_vel_sto_ins)
	begin
		if in_Tar_ang_vel_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tar_ang_vel <= in_Tar_ang_vel;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Tar_ang_loa_ins)
	begin
		if in_Tar_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tar_ang <= RAM_Tar_ang;
		end if;
	end process;process(in_Tar_ang_vel_loa_ins)
	begin
		if in_Tar_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tar_ang_vel <= RAM_Tar_ang_vel;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Cur_mod_wor_tim_loa_ins)
	begin
		if in_Cur_mod_wor_tim_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod_wor_tim <= RAM_Cur_mod_wor_tim;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSI.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSI is
port(
    in_Sun_sen_pow_on_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSI;
architecture Behavioral of SSI is
signal RAM_Sun_sen_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Sun_sen_pow_on_ins_sto_ins)
	begin
		if in_Sun_sen_pow_on_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_sen_pow_on_ins <= in_Sun_sen_pow_on_ins;
		end if;
	end process;process(in_Sun_sen_pow_on_ins_loa_ins)
	begin
		if in_Sun_sen_pow_on_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_sen_pow_on_ins <= RAM_Sun_sen_pow_on_ins;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPI.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TPI is
port(
    in_Thr_pow_on_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TPI;
architecture Behavioral of TPI is
signal RAM_Thr_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Thr_pow_on_ins_sto_ins)
	begin
		if in_Thr_pow_on_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Thr_pow_on_ins <= in_Thr_pow_on_ins;
		end if;
	end process;process(in_Thr_pow_on_ins_loa_ins)
	begin
		if in_Thr_pow_on_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Thr_pow_on_ins <= RAM_Thr_pow_on_ins;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSD.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSD.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSD.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSD is
port(
    in_Sun_vis_sig_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSD;
architecture Behavioral of SSD is
signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Sun_mea_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Sun_sen_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Sun_vis_sig_sto_ins)
	begin
		if in_Sun_vis_sig_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_vis_sig <= in_Sun_vis_sig;
		end if;
	end process;process(in_Sun_mea_ang_sto_ins)
	begin
		if in_Sun_mea_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_mea_ang <= in_Sun_mea_ang;
		end if;
	end process;process(in_Sun_sen_pow_sta_sto_ins)
	begin
		if in_Sun_sen_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_sen_pow_sta <= in_Sun_sen_pow_sta;
		end if;
	end process;process(in_Sun_vis_sig_loa_ins)
	begin
		if in_Sun_vis_sig_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_vis_sig <= RAM_Sun_vis_sig;
		end if;
	end process;process(in_Sun_mea_ang_loa_ins)
	begin
		if in_Sun_mea_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_mea_ang <= RAM_Sun_mea_ang;
		end if;
	end process;process(in_Sun_vis_sig_loa_ins)
	begin
		if in_Sun_vis_sig_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_vis_sig <= RAM_Sun_vis_sig;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TD.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TD.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TD.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TD is
port(
    in_Thr_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TD;
architecture Behavioral of TD is
signal RAM_Thr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Thr_pow_sta_sto_ins)
	begin
		if in_Thr_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Thr_pow_sta <= in_Thr_pow_sta;
		end if;
	end process;process(in_Thr_pow_sta_loa_ins)
	begin
		if in_Thr_pow_sta_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Thr_pow_sta <= RAM_Thr_pow_sta;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/ADR.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/ADR.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/ADR.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity ADR is
port(
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end ADR;
architecture Behavioral of ADR is
signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Tri_att_ang_sto_ins)
	begin
		if in_Tri_att_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_att_ang <= in_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_sto_ins)
	begin
		if in_Tri_ang_vel_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_ang_vel <= in_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/CCR.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/CCR.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/CCR.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity CCR is
port(
    in_Tri_con_qua_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end CCR;
architecture Behavioral of CCR is
signal RAM_Tri_con_qua: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Tri_con_qua_sto_ins)
	begin
		if in_Tri_con_qua_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_con_qua <= in_Tri_con_qua;
		end if;
	end process;process(in_Tri_con_qua_loa_ins)
	begin
		if in_Tri_con_qua_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_con_qua <= RAM_Tri_con_qua;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDCR.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDCR.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDCR.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDC is
port(
    in_Thr_com_log_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TDC;
architecture Behavioral of TDC is
signal RAM_Thr_com_log: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Thr_com_log_sto_ins)
	begin
		if in_Thr_com_log_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Thr_com_log <= in_Thr_com_log;
		end if;
	end process;process(in_Thr_com_log_loa_ins)
	begin
		if in_Thr_com_log_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Thr_com_log <= RAM_Thr_com_log;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTI.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTI is
port(
    in_Tri_con_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TTI;
architecture Behavioral of TTI is
signal RAM_Tri_con_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Tri_con_ins_sto_ins)
	begin
		if in_Tri_con_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_con_ins <= in_Tri_con_ins;
		end if;
	end process;process(in_Tri_con_ins_loa_ins)
	begin
		if in_Tri_con_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_con_ins <= RAM_Tri_con_ins;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GD.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GD.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GD.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GD is
port(
    in_Ang_vel_ana_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GD;
architecture Behavioral of GD is
signal RAM_Ang_vel_ana: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Gyr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Ang_vel_ana_sto_ins)
	begin
		if in_Ang_vel_ana_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Ang_vel_ana <= in_Ang_vel_ana;
		end if;
	end process;process(in_Gyr_pow_sta_sto_ins)
	begin
		if in_Gyr_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Gyr_pow_sta <= in_Gyr_pow_sta;
		end if;
	end process;process(in_Ang_vel_ana_loa_ins)
	begin
		if in_Ang_vel_ana_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Ang_vel_ana <= RAM_Ang_vel_ana;
		end if;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/a32ITI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/a32ITI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/a32ITI.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity a32ITI is
port(
    in_32m_Int_Tim_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_32m_Int_Tim_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end a32ITI;
architecture Behavioral of a32ITI is
signal RAM_32m_Int_Tim_Ini_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_32m_Int_Tim_Ini_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;

out_32m_Int_Tim_Ini_done <= std_logic_vector(to_unsigned(1, 32));
                        end if;
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_0=>

        end case;
	end process;
process(in_32m_Int_Tim_Ini_start)
	begin
		RAM_32m_Int_Tim_Ini_start<=in_32m_Int_Tim_Ini_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSCO.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSCO.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSCO.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSCO is
port(
    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSCO;
architecture Behavioral of SSCO is
component SSCO_con is
port(

    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component SSCO_com is
port(
	out_Sun_sen_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Sun_sen_pow_on_pul:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Sun_sen_pow_on_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
SSCO_con_process:SSCO_con port map(

in_Sun_sen_pow_on_ins => in_Sun_sen_pow_on_ins,
    in_Sun_Sen_Con_Out_start => in_Sun_Sen_Con_Out_start,
    out_Sun_sen_pow_on_ins_loa_ins => out_Sun_sen_pow_on_ins_loa_ins,
    out_Sun_sen_pow_on_pul => out_Sun_sen_pow_on_pul,
    out_Sun_Sen_Con_Out_done => out_Sun_Sen_Con_Out_done,
    in_Sun_sen_pow_on_pul => m_Sun_sen_pow_on_pul,
    out_Sun_sen_pow_on_ins => m_Sun_sen_pow_on_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
SSCO_com_process:SSCO_com port map(
out_Sun_sen_pow_on_pul => m_Sun_sen_pow_on_pul,
    in_Sun_sen_pow_on_ins => m_Sun_sen_pow_on_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSCO_con is
port(
    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSCO_con;
architecture Behavioral of SSCO_con is
signal RAM_Sun_sen_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_Sen_Con_Out_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_sen_pow_on_pul: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sun_Sen_Con_Out_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_0;

out_Sun_Sen_Con_Out_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sun_sen_pow_on_ins_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Sun_sen_pow_on_ins<=RAM_Sun_sen_pow_on_ins ;

when sta_3=>
out_Sun_sen_pow_on_pul<=RAM_Sun_sen_pow_on_pul ;

when sta_0=>

        end case;
	end process;
process(in_Sun_sen_pow_on_ins)
	begin
		RAM_Sun_sen_pow_on_ins<=in_Sun_sen_pow_on_ins;
	end process;

process(in_Sun_Sen_Con_Out_start)
	begin
		RAM_Sun_Sen_Con_Out_start<=in_Sun_Sen_Con_Out_start;
	end process;

process(in_Sun_sen_pow_on_pul)
	begin
		RAM_Sun_sen_pow_on_pul<=in_Sun_sen_pow_on_pul;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSCO_com is
port(
    out_Sun_sen_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSCO_com;
architecture Behavioral of SSCO_com is

begin
    process(in_Sun_sen_pow_on_ins)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSDA.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSDA.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSDA.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA is
port(
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSDA;
architecture Behavioral of SSDA is
component SSDA_con is
port(

    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component SSDA_com is
port(
	out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Sun_mea_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Ang_ana:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
SSDA_con_process:SSDA_con port map(

in_Sun_vis_sig => in_Sun_vis_sig,
    in_Ang_ana => in_Ang_ana,
    in_Sun_sen_pow_sta => in_Sun_sen_pow_sta,
    in_Sun_Sen_Dat_Acq_2_start => in_Sun_Sen_Dat_Acq_2_start,
    out_Sun_vis_sig_sto_ins => out_Sun_vis_sig_sto_ins,
    out_Sun_vis_sig => out_Sun_vis_sig,
    out_Sun_mea_ang_sto_ins => out_Sun_mea_ang_sto_ins,
    out_Sun_mea_ang => out_Sun_mea_ang,
    out_Sun_sen_pow_sta_sto_ins => out_Sun_sen_pow_sta_sto_ins,
    out_Sun_sen_pow_sta => out_Sun_sen_pow_sta,
    out_Sun_vis_sig_acq_ins => out_Sun_vis_sig_acq_ins,
    out_Ang_ana_acq_ins => out_Ang_ana_acq_ins,
    out_Sun_sen_pow_sta_per_ins => out_Sun_sen_pow_sta_per_ins,
    out_Sun_Sen_Dat_Acq_2_done => out_Sun_Sen_Dat_Acq_2_done,
    in_Sun_mea_ang => m_Sun_mea_ang,
    out_Ang_ana => m_Ang_ana,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
SSDA_com_process:SSDA_com port map(
out_Sun_mea_ang => m_Sun_mea_ang,
    in_Ang_ana => m_Ang_ana,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA_con is
port(
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSDA_con;
architecture Behavioral of SSDA_con is
signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Ang_ana: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_sen_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_Sen_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_mea_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sun_Sen_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_0;

out_Sun_Sen_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sun_vis_sig_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Ang_ana_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Sun_sen_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Ang_ana<=RAM_Ang_ana ;

when sta_5=>
out_Sun_vis_sig_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_vis_sig<=RAM_Sun_vis_sig ;

when sta_6=>
out_Sun_mea_ang_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_mea_ang<=RAM_Sun_mea_ang ;

when sta_7=>
out_Sun_sen_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_sen_pow_sta<=RAM_Sun_sen_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Sun_vis_sig)
	begin
		RAM_Sun_vis_sig<=in_Sun_vis_sig;
	end process;

process(in_Ang_ana)
	begin
		RAM_Ang_ana<=in_Ang_ana;
	end process;

process(in_Sun_sen_pow_sta)
	begin
		RAM_Sun_sen_pow_sta<=in_Sun_sen_pow_sta;
	end process;

process(in_Sun_Sen_Dat_Acq_2_start)
	begin
		RAM_Sun_Sen_Dat_Acq_2_start<=in_Sun_Sen_Dat_Acq_2_start;
	end process;

process(in_Sun_mea_ang)
	begin
		RAM_Sun_mea_ang<=in_Sun_mea_ang;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA_com is
port(
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSDA_com;
architecture Behavioral of SSDA_com is

begin
    process(in_Ang_ana)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TIP.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TIP.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TIP.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP is
port(
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TIP;
architecture Behavioral of TIP is
component TIP_con is
port(

    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TIP_com is
port(
	out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Nex_cyc_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tel_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TIP_con_process:TIP_con port map(

in_Tel_ins => in_Tel_ins,
    in_Tel_Ins_Pro_start => in_Tel_Ins_Pro_start,
    out_Nex_cyc_mod_sto_ins => out_Nex_cyc_mod_sto_ins,
    out_Nex_cyc_mod => out_Nex_cyc_mod,
    out_Tel_Ins_Pro_done => out_Tel_Ins_Pro_done,
    in_Nex_cyc_mod => m_Nex_cyc_mod,
    out_Tel_ins => m_Tel_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TIP_com_process:TIP_com port map(
out_Nex_cyc_mod => m_Nex_cyc_mod,
    in_Tel_ins => m_Tel_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP_con is
port(
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TIP_con;
architecture Behavioral of TIP_con is
signal RAM_Tel_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tel_Ins_Pro_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Tel_Ins_Pro_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_0;

out_Tel_Ins_Pro_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Tel_ins<=RAM_Tel_ins ;

when sta_2=>
out_Nex_cyc_mod_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Nex_cyc_mod<=RAM_Nex_cyc_mod ;

when sta_0=>

        end case;
	end process;
process(in_Tel_ins)
	begin
		RAM_Tel_ins<=in_Tel_ins;
	end process;

process(in_Tel_Ins_Pro_start)
	begin
		RAM_Tel_Ins_Pro_start<=in_Tel_Ins_Pro_start;
	end process;

process(in_Nex_cyc_mod)
	begin
		RAM_Nex_cyc_mod<=in_Nex_cyc_mod;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP_com is
port(
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TIP_com;
architecture Behavioral of TIP_com is

begin
    process(in_Tel_ins)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TP.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TP.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TP.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TP is
port(
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Pro_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_dat_tra_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Pro_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TP;
architecture Behavioral of TP is
component TP_con is
port(

    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Pro_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_dat_tra_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Pro_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_dat:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TP_com is
port(
	out_Tel_dat:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Tel_dat:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Cur_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_att_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TP_con_process:TP_con port map(

in_Cur_mod => in_Cur_mod,
    in_Tri_att_ang => in_Tri_att_ang,
    in_Tri_ang_vel => in_Tri_ang_vel,
    in_Tel_Pro_3_start => in_Tel_Pro_3_start,
    out_Cur_mod_loa_ins => out_Cur_mod_loa_ins,
    out_Tri_att_ang_loa_ins => out_Tri_att_ang_loa_ins,
    out_Tri_ang_vel_loa_ins => out_Tri_ang_vel_loa_ins,
    out_Tel_dat_tra_ins => out_Tel_dat_tra_ins,
    out_Tel_Pro_3_done => out_Tel_Pro_3_done,
    in_Tel_dat => m_Tel_dat,
    out_Cur_mod => m_Cur_mod,
    out_Tri_att_ang => m_Tri_att_ang,
    out_Tri_ang_vel => m_Tri_ang_vel,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TP_com_process:TP_com port map(
out_Tel_dat => m_Tel_dat,
    in_Cur_mod => m_Cur_mod,
    in_Tri_att_ang => m_Tri_att_ang,
    in_Tri_ang_vel => m_Tri_ang_vel,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TP_con is
port(
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Pro_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_dat_tra_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Pro_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_dat:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TP_con;
architecture Behavioral of TP_con is
signal RAM_Cur_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tel_Pro_3_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tel_dat: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Tel_Pro_3_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_0;

out_Tel_Pro_3_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Cur_mod_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Tri_att_ang_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Tri_ang_vel_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Cur_mod<=RAM_Cur_mod ;

when sta_5=>
out_Tri_att_ang<=RAM_Tri_att_ang ;

when sta_6=>
out_Tri_ang_vel<=RAM_Tri_ang_vel ;

when sta_7=>
out_Tel_dat_tra_ins<=RAM_Tel_dat_tra_ins ;

when sta_0=>

        end case;
	end process;
process(in_Cur_mod)
	begin
		RAM_Cur_mod<=in_Cur_mod;
	end process;

process(in_Tri_att_ang)
	begin
		RAM_Tri_att_ang<=in_Tri_att_ang;
	end process;

process(in_Tri_ang_vel)
	begin
		RAM_Tri_ang_vel<=in_Tri_ang_vel;
	end process;

process(in_Tel_Pro_3_start)
	begin
		RAM_Tel_Pro_3_start<=in_Tel_Pro_3_start;
	end process;

process(in_Tel_dat)
	begin
		RAM_Tel_dat<=in_Tel_dat;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TP_com is
port(
    out_Tel_dat:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TP_com;
architecture Behavioral of TP_com is

begin
    process(in_Cur_mod,in_Tri_att_ang,in_Tri_ang_vel)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TCC.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TCC.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TCC.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TCC is
port(
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Con_Com_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Con_Com_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TCC;
architecture Behavioral of TCC is
component TCC_con is
port(

    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Con_Com_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Con_Com_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TCC_com is
port(
	out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Tri_con_qua:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_att_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tar_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tar_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TCC_con_process:TCC_con port map(

in_Tri_att_ang => in_Tri_att_ang,
    in_Tri_ang_vel => in_Tri_ang_vel,
    in_Tar_ang => in_Tar_ang,
    in_Tar_ang_vel => in_Tar_ang_vel,
    in_Thr_Con_Com_2_start => in_Thr_Con_Com_2_start,
    out_Tri_att_ang_loa_ins => out_Tri_att_ang_loa_ins,
    out_Tri_ang_vel_loa_ins => out_Tri_ang_vel_loa_ins,
    out_Tar_ang_loa_ins => out_Tar_ang_loa_ins,
    out_Tar_ang_vel_loa_ins => out_Tar_ang_vel_loa_ins,
    out_Tri_con_qua_sto_ins => out_Tri_con_qua_sto_ins,
    out_Tri_con_qua => out_Tri_con_qua,
    out_Thr_Con_Com_2_done => out_Thr_Con_Com_2_done,
    in_Tri_con_qua => m_Tri_con_qua,
    out_Tri_att_ang => m_Tri_att_ang,
    out_Tri_ang_vel => m_Tri_ang_vel,
    out_Tar_ang => m_Tar_ang,
    out_Tar_ang_vel => m_Tar_ang_vel,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TCC_com_process:TCC_com port map(
out_Tri_con_qua => m_Tri_con_qua,
    in_Tri_att_ang => m_Tri_att_ang,
    in_Tri_ang_vel => m_Tri_ang_vel,
    in_Tar_ang => m_Tar_ang,
    in_Tar_ang_vel => m_Tar_ang_vel,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TCC_con is
port(
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Con_Com_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Con_Com_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TCC_con;
architecture Behavioral of TCC_con is
signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tar_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tar_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Con_Com_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_con_qua: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7,sta_8,sta_9);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Con_Com_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_8;

when sta_8=>
sta <=sta_9;

when sta_9=>
sta <=sta_0;

out_Thr_Con_Com_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Tri_att_ang_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Tri_ang_vel_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Tar_ang_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Tar_ang_vel_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_5=>
out_Tri_att_ang<=RAM_Tri_att_ang ;

when sta_6=>
out_Tri_ang_vel<=RAM_Tri_ang_vel ;

when sta_7=>
out_Tar_ang<=RAM_Tar_ang ;

when sta_8=>
out_Tar_ang_vel<=RAM_Tar_ang_vel ;

when sta_9=>
out_Tri_con_qua_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tri_con_qua<=RAM_Tri_con_qua ;

when sta_0=>

        end case;
	end process;
process(in_Tri_att_ang)
	begin
		RAM_Tri_att_ang<=in_Tri_att_ang;
	end process;

process(in_Tri_ang_vel)
	begin
		RAM_Tri_ang_vel<=in_Tri_ang_vel;
	end process;

process(in_Tar_ang)
	begin
		RAM_Tar_ang<=in_Tar_ang;
	end process;

process(in_Tar_ang_vel)
	begin
		RAM_Tar_ang_vel<=in_Tar_ang_vel;
	end process;

process(in_Thr_Con_Com_2_start)
	begin
		RAM_Thr_Con_Com_2_start<=in_Thr_Con_Com_2_start;
	end process;

process(in_Tri_con_qua)
	begin
		RAM_Tri_con_qua<=in_Tri_con_qua;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TCC_com is
port(
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TCC_com;
architecture Behavioral of TCC_com is

begin
    process(in_Tri_att_ang,in_Tri_ang_vel,in_Tar_ang,in_Tar_ang_vel)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDA.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDA.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDA.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDA is
port(
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TDA;
architecture Behavioral of TDA is
signal RAM_Thr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_0;

out_Thr_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Thr_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Thr_pow_sta<=RAM_Thr_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Thr_pow_sta)
	begin
		RAM_Thr_pow_sta<=in_Thr_pow_sta;
	end process;

process(in_Thr_Dat_Acq_2_start)
	begin
		RAM_Thr_Dat_Acq_2_start<=in_Thr_Dat_Acq_2_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDC.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDC.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TDC.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDC is
port(
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dis_Com_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dis_Com_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TDC;
architecture Behavioral of TDC is
component TDC_con is
port(

    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dis_Com_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dis_Com_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TDC_com is
port(
	out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Thr_com_log:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Thr_pow_sta:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_con_qua:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TDC_con_process:TDC_con port map(

in_Thr_pow_sta => in_Thr_pow_sta,
    in_Tri_con_qua => in_Tri_con_qua,
    in_Thr_Dis_Com_start => in_Thr_Dis_Com_start,
    out_Thr_pow_sta_loa_ins => out_Thr_pow_sta_loa_ins,
    out_Tri_con_qua_loa_ins => out_Tri_con_qua_loa_ins,
    out_Thr_com_log_sto_ins => out_Thr_com_log_sto_ins,
    out_Thr_com_log => out_Thr_com_log,
    out_Thr_Dis_Com_done => out_Thr_Dis_Com_done,
    in_Thr_com_log => m_Thr_com_log,
    out_Thr_pow_sta => m_Thr_pow_sta,
    out_Tri_con_qua => m_Tri_con_qua,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TDC_com_process:TDC_com port map(
out_Thr_com_log => m_Thr_com_log,
    in_Thr_pow_sta => m_Thr_pow_sta,
    in_Tri_con_qua => m_Tri_con_qua,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDC_con is
port(
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dis_Com_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dis_Com_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_qua:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TDC_con;
architecture Behavioral of TDC_con is
signal RAM_Thr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_con_qua: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Dis_Com_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_com_log: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Dis_Com_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_0;

out_Thr_Dis_Com_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_sta_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Tri_con_qua_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Thr_pow_sta<=RAM_Thr_pow_sta ;

when sta_4=>
out_Tri_con_qua<=RAM_Tri_con_qua ;

when sta_5=>
out_Thr_com_log_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Thr_com_log<=RAM_Thr_com_log ;

when sta_0=>

        end case;
	end process;
process(in_Thr_pow_sta)
	begin
		RAM_Thr_pow_sta<=in_Thr_pow_sta;
	end process;

process(in_Tri_con_qua)
	begin
		RAM_Tri_con_qua<=in_Tri_con_qua;
	end process;

process(in_Thr_Dis_Com_start)
	begin
		RAM_Thr_Dis_Com_start<=in_Thr_Dis_Com_start;
	end process;

process(in_Thr_com_log)
	begin
		RAM_Thr_com_log<=in_Thr_com_log;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDC_com is
port(
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_qua:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TDC_com;
architecture Behavioral of TDC_com is

begin
    process(in_Thr_pow_sta,in_Tri_con_qua)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPCO.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPCO.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TPCO.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TPCO is
port(
    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Pow_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Pow_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TPCO;
architecture Behavioral of TPCO is
component TPCO_con is
port(

    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Pow_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Pow_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TPCO_com is
port(
	out_Thr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Thr_pow_on_pul:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Thr_pow_on_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TPCO_con_process:TPCO_con port map(

in_Thr_pow_on_ins => in_Thr_pow_on_ins,
    in_Thr_Pow_Con_Out_start => in_Thr_Pow_Con_Out_start,
    out_Thr_pow_on_ins_loa_ins => out_Thr_pow_on_ins_loa_ins,
    out_Thr_pow_on_pul => out_Thr_pow_on_pul,
    out_Thr_Pow_Con_Out_done => out_Thr_Pow_Con_Out_done,
    in_Thr_pow_on_pul => m_Thr_pow_on_pul,
    out_Thr_pow_on_ins => m_Thr_pow_on_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TPCO_com_process:TPCO_com port map(
out_Thr_pow_on_pul => m_Thr_pow_on_pul,
    in_Thr_pow_on_ins => m_Thr_pow_on_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TPCO_con is
port(
    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Pow_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Pow_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TPCO_con;
architecture Behavioral of TPCO_con is
signal RAM_Thr_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Pow_Con_Out_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_pow_on_pul: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Pow_Con_Out_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_0;

out_Thr_Pow_Con_Out_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_on_ins_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Thr_pow_on_ins<=RAM_Thr_pow_on_ins ;

when sta_3=>
out_Thr_pow_on_pul<=RAM_Thr_pow_on_pul ;

when sta_0=>

        end case;
	end process;
process(in_Thr_pow_on_ins)
	begin
		RAM_Thr_pow_on_ins<=in_Thr_pow_on_ins;
	end process;

process(in_Thr_Pow_Con_Out_start)
	begin
		RAM_Thr_Pow_Con_Out_start<=in_Thr_Pow_Con_Out_start;
	end process;

process(in_Thr_pow_on_pul)
	begin
		RAM_Thr_pow_on_pul<=in_Thr_pow_on_pul;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TPCO_com is
port(
    out_Thr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TPCO_com;
architecture Behavioral of TPCO_com is

begin
    process(in_Thr_pow_on_ins)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTC.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTC.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTC.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTC is
port(
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TTC;
architecture Behavioral of TTC is
component TTC_con is
port(

    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TTC_com is
port(
	out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Tri_con_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Thr_com_log:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TTC_con_process:TTC_con port map(

in_Thr_com_log => in_Thr_com_log,
    in_Thr_Tri_Con_2_start => in_Thr_Tri_Con_2_start,
    out_Thr_com_log_loa_ins => out_Thr_com_log_loa_ins,
    out_Tri_con_ins_sto_ins => out_Tri_con_ins_sto_ins,
    out_Tri_con_ins => out_Tri_con_ins,
    out_Thr_Tri_Con_2_done => out_Thr_Tri_Con_2_done,
    in_Tri_con_ins => m_Tri_con_ins,
    out_Thr_com_log => m_Thr_com_log,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TTC_com_process:TTC_com port map(
out_Tri_con_ins => m_Tri_con_ins,
    in_Thr_com_log => m_Thr_com_log,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTC_con is
port(
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TTC_con;
architecture Behavioral of TTC_con is
signal RAM_Thr_com_log: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Tri_Con_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_con_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Tri_Con_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_0;

out_Thr_Tri_Con_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_com_log_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Thr_com_log<=RAM_Thr_com_log ;

when sta_3=>
out_Tri_con_ins_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tri_con_ins<=RAM_Tri_con_ins ;

when sta_0=>

        end case;
	end process;
process(in_Thr_com_log)
	begin
		RAM_Thr_com_log<=in_Thr_com_log;
	end process;

process(in_Thr_Tri_Con_2_start)
	begin
		RAM_Thr_Tri_Con_2_start<=in_Thr_Tri_Con_2_start;
	end process;

process(in_Tri_con_ins)
	begin
		RAM_Tri_con_ins<=in_Tri_con_ins;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTC_com is
port(
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TTC_com;
architecture Behavioral of TTC_com is

begin
    process(in_Thr_com_log)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTCO.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTCO.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/TTCO.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTCO is
port(
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TTCO;
architecture Behavioral of TTCO is
component TTCO_con is
port(

    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TTCO_com is
port(
	out_Tri_con_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Tri_con_sig:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_con_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TTCO_con_process:TTCO_con port map(

in_Tri_con_ins => in_Tri_con_ins,
    in_Thr_Tri_Con_Out_start => in_Thr_Tri_Con_Out_start,
    out_Tri_con_ins_loa_ins => out_Tri_con_ins_loa_ins,
    out_Tri_con_sig => out_Tri_con_sig,
    out_Thr_Tri_Con_Out_done => out_Thr_Tri_Con_Out_done,
    in_Tri_con_sig => m_Tri_con_sig,
    out_Tri_con_ins => m_Tri_con_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TTCO_com_process:TTCO_com port map(
out_Tri_con_sig => m_Tri_con_sig,
    in_Tri_con_ins => m_Tri_con_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTCO_con is
port(
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TTCO_con;
architecture Behavioral of TTCO_con is
signal RAM_Tri_con_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Tri_Con_Out_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_con_sig: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_while_1,sta_1,sta_2,sta_3,sta_while_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_while_1=>
sta <=sta_1;

when sta_while_3=>
                        if in_tim = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_1;

                        end if;
when sta_0=>
                        if in_Thr_Tri_Con_Out_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_while_3;

            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Tri_con_ins_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Tri_con_ins<=RAM_Tri_con_ins ;

when sta_3=>
out_Tri_con_sig<=RAM_Tri_con_sig ;

when sta_while_1=>
when sta_while_3=>
when sta_0=>

        end case;
	end process;
process(in_Tri_con_ins)
	begin
		RAM_Tri_con_ins<=in_Tri_con_ins;
	end process;

process(in_Thr_Tri_Con_Out_start)
	begin
		RAM_Thr_Tri_Con_Out_start<=in_Thr_Tri_Con_Out_start;
	end process;

process(in_Tri_con_sig)
	begin
		RAM_Tri_con_sig<=in_Tri_con_sig;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTCO_com is
port(
    out_Tri_con_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TTCO_com;
architecture Behavioral of TTCO_com is

begin
    process(in_Tri_con_ins)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/AD.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/AD.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/AD.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity AD is
port(
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Att_Det_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Att_Det_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end AD;
architecture Behavioral of AD is
component AD_con is
port(

    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Att_Det_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Att_Det_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component AD_com is
port(
	out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Tri_att_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Ang_vel_ana:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Sun_vis_sig:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Sun_mea_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Cur_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
AD_con_process:AD_con port map(

in_Ang_vel_ana => in_Ang_vel_ana,
    in_Sun_vis_sig => in_Sun_vis_sig,
    in_Sun_mea_ang => in_Sun_mea_ang,
    in_Cur_mod => in_Cur_mod,
    in_Att_Det_start => in_Att_Det_start,
    out_Ang_vel_ana_loa_ins => out_Ang_vel_ana_loa_ins,
    out_Sun_vis_sig_loa_ins => out_Sun_vis_sig_loa_ins,
    out_Sun_mea_ang_loa_ins => out_Sun_mea_ang_loa_ins,
    out_Cur_mod_loa_ins => out_Cur_mod_loa_ins,
    out_Tri_att_ang_sto_ins => out_Tri_att_ang_sto_ins,
    out_Tri_att_ang => out_Tri_att_ang,
    out_Tri_ang_vel_sto_ins => out_Tri_ang_vel_sto_ins,
    out_Tri_ang_vel => out_Tri_ang_vel,
    out_Att_Det_done => out_Att_Det_done,
    in_Tri_att_ang => m_Tri_att_ang,
    in_Tri_ang_vel => m_Tri_ang_vel,
    out_Ang_vel_ana => m_Ang_vel_ana,
    out_Sun_vis_sig => m_Sun_vis_sig,
    out_Sun_mea_ang => m_Sun_mea_ang,
    out_Cur_mod => m_Cur_mod,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
AD_com_process:AD_com port map(
out_Tri_att_ang => m_Tri_att_ang,
    out_Tri_ang_vel => m_Tri_ang_vel,
    in_Ang_vel_ana => m_Ang_vel_ana,
    in_Sun_vis_sig => m_Sun_vis_sig,
    in_Sun_mea_ang => m_Sun_mea_ang,
    in_Cur_mod => m_Cur_mod,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity AD_con is
port(
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Att_Det_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Att_Det_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end AD_con;
architecture Behavioral of AD_con is
signal RAM_Ang_vel_ana: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_mea_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Cur_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Att_Det_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7,sta_8,sta_9,sta_10);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Att_Det_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_8;

when sta_8=>
sta <=sta_9;

when sta_9=>
sta <=sta_10;

when sta_10=>
sta <=sta_0;

out_Att_Det_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Ang_vel_ana_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Sun_vis_sig_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Sun_mea_ang_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Cur_mod_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_5=>
out_Ang_vel_ana<=RAM_Ang_vel_ana ;

when sta_6=>
out_Sun_vis_sig<=RAM_Sun_vis_sig ;

when sta_7=>
out_Sun_mea_ang<=RAM_Sun_mea_ang ;

when sta_8=>
out_Cur_mod<=RAM_Cur_mod ;

when sta_9=>
out_Tri_att_ang_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tri_att_ang<=RAM_Tri_att_ang ;

when sta_10=>
out_Tri_ang_vel_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tri_ang_vel<=RAM_Tri_ang_vel ;

when sta_0=>

        end case;
	end process;
process(in_Ang_vel_ana)
	begin
		RAM_Ang_vel_ana<=in_Ang_vel_ana;
	end process;

process(in_Sun_vis_sig)
	begin
		RAM_Sun_vis_sig<=in_Sun_vis_sig;
	end process;

process(in_Sun_mea_ang)
	begin
		RAM_Sun_mea_ang<=in_Sun_mea_ang;
	end process;

process(in_Cur_mod)
	begin
		RAM_Cur_mod<=in_Cur_mod;
	end process;

process(in_Att_Det_start)
	begin
		RAM_Att_Det_start<=in_Att_Det_start;
	end process;

process(in_Tri_att_ang)
	begin
		RAM_Tri_att_ang<=in_Tri_att_ang;
	end process;

process(in_Tri_ang_vel)
	begin
		RAM_Tri_ang_vel<=in_Tri_ang_vel;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity AD_com is
port(
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end AD_com;
architecture Behavioral of AD_com is

begin
    process(in_Ang_vel_ana,in_Sun_vis_sig,in_Sun_mea_ang,in_Cur_mod)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GCO.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GCO.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GCO.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GCO is
port(
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GCO;
architecture Behavioral of GCO is
component GCO_con is
port(

    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component GCO_com is
port(
	out_Gyr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Gyr_pow_on_pul:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Gyr_pow_on_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
GCO_con_process:GCO_con port map(

in_Gyr_pow_on_ins => in_Gyr_pow_on_ins,
    in_Gyr_Con_Out_start => in_Gyr_Con_Out_start,
    out_Gyr_pow_on_ins_loa_ins => out_Gyr_pow_on_ins_loa_ins,
    out_Gyr_pow_on_pul => out_Gyr_pow_on_pul,
    out_Gyr_Con_Out_done => out_Gyr_Con_Out_done,
    in_Gyr_pow_on_pul => m_Gyr_pow_on_pul,
    out_Gyr_pow_on_ins => m_Gyr_pow_on_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
GCO_com_process:GCO_com port map(
out_Gyr_pow_on_pul => m_Gyr_pow_on_pul,
    in_Gyr_pow_on_ins => m_Gyr_pow_on_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GCO_con is
port(
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Con_Out_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Con_Out_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_pul:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GCO_con;
architecture Behavioral of GCO_con is
signal RAM_Gyr_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_Con_Out_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_pow_on_pul: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Gyr_Con_Out_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_0;

out_Gyr_Con_Out_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Gyr_pow_on_ins_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Gyr_pow_on_ins<=RAM_Gyr_pow_on_ins ;

when sta_3=>
out_Gyr_pow_on_pul<=RAM_Gyr_pow_on_pul ;

when sta_0=>

        end case;
	end process;
process(in_Gyr_pow_on_ins)
	begin
		RAM_Gyr_pow_on_ins<=in_Gyr_pow_on_ins;
	end process;

process(in_Gyr_Con_Out_start)
	begin
		RAM_Gyr_Con_Out_start<=in_Gyr_Con_Out_start;
	end process;

process(in_Gyr_pow_on_pul)
	begin
		RAM_Gyr_pow_on_pul<=in_Gyr_pow_on_pul;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GCO_com is
port(
    out_Gyr_pow_on_pul:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GCO_com;
architecture Behavioral of GCO_com is

begin
    process(in_Gyr_pow_on_ins)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GDA.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GDA.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/GDA.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA is
port(
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GDA;
architecture Behavioral of GDA is
component GDA_con is
port(

    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component GDA_com is
port(
	out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Ang_vel_ana:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Pul_cou:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
GDA_con_process:GDA_con port map(

in_Pul_cou => in_Pul_cou,
    in_Gyr_pow_sta => in_Gyr_pow_sta,
    in_Gyr_Dat_Acq_2_start => in_Gyr_Dat_Acq_2_start,
    out_Ang_vel_ana_sto_ins => out_Ang_vel_ana_sto_ins,
    out_Ang_vel_ana => out_Ang_vel_ana,
    out_Gyr_pow_sta_sto_ins => out_Gyr_pow_sta_sto_ins,
    out_Gyr_pow_sta => out_Gyr_pow_sta,
    out_Pul_cou_acq_ins => out_Pul_cou_acq_ins,
    out_Gyr_pow_sta_per_ins => out_Gyr_pow_sta_per_ins,
    out_Gyr_Dat_Acq_2_done => out_Gyr_Dat_Acq_2_done,
    in_Ang_vel_ana => m_Ang_vel_ana,
    out_Pul_cou => m_Pul_cou,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
GDA_com_process:GDA_com port map(
out_Ang_vel_ana => m_Ang_vel_ana,
    in_Pul_cou => m_Pul_cou,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA_con is
port(
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GDA_con;
architecture Behavioral of GDA_con is
signal RAM_Pul_cou: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Ang_vel_ana: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Gyr_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_0;

out_Gyr_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Pul_cou_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Gyr_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Pul_cou<=RAM_Pul_cou ;

when sta_4=>
out_Ang_vel_ana_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Ang_vel_ana<=RAM_Ang_vel_ana ;

when sta_5=>
out_Gyr_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Gyr_pow_sta<=RAM_Gyr_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Pul_cou)
	begin
		RAM_Pul_cou<=in_Pul_cou;
	end process;

process(in_Gyr_pow_sta)
	begin
		RAM_Gyr_pow_sta<=in_Gyr_pow_sta;
	end process;

process(in_Gyr_Dat_Acq_2_start)
	begin
		RAM_Gyr_Dat_Acq_2_start<=in_Gyr_Dat_Acq_2_start;
	end process;

process(in_Ang_vel_ana)
	begin
		RAM_Ang_vel_ana<=in_Ang_vel_ana;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA_com is
port(
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GDA_com;
architecture Behavioral of GDA_com is

begin
    process(in_Pul_cou)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MI.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MI is
port(
    in_Mod_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end MI;
architecture Behavioral of MI is
signal RAM_Mod_Ini_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Mod_Ini_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_0;

out_Mod_Ini_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Cur_mod_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Cur_mod<=RAM_Cur_mod ;

when sta_0=>

        end case;
	end process;
process(in_Mod_Ini_start)
	begin
		RAM_Mod_Ini_start<=in_Mod_Ini_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MSM.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MSM.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/MSM.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MSM is
port(
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Swi_Man_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Swi_Man_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end MSM;
architecture Behavioral of MSM is
component MSM_con is
port(

    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Swi_Man_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Swi_Man_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component MSM_com is
port(
	out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Nex_cyc_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Cur_mod_wor_tim:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tar_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tar_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_att_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tri_ang_vel:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Sun_vis_sig:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Cur_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Cur_mod_wor_tim:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
MSM_con_process:MSM_con port map(

in_Tri_att_ang => in_Tri_att_ang,
    in_Tri_ang_vel => in_Tri_ang_vel,
    in_Sun_vis_sig => in_Sun_vis_sig,
    in_Cur_mod => in_Cur_mod,
    in_Cur_mod_wor_tim => in_Cur_mod_wor_tim,
    in_Mod_Swi_Man_3_start => in_Mod_Swi_Man_3_start,
    out_Tri_att_ang_loa_ins => out_Tri_att_ang_loa_ins,
    out_Tri_ang_vel_loa_ins => out_Tri_ang_vel_loa_ins,
    out_Sun_vis_sig_loa_ins => out_Sun_vis_sig_loa_ins,
    out_Cur_mod_loa_ins => out_Cur_mod_loa_ins,
    out_Cur_mod_wor_tim_loa_ins => out_Cur_mod_wor_tim_loa_ins,
    out_Nex_cyc_mod_sto_ins => out_Nex_cyc_mod_sto_ins,
    out_Nex_cyc_mod => out_Nex_cyc_mod,
    out_Cur_mod_wor_tim_sto_ins => out_Cur_mod_wor_tim_sto_ins,
    out_Cur_mod_wor_tim => out_Cur_mod_wor_tim,
    out_Tar_ang_sto_ins => out_Tar_ang_sto_ins,
    out_Tar_ang => out_Tar_ang,
    out_Tar_ang_vel_sto_ins => out_Tar_ang_vel_sto_ins,
    out_Tar_ang_vel => out_Tar_ang_vel,
    out_Mod_Swi_Man_3_done => out_Mod_Swi_Man_3_done,
    in_Nex_cyc_mod => m_Nex_cyc_mod,
    in_Cur_mod_wor_tim => m_Cur_mod_wor_tim,
    in_Tar_ang => m_Tar_ang,
    in_Tar_ang_vel => m_Tar_ang_vel,
    out_Tri_att_ang => m_Tri_att_ang,
    out_Tri_ang_vel => m_Tri_ang_vel,
    out_Sun_vis_sig => m_Sun_vis_sig,
    out_Cur_mod => m_Cur_mod,
    out_Cur_mod_wor_tim => m_Cur_mod_wor_tim,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
MSM_com_process:MSM_com port map(
out_Nex_cyc_mod => m_Nex_cyc_mod,
    out_Cur_mod_wor_tim => m_Cur_mod_wor_tim,
    out_Tar_ang => m_Tar_ang,
    out_Tar_ang_vel => m_Tar_ang_vel,
    in_Tri_att_ang => m_Tri_att_ang,
    in_Tri_ang_vel => m_Tri_ang_vel,
    in_Sun_vis_sig => m_Sun_vis_sig,
    in_Cur_mod => m_Cur_mod,
    in_Cur_mod_wor_tim => m_Cur_mod_wor_tim,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MSM_con is
port(
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Swi_Man_3_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_loa_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Swi_Man_3_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end MSM_con;
architecture Behavioral of MSM_con is
signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Cur_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Cur_mod_wor_tim: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Mod_Swi_Man_3_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Cur_mod_wor_tim: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tar_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tar_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7,sta_8,sta_9,sta_10,sta_11,sta_12,sta_13,sta_14);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Mod_Swi_Man_3_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_8;

when sta_8=>
sta <=sta_9;

when sta_9=>
sta <=sta_10;

when sta_10=>
sta <=sta_11;

when sta_11=>
sta <=sta_12;

when sta_12=>
sta <=sta_13;

when sta_13=>
sta <=sta_14;

when sta_14=>
sta <=sta_0;

out_Mod_Swi_Man_3_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Tri_att_ang_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Tri_ang_vel_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Sun_vis_sig_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Cur_mod_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_5=>
out_Cur_mod_wor_tim_loa_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_6=>
out_Tri_att_ang<=RAM_Tri_att_ang ;

when sta_7=>
out_Tri_ang_vel<=RAM_Tri_ang_vel ;

when sta_8=>
out_Sun_vis_sig<=RAM_Sun_vis_sig ;

when sta_9=>
out_Cur_mod<=RAM_Cur_mod ;

when sta_10=>
out_Cur_mod_wor_tim<=RAM_Cur_mod_wor_tim ;

when sta_11=>
out_Nex_cyc_mod_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Nex_cyc_mod<=RAM_Nex_cyc_mod ;

when sta_12=>
out_Cur_mod_wor_tim_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Cur_mod_wor_tim<=RAM_Cur_mod_wor_tim ;

when sta_13=>
out_Tar_ang_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tar_ang<=RAM_Tar_ang ;

when sta_14=>
out_Tar_ang_vel_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Tar_ang_vel<=RAM_Tar_ang_vel ;

when sta_0=>

        end case;
	end process;
process(in_Tri_att_ang)
	begin
		RAM_Tri_att_ang<=in_Tri_att_ang;
	end process;

process(in_Tri_ang_vel)
	begin
		RAM_Tri_ang_vel<=in_Tri_ang_vel;
	end process;

process(in_Sun_vis_sig)
	begin
		RAM_Sun_vis_sig<=in_Sun_vis_sig;
	end process;

process(in_Cur_mod)
	begin
		RAM_Cur_mod<=in_Cur_mod;
	end process;

process(in_Cur_mod_wor_tim)
	begin
		RAM_Cur_mod_wor_tim<=in_Cur_mod_wor_tim;
	end process;

process(in_Mod_Swi_Man_3_start)
	begin
		RAM_Mod_Swi_Man_3_start<=in_Mod_Swi_Man_3_start;
	end process;

process(in_Nex_cyc_mod)
	begin
		RAM_Nex_cyc_mod<=in_Nex_cyc_mod;
	end process;

process(in_Cur_mod_wor_tim)
	begin
		RAM_Cur_mod_wor_tim<=in_Cur_mod_wor_tim;
	end process;

process(in_Tar_ang)
	begin
		RAM_Tar_ang<=in_Tar_ang;
	end process;

process(in_Tar_ang_vel)
	begin
		RAM_Tar_ang_vel<=in_Tar_ang_vel;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MSM_com is
port(
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end MSM_com;
architecture Behavioral of MSM_com is

begin
    process(in_Tri_att_ang,in_Tri_ang_vel,in_Sun_vis_sig,in_Cur_mod,in_Cur_mod_wor_tim)

    begin


                --



	end process;



end Behavioral;

"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SGPOI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SGPOI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SGPOI.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SGPOI is
port(
    in_Sto_Gyr_Pow_on_Ins_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Gyr_Pow_on_Ins_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SGPOI;
architecture Behavioral of SGPOI is
signal RAM_Sto_Gyr_Pow_on_Ins_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sto_Gyr_Pow_on_Ins_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;

out_Sto_Gyr_Pow_on_Ins_done <= std_logic_vector(to_unsigned(1, 32));
                        end if;
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_0=>

        end case;
	end process;
process(in_Sto_Gyr_Pow_on_Ins_start)
	begin
		RAM_Sto_Gyr_Pow_on_Ins_start<=in_Sto_Gyr_Pow_on_Ins_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSSPOI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSSPOI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/SSSPOI.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSSPOI is
port(
    in_Sto_Sun_Sen_Pow_on_Ins_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Sun_Sen_Pow_on_Ins_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSSPOI;
architecture Behavioral of SSSPOI is
signal RAM_Sto_Sun_Sen_Pow_on_Ins_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sto_Sun_Sen_Pow_on_Ins_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;

out_Sto_Sun_Sen_Pow_on_Ins_done <= std_logic_vector(to_unsigned(1, 32));
                        end if;
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_0=>

        end case;
	end process;
process(in_Sto_Sun_Sen_Pow_on_Ins_start)
	begin
		RAM_Sto_Sun_Sen_Pow_on_Ins_start<=in_Sto_Sun_Sen_Pow_on_Ins_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/STPOI.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/STPOI.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/STPOI.vhd" a]
puts $file "
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity STPOI is
port(
    in_Sto_Thr_Pow_on_Ins_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Thr_Pow_on_Ins_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end STPOI;
architecture Behavioral of STPOI is
signal RAM_Sto_Thr_Pow_on_Ins_start: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sto_Thr_Pow_on_Ins_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_0;

out_Sto_Thr_Pow_on_Ins_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_on_ins_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Thr_pow_on_ins<=RAM_Thr_pow_on_ins ;

when sta_0=>

        end case;
	end process;
process(in_Sto_Thr_Pow_on_Ins_start)
	begin
		RAM_Sto_Thr_Pow_on_Ins_start<=in_Sto_Thr_Pow_on_Ins_start;
	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sea_Sub.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sea_Sub.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sea_Sub.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Sun_Sea_Sub is
port(
    in_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Dat_Acq_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Att_Det_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Swi_Man_3_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Con_Com_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dis_Com_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Pro_3_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Dat_Acq_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Att_Det_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Swi_Man_3_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Con_Com_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dis_Com_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Pro_3_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Sun_Sea_Sub;
architecture Behavioral of Sun_Sea_Sub is

Type states is (sta_0,sta_1,sta_while_2,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7,sta_8,sta_at_9,sta_9,sta_while_9);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_at_9=>
                        if in_128=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_9;
                        end if; 
when sta_while_2=>
                        if in_not=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_while_9=>
                        if in_160=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_2;
                        end if; 
when sta_0=>
                        if in_Sun_Sea_Sub_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_2;
                        end if; 
when sta_2=>
                        if in_Tel_Ins_Pro_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Dat_Acq_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_4;
                        end if; 
when sta_4=>
                        if in_Att_Det_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_5;
                        end if; 
when sta_5=>
                        if in_Mod_Swi_Man_3_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_6;
                        end if; 
when sta_6=>
                        if in_Thr_Con_Com_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_7;
                        end if; 
when sta_7=>
                        if in_Thr_Dis_Com_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_8;
                        end if; 
when sta_8=>
                        if in_Tel_Pro_3_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_at_9;
                        end if; 
when sta_9=>
                        if in_Thr_Tri_Con_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_9;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Tel_Ins_Pro_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Dat_Acq_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_4=>
out_Att_Det_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_5=>
out_Mod_Swi_Man_3_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_6=>
out_Thr_Con_Com_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_7=>
out_Thr_Dis_Com_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_8=>
out_Tel_Pro_3_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_9=>
out_Thr_Tri_Con_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_at_9=>
when sta_while_2=>
when sta_while_9=>
when sta_0=>
out_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Tel_Ins_Pro_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Dat_Acq_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Att_Det_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Mod_Swi_Man_3_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Con_Com_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Dis_Com_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Tel_Pro_3_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Tri_Con_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Initialization.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Initialization.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Initialization.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Ini is
port(
    in_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_32m_Int_Tim_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_32m_Int_Tim_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Ini;
architecture Behavioral of Ini is

Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_32m_Int_Tim_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Gyr_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Sun_Sen_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_4;
                        end if; 
when sta_4=>
                        if in_Thr_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_5;
                        end if; 
when sta_5=>
                        if in_Mod_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_32m_Int_Tim_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Gyr_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Sun_Sen_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_4=>
out_Thr_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_5=>
out_Mod_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_32m_Int_Tim_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Gyr_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Mod_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Gyr_Ini.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Gyr_Ini.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Gyr_Ini.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Gyr_Ini is
port(
    in_Gyr_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sto_Gyr_Pow_on_Ins_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Con_Out_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Gyr_Pow_on_Ins_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Con_Out_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Gyr_Ini;
architecture Behavioral of Gyr_Ini is

Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Gyr_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Sto_Gyr_Pow_on_Ins_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Gyr_Con_Out_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sto_Gyr_Pow_on_Ins_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Gyr_Con_Out_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Sto_Gyr_Pow_on_Ins_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Gyr_Con_Out_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sen_Ini.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sen_Ini.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Sun_Sen_Ini.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Sun_Sen_Ini is
port(
    in_Sun_Sen_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sto_Sun_Sen_Pow_on_Ins_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Con_Out_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Sun_Sen_Pow_on_Ins_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Con_Out_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Sun_Sen_Ini;
architecture Behavioral of Sun_Sen_Ini is

Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sun_Sen_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Sto_Sun_Sen_Pow_on_Ins_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Sun_Sen_Con_Out_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sto_Sun_Sen_Pow_on_Ins_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Sun_Sen_Con_Out_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Sto_Sun_Sen_Pow_on_Ins_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Con_Out_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Ini.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Ini.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Ini.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Thr_Ini is
port(
    in_Thr_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sto_Thr_Pow_on_Ins_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Pow_Con_Out_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Thr_Pow_on_Ins_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Pow_Con_Out_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Thr_Ini;
architecture Behavioral of Thr_Ini is

Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Sto_Thr_Pow_on_Ins_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Thr_Pow_Con_Out_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sto_Thr_Pow_on_Ins_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Thr_Pow_Con_Out_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Sto_Thr_Pow_on_Ins_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Pow_Con_Out_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Dat_Acq.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Dat_Acq.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Dat_Acq.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Dat_Acq is
port(
    in_Dat_Acq_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Dat_Acq_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Dat_Acq;
architecture Behavioral of Dat_Acq is

Type states is (sta_0,sta_1,sta_2,sta_3);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Dat_Acq_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Gyr_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Sun_Sen_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Thr_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Gyr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Sun_Sen_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Thr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Gyr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
close [ open ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Tri_Con.vhd w ]
add_files ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Tri_Con.vhd
set file [open "./AtomicSystemGeneration/test/Data/Vhdlproject/Sun/Sun.srcs/sources_1/new/Thr_Tri_Con.vhd" a]
puts $file "library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Thr_Tri_Con is
port(
    in_Thr_Tri_Con_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_Out_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_Out_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Thr_Tri_Con;
architecture Behavioral of Thr_Tri_Con is

Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Thr_Tri_Con_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Thr_Tri_Con_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Thr_Tri_Con_Out_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_Tri_Con_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Thr_Tri_Con_Out_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Thr_Tri_Con_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Tri_Con_Out_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/test/Data/Vhdlproject/Sun xilinx.com -library user -taxonomy /UserIP 
