library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Sun_Sen_Ini is
port(
    in_Sun_Sen_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sto_Sun_Sen_Pow_on_Ins_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Con_Out_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Sun_Sen_Pow_on_Ins_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Con_Out_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Sun_Sen_Ini;
architecture Behavioral of Sun_Sen_Ini is

Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sun_Sen_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Sto_Sun_Sen_Pow_on_Ins_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Sun_Sen_Con_Out_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sto_Sun_Sen_Pow_on_Ins_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Sun_Sen_Con_Out_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Sto_Sun_Sen_Pow_on_Ins_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Con_Out_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;
