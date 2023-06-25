library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity MSM19 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode

	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode load instruction

	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Current mode working time

	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angle storage instruction

	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angular velocity

	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angle

	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time load instruction

	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Next cycle mode

	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time storage instruction

	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angular velocity storage instruction

	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC--out_MSM_MR_Next cycle mode storage instruction

);

end MSM19;

architecture Behavioral of MSM19 is

component MSM is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSMC_MSM_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSMC_MSM_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSMC_MSM_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSMC_MSM_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;

	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;

	out_MSM_MSMC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MSMC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MSMC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MSMC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MSMC_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;

	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;

	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;

	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;

	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component MSMCC is

port(

	in_MSM_MSMC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MSMC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MSMC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MSMC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_MSM_MSMC_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_MSMC_MSM_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSMC_MSM_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSMC_MSM_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_MSMC_MSM_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_MSM_MSMC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSM_MSMC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSM_MSMC_Sun_visi_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSM_MSMC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSM_MSMC_Curr_mode_work_time:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_MSMC_MSM_Next_cycl_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSMC_MSM_Curr_mode_work_time:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSMC_MSM_Targ_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_MSMC_MSM_Targ_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

MSM_process:MSM port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,

in_SSD_SSD_Sun_visi_sign=> in_SSD_SSD_Sun_visi_sign,

in_MSM_MR_Curr_mode=> in_MSM_MR_Curr_mode,

in_MSM_MR_Curr_mode_work_time=> in_MSM_MR_Curr_mode_work_time,

in_MSMC_MSM_Next_cycl_mode=> m_MSMC_MSM_Next_cycl_mode,

in_MSMC_MSM_Curr_mode_work_time=> m_MSMC_MSM_Curr_mode_work_time,

in_MSMC_MSM_Targ_angl=> m_MSMC_MSM_Targ_angl,

in_MSMC_MSM_Targ_angu_velo=> m_MSMC_MSM_Targ_angu_velo,

out_MSM_MR_Curr_mode_load_inst=> out_MSM_MR_Curr_mode_load_inst,

out_MSM_MR_Curr_mode_work_time_load_inst=> out_MSM_MR_Curr_mode_work_time_load_inst,

out_MSM_MSMC_Tria_atti_angl=> m_MSM_MSMC_Tria_atti_angl,

out_MSM_MSMC_Tria_angu_velo=> m_MSM_MSMC_Tria_angu_velo,

out_MSM_MSMC_Sun_visi_sign=> m_MSM_MSMC_Sun_visi_sign,

out_MSM_MSMC_Curr_mode=> m_MSM_MSMC_Curr_mode,

out_MSM_MSMC_Curr_mode_work_time=> m_MSM_MSMC_Curr_mode_work_time,

out_MSM_MR_Next_cycl_mode_stor_inst=> out_MSM_MR_Next_cycl_mode_stor_inst,

out_MSM_MR_Next_cycl_mode=> out_MSM_MR_Next_cycl_mode,

out_MSM_MR_Curr_mode_work_time_stor_inst=> out_MSM_MR_Curr_mode_work_time_stor_inst,

out_MSM_MR_Curr_mode_work_time=> out_MSM_MR_Curr_mode_work_time,

out_MSM_MR_Targ_angl_stor_inst=> out_MSM_MR_Targ_angl_stor_inst,

out_MSM_MR_Targ_angl=> out_MSM_MR_Targ_angl,

out_MSM_MR_Targ_angu_velo_stor_inst=> out_MSM_MR_Targ_angu_velo_stor_inst,

out_MSM_MR_Targ_angu_velo=> out_MSM_MR_Targ_angu_velo,

out_calc_inst=> m_calc_inst

);

MSMCC_process:MSMCC port map(

in_MSM_MSMC_Tria_atti_angl=> m_MSM_MSMC_Tria_atti_angl,

in_MSM_MSMC_Tria_angu_velo=> m_MSM_MSMC_Tria_angu_velo,

in_MSM_MSMC_Sun_visi_sign=> m_MSM_MSMC_Sun_visi_sign,

in_MSM_MSMC_Curr_mode=> m_MSM_MSMC_Curr_mode,

in_MSM_MSMC_Curr_mode_work_time=> m_MSM_MSMC_Curr_mode_work_time,

in_calc_inst=> m_calc_inst,

out_MSMC_MSM_Next_cycl_mode=> m_MSMC_MSM_Next_cycl_mode,

out_MSMC_MSM_Curr_mode_work_time=> m_MSMC_MSM_Curr_mode_work_time,

out_MSMC_MSM_Targ_angl=> m_MSMC_MSM_Targ_angl,

out_MSMC_MSM_Targ_angu_velo=> m_MSMC_MSM_Targ_angu_velo

);

end Behavioral;

