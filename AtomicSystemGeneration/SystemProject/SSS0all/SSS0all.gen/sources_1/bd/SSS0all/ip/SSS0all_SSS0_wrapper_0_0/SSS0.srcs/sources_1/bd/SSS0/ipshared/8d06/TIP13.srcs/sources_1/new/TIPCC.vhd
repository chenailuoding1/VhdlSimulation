library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity TIPCC is

port(

	in_TIP_TIPC_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TIP_TIPCC_Telecontrol instruction

	in_calc_inst:in STD_LOGIC;--in_calculate instruction

	out_TIPC_TIP_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TIPCC_TIP_Next cycle mode

);

end TIPCC;

architecture Behavioral of TIPCC is

begin

    process(in_calc_inst)



    begin



            if in_calc_inst='1' then

--由输入端口in_TIP_TIPC_Tele_inst、得到输出端口out_TIPC_TIP_Next_cycl_mode、

            end if;



	end process;







end Behavioral;


