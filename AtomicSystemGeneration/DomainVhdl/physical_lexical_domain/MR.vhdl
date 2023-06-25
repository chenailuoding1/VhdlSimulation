library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity MR is
port(
	in_TP_MR_Curr_mode_load_inst:in STD_LOGIC;--in_TP_MR_Current mode load instruction
	in_MI_MR_Curr_mode_stor_inst:in STD_LOGIC;--in_MI_MR_Current mode storage instruction
	in_MI_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MI_MR_Current mode
	in_AD_MR_Curr_mode_load_inst:in STD_LOGIC;--in_AD_MR_Current mode load instruction
	in_TCC_MR_Targ_angl_load_inst:in STD_LOGIC;--in_TCC_MR_Target angle load instruction
	in_TCC_MR_Targ_angu_velo_load_inst:in STD_LOGIC;--in_TCC_MR_Target angular velocity load instruction
	in_MSM_MR_Curr_mode_load_inst:in STD_LOGIC;--in_MSM_MR_Current mode load instruction
	in_MSM_MR_Curr_mode_work_time_load_inst:in STD_LOGIC;--in_MSM_MR_Current mode working time load instruction
	in_MSM_MR_Next_cycl_mode_stor_inst:in STD_LOGIC;--in_MSM_MR_Next cycle mode storage instruction
	in_MSM_MR_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Next cycle mode
	in_MSM_MR_Curr_mode_work_time_stor_inst:in STD_LOGIC;--in_MSM_MR_Current mode working time storage instruction
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time
	in_MSM_MR_Targ_angl_stor_inst:in STD_LOGIC;--in_MSM_MR_Target angle storage instruction
	in_MSM_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Target angle
	in_MSM_MR_Targ_angu_velo_stor_inst:in STD_LOGIC;--in_MSM_MR_Target angular velocity storage instruction
	in_MSM_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Target angular velocity
	in_TIP_MR_Next_cycl_mode_stor_inst:in STD_LOGIC;--in_TIP_MR_Next cycle mode storage instruction
	in_TIP_MR_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TIP_MR_Next cycle mode
	out_TP_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_MR_Current mode
	out_AD_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_MR_Current mode
	out_TCC_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_MR_Target angle
	out_TCC_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_MR_Target angular velocity
	out_MSM_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Current mode
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_MSM_MR_Current mode working time
);
end MR;
architecture Behavioral of MR is
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Current_mode: ram_type0;
signal Current_mode_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Next_cycl_mode: ram_type1;
signal Next_cycl_mode_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Current_mode_work_time: ram_type2;
signal Current_mode_work_time_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Target_angl: ram_type3;
signal Target_angl_addr: integer:=1;
type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Target_angu_velo: ram_type4;
signal Target_angu_velo_addr: integer:=1;
type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Next_cycl_mode: ram_type5;
signal Next_cycl_mode_addr: integer:=1;
signal Next_cycl_mode_stor_inst:STD_LOGIC_VECTOR (1 downto 0 );
begin
	process(in_MI_MR_Curr_mode_stor_inst)
	begin
		if in_MI_MR_Curr_mode_stor_inst='1' then
			RAM_MR_Current_mode(Current_mode_addr)<=in_MI_MR_Curr_mode;
		end if;
	end process;
	process(in_MSM_MR_Next_cycl_mode_stor_inst,in_TIP_MR_Next_cycl_mode_stor_inst)
	begin
		Next_cycl_mode_stor_inst <= in_MSM_MR_Next_cycl_mode_stor_inst&in_TIP_MR_Next_cycl_mode_stor_inst;
		case Next_cycl_mode_stor_inst is
			when "00"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
			when "01"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_MSM_MR_Next_cycl_mode;
			when "10"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
			when "11"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
		end case;
	end process;
	process(in_MSM_MR_Curr_mode_work_time_stor_inst)
	begin
		if in_MSM_MR_Curr_mode_work_time_stor_inst='1' then
			RAM_MR_Current_mode_work_time(Current_mode_work_time_addr)<=in_MSM_MR_Curr_mode_work_time;
		end if;
	end process;
	process(in_MSM_MR_Targ_angl_stor_inst)
	begin
		if in_MSM_MR_Targ_angl_stor_inst='1' then
			RAM_MR_Target_angl(Target_angl_addr)<=in_MSM_MR_Targ_angl;
		end if;
	end process;
	process(in_MSM_MR_Targ_angu_velo_stor_inst)
	begin
		if in_MSM_MR_Targ_angu_velo_stor_inst='1' then
			RAM_MR_Target_angu_velo(Target_angu_velo_addr)<=in_MSM_MR_Targ_angu_velo;
		end if;
	end process;
	process(in_TP_MR_Curr_mode_load_inst)
	begin
		if in_TP_MR_Curr_mode_load_inst='1' then
			out_TP_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_AD_MR_Curr_mode_load_inst)
	begin
		if in_AD_MR_Curr_mode_load_inst='1' then
			out_AD_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_TCC_MR_Targ_angl_load_inst)
	begin
		if in_TCC_MR_Targ_angl_load_inst='1' then
			out_TCC_MR_Targ_angl<=RAM_MR_Target_angl(Target_angl_addr);
		end if;
	end process;
	process(in_TCC_MR_Targ_angu_velo_load_inst)
	begin
		if in_TCC_MR_Targ_angu_velo_load_inst='1' then
			out_TCC_MR_Targ_angu_velo<=RAM_MR_Target_angu_velo(Target_angu_velo_addr);
		end if;
	end process;
	process(in_MSM_MR_Curr_mode_load_inst)
	begin
		if in_MSM_MR_Curr_mode_load_inst='1' then
			out_MSM_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_MSM_MR_Curr_mode_work_time_load_inst)
	begin
		if in_MSM_MR_Curr_mode_work_time_load_inst='1' then
			out_MSM_MR_Curr_mode_work_time<=RAM_MR_Current_mode_work_time(Current_mode_work_time_addr);
		end if;
	end process;




end Behavioral;
