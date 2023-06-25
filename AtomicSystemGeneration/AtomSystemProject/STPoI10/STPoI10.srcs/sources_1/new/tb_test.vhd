library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component STPonI is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	out_STPo_TPI_Thru_powe_on_inst_stor_inst:out STD_LOGIC;

	out_STPo_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_out_STPo_TPI_Thru_powe_on_inst_stor_instSTD_LOGIC;

signal t_out_STPo_TPI_Thru_powe_on_instSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

STPonI_process:STPonI port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

out_STPo_TPI_Thru_powe_on_inst_stor_inst=> t_out_STPo_TPI_Thru_powe_on_inst_stor_inst,

out_STPo_TPI_Thru_powe_on_inst=> t_out_STPo_TPI_Thru_powe_on_inst

);

end component;


