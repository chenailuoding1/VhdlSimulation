library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TTI is
port(
    in_Tri_con_ins_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_con_ins_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_con_ins:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TTI;
architecture Behavioral of TTI is
signal RAM_Tri_con_ins: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Tri_con_ins_sto_ins)
	begin
		if in_Tri_con_ins_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_con_ins <= in_Tri_con_ins;
		end if;
	end process;process(in_Tri_con_ins_loa_ins)
	begin
		if in_Tri_con_ins_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_con_ins <= RAM_Tri_con_ins;
		end if;
	end process;
end Behavioral;
