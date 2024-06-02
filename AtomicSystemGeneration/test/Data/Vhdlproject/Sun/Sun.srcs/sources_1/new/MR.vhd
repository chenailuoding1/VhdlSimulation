library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity MR is
port(
    in_Nex_cyc_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim_loa_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Cur_mod_wor_tim:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel_sto_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tar_ang_vel:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tar_ang_vel:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Cur_mod_wor_tim:out STD_LOGIC_VECTOR ( 31 downto 0 )

);
end MR;
architecture Behavioral of MR is
signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Cur_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Cur_mod_wor_tim: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tar_ang: STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_Tar_ang_vel: STD_LOGIC_VECTOR ( 31 downto 0 );

begin
process(in_Nex_cyc_mod_sto_ins)
	begin
		if in_Nex_cyc_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Nex_cyc_mod <= in_Nex_cyc_mod;
		end if;
	end process;process(in_Cur_mod_sto_ins)
	begin
		if in_Cur_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Cur_mod <= in_Cur_mod;
		end if;
	end process;process(in_Nex_cyc_mod_sto_ins)
	begin
		if in_Nex_cyc_mod_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Nex_cyc_mod <= in_Nex_cyc_mod;
		end if;
	end process;process(in_Cur_mod_wor_tim_sto_ins)
	begin
		if in_Cur_mod_wor_tim_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Cur_mod_wor_tim <= in_Cur_mod_wor_tim;
		end if;
	end process;process(in_Tar_ang_sto_ins)
	begin
		if in_Tar_ang_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tar_ang <= in_Tar_ang;
		end if;
	end process;process(in_Tar_ang_vel_sto_ins)
	begin
		if in_Tar_ang_vel_sto_ins=std_logic_vector(to_unsigned(1, 32)) then
			RAM_Tar_ang_vel <= in_Tar_ang_vel;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Tar_ang_loa_ins)
	begin
		if in_Tar_ang_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tar_ang <= RAM_Tar_ang;
		end if;
	end process;process(in_Tar_ang_vel_loa_ins)
	begin
		if in_Tar_ang_vel_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Tar_ang_vel <= RAM_Tar_ang_vel;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Cur_mod_loa_ins)
	begin
		if in_Cur_mod_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod <= RAM_Cur_mod;
		end if;
	end process;process(in_Cur_mod_wor_tim_loa_ins)
	begin
		if in_Cur_mod_wor_tim_loa_ins=std_logic_vector(to_unsigned(1, 32)) then
			out_Cur_mod_wor_tim <= RAM_Cur_mod_wor_tim;
		end if;
	end process;
end Behavioral;
