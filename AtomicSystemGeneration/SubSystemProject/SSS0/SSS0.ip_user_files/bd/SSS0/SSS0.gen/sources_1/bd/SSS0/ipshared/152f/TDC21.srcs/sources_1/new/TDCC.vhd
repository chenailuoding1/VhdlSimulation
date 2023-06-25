library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity TDCC is

port(

	in_TDC_TDCC_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDC_TDCC_Thruster power state

	in_TDC_TDCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDC_TDCC_Triaxial control quantity

	in_calc_inst:in STD_LOGIC;--in_calculate instruction

	out_TDCC_TDC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TDCC_TDC_Thruster combination logic

);

end TDCC;

architecture Behavioral of TDCC is

begin

    process(in_calc_inst)



    begin



            if in_calc_inst='1' then

--由输入端口in_TDC_TDCC_Thru_powe_stat、in_TDC_TDCC_Tria_cont_quan、得到输出端口out_TDCC_TDC_Thru_comb_logi、

            end if;



	end process;







end Behavioral;


