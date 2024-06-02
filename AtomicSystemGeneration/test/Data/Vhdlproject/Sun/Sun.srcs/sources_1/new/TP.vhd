library IEEE;
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


