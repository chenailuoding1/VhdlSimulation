library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TTCOCC is
port(
	in_TTCO_TTCO_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTCO_TTCOCC_Triaxial control instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TTCO_TTCO_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCOCC_TTCO_Triaxial control signal
);
end TTCOCC;
architecture Behavioral of TTCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TTCO_TTCO_Tria_cont_inst、得到输出端口out_TTCO_TTCO_Tria_cont_sign、
            end if;

	end process;



end Behavioral;
