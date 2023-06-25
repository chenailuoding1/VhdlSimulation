library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity G is

port(

	in_GDA_G_Puls_coun_acqu_inst:in STD_LOGIC;--in_GDA_G_Pulse count acquisition instruction

	in_GDA_G_Gyro_powe_stat_perc_inst:in STD_LOGIC;--in_GDA_G_Gyro power state perception instruction

	in_GCO_G_Gyro_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_G_Gyro power on pulse

	out_GDA_G_Puls_coun:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GDA_G_Pulse count

	out_GDA_G_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GDA_G_Gyro power state

);

end G;

architecture Behavioral of G is

begin

--需要用户补全的信息









end Behavioral;


