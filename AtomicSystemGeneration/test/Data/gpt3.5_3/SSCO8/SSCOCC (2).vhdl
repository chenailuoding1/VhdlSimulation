library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity SSCOCC is
port(
	in_SSCO_SSCO_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SSCOCC_Sun sensor power on instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_SSCO_SSCO_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSCOCC_SSCO_Sun sensor power on pulse
);
end SSCOCC;
architecture Behavioral of SSCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
	out_SSCO_SSCO_Sun_sens_powe_on_puls<=in_SSCO_SSCO_Sun_sens_powe_on_inst;
--由输入端口in_SSCO_SSCO_Sun_sens_powe_on_inst、得到输出端口out_SSCO_SSCO_Sun_sens_powe_on_puls、
            end if;

	end process;



end Behavioral;
