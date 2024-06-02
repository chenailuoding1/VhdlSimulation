library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TD is
port(
    in_Thr_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_pow_sta_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TD;
architecture Behavioral of TD is
signal RAM_Thr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Thr_pow_sta_sto_ins)
	begin
		if in_Thr_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Thr_pow_sta <= in_Thr_pow_sta;
		end if;
	end process;process(in_Thr_pow_sta_loa_ins)
	begin
		if in_Thr_pow_sta_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Thr_pow_sta <= RAM_Thr_pow_sta;
		end if;
	end process;
end Behavioral;
