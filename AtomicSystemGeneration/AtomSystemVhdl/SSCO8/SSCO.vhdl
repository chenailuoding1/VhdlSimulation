library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SSCO is
port(
	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SSI_Sun sensor power on instruction
	in_SSCO_SSCO_Sun_sens_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCOCC_SSCO_Sun sensor power on pulse
	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC;--out_SSCO_SSI_Sun sensor power on instruction load instruction
	out_SSCO_SSCO_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSCO_SSCOCC_Sun sensor power on instruction
	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSCO_SS_Sun sensor power on pulse
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end SSCO;
architecture Behavioral of SSCO is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSCO_Sun_sens_powe_on_inst: ram_type0;
signal Sun_sens_powe_on_inst_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSCO_Sun_sens_powe_on_puls: ram_type1;
signal Sun_sens_powe_on_puls_addr: integer:=1;
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
					out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst<='1';
				when sta2=> 
					out_SSCO_SSCO_Sun_sens_powe_on_inst<=RAM_SSCO_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr);
					out_calc_inst<='1';
					out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst<='0';
				when sta3=> 
					out_SSCO_SS_Sun_sens_powe_on_puls<=RAM_SSCO_Sun_sens_powe_on_puls(Sun_sens_powe_on_puls_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_SSCO_SSI_Sun_sens_powe_on_inst)
	begin
		RAM_SSCO_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr)<=in_SSCO_SSI_Sun_sens_powe_on_inst;
	end process;
	process(in_SSCO_SSCO_Sun_sens_powe_on_puls)
	begin
		RAM_SSCO_Sun_sens_powe_on_puls(Sun_sens_powe_on_puls_addr)<=in_SSCO_SSCO_Sun_sens_powe_on_puls;
	end process;
end Behavioral;