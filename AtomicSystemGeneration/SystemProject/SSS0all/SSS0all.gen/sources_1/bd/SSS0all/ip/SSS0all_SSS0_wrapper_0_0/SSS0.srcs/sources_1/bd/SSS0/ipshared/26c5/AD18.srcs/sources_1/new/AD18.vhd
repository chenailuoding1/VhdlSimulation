library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity AD18 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_MR_Current mode

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun measurement angle

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GD_GD_Angular velocity analog

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial angular velocity

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC;--out_AD_MR_Current mode load instruction

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_ADR_ADR_Triaxial attitude angle

);

end AD18;

architecture Behavioral of AD18 is

component AD is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADCC_AD_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADCC_AD_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC;

	out_AD_ADCC_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component ADCC is

port(

	in_AD_ADCC_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_ADCC_AD_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADCC_AD_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_AD_ADCC_Angu_velo_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Sun_visi_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Sun_meas_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_ADCC_AD_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_ADCC_AD_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

AD_process:AD port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GD_GD_Angu_velo_anal=> in_GD_GD_Angu_velo_anal,

in_SSD_SSD_Sun_visi_sign=> in_SSD_SSD_Sun_visi_sign,

in_SSD_SSD_Sun_meas_angl=> in_SSD_SSD_Sun_meas_angl,

in_AD_MR_Curr_mode=> in_AD_MR_Curr_mode,

in_ADCC_AD_Tria_atti_angl=> m_ADCC_AD_Tria_atti_angl,

in_ADCC_AD_Tria_angu_velo=> m_ADCC_AD_Tria_angu_velo,

out_AD_MR_Curr_mode_load_inst=> out_AD_MR_Curr_mode_load_inst,

out_AD_ADCC_Angu_velo_anal=> m_AD_ADCC_Angu_velo_anal,

out_AD_ADCC_Sun_visi_sign=> m_AD_ADCC_Sun_visi_sign,

out_AD_ADCC_Sun_meas_angl=> m_AD_ADCC_Sun_meas_angl,

out_AD_ADCC_Curr_mode=> m_AD_ADCC_Curr_mode,

out_ADR_ADR_Tria_atti_angl=> out_ADR_ADR_Tria_atti_angl,

out_ADR_ADR_Tria_angu_velo=> out_ADR_ADR_Tria_angu_velo,

out_calc_inst=> m_calc_inst

);

ADCC_process:ADCC port map(

in_AD_ADCC_Angu_velo_anal=> m_AD_ADCC_Angu_velo_anal,

in_AD_ADCC_Sun_visi_sign=> m_AD_ADCC_Sun_visi_sign,

in_AD_ADCC_Sun_meas_angl=> m_AD_ADCC_Sun_meas_angl,

in_AD_ADCC_Curr_mode=> m_AD_ADCC_Curr_mode,

in_calc_inst=> m_calc_inst,

out_ADCC_AD_Tria_atti_angl=> m_ADCC_AD_Tria_atti_angl,

out_ADCC_AD_Tria_angu_velo=> m_ADCC_AD_Tria_angu_velo

);

end Behavioral;

