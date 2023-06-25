create_project GCO5 ./AtomicSystemGeneration/AtomSystemProject/GCO5 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity GCO is

port(

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GI_Gyro power on instruction

	in_GCOC_GCO_Gyro_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCOCC_GCO_Gyro power on pulse

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC;--out_GCO_GI_Gyro power on instruction load instruction

	out_GCO_GCOC_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_GCOCC_Gyro power on instruction

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_G_Gyro power on pulse

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end GCO;

architecture Behavioral of GCO is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_GCO_Gyro_powe_on_inst: ram_type0;

signal Gyro_powe_on_inst_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_GCO_Gyro_powe_on_puls: ram_type1;

signal Gyro_powe_on_puls_addr: integer:=1;

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

					out_GCO_GI_Gyro_powe_on_inst_load_inst<='1';

				when sta2=> 

					out_GCO_GCOC_Gyro_powe_on_inst<=RAM_GCO_Gyro_powe_on_inst(Gyro_powe_on_inst_addr);

					out_calc_inst<='1';

					out_GCO_GI_Gyro_powe_on_inst_load_inst<='0';

				when sta3=> 

					out_GCO_G_Gyro_powe_on_puls<=RAM_GCO_Gyro_powe_on_puls(Gyro_powe_on_puls_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_GCO_GI_Gyro_powe_on_inst)

	begin

		RAM_GCO_Gyro_powe_on_inst(Gyro_powe_on_inst_addr)<=in_GCO_GI_Gyro_powe_on_inst;

	end process;

	process(in_GCOC_GCO_Gyro_powe_on_puls)

	begin

		RAM_GCO_Gyro_powe_on_puls(Gyro_powe_on_puls_addr)<=in_GCOC_GCO_Gyro_powe_on_puls;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO5.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO5.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/GCO5.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity GCO5 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GI_Gyro power on instruction

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GCO_G_Gyro power on pulse

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC--out_GCO_GI_Gyro power on instruction load instruction

);

end GCO5;

architecture Behavioral of GCO5 is

component GCO is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GCOC_GCO_Gyro_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC;

	out_GCO_GCOC_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component GCOCC is

port(

	in_GCO_GCOC_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_GCOC_GCO_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_GCO_GCOC_Gyro_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_GCOC_GCO_Gyro_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

GCO_process:GCO port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GCO_GI_Gyro_powe_on_inst=> in_GCO_GI_Gyro_powe_on_inst,

in_GCOC_GCO_Gyro_powe_on_puls=> m_GCOC_GCO_Gyro_powe_on_puls,

out_GCO_GI_Gyro_powe_on_inst_load_inst=> out_GCO_GI_Gyro_powe_on_inst_load_inst,

out_GCO_GCOC_Gyro_powe_on_inst=> m_GCO_GCOC_Gyro_powe_on_inst,

out_GCO_G_Gyro_powe_on_puls=> out_GCO_G_Gyro_powe_on_puls,

out_calc_inst=> m_calc_inst

);

GCOCC_process:GCOCC port map(

in_GCO_GCOC_Gyro_powe_on_inst=> m_GCO_GCOC_Gyro_powe_on_inst,

in_calc_inst=> m_calc_inst,

out_GCOC_GCO_Gyro_powe_on_puls=> m_GCOC_GCO_Gyro_powe_on_puls

);

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GCO5/GCO5.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component GCO5 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GCO_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_GCO_GI_Gyro_powe_on_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_GCO_G_Gyro_powe_on_pulsSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_GCO_GI_Gyro_powe_on_inst_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

GCO5_process:GCO5 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_GCO_GI_Gyro_powe_on_inst=> t_in_GCO_GI_Gyro_powe_on_inst,

out_GCO_G_Gyro_powe_on_puls=> t_out_GCO_G_Gyro_powe_on_puls,

out_GCO_GI_Gyro_powe_on_inst_load_inst=> t_out_GCO_GI_Gyro_powe_on_inst_load_inst

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/GCO5 xilinx.com -library user -taxonomy /UserIP 
