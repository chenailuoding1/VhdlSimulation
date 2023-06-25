library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;



entity tb_test is

--  Port ( );

end tb_test;



architecture Behavioral of tb_test is
component TCC20 is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;
	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC;
	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
signal t_clk:std_logic;
signal t_start: std_logic;
signal t_done: std_logic;
signal t_rst: std_logic;
signal t_in_TCC_MR_Targ_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_TCC_MR_Targ_anglSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_in_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );
signal t_out_TCC_MR_Targ_angl_load_instSTD_LOGIC;
signal t_out_TCC_MR_Targ_angu_velo_load_instSTD_LOGIC;
signal t_out_CCR_CCR_Tria_cont_quanSTD_LOGIC_VECTOR ( 31 downto 0 );
constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process
begin
TCC20_process:TCC20 port map(
clk=>t_clk,
start=>t_start,
done=>t_done,
rst=>t_rst,
in_TCC_MR_Targ_angu_velo=> t_in_TCC_MR_Targ_angu_velo,
in_ADR_ADR_Tria_atti_angl=> t_in_ADR_ADR_Tria_atti_angl,
in_TCC_MR_Targ_angl=> t_in_TCC_MR_Targ_angl,
in_ADR_ADR_Tria_angu_velo=> t_in_ADR_ADR_Tria_angu_velo,
out_TCC_MR_Targ_angl_load_inst=> t_out_TCC_MR_Targ_angl_load_inst,
out_TCC_MR_Targ_angu_velo_load_inst=> t_out_TCC_MR_Targ_angu_velo_load_inst,
out_CCR_CCR_Tria_cont_quan=> t_out_CCR_CCR_Tria_cont_quan
);
end component;
