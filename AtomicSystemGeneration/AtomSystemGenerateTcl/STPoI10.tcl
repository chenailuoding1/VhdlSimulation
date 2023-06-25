create_project STPoI10 ./AtomicSystemGeneration/AtomSystemProject/STPoI10 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/STPoI10.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/STPoI10.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/STPoI10.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity STPoI10 is

port(

	out_STPo_TPI_Thru_powe_on_inst_stor_inst:out STD_LOGIC;--out_STPonI_TPI_Thruster power on instruction storage instruction

	out_STPo_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_STPonI_TPI_Thruster power on instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end STPoI10;

architecture Behavioral of STPoI10 is

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

					out_STPo_TPI_Thru_powe_on_inst_stor_inst<='0';

				when sta1=> 

					out_STPo_TPI_Thru_powe_on_inst_stor_inst<='1';

					out_STPo_TPI_Thru_powe_on_inst<=RAM_STPoI10_Thru_powe_on_inst(Thru_powe_on_inst_addr);

					Count:=0;

					done<='1';

				end case;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/STPoI10/STPoI10.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component STPonI is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	out_STPo_TPI_Thru_powe_on_inst_stor_inst:out STD_LOGIC;

	out_STPo_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_out_STPo_TPI_Thru_powe_on_inst_stor_instSTD_LOGIC;

signal t_out_STPo_TPI_Thru_powe_on_instSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

STPonI_process:STPonI port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

out_STPo_TPI_Thru_powe_on_inst_stor_inst=> t_out_STPo_TPI_Thru_powe_on_inst_stor_inst,

out_STPo_TPI_Thru_powe_on_inst=> t_out_STPo_TPI_Thru_powe_on_inst

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/STPoI10 xilinx.com -library user -taxonomy /UserIP 
