library IEEE;
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


