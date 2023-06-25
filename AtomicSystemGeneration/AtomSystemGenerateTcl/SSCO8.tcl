create_project SSCO8 ./AtomicSystemGeneration/AtomSystemProject/SSCO8 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO.vhd" a]
puts $file "library IEEE;



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
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO8.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO8.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/SSCO8.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity SSCO8 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SSI_Sun sensor power on instruction

	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSCO_SS_Sun sensor power on pulse

	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC--out_SSCO_SSI_Sun sensor power on instruction load instruction

);

end SSCO8;

architecture Behavioral of SSCO8 is

component SSCO is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSCO_SSCO_Sun_sens_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC;

	out_SSCO_SSCO_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component SSCOCC is

port(

	in_SSCO_SSCO_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_SSCO_SSCO_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_SSCO_SSCO_Sun_sens_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_SSCO_SSCO_Sun_sens_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

SSCO_process:SSCO port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_SSCO_SSI_Sun_sens_powe_on_inst=> in_SSCO_SSI_Sun_sens_powe_on_inst,

in_SSCO_SSCO_Sun_sens_powe_on_puls=> m_SSCO_SSCO_Sun_sens_powe_on_puls,

out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst=> out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst,

out_SSCO_SSCO_Sun_sens_powe_on_inst=> m_SSCO_SSCO_Sun_sens_powe_on_inst,

out_SSCO_SS_Sun_sens_powe_on_puls=> out_SSCO_SS_Sun_sens_powe_on_puls,

out_calc_inst=> m_calc_inst

);

SSCOCC_process:SSCOCC port map(

in_SSCO_SSCO_Sun_sens_powe_on_inst=> m_SSCO_SSCO_Sun_sens_powe_on_inst,

in_calc_inst=> m_calc_inst,

out_SSCO_SSCO_Sun_sens_powe_on_puls=> m_SSCO_SSCO_Sun_sens_powe_on_puls

);

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/SSCO8/SSCO8.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component SSCO8 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_SSCO_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SS_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_SSCO_SSI_Sun_sens_powe_on_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_SSCO_SS_Sun_sens_powe_on_pulsSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_SSCO_SSI_Sun_sens_powe_on_inst_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

SSCO8_process:SSCO8 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_SSCO_SSI_Sun_sens_powe_on_inst=> t_in_SSCO_SSI_Sun_sens_powe_on_inst,

out_SSCO_SS_Sun_sens_powe_on_puls=> t_out_SSCO_SS_Sun_sens_powe_on_puls,

out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst=> t_out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/SSCO8 xilinx.com -library user -taxonomy /UserIP 
