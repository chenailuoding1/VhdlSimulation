library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity GDA15 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Pulse count

	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Gyro power state

	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;--out_GDA_G_Gyro power state perception instruction

	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;--out_GDA_G_Pulse count acquisition instruction

	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Angular velocity analog

	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GD_GD_Gyro power state

);

end GDA15;

architecture Behavioral of GDA15 is

component GDA is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GDAC_GDA_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;

	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;

	out_GDA_GDAC_Puls_coun:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component GDACC is

port(

	in_GDA_GDAC_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_GDAC_GDA_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_GDA_GDAC_Puls_coun:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_GDAC_GDA_Angu_velo_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

GDA_process:GDA port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GDA_G_Puls_coun=> in_GDA_G_Puls_coun,

in_GDA_G_Gyro_powe_stat=> in_GDA_G_Gyro_powe_stat,

in_GDAC_GDA_Angu_velo_anal=> m_GDAC_GDA_Angu_velo_anal,

out_GDA_G_Puls_coun_acqu_inst=> out_GDA_G_Puls_coun_acqu_inst,

out_GDA_G_Gyro_powe_stat_perc_inst=> out_GDA_G_Gyro_powe_stat_perc_inst,

out_GDA_GDAC_Puls_coun=> m_GDA_GDAC_Puls_coun,

out_GD_GD_Angu_velo_anal=> out_GD_GD_Angu_velo_anal,

out_GD_GD_Gyro_powe_stat=> out_GD_GD_Gyro_powe_stat,

out_calc_inst=> m_calc_inst

);

GDACC_process:GDACC port map(

in_GDA_GDAC_Puls_coun=> m_GDA_GDAC_Puls_coun,

in_calc_inst=> m_calc_inst,

out_GDAC_GDA_Angu_velo_anal=> m_GDAC_GDA_Angu_velo_anal

);

end Behavioral;

