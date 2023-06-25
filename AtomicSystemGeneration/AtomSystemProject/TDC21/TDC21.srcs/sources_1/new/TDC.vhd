library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TDC is

port(

	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TD_TD_Thruster power state

	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_CCR_CCR_Triaxial control quantity

	in_TDCC_TDC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDCC_TDC_Thruster combination logic

	out_TDC_TDCC_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDC_TDCC_Thruster power state

	out_TDC_TDCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDC_TDCC_Triaxial control quantity

	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDCR_TDCR_Thruster combination logic

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TDC;

architecture Behavioral of TDC is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TDC_Thru_powe_stat: ram_type0;

signal Thru_powe_stat_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TDC_Tria_cont_quan: ram_type1;

signal Tria_cont_quan_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TDC_Thru_comb_logi: ram_type2;

signal Thru_comb_logi_addr: integer:=1;

Type states is (sta0,sta1,sta2);

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

					sta<=sta0;

            end case;



        end if;



    end process;



    process(sta) --??????????????????????



    begin



        case sta is

				when sta0=> 

					done<='0';

				when sta1=> 

					out_TDC_TDCC_Thru_powe_stat<=RAM_TDC_Thru_powe_stat(Thru_powe_stat_addr);

					out_calc_inst<='1';

					out_TDC_TDCC_Tria_cont_quan<=RAM_TDC_Tria_cont_quan(Tria_cont_quan_addr);

				when sta2=> 

					out_TDCR_TDCR_Thru_comb_logi<=RAM_TDC_Thru_comb_logi(Thru_comb_logi_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_TD_TD_Thru_powe_stat)

	begin

		RAM_TDC_Thru_powe_stat(Thru_powe_stat_addr)<=in_TD_TD_Thru_powe_stat;

	end process;

	process(in_CCR_CCR_Tria_cont_quan)

	begin

		RAM_TDC_Tria_cont_quan(Tria_cont_quan_addr)<=in_CCR_CCR_Tria_cont_quan;

	end process;

	process(in_TDCC_TDC_Thru_comb_logi)

	begin

		RAM_TDC_Thru_comb_logi(Thru_comb_logi_addr)<=in_TDCC_TDC_Thru_comb_logi;

	end process;

end Behavioral;

