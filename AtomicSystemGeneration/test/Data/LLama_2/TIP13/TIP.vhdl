library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TIP is
port(
	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_DMC_TIP_Telecontrol instruction
	in_TIPC_TIP_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TIPCC_TIP_Next cycle mode
	out_TIP_TIPC_Tele_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TIP_TIPCC_Telecontrol instruction
	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;--out_TIP_MR_Next cycle mode storage instruction
	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TIP_MR_Next cycle mode
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end TIP;
architecture Behavioral of TIP is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TIP_Tele_inst: ram_type0;
signal Tele_inst_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TIP_Next_cycl_mode: ram_type1;
signal Next_cycl_mode_addr: integer:=1;
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

				process(sta)
begin
case
sta is
				when sta0=> 
					done<='0';
					out_TIP_MR_Next_cycl_mode_stor_inst<='0';
				when sta1=> 
					out_TIP_TIPC_Tele_inst<=RAM_TIP_Tele_inst(Tele_inst_addr);
					out_calc_inst<='1';
				when sta2=> 
					out_TIP_MR_Next_cycl_mode_stor_inst<='1';
					out_TIP_MR_Next_cycl_mode<=RAM_TIP_Next_cycl_mode(Next_cycl_mode_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_DMC_TIP_Tele_inst)
	begin
		RAM_TIP_Tele_inst(Tele_inst_addr)<=in_DMC_TIP_Tele_inst;
	end process;
	process(in_TIPC_TIP_Next_cycl_mode)
	begin
		RAM_TIP_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIPC_TIP_Next_cycl_mode;
	end process;

end Behavioral;