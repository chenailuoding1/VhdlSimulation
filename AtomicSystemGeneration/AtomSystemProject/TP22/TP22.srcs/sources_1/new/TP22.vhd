library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TP22 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_MR_Current mode

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_DMC_Telemetry data transmission instruction

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC--out_TP_MR_Current mode load instruction

);

end TP22;

architecture Behavioral of TP22 is

component TP is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TPCC_TP_Tele_data:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC;

	out_TP_TPCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_TPCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_TPCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TPCC is

port(

	in_TP_TPCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_TPCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_TPCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TPCC_TP_Tele_data:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TP_TPCC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TP_TPCC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TP_TPCC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TPCC_TP_Tele_data:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TP_process:TP port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_TP_MR_Curr_mode=> in_TP_MR_Curr_mode,

in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,

in_TPCC_TP_Tele_data=> m_TPCC_TP_Tele_data,

out_TP_MR_Curr_mode_load_inst=> out_TP_MR_Curr_mode_load_inst,

out_TP_TPCC_Curr_mode=> m_TP_TPCC_Curr_mode,

out_TP_TPCC_Tria_atti_angl=> m_TP_TPCC_Tria_atti_angl,

out_TP_TPCC_Tria_angu_velo=> m_TP_TPCC_Tria_angu_velo,

out_TP_DMC_Tele_data_tran_inst=> out_TP_DMC_Tele_data_tran_inst,

out_calc_inst=> m_calc_inst

);

TPCC_process:TPCC port map(

in_TP_TPCC_Curr_mode=> m_TP_TPCC_Curr_mode,

in_TP_TPCC_Tria_atti_angl=> m_TP_TPCC_Tria_atti_angl,

in_TP_TPCC_Tria_angu_velo=> m_TP_TPCC_Tria_angu_velo,

in_calc_inst=> m_calc_inst,

out_TPCC_TP_Tele_data=> m_TPCC_TP_Tele_data

);

end Behavioral;

