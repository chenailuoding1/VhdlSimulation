create_project DA14Dependency ./AtomicSystemGeneration/DependencyProject//DA14Dependency -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/DependencyProject//DA14Dependency/DA14Dependency.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/DependencyProject//DA14Dependency/DA14Dependency.srcs/sources_1/new/DA14Dependency.vhd w ]
add_files ./AtomicSystemGeneration/DependencyProject//DA14Dependency/DA14Dependency.srcs/sources_1/new/DA14Dependency.vhd
set file [open "./AtomicSystemGeneration/DependencyProject//DA14Dependency/DA14Dependency.srcs/sources_1/new/DA14Dependency.vhd" a]
set text "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



entity DA14Dependency is

port(

start0:out std_logic;

done0:in std_logic;

start1:out std_logic;

done1:in std_logic;

start2:out std_logic;

done2:in std_logic;

start:in std_logic;

done:out std_logic;

        clk:in std_logic;



        rst:in std_logic



        



    );



end DA14Dependency;

architecture Behavioral of DA14Dependency is

Type states is (st0,st1,st2) ;

signal current_sta,next_sta:states;



begin

sta_pro:process(current_sta,start,done0,done1,done2) is

begin



        case current_sta is

when st0=> 

done<='0';

if start='0' then

start0<='0';

start1<='0';

start2<='0';

elsif start='1' then

start0<='1';

start1<='0';

start2<='0';

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

if done1='1' then 

	next_sta<=st2;

else

	next_sta<=st1;

end if;

when st2=> 

start0<='0';

start1<='0';

start2<='1';

if done2='1' then 

	next_sta<=st0;	done<='1';

else

	next_sta<=st2;

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

"
puts $file $text
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/DependencyProject//DA14Dependency xilinx.com -library user -taxonomy /UserIP 
