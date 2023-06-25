library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TTCO is
port(
	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTI_TTI_Triaxial control instruction
	in_TTCO_TTCO_Tria_cont_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTCOCC_TTCO_Triaxial control signal
	out_TTCO_TTCO_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TTCO_TTCOCC_Triaxial control instruction
	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TTCO_TCT_Triaxial control signal
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end TTCO;
architecture Behavioral of TTCO is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TTCO_Tria_cont_inst: ram_type0;
signal Tria_cont_inst_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TTCO_Tria_cont_sign: ram_type1;
signal Tria_cont_sign_addr: integer:=1;
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
					out_TTCO_TTCO_Tria_cont_inst<=RAM_TTCO_Tria_cont_inst(Tria_cont_inst_addr);
					out_calc_inst<='1';
				when sta2=> 
					out_TTCO_TCT_Tria_cont_sign<=RAM_TTCO_Tria_cont_sign(Tria_cont_sign_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_TTI_TTI_Tria_cont_inst)
	begin
		RAM_TTCO_Tria_cont_inst(Tria_cont_inst_addr)<=in_TTI_TTI_Tria_cont_inst;
	end process;
	process(in_TTCO_TTCO_Tria_cont_sign)
	begin
		RAM_TTCO_Tria_cont_sign(Tria_cont_sign_addr)<=in_TTCO_TTCO_Tria_cont_sign;
	end process;
end Behavioral;