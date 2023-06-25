library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TCC20 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angular velocity

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angle

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_CCR_CCR_Triaxial control quantity

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC;--out_TCC_MR_Target angular velocity load instruction

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC--out_TCC_MR_Target angle load instruction

);

end TCC20;

architecture Behavioral of TCC20 is

component TCC is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_CCC_TCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC;

	out_TCC_CCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component CCC is

port(

	in_TCC_CCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_CCC_TCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TCC_CCC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Targ_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Targ_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_CCC_TCC_Tria_cont_quan:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TCC_process:TCC port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,

in_TCC_MR_Targ_angl=> in_TCC_MR_Targ_angl,

in_TCC_MR_Targ_angu_velo=> in_TCC_MR_Targ_angu_velo,

in_CCC_TCC_Tria_cont_quan=> m_CCC_TCC_Tria_cont_quan,

out_TCC_MR_Targ_angl_load_inst=> out_TCC_MR_Targ_angl_load_inst,

out_TCC_MR_Targ_angu_velo_load_inst=> out_TCC_MR_Targ_angu_velo_load_inst,

out_TCC_CCC_Tria_atti_angl=> m_TCC_CCC_Tria_atti_angl,

out_TCC_CCC_Tria_angu_velo=> m_TCC_CCC_Tria_angu_velo,

out_TCC_CCC_Targ_angl=> m_TCC_CCC_Targ_angl,

out_TCC_CCC_Targ_angu_velo=> m_TCC_CCC_Targ_angu_velo,

out_CCR_CCR_Tria_cont_quan=> out_CCR_CCR_Tria_cont_quan,

out_calc_inst=> m_calc_inst

);

CCC_process:CCC port map(

in_TCC_CCC_Tria_atti_angl=> m_TCC_CCC_Tria_atti_angl,

in_TCC_CCC_Tria_angu_velo=> m_TCC_CCC_Tria_angu_velo,

in_TCC_CCC_Targ_angl=> m_TCC_CCC_Targ_angl,

in_TCC_CCC_Targ_angu_velo=> m_TCC_CCC_Targ_angu_velo,

in_calc_inst=> m_calc_inst,

out_CCC_TCC_Tria_cont_quan=> m_CCC_TCC_Tria_cont_quan

);

end Behavioral;

