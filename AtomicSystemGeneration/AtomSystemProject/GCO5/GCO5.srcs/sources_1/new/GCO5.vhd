library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity GCO5 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GI_Gyro power on instruction

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_G_Gyro power on pulse

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC--out_GCO_GI_Gyro power on instruction load instruction

);

end GCO5;

architecture Behavioral of GCO5 is

component GCO is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GCOC_GCO_Gyro_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC;

	out_GCO_GCOC_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component GCOCC is

port(

	in_GCO_GCOC_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_GCOC_GCO_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_GCO_GCOC_Gyro_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_GCOC_GCO_Gyro_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

GCO_process:GCO port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GCO_GI_Gyro_powe_on_inst=> in_GCO_GI_Gyro_powe_on_inst,

in_GCOC_GCO_Gyro_powe_on_puls=> m_GCOC_GCO_Gyro_powe_on_puls,

out_GCO_GI_Gyro_powe_on_inst_load_inst=> out_GCO_GI_Gyro_powe_on_inst_load_inst,

out_GCO_GCOC_Gyro_powe_on_inst=> m_GCO_GCOC_Gyro_powe_on_inst,

out_GCO_G_Gyro_powe_on_puls=> out_GCO_G_Gyro_powe_on_puls,

out_calc_inst=> m_calc_inst

);

GCOCC_process:GCOCC port map(

in_GCO_GCOC_Gyro_powe_on_inst=> m_GCO_GCOC_Gyro_powe_on_inst,

in_calc_inst=> m_calc_inst,

out_GCOC_GCO_Gyro_powe_on_puls=> m_GCOC_GCO_Gyro_powe_on_puls

);

end Behavioral;

