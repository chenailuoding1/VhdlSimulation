library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TDC is
port(
    in_Thr_com_log_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_com_log_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_com_log:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TDC;
architecture Behavioral of TDC is
signal RAM_Thr_com_log: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Thr_com_log_sto_ins)
	begin
		if in_Thr_com_log_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Thr_com_log <= in_Thr_com_log;
		end if;
	end process;process(in_Thr_com_log_loa_ins)
	begin
		if in_Thr_com_log_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Thr_com_log <= RAM_Thr_com_log;
		end if;
	end process;
end Behavioral;
