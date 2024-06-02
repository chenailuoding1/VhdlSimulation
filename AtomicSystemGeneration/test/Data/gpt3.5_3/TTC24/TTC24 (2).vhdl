library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TTC24 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDCR_TDCR_Thruster combination logic
	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTI_TTI_Triaxial control instruction
);
end TTC24;
architecture Behavioral of TTC24 is
component TTC is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TTCC_TTC_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TTC_TTCC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component TTCCC is
port(
	in_TTC_TTCC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_TTCC_TTC_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_TTC_TTCC_Thru_comb_logi:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_TTCC_TTC_Tria_cont_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
TTC_process:TTC port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_TDCR_TDCR_Thru_comb_logi=> in_TDCR_TDCR_Thru_comb_logi,
in_TTCC_TTC_Tria_cont_inst=> m_TTCC_TTC_Tria_cont_inst,
out_TTC_TTCC_Thru_comb_logi=> m_TTC_TTCC_Thru_comb_logi,
out_TTI_TTI_Tria_cont_inst=> out_TTI_TTI_Tria_cont_inst,
out_calc_inst=> m_calc_inst
);
TTCCC_process:TTCCC port map(
in_TTC_TTCC_Thru_comb_logi=> m_TTC_TTCC_Thru_comb_logi,
in_calc_inst=> m_calc_inst,
out_TTCC_TTC_Tria_cont_inst=> m_TTCC_TTC_Tria_cont_inst
);
end Behavioral;