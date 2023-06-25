library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity DMC is

port(

	in_TP_DMC_Tele_data_tran_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_DMC_Telemetry data transmission instruction

	out_DMC_TIP_Tele_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_DMC_TIP_Telecontrol instruction

);

end DMC;

architecture Behavioral of DMC is

begin

--需要用户补全的信息









end Behavioral;


