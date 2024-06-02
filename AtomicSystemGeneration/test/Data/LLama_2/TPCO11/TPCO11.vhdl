library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TPCO11 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_TPCO_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TPI_Thruster power on instruction
	out_TPCO_TPI_Thru_powe_on_inst_load_inst:out STD_LOGIC;--out_TPCO_TPI_Thruster power on instruction load instruction
	out_TPCO_TCT_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCO_TCT_Thruster power on pulse
);
end TPCO11;
architecture Behavioral of TPCO11 is
component TPCO is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TPCO_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TPCO_TPCO_Thru_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TPCO_TPI_Thru_powe_on_inst_load_inst:out STD_LOGIC;
	out_TPCO_TPCO_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TPCO_TCT_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component TPCOCC is
port(
	in_TPCO_TPCO_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_TPCO_TPCO_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_TPCO_TPCO_Thru_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_TPCO_TPCO_Thru_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
TPCO_process:TPCO port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_TPCO_TPI_Thru_powe_on_inst=> in_TPCO_TPI_Thru_powe_on_inst,
in_TPCO_TPCO_Thru_powe_on_puls=> m_TPCO_TPCO_Thru_powe_on_puls,
out_TPCO_TPI_Thru_powe_on_inst_load_inst=> out_TPCO_TPI_Thru_powe_on_inst_load_inst,
out_TPCO_TPCO_Thru_powe_on_inst=> m_TPCO_TPCO_Thru_powe_on_inst,
out_TPCO_TCT_Thru_powe_on_puls=> out_TPCO_TCT_Thru_powe_on_puls,
out_calc_inst=> m_calc_inst
);
TPCOCC_process:TPCOCC port map(
in_TPCO_TPCO_Thru_powe_on_inst=> m_TPCO_TPCO_Thru_powe_on_inst,
in_calc_inst=> m_calc_inst,
out_TPCO_TPCO_Thru_powe_on_puls=> m_TPCO_TPCO_Thru_powe_on_puls
);
end Behavioral;