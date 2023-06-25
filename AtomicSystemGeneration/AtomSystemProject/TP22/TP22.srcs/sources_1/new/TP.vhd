library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TP is

port(

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_MR_Current mode

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_TPCC_TP_Tele_data:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCC_TP_Telemetry data

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC;--out_TP_MR_Current mode load instruction

	out_TP_TPCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Current mode

	out_TP_TPCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Triaxial attitude angle

	out_TP_TPCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Triaxial angular velocity

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_DMC_Telemetry data transmission instruction

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TP;

architecture Behavioral of TP is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Curr_mode: ram_type0;

signal Curr_mode_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tria_atti_angl: ram_type1;

signal Tria_atti_angl_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tria_angu_velo: ram_type2;

signal Tria_angu_velo_addr: integer:=1;

type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tele_data: ram_type3;

signal Tele_data_addr: integer:=1;

Type states is (sta0,sta1,sta2,sta3);

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

					out_TP_MR_Curr_mode_load_inst<='1';

				when sta2=> 

					out_TP_TPCC_Curr_mode<=RAM_TP_Curr_mode(Curr_mode_addr);

					out_calc_inst<='1';

					out_TP_TPCC_Tria_atti_angl<=RAM_TP_Tria_atti_angl(Tria_atti_angl_addr);

					out_TP_TPCC_Tria_angu_velo<=RAM_TP_Tria_angu_velo(Tria_angu_velo_addr);

					out_TP_MR_Curr_mode_load_inst<='0';

				when sta3=> 

					out_TP_DMC_Tele_data_tran_inst<=RAM_TP_Tele_data_tran_inst(Tele_data_tran_inst_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_TP_MR_Curr_mode)

	begin

		RAM_TP_Curr_mode(Curr_mode_addr)<=in_TP_MR_Curr_mode;

	end process;

	process(in_ADR_ADR_Tria_atti_angl)

	begin

		RAM_TP_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADR_ADR_Tria_atti_angl;

	end process;

	process(in_ADR_ADR_Tria_angu_velo)

	begin

		RAM_TP_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADR_ADR_Tria_angu_velo;

	end process;

	process(in_TPCC_TP_Tele_data)

	begin

		RAM_TP_Tele_data(Tele_data_addr)<=in_TPCC_TP_Tele_data;

	end process;

end Behavioral;

