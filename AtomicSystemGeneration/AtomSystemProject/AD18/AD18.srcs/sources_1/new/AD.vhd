library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity AD is

port(

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GD_GD_Angular velocity analog

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun measurement angle

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_MR_Current mode

	in_ADCC_AD_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADCC_AD_Triaxial attitude angle

	in_ADCC_AD_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADCC_AD_Triaxial angular velocity

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC;--out_AD_MR_Current mode load instruction

	out_AD_ADCC_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Angular velocity analog

	out_AD_ADCC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Sun visible sign

	out_AD_ADCC_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Sun measurement angle

	out_AD_ADCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Current mode

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial attitude angle

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial angular velocity

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end AD;

architecture Behavioral of AD is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Angu_velo_anal: ram_type0;

signal Angu_velo_anal_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Sun_visi_sign: ram_type1;

signal Sun_visi_sign_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Sun_meas_angl: ram_type2;

signal Sun_meas_angl_addr: integer:=1;

type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Curr_mode: ram_type3;

signal Curr_mode_addr: integer:=1;

type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Tria_atti_angl: ram_type4;

signal Tria_atti_angl_addr: integer:=1;

type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Tria_angu_velo: ram_type5;

signal Tria_angu_velo_addr: integer:=1;

Type states is (sta0,sta1,sta2,sta3,sta4);

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

					out_AD_MR_Curr_mode_load_inst<='1';

				when sta2=> 

					out_AD_ADCC_Angu_velo_anal<=RAM_AD_Angu_velo_anal(Angu_velo_anal_addr);

					out_calc_inst<='1';

					out_AD_ADCC_Sun_visi_sign<=RAM_AD_Sun_visi_sign(Sun_visi_sign_addr);

					out_AD_ADCC_Sun_meas_angl<=RAM_AD_Sun_meas_angl(Sun_meas_angl_addr);

					out_AD_ADCC_Curr_mode<=RAM_AD_Curr_mode(Curr_mode_addr);

					out_AD_MR_Curr_mode_load_inst<='0';

				when sta3=> 

					out_ADR_ADR_Tria_atti_angl<=RAM_AD_Tria_atti_angl(Tria_atti_angl_addr);

					out_calc_inst<='0';

				when sta4=> 

					out_ADR_ADR_Tria_angu_velo<=RAM_AD_Tria_angu_velo(Tria_angu_velo_addr);

					Count:=0;

					done<='1';

				end case;

	end process;

	process(in_GD_GD_Angu_velo_anal)

	begin

		RAM_AD_Angu_velo_anal(Angu_velo_anal_addr)<=in_GD_GD_Angu_velo_anal;

	end process;

	process(in_SSD_SSD_Sun_visi_sign)

	begin

		RAM_AD_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSD_SSD_Sun_visi_sign;

	end process;

	process(in_SSD_SSD_Sun_meas_angl)

	begin

		RAM_AD_Sun_meas_angl(Sun_meas_angl_addr)<=in_SSD_SSD_Sun_meas_angl;

	end process;

	process(in_AD_MR_Curr_mode)

	begin

		RAM_AD_Curr_mode(Curr_mode_addr)<=in_AD_MR_Curr_mode;

	end process;

	process(in_ADCC_AD_Tria_atti_angl)

	begin

		RAM_AD_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADCC_AD_Tria_atti_angl;

	end process;

	process(in_ADCC_AD_Tria_angu_velo)

	begin

		RAM_AD_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADCC_AD_Tria_angu_velo;

	end process;

end Behavioral;

