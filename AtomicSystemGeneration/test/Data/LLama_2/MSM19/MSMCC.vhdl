

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;



--鎸囦护锛坕nstruction锛夌粺锟�?涓簊td_logic鏁版嵁绫诲瀷锛岋拷?锟斤紙value锛宻ignal锛夌粺锟�?涓篠TD_LOGIC_VECTOR ( 31 downto 0 )鏁版嵁绫诲瀷

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

--鐢辫緭鍏ョ鍙n_MSM_MSMC_Tria_atti_angl銆乮n_MSM_MSMC_Tria_angu_velo銆乮n_MSM_MSMC_Sun_visi_sign銆乮n_MSM_MSMC_Curr_mode銆乮n_MSM_MSMC_Curr_mode_work_time銆佸緱鍒拌緭鍑虹鍙ut_MSMC_MSM_Next_cycl_mode銆乷ut_MSMC_MSM_Curr_mode_work_time銆乷ut_MSMC_MSM_Targ_angl銆乷ut_MSMC_MSM_Targ_angu_velo锟�?
            case to_integer(unsigned(in_MSM_MSMC_Curr_mode)) is 
            
           when 0=>
            if to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))=2 then
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(1,32));
            else
                out_MSMC_MSM_Targ_angl<=std_logic_vector(to_signed(2*to_integer(unsigned(in_MSM_MSMC_Tria_atti_angl)),32));
                out_MSMC_MSM_Targ_angu_velo<=std_logic_vector(to_signed(2*to_integer(unsigned(in_MSM_MSMC_Tria_angu_velo)),32));
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))+1,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            end if;
           when 1=>
           if to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))=2 then
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            else
                out_MSMC_MSM_Targ_angl<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Tria_atti_angl)),32));
                out_MSMC_MSM_Targ_angu_velo<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Tria_angu_velo)),32));
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))+1,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(1,32));
            end if;
            when others=>
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            end case;         
            end if;



	end process;







end Behavioral;


