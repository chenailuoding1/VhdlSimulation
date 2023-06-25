library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component TDC21 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_TD_TD_Thru_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_CCR_CCR_Tria_cont_quanSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_TDCR_TDCR_Thru_comb_logiSTD_LOGIC_VECTOR ( 31 downto 0 );
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
TDC21_process:TDC21 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_TD_TD_Thru_powe_stat=> t_in_TD_TD_Thru_powe_stat,
in_CCR_CCR_Tria_cont_quan=> t_in_CCR_CCR_Tria_cont_quan,
out_TDCR_TDCR_Thru_comb_logi=> t_out_TDCR_TDCR_Thru_comb_logi
);
end component;
