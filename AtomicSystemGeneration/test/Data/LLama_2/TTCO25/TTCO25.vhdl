library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TTCO25 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTI_TTI_Triaxial control instruction
	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCO_TCT_Triaxial control signal
);
end TTCO25;
architecture Behavioral of TTCO25 is
component TTCO is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TTCO_TTCO_Tria_cont_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TTCO_TTCO_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component TTCOCC is
port(
	in_TTCO_TTCO_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_TTCO_TTCO_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_TTCO_TTCO_Tria_cont_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_TTCO_TTCO_Tria_cont_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
TTCO_process:TTCO port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_TTI_TTI_Tria_cont_inst=> in_TTI_TTI_Tria_cont_inst,
in_TTCO_TTCO_Tria_cont_sign=> m_TTCO_TTCO_Tria_cont_sign,
out_TTCO_TTCO_Tria_cont_inst=> m_TTCO_TTCO_Tria_cont_inst,
out_TTCO_TCT_Tria_cont_sign=> out_TTCO_TCT_Tria_cont_sign,
out_calc_inst=> m_calc_inst
);
TTCOCC_process:TTCOCC port map(
in_TTCO_TTCO_Tria_cont_inst=> m_TTCO_TTCO_Tria_cont_inst,
in_calc_inst=> m_calc_inst,
out_TTCO_TTCO_Tria_cont_sign=> m_TTCO_TTCO_Tria_cont_sign
);
end Behavioral;