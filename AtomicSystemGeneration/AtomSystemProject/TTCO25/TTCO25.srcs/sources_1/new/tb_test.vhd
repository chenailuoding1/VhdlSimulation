library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TTCO25 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_TTI_TTI_Tria_cont_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TTCO_TCT_Tria_cont_signSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TTCO25_process:TTCO25 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_TTI_TTI_Tria_cont_inst=> t_in_TTI_TTI_Tria_cont_inst,

out_TTCO_TCT_Tria_cont_sign=> t_out_TTCO_TCT_Tria_cont_sign

);

end component;


