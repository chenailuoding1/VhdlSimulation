library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component GCO5 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_GCO_GI_Gyro_powe_on_instSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_GCO_G_Gyro_powe_on_pulsSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_GCO_GI_Gyro_powe_on_inst_load_instSTD_LOGIC;
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
GCO5_process:GCO5 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_GCO_GI_Gyro_powe_on_inst=> t_in_GCO_GI_Gyro_powe_on_inst,
out_GCO_G_Gyro_powe_on_puls=> t_out_GCO_G_Gyro_powe_on_puls,
out_GCO_GI_Gyro_powe_on_inst_load_inst=> t_out_GCO_GI_Gyro_powe_on_inst_load_inst
);
end component;
