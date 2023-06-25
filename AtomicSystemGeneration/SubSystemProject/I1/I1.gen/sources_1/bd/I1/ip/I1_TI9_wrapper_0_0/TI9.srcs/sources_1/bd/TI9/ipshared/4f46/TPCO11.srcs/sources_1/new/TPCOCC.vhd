library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity TPCOCC is

port(

	in_TPCO_TPCO_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TPCOCC_Thruster power on instruction

	in_calc_inst:in STD_LOGIC;--in_calculate instruction

	out_TPCO_TPCO_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCOCC_TPCO_Thruster power on pulse

);

end TPCOCC;

architecture Behavioral of TPCOCC is

begin

    process(in_calc_inst)



    begin



            if in_calc_inst='1' then

--由输入端口in_TPCO_TPCO_Thru_powe_on_inst、得到输出端口out_TPCO_TPCO_Thru_powe_on_puls、

            end if;



	end process;







end Behavioral;


