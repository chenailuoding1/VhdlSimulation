library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component AD18 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_GD_GD_Angu_velo_analSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_SSD_SSD_Sun_visi_signSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_AD_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_SSD_SSD_Sun_meas_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_AD_MR_Curr_mode_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

AD18_process:AD18 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_GD_GD_Angu_velo_anal=> t_in_GD_GD_Angu_velo_anal,

in_SSD_SSD_Sun_visi_sign=> t_in_SSD_SSD_Sun_visi_sign,

in_AD_MR_Curr_mode=> t_in_AD_MR_Curr_mode,

in_SSD_SSD_Sun_meas_angl=> t_in_SSD_SSD_Sun_meas_angl,

out_ADR_ADR_Tria_atti_angl=> t_out_ADR_ADR_Tria_atti_angl,

out_ADR_ADR_Tria_angu_velo=> t_out_ADR_ADR_Tria_angu_velo,

out_AD_MR_Curr_mode_load_inst=> t_out_AD_MR_Curr_mode_load_inst

);

end component;


