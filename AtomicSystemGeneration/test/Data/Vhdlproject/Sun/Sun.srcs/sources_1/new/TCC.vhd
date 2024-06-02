library IEEE;
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


