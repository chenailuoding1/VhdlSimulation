library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

entity MSMCC is

port(

	in_MSM_MSMC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Triaxial attitude angle

	in_MSM_MSMC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Triaxial angular velocity

	in_MSM_MSMC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Sun visible sign

	in_MSM_MSMC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Current mode

	in_MSM_MSMC_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Current mode working time

	in_calc_inst:in STD_LOGIC;--in_calculate instruction

	out_MSMC_MSM_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Next cycle mode

	out_MSMC_MSM_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Current mode working time

	out_MSMC_MSM_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Target angle

	out_MSMC_MSM_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_MSMCC_MSM_Target angular velocity

);

end MSMCC;

architecture Behavioral of MSMCC is

begin

    process(in_calc_inst)



    begin



            if in_calc_inst='1' then

--由输入端口in_MSM_MSMC_Tria_atti_angl、in_MSM_MSMC_Tria_angu_velo、in_MSM_MSMC_Sun_visi_sign、in_MSM_MSMC_Curr_mode、in_MSM_MSMC_Curr_mode_work_time、得到输出端口out_MSMC_MSM_Next_cycl_mode、out_MSMC_MSM_Curr_mode_work_time、out_MSMC_MSM_Targ_angl、out_MSMC_MSM_Targ_angu_velo、

            end if;



	end process;







end Behavioral;


