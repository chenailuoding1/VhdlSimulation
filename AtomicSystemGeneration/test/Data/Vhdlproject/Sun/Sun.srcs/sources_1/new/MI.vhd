
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

