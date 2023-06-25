library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component SSDA16 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;
	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;
	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;
	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_SSDA_SS_Angl_analSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_SSDA_SS_Sun_visi_signSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_SSDA_SS_Sun_sens_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_SSDA_SS_Angl_anal_acqu_instSTD_LOGIC;
signal t_out_SSDA_SS_Sun_visi_sign_acqu_instSTD_LOGIC;
signal t_out_SSDA_SS_Sun_sens_powe_stat_perc_instSTD_LOGIC;
signal t_out_SSD_SSD_Sun_visi_signSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_SSD_SSD_Sun_meas_anglSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_SSD_SSD_Sun_sens_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
SSDA16_process:SSDA16 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_SSDA_SS_Angl_anal=> t_in_SSDA_SS_Angl_anal,
in_SSDA_SS_Sun_visi_sign=> t_in_SSDA_SS_Sun_visi_sign,
in_SSDA_SS_Sun_sens_powe_stat=> t_in_SSDA_SS_Sun_sens_powe_stat,
out_SSDA_SS_Angl_anal_acqu_inst=> t_out_SSDA_SS_Angl_anal_acqu_inst,
out_SSDA_SS_Sun_visi_sign_acqu_inst=> t_out_SSDA_SS_Sun_visi_sign_acqu_inst,
out_SSDA_SS_Sun_sens_powe_stat_perc_inst=> t_out_SSDA_SS_Sun_sens_powe_stat_perc_inst,
out_SSD_SSD_Sun_visi_sign=> t_out_SSD_SSD_Sun_visi_sign,
out_SSD_SSD_Sun_meas_angl=> t_out_SSD_SSD_Sun_meas_angl,
out_SSD_SSD_Sun_sens_powe_stat=> t_out_SSD_SSD_Sun_sens_powe_stat
);
end component;
