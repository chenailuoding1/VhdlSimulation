library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GD is
port(
    in_Ang_vel_ana_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GD;
architecture Behavioral of GD is
signal RAM_Ang_vel_ana: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Gyr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Ang_vel_ana_sto_ins)
	begin
		if in_Ang_vel_ana_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Ang_vel_ana <= in_Ang_vel_ana;
		end if;
	end process;process(in_Gyr_pow_sta_sto_ins)
	begin
		if in_Gyr_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Gyr_pow_sta <= in_Gyr_pow_sta;
		end if;
	end process;process(in_Ang_vel_ana_loa_ins)
	begin
		if in_Ang_vel_ana_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Ang_vel_ana <= RAM_Ang_vel_ana;
		end if;
	end process;
end Behavioral;
