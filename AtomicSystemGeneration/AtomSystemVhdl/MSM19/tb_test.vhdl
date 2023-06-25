library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component MSM19 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;
	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;
	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;
	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;
	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;
	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_MSM_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_SSD_SSD_Sun_visi_signSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_MSM_MR_Curr_mode_work_timeSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_MSM_MR_Targ_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_MSM_MR_Curr_mode_work_time_stor_instSTD_LOGIC;
signal t_out_MSM_MR_Targ_angl_stor_instSTD_LOGIC;
signal t_out_MSM_MR_Curr_mode_work_time_load_instSTD_LOGIC;
signal t_out_MSM_MR_Next_cycl_modeSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_MSM_MR_Next_cycl_mode_stor_instSTD_LOGIC;
signal t_out_MSM_MR_Curr_mode_load_instSTD_LOGIC;
signal t_out_MSM_MR_Targ_anglSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_MSM_MR_Curr_mode_work_timeSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_MSM_MR_Targ_angu_velo_stor_instSTD_LOGIC;
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
MSM19_process:MSM19 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_ADR_ADR_Tria_atti_angl=> t_in_ADR_ADR_Tria_atti_angl,
in_MSM_MR_Curr_mode=> t_in_MSM_MR_Curr_mode,
in_SSD_SSD_Sun_visi_sign=> t_in_SSD_SSD_Sun_visi_sign,
in_ADR_ADR_Tria_angu_velo=> t_in_ADR_ADR_Tria_angu_velo,
in_MSM_MR_Curr_mode_work_time=> t_in_MSM_MR_Curr_mode_work_time,
out_MSM_MR_Targ_angu_velo=> t_out_MSM_MR_Targ_angu_velo,
out_MSM_MR_Curr_mode_work_time_stor_inst=> t_out_MSM_MR_Curr_mode_work_time_stor_inst,
out_MSM_MR_Targ_angl_stor_inst=> t_out_MSM_MR_Targ_angl_stor_inst,
out_MSM_MR_Curr_mode_work_time_load_inst=> t_out_MSM_MR_Curr_mode_work_time_load_inst,
out_MSM_MR_Next_cycl_mode=> t_out_MSM_MR_Next_cycl_mode,
out_MSM_MR_Next_cycl_mode_stor_inst=> t_out_MSM_MR_Next_cycl_mode_stor_inst,
out_MSM_MR_Curr_mode_load_inst=> t_out_MSM_MR_Curr_mode_load_inst,
out_MSM_MR_Targ_angl=> t_out_MSM_MR_Targ_angl,
out_MSM_MR_Curr_mode_work_time=> t_out_MSM_MR_Curr_mode_work_time,
out_MSM_MR_Targ_angu_velo_stor_inst=> t_out_MSM_MR_Targ_angu_velo_stor_inst
);
end component;
