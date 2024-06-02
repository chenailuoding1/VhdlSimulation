library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Dat_Acq is
port(
    in_Dat_Acq_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dat_Acq_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Dat_Acq_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dat_Acq_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Dat_Acq;
architecture Behavioral of Dat_Acq is

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
                        if in_Dat_Acq_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Gyr_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_2=>
                        if in_Sun_Sen_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Thr_Dat_Acq_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_0;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Gyr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Sun_Sen_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Thr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_0=>
out_Gyr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Sun_Sen_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Dat_Acq_2_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;
