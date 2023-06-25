create_project GDA15 ./AtomicSystemGeneration/AtomSystemProject/GDA15 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA.vhd" a]
puts $file "library IEEE;



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
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA15.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA15.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/GDA15.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity GDA15 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Pulse count

	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_G_Gyro power state

	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;--out_GDA_G_Gyro power state perception instruction

	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;--out_GDA_G_Pulse count acquisition instruction

	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Angular velocity analog

	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GD_GD_Gyro power state

);

end GDA15;

architecture Behavioral of GDA15 is

component GDA is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GDAC_GDA_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;

	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;

	out_GDA_GDAC_Puls_coun:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component GDACC is

port(

	in_GDA_GDAC_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_GDAC_GDA_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_GDA_GDAC_Puls_coun:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_GDAC_GDA_Angu_velo_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

GDA_process:GDA port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GDA_G_Puls_coun=> in_GDA_G_Puls_coun,

in_GDA_G_Gyro_powe_stat=> in_GDA_G_Gyro_powe_stat,

in_GDAC_GDA_Angu_velo_anal=> m_GDAC_GDA_Angu_velo_anal,

out_GDA_G_Puls_coun_acqu_inst=> out_GDA_G_Puls_coun_acqu_inst,

out_GDA_G_Gyro_powe_stat_perc_inst=> out_GDA_G_Gyro_powe_stat_perc_inst,

out_GDA_GDAC_Puls_coun=> m_GDA_GDAC_Puls_coun,

out_GD_GD_Angu_velo_anal=> out_GD_GD_Angu_velo_anal,

out_GD_GD_Gyro_powe_stat=> out_GD_GD_Gyro_powe_stat,

out_calc_inst=> m_calc_inst

);

GDACC_process:GDACC port map(

in_GDA_GDAC_Puls_coun=> m_GDA_GDAC_Puls_coun,

in_calc_inst=> m_calc_inst,

out_GDAC_GDA_Angu_velo_anal=> m_GDAC_GDA_Angu_velo_anal

);

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/GDA15/GDA15.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component GDA15 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GDA_G_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_GDA_G_Gyro_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC;

	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;

	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_GDA_G_Puls_counSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_GDA_G_Gyro_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_GDA_G_Gyro_powe_stat_perc_instSTD_LOGIC;

signal t_out_GDA_G_Puls_coun_acqu_instSTD_LOGIC;

signal t_out_GD_GD_Angu_velo_analSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_GD_GD_Gyro_powe_statSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

GDA15_process:GDA15 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_GDA_G_Puls_coun=> t_in_GDA_G_Puls_coun,

in_GDA_G_Gyro_powe_stat=> t_in_GDA_G_Gyro_powe_stat,

out_GDA_G_Gyro_powe_stat_perc_inst=> t_out_GDA_G_Gyro_powe_stat_perc_inst,

out_GDA_G_Puls_coun_acqu_inst=> t_out_GDA_G_Puls_coun_acqu_inst,

out_GD_GD_Angu_velo_anal=> t_out_GD_GD_Angu_velo_anal,

out_GD_GD_Gyro_powe_stat=> t_out_GD_GD_Gyro_powe_stat

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/GDA15 xilinx.com -library user -taxonomy /UserIP 
