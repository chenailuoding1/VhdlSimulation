create_project GI ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI/GI.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI/GI.srcs/sources_1/new/GI.vhd w ]
add_files ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI/GI.srcs/sources_1/new/GI.vhd
set file [open "./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI/GI.srcs/sources_1/new/GI.vhd" a]
set text "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity GI is

port(

	in_SGPo_GI_Gyro_powe_on_inst_stor_inst:in STD_LOGIC;--in_SGPonI_GI_Gyro power on instruction storage instruction

	in_SGPo_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SGPonI_GI_Gyro power on instruction

	in_GCO_GI_Gyro_powe_on_inst_load_inst:in STD_LOGIC;--in_GCO_GI_Gyro power on instruction load instruction

	out_GCO_GI_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GCO_GI_Gyro power on instruction

);

end GI;

architecture Behavioral of GI is

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_GI_Gyro_powe_on_inst: ram_type0;

signal Gyro_powe_on_inst_addr: integer:=1;

begin

	process(in_SGPo_GI_Gyro_powe_on_inst_stor_inst)

	begin

		if in_SGPo_GI_Gyro_powe_on_inst_stor_inst='1' then

			RAM_GI_Gyro_powe_on_inst(Gyro_powe_on_inst_addr)<=in_SGPonI_GI_Gyro_powe_on_inst;

		end if;

	end process;

	process(in_GCO_GI_Gyro_powe_on_inst_load_inst)

	begin

		if in_GCO_GI_Gyro_powe_on_inst_load_inst='1' then

			out_GCO_GI_Gyro_powe_on_inst<=RAM_GI_Gyro_powe_on_inst(Gyro_powe_on_inst_addr);

		end if;

	end process;









end Behavioral;

"
puts $file $text
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//GI xilinx.com -library user -taxonomy /UserIP 
