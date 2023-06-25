library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity I1Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start2:out std_logic;
done2:in std_logic;
start3:out std_logic;
done3:in std_logic;
start4:out std_logic;
done4:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic

        

    );

end I1Dependency;
architecture Behavioral of I1Dependency is
Type states is (st0,st1,st2,st3,st4) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1,done2,done3,done4) is
begin

        case current_sta is
when st0=> 
done<='0';
if start='0' then
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
elsif start='1' then
start0<='1';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
if done0='1' then 
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=> 
start0<='0';
start1<='1';
start2<='0';
start3<='0';
start4<='0';
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
if done4='1' then 
	next_sta<=st0;	done<='1';
else
	next_sta<=st4;
end if;
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
