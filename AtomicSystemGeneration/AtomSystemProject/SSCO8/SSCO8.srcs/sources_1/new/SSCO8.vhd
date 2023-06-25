library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity SSCO8 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SSI_Sun sensor power on instruction

	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSCO_SS_Sun sensor power on pulse

	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC--out_SSCO_SSI_Sun sensor power on instruction load instruction

);

end SSCO8;

architecture Behavioral of SSCO8 is

component SSCO is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSCO_SSCO_Sun_sens_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC;

	out_SSCO_SSCO_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component SSCOCC is

port(

	in_SSCO_SSCO_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_SSCO_SSCO_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_SSCO_SSCO_Sun_sens_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_SSCO_SSCO_Sun_sens_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

SSCO_process:SSCO port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_SSCO_SSI_Sun_sens_powe_on_inst=> in_SSCO_SSI_Sun_sens_powe_on_inst,

in_SSCO_SSCO_Sun_sens_powe_on_puls=> m_SSCO_SSCO_Sun_sens_powe_on_puls,

out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst=> out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst,

out_SSCO_SSCO_Sun_sens_powe_on_inst=> m_SSCO_SSCO_Sun_sens_powe_on_inst,

out_SSCO_SS_Sun_sens_powe_on_puls=> out_SSCO_SS_Sun_sens_powe_on_puls,

out_calc_inst=> m_calc_inst

);

SSCOCC_process:SSCOCC port map(

in_SSCO_SSCO_Sun_sens_powe_on_inst=> m_SSCO_SSCO_Sun_sens_powe_on_inst,

in_calc_inst=> m_calc_inst,

out_SSCO_SSCO_Sun_sens_powe_on_puls=> m_SSCO_SSCO_Sun_sens_powe_on_puls

);

end Behavioral;

