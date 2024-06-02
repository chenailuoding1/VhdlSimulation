
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDA is
port(
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TDA;
architecture Behavioral of TDA is
signal RAM_Thr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Thr_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
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
                        if in_Thr_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_0;

out_Thr_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Thr_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Thr_pow_sta<=RAM_Thr_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Thr_pow_sta)
	begin
		RAM_Thr_pow_sta<=in_Thr_pow_sta;
	end process;

process(in_Thr_Dat_Acq_2_start)
	begin
		RAM_Thr_Dat_Acq_2_start<=in_Thr_Dat_Acq_2_start;
	end process;

end Behavioral;

