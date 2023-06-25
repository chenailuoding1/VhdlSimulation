library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component GDA15 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;
	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_GDA_G_Puls_counSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_GDA_G_Gyro_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_GD_GD_Gyro_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_GD_GD_Angu_velo_analSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_GDA_G_Puls_coun_acqu_instSTD_LOGIC;
signal t_out_GDA_G_Gyro_powe_stat_perc_instSTD_LOGIC;
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
GDA15_process:GDA15 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_GDA_G_Puls_coun=> t_in_GDA_G_Puls_coun,
in_GDA_G_Gyro_powe_stat=> t_in_GDA_G_Gyro_powe_stat,
out_GD_GD_Gyro_powe_stat=> t_out_GD_GD_Gyro_powe_stat,
out_GD_GD_Angu_velo_anal=> t_out_GD_GD_Angu_velo_anal,
out_GDA_G_Puls_coun_acqu_inst=> t_out_GDA_G_Puls_coun_acqu_inst,
out_GDA_G_Gyro_powe_stat_perc_inst=> t_out_GDA_G_Gyro_powe_stat_perc_inst
);
end component;
