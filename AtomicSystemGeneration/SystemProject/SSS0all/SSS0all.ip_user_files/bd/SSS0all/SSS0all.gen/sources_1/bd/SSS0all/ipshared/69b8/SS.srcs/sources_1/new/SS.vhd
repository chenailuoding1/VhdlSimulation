library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity SS is

port(

	in_SSDA_SS_Sun_visi_sign_acqu_inst:in STD_LOGIC;--in_SSDA_SS_Sun visible sign acquisition instruction

	in_SSDA_SS_Angl_anal_acqu_inst:in STD_LOGIC;--in_SSDA_SS_Angle analog acquisition instruction

	in_SSDA_SS_Sun_sens_powe_stat_perc_inst:in STD_LOGIC;--in_SSDA_SS_Sun sensor power state perception instruction

	in_SSCO_SS_Sun_sens_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SS_Sun sensor power on pulse

	out_SSDA_SS_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSDA_SS_Sun visible sign

	out_SSDA_SS_Angl_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSDA_SS_Angle analog

	out_SSDA_SS_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSDA_SS_Sun sensor power state

);

end SS;

architecture Behavioral of SS is

begin

--需要用户补全的信息









end Behavioral;


