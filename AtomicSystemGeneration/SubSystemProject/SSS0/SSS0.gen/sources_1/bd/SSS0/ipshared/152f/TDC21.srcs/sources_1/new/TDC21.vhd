library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TDC21 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_CCR_CCR_Triaxial control quantity

	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TD_TD_Thruster power state

	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TDCR_TDCR_Thruster combination logic

);

end TDC21;

architecture Behavioral of TDC21 is

component TDC is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TDCC_TDC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TDC_TDCC_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TDC_TDCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TDCC is

port(

	in_TDC_TDCC_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TDC_TDCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TDCC_TDC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TDC_TDCC_Thru_powe_stat:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TDC_TDCC_Tria_cont_quan:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TDCC_TDC_Thru_comb_logi:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TDC_process:TDC port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_TD_TD_Thru_powe_stat=> in_TD_TD_Thru_powe_stat,

in_CCR_CCR_Tria_cont_quan=> in_CCR_CCR_Tria_cont_quan,

in_TDCC_TDC_Thru_comb_logi=> m_TDCC_TDC_Thru_comb_logi,

out_TDC_TDCC_Thru_powe_stat=> m_TDC_TDCC_Thru_powe_stat,

out_TDC_TDCC_Tria_cont_quan=> m_TDC_TDCC_Tria_cont_quan,

out_TDCR_TDCR_Thru_comb_logi=> out_TDCR_TDCR_Thru_comb_logi,

out_calc_inst=> m_calc_inst

);

TDCC_process:TDCC port map(

in_TDC_TDCC_Thru_powe_stat=> m_TDC_TDCC_Thru_powe_stat,

in_TDC_TDCC_Tria_cont_quan=> m_TDC_TDCC_Tria_cont_quan,

in_calc_inst=> m_calc_inst,

out_TDCC_TDC_Thru_comb_logi=> m_TDCC_TDC_Thru_comb_logi

);

end Behavioral;

