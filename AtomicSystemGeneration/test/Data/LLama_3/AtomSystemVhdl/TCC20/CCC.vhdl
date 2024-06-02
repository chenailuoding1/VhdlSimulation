

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;




--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity CCC is
port(
	in_TCC_CCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Triaxial attitude angle
	in_TCC_CCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Triaxial angular velocity
	in_TCC_CCC_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Target angle
	in_TCC_CCC_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Target angular velocity
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_CCC_TCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_CCC_TCC_Triaxial control quantity
);
end CCC;
architecture Behavioral of CCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TCC_CCC_Tria_atti_angl、in_TCC_CCC_Tria_angu_velo、in_TCC_CCC_Targ_angl、in_TCC_CCC_Targ_angu_velo、得到输出端口out_CCC_TCC_Tria_cont_quan、
            if to_integer(unsigned(in_TCC_CCC_Targ_angl))<to_integer(unsigned(in_TCC_CCC_Targ_angu_velo)) then
                out_CCC_TCC_Tria_cont_quan<=std_logic_vector(to_signed(1,32));
            else 
                out_CCC_TCC_Tria_cont_quan<=std_logic_vector(to_signed(2,32));
            end if;
	end if;

	end process;



end Behavioral;
