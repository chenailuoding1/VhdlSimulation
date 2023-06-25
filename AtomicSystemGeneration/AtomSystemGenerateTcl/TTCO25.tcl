create_project TTCO25 ./AtomicSystemGeneration/AtomSystemProject/TTCO25 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TTCO25 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_TTI_TTI_Tria_cont_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TTCO_TCT_Tria_cont_signSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TTCO25_process:TTCO25 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_TTI_TTI_Tria_cont_inst=> t_in_TTI_TTI_Tria_cont_inst,

out_TTCO_TCT_Tria_cont_sign=> t_out_TTCO_TCT_Tria_cont_sign

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO.vhd" a]
puts $file "library IEEE;



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
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO25.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO25.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTCO25/TTCO25.srcs/sources_1/new/TTCO25.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TTCO25 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTI_TTI_Triaxial control instruction

	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCO_TCT_Triaxial control signal

);

end TTCO25;

architecture Behavioral of TTCO25 is

component TTCO is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TTI_TTI_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TTCO_TTCO_Tria_cont_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTCO_TTCO_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTCO_TCT_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TTCOCC is

port(

	in_TTCO_TTCO_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TTCO_TTCO_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TTCO_TTCO_Tria_cont_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TTCO_TTCO_Tria_cont_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TTCO_process:TTCO port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_TTI_TTI_Tria_cont_inst=> in_TTI_TTI_Tria_cont_inst,

in_TTCO_TTCO_Tria_cont_sign=> m_TTCO_TTCO_Tria_cont_sign,

out_TTCO_TTCO_Tria_cont_inst=> m_TTCO_TTCO_Tria_cont_inst,

out_TTCO_TCT_Tria_cont_sign=> out_TTCO_TCT_Tria_cont_sign,

out_calc_inst=> m_calc_inst

);

TTCOCC_process:TTCOCC port map(

in_TTCO_TTCO_Tria_cont_inst=> m_TTCO_TTCO_Tria_cont_inst,

in_calc_inst=> m_calc_inst,

out_TTCO_TTCO_Tria_cont_sign=> m_TTCO_TTCO_Tria_cont_sign

);

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TTCO25 xilinx.com -library user -taxonomy /UserIP 
