create_project SSI ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI/SSI.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI/SSI.srcs/sources_1/new/SSI.vhd w ]
add_files ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI/SSI.srcs/sources_1/new/SSI.vhd
set file [open "./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI/SSI.srcs/sources_1/new/SSI.vhd" a]
set text "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity SSI is

port(

	in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst:in STD_LOGIC;--in_SSSPonI_SSI_Sun sensor power on instruction storage instruction

	in_SSSP_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSSPonI_SSI_Sun sensor power on instruction

	in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:in STD_LOGIC;--in_SSCO_SSI_Sun sensor power on instruction load instruction

	out_SSCO_SSI_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSCO_SSI_Sun sensor power on instruction

);

end SSI;

architecture Behavioral of SSI is

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_SSI_Sun_sens_powe_on_inst: ram_type0;

signal Sun_sens_powe_on_inst_addr: integer:=1;

begin

	process(in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst)

	begin

		if in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst='1' then

			RAM_SSI_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr)<=in_SSSPonI_SSI_Sun_sens_powe_on_inst;

		end if;

	end process;

	process(in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst)

	begin

		if in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst='1' then

			out_SSCO_SSI_Sun_sens_powe_on_inst<=RAM_SSI_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr);

		end if;

	end process;









end Behavioral;

"
puts $file $text
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/DomainProject/physical_lexical_domain//SSI xilinx.com -library user -taxonomy /UserIP 
