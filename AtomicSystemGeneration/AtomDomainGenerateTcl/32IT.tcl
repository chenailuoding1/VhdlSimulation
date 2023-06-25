create_project 32IT ./AtomicSystemGeneration/DomainProject/causal_domain//32IT -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/DomainProject/causal_domain//32IT/32IT.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/DomainProject/causal_domain//32IT/32IT.srcs/sources_1/new/32IT.vhd w ]
add_files ./AtomicSystemGeneration/DomainProject/causal_domain//32IT/32IT.srcs/sources_1/new/32IT.vhd
set file [open "./AtomicSystemGeneration/DomainProject/causal_domain//32IT/32IT.srcs/sources_1/new/32IT.vhd" a]
set text "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity IT is

port(

	in_32IT_32IT_32ms_inte_time_star_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )--in_32ITI_32IT_32ms interrupt timer start instruction

);

end IT;

architecture Behavioral of IT is

begin

--需要用户补全的信息









end Behavioral;

"
puts $file $text
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/DomainProject/causal_domain//32IT xilinx.com -library user -taxonomy /UserIP 
