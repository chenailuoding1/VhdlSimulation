library IEEE;
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


