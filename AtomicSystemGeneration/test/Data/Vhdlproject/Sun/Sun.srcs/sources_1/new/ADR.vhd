library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity ADR is
port(
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_att_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tri_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_att_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tri_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end ADR;
architecture Behavioral of ADR is
signal RAM_Tri_att_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tri_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Tri_att_ang_sto_ins)
	begin
		if in_Tri_att_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_att_ang <= in_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_sto_ins)
	begin
		if in_Tri_ang_vel_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tri_ang_vel <= in_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;process(in_Tri_att_ang_loa_ins)
	begin
		if in_Tri_att_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_att_ang <= RAM_Tri_att_ang;
		end if;
	end process;process(in_Tri_ang_vel_loa_ins)
	begin
		if in_Tri_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tri_ang_vel <= RAM_Tri_ang_vel;
		end if;
	end process;
end Behavioral;
