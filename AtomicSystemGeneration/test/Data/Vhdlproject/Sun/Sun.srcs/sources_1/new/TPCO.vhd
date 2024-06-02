library IEEE;
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


