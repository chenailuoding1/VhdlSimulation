library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity ADCC is
port(
	in_AD_ADCC_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Angular velocity analog
	in_AD_ADCC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Sun visible sign
	in_AD_ADCC_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Sun measurement angle
	in_AD_ADCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Current mode
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_ADCC_AD_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADCC_AD_Triaxial attitude angle
	out_ADCC_AD_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_ADCC_AD_Triaxial angular velocity
);
end ADCC;
architecture Behavioral of ADCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_AD_ADCC_Angu_velo_anal、in_AD_ADCC_Sun_visi_sign、in_AD_ADCC_Sun_meas_angl、in_AD_ADCC_Curr_mode、得到输出端口out_ADCC_AD_Tria_atti_angl、out_ADCC_AD_Tria_angu_velo、
            end if;

	end process;



end Behavioral;
