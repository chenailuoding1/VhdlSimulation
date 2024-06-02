library IEEE;
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


