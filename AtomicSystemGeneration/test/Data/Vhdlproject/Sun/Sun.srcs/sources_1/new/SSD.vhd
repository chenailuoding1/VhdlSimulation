library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSD is
port(
    in_Sun_vis_sig_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_vis_sig_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSD;
architecture Behavioral of SSD is
signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Sun_mea_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Sun_sen_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Sun_vis_sig_sto_ins)
	begin
		if in_Sun_vis_sig_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_vis_sig <= in_Sun_vis_sig;
		end if;
	end process;process(in_Sun_mea_ang_sto_ins)
	begin
		if in_Sun_mea_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_mea_ang <= in_Sun_mea_ang;
		end if;
	end process;process(in_Sun_sen_pow_sta_sto_ins)
	begin
		if in_Sun_sen_pow_sta_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Sun_sen_pow_sta <= in_Sun_sen_pow_sta;
		end if;
	end process;process(in_Sun_vis_sig_loa_ins)
	begin
		if in_Sun_vis_sig_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_vis_sig <= RAM_Sun_vis_sig;
		end if;
	end process;process(in_Sun_mea_ang_loa_ins)
	begin
		if in_Sun_mea_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_mea_ang <= RAM_Sun_mea_ang;
		end if;
	end process;process(in_Sun_vis_sig_loa_ins)
	begin
		if in_Sun_vis_sig_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Sun_vis_sig <= RAM_Sun_vis_sig;
		end if;
	end process;
end Behavioral;
