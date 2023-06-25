library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TIP13 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_DMC_TIP_Tele_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TIP_MR_Next_cycl_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TIP_MR_Next_cycl_mode_stor_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TIP13_process:TIP13 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_DMC_TIP_Tele_inst=> t_in_DMC_TIP_Tele_inst,

out_TIP_MR_Next_cycl_mode=> t_out_TIP_MR_Next_cycl_mode,

out_TIP_MR_Next_cycl_mode_stor_inst=> t_out_TIP_MR_Next_cycl_mode_stor_inst

);

end component;


