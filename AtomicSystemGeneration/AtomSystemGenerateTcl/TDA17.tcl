create_project TDA17 ./AtomicSystemGeneration/AtomSystemProject/TDA17 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TDA is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TDA_TCT_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TDA_TCT_Thru_powe_stat_perc_inst:out STD_LOGIC;

	out_TD_TD_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_TDA_TCT_Thru_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TDA_TCT_Thru_powe_stat_perc_instSTD_LOGIC;

signal t_out_TD_TD_Thru_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TDA_process:TDA port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_TDA_TCT_Thru_powe_stat=> t_in_TDA_TCT_Thru_powe_stat,

out_TDA_TCT_Thru_powe_stat_perc_inst=> t_out_TDA_TCT_Thru_powe_stat_perc_inst,

out_TD_TD_Thru_powe_stat=> t_out_TD_TD_Thru_powe_stat

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/TDA17.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/TDA17.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TDA17/TDA17.srcs/sources_1/new/TDA17.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TDA17 is

port(

	in_TDA_TCT_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDA_TCT_Thruster power state

	out_TDA_TCT_Thru_powe_stat_perc_inst:out STD_LOGIC;--out_TDA_TCT_Thruster power state perception instruction

	out_TD_TD_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TD_TD_Thruster power state

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TDA17;

architecture Behavioral of TDA17 is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TDA17_Thru_powe_stat: ram_type0;

signal Thru_powe_stat_addr: integer:=1;

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

					out_TDA_TCT_Thru_powe_stat_perc_inst<='1';

				when sta2=> 

					out_TD_TD_Thru_powe_stat<=RAM_TDA17_Thru_powe_stat(Thru_powe_stat_addr);

					Count:=0;

					done<='1';

					out_TDA_TCT_Thru_powe_stat_perc_inst<='0';

				end case;

	end process;

	process(in_TDA_TCT_Thru_powe_stat)

	begin

		RAM_TDA17_Thru_powe_stat(Thru_powe_stat_addr)<=in_TDA_TCT_Thru_powe_stat;

	end process;

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TDA17 xilinx.com -library user -taxonomy /UserIP 
