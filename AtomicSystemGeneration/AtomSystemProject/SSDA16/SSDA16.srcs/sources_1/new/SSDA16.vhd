library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity SSDA16 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun sensor power state

	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Angle analog

	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun visible sign

	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;--out_SSDA_SS_Sun sensor power state perception instruction

	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun measurement angle

	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun visible sign

	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun sensor power state

	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Angle analog acquisition instruction

	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC--out_SSDA_SS_Sun visible sign acquisition instruction

);

end SSDA16;

architecture Behavioral of SSDA16 is

component SSDA is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSDA_SSDA_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;

	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;

	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;

	out_SSDA_SSDA_Angl_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component SSDACC is

port(

	in_SSDA_SSDA_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_SSDA_SSDA_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_SSDA_SSDA_Angl_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_SSDA_SSDA_Sun_meas_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

SSDA_process:SSDA port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_SSDA_SS_Sun_visi_sign=> in_SSDA_SS_Sun_visi_sign,

in_SSDA_SS_Angl_anal=> in_SSDA_SS_Angl_anal,

in_SSDA_SS_Sun_sens_powe_stat=> in_SSDA_SS_Sun_sens_powe_stat,

in_SSDA_SSDA_Sun_meas_angl=> m_SSDA_SSDA_Sun_meas_angl,

out_SSDA_SS_Sun_visi_sign_acqu_inst=> out_SSDA_SS_Sun_visi_sign_acqu_inst,

out_SSDA_SS_Angl_anal_acqu_inst=> out_SSDA_SS_Angl_anal_acqu_inst,

out_SSDA_SS_Sun_sens_powe_stat_perc_inst=> out_SSDA_SS_Sun_sens_powe_stat_perc_inst,

out_SSDA_SSDA_Angl_anal=> m_SSDA_SSDA_Angl_anal,

out_SSD_SSD_Sun_visi_sign=> out_SSD_SSD_Sun_visi_sign,

out_SSD_SSD_Sun_meas_angl=> out_SSD_SSD_Sun_meas_angl,

out_SSD_SSD_Sun_sens_powe_stat=> out_SSD_SSD_Sun_sens_powe_stat,

out_calc_inst=> m_calc_inst

);

SSDACC_process:SSDACC port map(

in_SSDA_SSDA_Angl_anal=> m_SSDA_SSDA_Angl_anal,

in_calc_inst=> m_calc_inst,

out_SSDA_SSDA_Sun_meas_angl=> m_SSDA_SSDA_Sun_meas_angl

);

end Behavioral;

