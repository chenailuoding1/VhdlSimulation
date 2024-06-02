library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity MSM is
port(
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign
	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time
	in_MSMC_MSM_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Next cycle mode
	in_MSMC_MSM_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Current mode working time
	in_MSMC_MSM_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Target angle
	in_MSMC_MSM_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Target angular velocity
	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode load instruction
	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time load instruction
	out_MSM_MSMC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Triaxial attitude angle
	out_MSM_MSMC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Triaxial angular velocity
	out_MSM_MSMC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Sun visible sign
	out_MSM_MSMC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Current mode
	out_MSM_MSMC_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Current mode working time
	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;--out_MSM_MR_Next cycle mode storage instruction
	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Next cycle mode
	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time storage instruction
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Current mode working time
	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angle storage instruction
	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angle
	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angular velocity storage instruction
	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angular velocity
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end MSM;
architecture Behavioral of MSM is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Tria_atti_angl: ram_type0;
signal Tria_atti_angl_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Tria_angu_velo: ram_type1;
signal Tria_angu_velo_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Sun_visi_sign: ram_type2;
signal Sun_visi_sign_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Curr_mode: ram_type3;
signal Curr_mode_addr: integer:=1;
signal Curr_mode_work_time_signal: STD_LOGIC_VECTOR ( 31 downto 0 );
type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Curr_mode_work_time: ram_type4;
signal Curr_mode_work_time_addr: integer:=1;
type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Next_cycl_mode: ram_type5;
signal Next_cycl_mode_addr: integer:=1;
type ram_type6 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Targ_angl: ram_type6;
signal Targ_angl_addr: integer:=1;
type ram_type7 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Targ_angu_velo: ram_type7;
signal Targ_angu_velo_addr: integer:=1;
Type states is (sta0,sta1,sta2,sta3,sta4,sta5,sta6,sta7);
signal sta:states;
begin

    process(start)

    begin

            if start='1' then 

                Count:=1;

            else

                Count:=0;

            end if;

    end process;

    process(clk,rst)

    begin

        if rst = '1' then

            sta <= sta0;

        elsif clk'event and clk = '1' then

            case sta is

                when sta0 =>

                if Count=1 then 

                    sta<=sta1;

                else

                    sta<=sta0;

                end if;

    
				when sta1=> 
					sta<=sta2;
				when sta2=> 
					sta<=sta3;
				when sta3=> 
					sta<=sta4;
				when sta4=> 
					sta<=sta5;
				when sta5=> 
					sta<=sta6;
				when sta6=> 
					sta<=sta7;
				when sta7=> 
					sta<=sta0;
            end case;

        end if;

    end process;

				process(sta)
begin
case
sta is
				when sta0=> 
					done<='0';
					out_MSM_MR_Targ_angu_velo_stor_inst<='0';
				when sta1=> 
					out_MSM_MR_Curr_mode_load_inst<='1';
				when sta2=> 
					out_MSM_MR_Curr_mode_work_time_load_inst<='1';
					out_MSM_MR_Curr_mode_load_inst<='0';
				when sta3=> 
					out_MSM_MSMC_Tria_atti_angl<=RAM_MSM_Tria_atti_angl(Tria_atti_angl_addr);
					out_calc_inst<='1';
					out_MSM_MSMC_Tria_angu_velo<=RAM_MSM_Tria_angu_velo(Tria_angu_velo_addr);
					out_MSM_MSMC_Sun_visi_sign<=RAM_MSM_Sun_visi_sign(Sun_visi_sign_addr);
					out_MSM_MSMC_Curr_mode<=RAM_MSM_Curr_mode(Curr_mode_addr);
					out_MSM_MSMC_Curr_mode_work_time<=RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr);
					out_MSM_MR_Curr_mode_work_time_load_inst<='0';
				when sta4=> 
					out_MSM_MR_Next_cycl_mode_stor_inst<='1';
					out_MSM_MR_Next_cycl_mode<=RAM_MSM_Next_cycl_mode(Next_cycl_mode_addr);
					out_calc_inst<='0';
				when sta5=> 
					out_MSM_MR_Curr_mode_work_time_stor_inst<='1';
					out_MSM_MR_Curr_mode_work_time<=RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr);
					out_MSM_MR_Next_cycl_mode_stor_inst<='0';
				when sta6=> 
					out_MSM_MR_Targ_angl_stor_inst<='1';
					out_MSM_MR_Targ_angl<=RAM_MSM_Targ_angl(Targ_angl_addr);
					out_MSM_MR_Curr_mode_work_time_stor_inst<='0';
				when sta7=> 
					out_MSM_MR_Targ_angu_velo_stor_inst<='1';
					out_MSM_MR_Targ_angu_velo<=RAM_MSM_Targ_angu_velo(Targ_angu_velo_addr);
					Count:=0;
					done<='1';
					out_MSM_MR_Targ_angl_stor_inst<='0';
				end case;
	end process;
	process(in_ADR_ADR_Tria_atti_angl)
	begin
		RAM_MSM_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADR_ADR_Tria_atti_angl;
	end process;
	process(in_ADR_ADR_Tria_angu_velo)
	begin
		RAM_MSM_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADR_ADR_Tria_angu_velo;
	end process;
	process(in_SSD_SSD_Sun_visi_sign)
	begin
		RAM_MSM_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSD_SSD_Sun_visi_sign;
	end process;
	process(in_MSM_MR_Curr_mode)
	begin
		RAM_MSM_Curr_mode(Curr_mode_addr)<=in_MSM_MR_Curr_mode;
	end process;
	process(in_MSM_MR_Curr_mode_work_time,in_MSMC_MSM_Curr_mode_work_time)
	begin
if in_MSM_MR_Curr_mode_work_time /= Curr_mode_work_time_signal then
	Curr_mode_work_time_signal <= in_MSM_MR_Curr_mode_work_time;
elsif in_MSMC_MSM_Curr_mode_work_time /= Curr_mode_work_time_signal then
	Curr_mode_work_time_signal <= in_MSMC_MSM_Curr_mode_work_time;
	end if;
	end process;
	process(in_MSMC_MSM_Next_cycl_mode)
	begin
		RAM_MSM_Next_cycl_mode(Next_cycl_mode_addr)<=in_MSMC_MSM_Next_cycl_mode;
	end process;
	process(in_MSMC_MSM_Targ_angl)
	begin
		RAM_MSM_Targ_angl(Targ_angl_addr)<=in_MSMC_MSM_Targ_angl;
	end process;
	process(in_MSMC_MSM_Targ_angu_velo)
	begin
		RAM_MSM_Targ_angu_velo(Targ_angu_velo_addr)<=in_MSMC_MSM_Targ_angu_velo;
	end process;
	process(Curr_mode_work_time_signal)
	begin
		RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr)<=Curr_mode_work_time_signal;
	end process;

end Behavioral;