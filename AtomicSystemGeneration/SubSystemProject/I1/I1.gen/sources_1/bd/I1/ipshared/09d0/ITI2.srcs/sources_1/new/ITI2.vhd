library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity ITI2 is

port(

	out_32IT_32IT_32ms_inte_time_star_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_32ITI_32IT_32ms interrupt timer start instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end ITI2;

architecture Behavioral of ITI2 is

shared variable Count: integer:=0;

Type states is (sta0,sta1);

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

					out_32IT_32IT_32ms_inte_time_star_inst<=RAM_ITI2_32ms_inte_time_star_inst(32ms_inte_time_star_inst_addr);

					Count:=0;

					done<='1';

				end case;

	end process;

end Behavioral;

