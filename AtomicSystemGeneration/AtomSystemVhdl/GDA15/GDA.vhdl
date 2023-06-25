library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity GDA is
port(
	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Pulse count
	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Gyro power state
	in_GDAC_GDA_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDACC_GDA_Angular velocity analog
	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;--out_GDA_G_Pulse count acquisition instruction
	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;--out_GDA_G_Gyro power state perception instruction
	out_GDA_GDAC_Puls_coun:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GDA_GDACC_Pulse count
	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Angular velocity analog
	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Gyro power state
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end GDA;
architecture Behavioral of GDA is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GDA_Puls_coun: ram_type0;
signal Puls_coun_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GDA_Gyro_powe_stat: ram_type1;
signal Gyro_powe_stat_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GDA_Angu_velo_anal: ram_type2;
signal Angu_velo_anal_addr: integer:=1;
Type states is (sta0,sta1,sta2,sta3,sta4,sta5);
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
					out_GDA_G_Puls_coun_acqu_inst<='1';
				when sta2=> 
					out_GDA_G_Gyro_powe_stat_perc_inst<='1';
					out_GDA_G_Puls_coun_acqu_inst<='0';
				when sta3=> 
					out_GDA_GDAC_Puls_coun<=RAM_GDA_Puls_coun(Puls_coun_addr);
					out_calc_inst<='1';
					out_GDA_G_Gyro_powe_stat_perc_inst<='0';
				when sta4=> 
					out_GD_GD_Angu_velo_anal<=RAM_GDA_Angu_velo_anal(Angu_velo_anal_addr);
					out_calc_inst<='0';
				when sta5=> 
					out_GD_GD_Gyro_powe_stat<=RAM_GDA_Gyro_powe_stat(Gyro_powe_stat_addr);
					Count:=0;
					done<='1';
				end case;
	end process;
	process(in_GDA_G_Puls_coun)
	begin
		RAM_GDA_Puls_coun(Puls_coun_addr)<=in_GDA_G_Puls_coun;
	end process;
	process(in_GDA_G_Gyro_powe_stat)
	begin
		RAM_GDA_Gyro_powe_stat(Gyro_powe_stat_addr)<=in_GDA_G_Gyro_powe_stat;
	end process;
	process(in_GDAC_GDA_Angu_velo_anal)
	begin
		RAM_GDA_Angu_velo_anal(Angu_velo_anal_addr)<=in_GDAC_GDA_Angu_velo_anal;
	end process;
end Behavioral;