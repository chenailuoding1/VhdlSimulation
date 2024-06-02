library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SSDA is
port(
	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun visible sign
	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Angle analog
	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun sensor power state
	in_SSDA_SSDA_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDACC_SSDA_Sun measurement angle
	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Sun visible sign acquisition instruction
	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Angle analog acquisition instruction
	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;--out_SSDA_SS_Sun sensor power state perception instruction
	out_SSDA_SSDA_Angl_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSDA_SSDACC_Angle analog
	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun visible sign
	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun measurement angle
	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun sensor power state
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end SSDA;
architecture Behavioral of SSDA is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_visi_sign: ram_type0;
signal Sun_visi_sign_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Angl_anal: ram_type1;
signal Angl_anal_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_sens_powe_stat: ram_type2;
signal Sun_sens_powe_stat_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_meas_angl: ram_type3;
signal Sun_meas_angl_addr: integer:=1;
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
				when sta1=> 
					out_SSDA_SS_Sun_visi_sign_acqu_inst<='1';
				when sta2=> 
					out_SSDA_SS_Angl_anal_acqu_inst<='1';
					out_SSDA_SS_Sun_visi_sign_acqu_inst<='0';
				when sta3=> 
					out_SSDA_SS_Sun_sens_powe_stat_perc_inst<='1';
					out_SSDA_SS_Angl_anal_acqu_inst<='0';
				when sta4=> 
					out_SSDA_SSDA_Angl_anal<=RAM_SSDA_Angl_anal(Angl_anal_addr);
					out_calc_inst<='1';
					out_SSDA_SS_Sun_sens_powe_stat_perc_inst<='0';
				when sta5=> 
					out_SSD_SSD_Sun_visi_sign<=RAM_SSDA_Sun_visi_sign(Sun_visi_sign_addr);
					out_calc_inst<='0';
				when sta6=> 
					out_SSD_SSD_Sun_meas_angl<=RAM_SSDA_Sun_meas_angl(Sun_meas_angl_addr);
				when sta7=> 
					out_SSD_SSD_Sun_sens_powe_stat<=RAM_SSDA_Sun_sens_powe_stat(Sun_sens_powe_stat_addr);
					Count:=0;
					done<='1';
				end case;
	end process;
	process(in_SSDA_SS_Sun_visi_sign)
	begin
		RAM_SSDA_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSDA_SS_Sun_visi_sign;
	end process;
	process(in_SSDA_SS_Angl_anal)
	begin
		RAM_SSDA_Angl_anal(Angl_anal_addr)<=in_SSDA_SS_Angl_anal;
	end process;
	process(in_SSDA_SS_Sun_sens_powe_stat)
	begin
		RAM_SSDA_Sun_sens_powe_stat(Sun_sens_powe_stat_addr)<=in_SSDA_SS_Sun_sens_powe_stat;
	end process;
	process(in_SSDA_SSDA_Sun_meas_angl)
	begin
		RAM_SSDA_Sun_meas_angl(Sun_meas_angl_addr)<=in_SSDA_SSDA_Sun_meas_angl;
	end process;

end Behavioral;