create_project TIP13 ./AtomicSystemGeneration/AtomSystemProject/TIP13 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TIP13 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_DMC_TIP_Tele_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TIP_MR_Next_cycl_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TIP_MR_Next_cycl_mode_stor_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TIP13_process:TIP13 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_DMC_TIP_Tele_inst=> t_in_DMC_TIP_Tele_inst,

out_TIP_MR_Next_cycl_mode=> t_out_TIP_MR_Next_cycl_mode,

out_TIP_MR_Next_cycl_mode_stor_inst=> t_out_TIP_MR_Next_cycl_mode_stor_inst

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP.vhd" a]
puts $file "library IEEE;



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



    process(sta) --??????????????????????



    begin



        case sta is

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
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP13.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP13.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TIP13/TIP13.srcs/sources_1/new/TIP13.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TIP13 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_DMC_TIP_Telecontrol instruction

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TIP_MR_Next cycle mode

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC--out_TIP_MR_Next cycle mode storage instruction

);

end TIP13;

architecture Behavioral of TIP13 is

component TIP is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_DMC_TIP_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TIPC_TIP_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_TIPC_Tele_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;

	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TIPCC is

port(

	in_TIP_TIPC_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TIPC_TIP_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TIP_TIPC_Tele_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TIPC_TIP_Next_cycl_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TIP_process:TIP port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_DMC_TIP_Tele_inst=> in_DMC_TIP_Tele_inst,

in_TIPC_TIP_Next_cycl_mode=> m_TIPC_TIP_Next_cycl_mode,

out_TIP_TIPC_Tele_inst=> m_TIP_TIPC_Tele_inst,

out_TIP_MR_Next_cycl_mode_stor_inst=> out_TIP_MR_Next_cycl_mode_stor_inst,

out_TIP_MR_Next_cycl_mode=> out_TIP_MR_Next_cycl_mode,

out_calc_inst=> m_calc_inst

);

TIPCC_process:TIPCC port map(

in_TIP_TIPC_Tele_inst=> m_TIP_TIPC_Tele_inst,

in_calc_inst=> m_calc_inst,

out_TIPC_TIP_Next_cycl_mode=> m_TIPC_TIP_Next_cycl_mode

);

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TIP13 xilinx.com -library user -taxonomy /UserIP 
