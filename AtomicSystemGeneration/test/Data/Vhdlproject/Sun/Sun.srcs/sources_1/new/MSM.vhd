library IEEE;
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


