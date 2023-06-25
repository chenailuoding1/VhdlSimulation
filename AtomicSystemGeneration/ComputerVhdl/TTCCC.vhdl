library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TTCCC is
port(
	in_TTC_TTCC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTC_TTCCC_Thruster combination logic
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TTCC_TTC_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCCC_TTC_Triaxial control instruction
);
end TTCCC;
architecture Behavioral of TTCCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TTC_TTCC_Thru_comb_logi、得到输出端口out_TTCC_TTC_Tria_cont_inst、
            end if;

	end process;



end Behavioral;
