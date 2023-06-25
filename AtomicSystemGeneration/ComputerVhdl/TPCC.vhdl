library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TPCC is
port(
	in_TP_TPCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Current mode
	in_TP_TPCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Triaxial attitude angle
	in_TP_TPCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Triaxial angular velocity
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TPCC_TP_Tele_data:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCC_TP_Telemetry data
);
end TPCC;
architecture Behavioral of TPCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TP_TPCC_Curr_mode、in_TP_TPCC_Tria_atti_angl、in_TP_TPCC_Tria_angu_velo、得到输出端口out_TPCC_TP_Tele_data、
            end if;

	end process;



end Behavioral;
