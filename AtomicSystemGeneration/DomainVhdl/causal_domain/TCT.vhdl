library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TCT is
port(
	in_TPCO_TCT_Thru_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TCT_Thruster power on pulse
	in_TDA_TCT_Thru_powe_stat_perc_inst:in STD_LOGIC;--in_TDA_TCT_Thruster power state perception instruction
	in_TTCO_TCT_Tria_cont_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTCO_TCT_Triaxial control signal
	out_TDA_TCT_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TDA_TCT_Thruster power state
);
end TCT;
architecture Behavioral of TCT is
begin
--需要用户补全的信息




end Behavioral;
