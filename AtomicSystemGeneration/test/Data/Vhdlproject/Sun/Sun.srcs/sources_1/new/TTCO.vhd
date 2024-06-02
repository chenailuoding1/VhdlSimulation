library IEEE;
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


