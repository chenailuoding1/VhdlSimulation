library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity TPI is

port(

	in_TPCO_TPI_Thru_powe_on_inst_load_inst:in STD_LOGIC;--in_TPCO_TPI_Thruster power on instruction load instruction

	in_STPo_TPI_Thru_powe_on_inst_stor_inst:in STD_LOGIC;--in_STPonI_TPI_Thruster power on instruction storage instruction

	in_STPo_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_STPonI_TPI_Thruster power on instruction

	out_TPCO_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCO_TPI_Thruster power on instruction

);

end TPI;

architecture Behavioral of TPI is

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TPI_Thruster_powe_on_inst: ram_type0;

signal Thruster_powe_on_inst_addr: integer:=1;

begin

	process(in_STPo_TPI_Thru_powe_on_inst_stor_inst)

	begin

		if in_STPo_TPI_Thru_powe_on_inst_stor_inst='1' then

			RAM_TPI_Thruster_powe_on_inst(Thruster_powe_on_inst_addr)<=in_STPonI_TPI_Thru_powe_on_inst;

		end if;

	end process;

	process(in_TPCO_TPI_Thru_powe_on_inst_load_inst)

	begin

		if in_TPCO_TPI_Thru_powe_on_inst_load_inst='1' then

			out_TPCO_TPI_Thru_powe_on_inst<=RAM_TPI_Thruster_powe_on_inst(Thruster_powe_on_inst_addr);

		end if;

	end process;









end Behavioral;


