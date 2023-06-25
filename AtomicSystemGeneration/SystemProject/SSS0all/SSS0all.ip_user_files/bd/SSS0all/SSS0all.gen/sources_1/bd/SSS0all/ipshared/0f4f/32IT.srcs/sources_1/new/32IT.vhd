library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统�?为std_logic数据类型，�?�（value，signal）统�?为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity IT is

port(
    clk     : in  std_logic;
    reset   : in  std_logic;
	in_32IT_32IT_32ms_inte_time_star_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_32ITI_32IT_32ms interrupt timer start instruction
    interruptsignal:out std_logic
);

end IT;

architecture Behavioral of IT is

begin

--�?要用户补全的信息









end Behavioral;


