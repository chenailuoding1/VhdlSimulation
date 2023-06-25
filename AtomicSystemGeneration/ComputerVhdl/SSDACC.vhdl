library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity SSDACC is
port(
	in_SSDA_SSDA_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SSDACC_Angle analog
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_SSDA_SSDA_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSDACC_SSDA_Sun measurement angle
);
end SSDACC;
architecture Behavioral of SSDACC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_SSDA_SSDA_Angl_anal、得到输出端口out_SSDA_SSDA_Sun_meas_angl、
            end if;

	end process;



end Behavioral;
