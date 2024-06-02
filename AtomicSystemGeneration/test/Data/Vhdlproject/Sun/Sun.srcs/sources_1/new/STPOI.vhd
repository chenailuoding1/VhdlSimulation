
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity STPOI is
port(
    in_Sto_Thr_Pow_on_Ins_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sto_Thr_Pow_on_Ins_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end STPOI;
architecture Behavioral of STPOI is
signal RAM_Sto_Thr_Pow_on_Ins_start: STD_LOGIC_VECTOR ( 31 downto 0 );
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
                        if in_Sto_Thr_Pow_on_Ins_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_0;

out_Sto_Thr_Pow_on_Ins_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Thr_pow_on_ins_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Thr_pow_on_ins<=RAM_Thr_pow_on_ins ;

when sta_0=>

        end case;
	end process;
process(in_Sto_Thr_Pow_on_Ins_start)
	begin
		RAM_Sto_Thr_Pow_on_Ins_start<=in_Sto_Thr_Pow_on_Ins_start;
	end process;

end Behavioral;

