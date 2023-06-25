library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TIP13 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_DMC_TIP_Telecontrol instruction

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TIP_MR_Next cycle mode

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC--out_TIP_MR_Next cycle mode storage instruction

);

end TIP13;

architecture Behavioral of TIP13 is

component TIP is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TIPC_TIP_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_TIPC_Tele_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TIPCC is

port(

	in_TIP_TIPC_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TIPC_TIP_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TIP_TIPC_Tele_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TIPC_TIP_Next_cycl_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TIP_process:TIP port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_DMC_TIP_Tele_inst=> in_DMC_TIP_Tele_inst,

in_TIPC_TIP_Next_cycl_mode=> m_TIPC_TIP_Next_cycl_mode,

out_TIP_TIPC_Tele_inst=> m_TIP_TIPC_Tele_inst,

out_TIP_MR_Next_cycl_mode_stor_inst=> out_TIP_MR_Next_cycl_mode_stor_inst,

out_TIP_MR_Next_cycl_mode=> out_TIP_MR_Next_cycl_mode,

out_calc_inst=> m_calc_inst

);

TIPCC_process:TIPCC port map(

in_TIP_TIPC_Tele_inst=> m_TIP_TIPC_Tele_inst,

in_calc_inst=> m_calc_inst,

out_TIPC_TIP_Next_cycl_mode=> m_TIPC_TIP_Next_cycl_mode

);

end Behavioral;

