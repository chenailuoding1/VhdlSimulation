library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Ini is
port(
    in_Ini_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_32m_Int_Tim_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ini_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_32m_Int_Tim_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Ini;
architecture Behavioral of Ini is

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
                        if in_Ini_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_32m_Int_Tim_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Gyr_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Sun_Sen_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_4;
                        end if; 
when sta_4=>
                        if in_Thr_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_5;
                        end if; 
when sta_5=>
                        if in_Mod_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_32m_Int_Tim_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Gyr_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Sun_Sen_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_4=>
out_Thr_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_5=>
out_Mod_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_32m_Int_Tim_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Gyr_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Mod_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;
