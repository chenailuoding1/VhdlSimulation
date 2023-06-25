library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TP22 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_TP_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TP_DMC_Tele_data_tran_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TP_MR_Curr_mode_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TP22_process:TP22 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_ADR_ADR_Tria_atti_angl=> t_in_ADR_ADR_Tria_atti_angl,

in_TP_MR_Curr_mode=> t_in_TP_MR_Curr_mode,

in_ADR_ADR_Tria_angu_velo=> t_in_ADR_ADR_Tria_angu_velo,

out_TP_DMC_Tele_data_tran_inst=> t_out_TP_DMC_Tele_data_tran_inst,

out_TP_MR_Curr_mode_load_inst=> t_out_TP_MR_Curr_mode_load_inst

);

end component;


