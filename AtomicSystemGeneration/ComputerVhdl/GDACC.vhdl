library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity GDACC is
port(
	in_GDA_GDAC_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_GDACC_Pulse count
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_GDAC_GDA_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GDACC_GDA_Angular velocity analog
);
end GDACC;
architecture Behavioral of GDACC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_GDA_GDAC_Puls_coun、得到输出端口out_GDAC_GDA_Angu_velo_anal、
            end if;

	end process;



end Behavioral;
