create_project MI12 ./AtomicSystemGeneration/AtomSystemProject/MI12 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/MI12.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/MI12.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/MI12.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity MI12 is

port(

	out_MI_MR_Curr_mode_stor_inst:out STD_LOGIC;--out_MI_MR_Current mode storage instruction

	out_MI_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MI_MR_Current mode

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end MI12;

architecture Behavioral of MI12 is

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

					out_MI_MR_Curr_mode_stor_inst<='0';

				when sta1=> 

					out_MI_MR_Curr_mode_stor_inst<='1';

					out_MI_MR_Curr_mode<=RAM_MI12_Curr_mode(Curr_mode_addr);

					Count:=0;

					done<='1';

				end case;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/MI12/MI12.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component MI is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	out_MI_MR_Curr_mode_stor_inst:out STD_LOGIC;

	out_MI_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_out_MI_MR_Curr_mode_stor_instSTD_LOGIC;

signal t_out_MI_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

MI_process:MI port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

out_MI_MR_Curr_mode_stor_inst=> t_out_MI_MR_Curr_mode_stor_inst,

out_MI_MR_Curr_mode=> t_out_MI_MR_Curr_mode

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/MI12 xilinx.com -library user -taxonomy /UserIP 
