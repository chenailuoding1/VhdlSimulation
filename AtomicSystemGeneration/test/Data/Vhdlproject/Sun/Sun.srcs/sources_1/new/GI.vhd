library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GI is
port(
    in_Gyr_pow_on_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_on_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_on_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GI;
architecture Behavioral of GI is
signal RAM_Gyr_pow_on_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Gyr_pow_on_ins_sto_ins)
	begin
		if in_Gyr_pow_on_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Gyr_pow_on_ins <= in_Gyr_pow_on_ins;
		end if;
	end process;process(in_Gyr_pow_on_ins_loa_ins)
	begin
		if in_Gyr_pow_on_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Gyr_pow_on_ins <= RAM_Gyr_pow_on_ins;
		end if;
	end process;
end Behavioral;
