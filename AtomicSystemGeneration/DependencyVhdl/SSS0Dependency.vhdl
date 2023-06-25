library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity SSS0Dependency is
port(
start0:out std_logic;done0:in std_logic;
start1:out std_logic;done1:in std_logic;
start2:out std_logic;done2:in std_logic;
start3:out std_logic;done3:in std_logic;
start4:out std_logic;done4:in std_logic;
start5:out std_logic;done5:in std_logic;
start6:out std_logic;done6:in std_logic;
start7:out std_logic;done7:in std_logic;
start8:out std_logic;done8:in std_logic;
        clk:in std_logic;

        rst:in std_logic

        

    );

end SSS0Dependency;
architecture Behavioral of SSS0Dependency is
Type states is (st0,st1,st2,st3,st4,st5,st6,st7,st8) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,done0,done1,done2,done3,done4,done5,done6,done7,done8) is
begin

        case current_sta is
when st0=> 
start0<='1';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done0='1' then 
	next_sta<=st1;
else
	next_sta<=st0;
end if;
when st1=> 
start0<='0';
start1<='1';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done1='1' then 
	next_sta<=st2;
else
	next_sta<=st1;
end if;
when st2=> 
start0<='0';
start1<='0';
start2<='1';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done2='1' then 
	next_sta<=st3;
else
	next_sta<=st2;
end if;
when st3=> 
start0<='0';
start1<='0';
start2<='0';
start3<='1';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done3='1' then 
	next_sta<=st4;
else
	next_sta<=st3;
end if;
when st4=> 
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='1';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done4='1' then 
	next_sta<=st5;
else
	next_sta<=st4;
end if;
when st5=> 
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='1';
start6<='0';
start7<='0';
start8<='0';
if done5='1' then 
	next_sta<=st6;
else
	next_sta<=st5;
end if;
when st6=> 
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='1';
start7<='0';
start8<='0';
if done6='1' then 
	next_sta<=st7;
else
	next_sta<=st6;
end if;
when st7=> 
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='1';
start8<='0';
when st8=> 
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='1';
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;
