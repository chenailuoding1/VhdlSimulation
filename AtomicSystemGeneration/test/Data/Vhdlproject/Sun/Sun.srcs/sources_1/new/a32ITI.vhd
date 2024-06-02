
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

