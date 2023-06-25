create_project TTC24 ./AtomicSystemGeneration/AtomSystemProject/TTC24 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TTC24 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_TDCR_TDCR_Thru_comb_logiSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TTI_TTI_Tria_cont_instSTD_LOGIC_VECTOR ( 31 downto 0 );

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TTC24_process:TTC24 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_TDCR_TDCR_Thru_comb_logi=> t_in_TDCR_TDCR_Thru_comb_logi,

out_TTI_TTI_Tria_cont_inst=> t_out_TTI_TTI_Tria_cont_inst

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TTC is

port(

	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDCR_TDCR_Thruster combination logic

	in_TTCC_TTC_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTCCC_TTC_Triaxial control instruction

	out_TTC_TTCC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TTC_TTCCC_Thruster combination logic

	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TTI_TTI_Triaxial control instruction

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TTC;

architecture Behavioral of TTC is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TTC_Thru_comb_logi: ram_type0;

signal Thru_comb_logi_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TTC_Tria_cont_inst: ram_type1;

signal Tria_cont_inst_addr: integer:=1;

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

					out_TTC_TTCC_Thru_comb_logi<=RAM_TTC_Thru_comb_logi(Thru_comb_logi_addr);

					out_calc_inst<='1';

				when sta2=> 

					out_TTI_TTI_Tria_cont_inst<=RAM_TTC_Tria_cont_inst(Tria_cont_inst_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_TDCR_TDCR_Thru_comb_logi)

	begin

		RAM_TTC_Thru_comb_logi(Thru_comb_logi_addr)<=in_TDCR_TDCR_Thru_comb_logi;

	end process;

	process(in_TTCC_TTC_Tria_cont_inst)

	begin

		RAM_TTC_Tria_cont_inst(Tria_cont_inst_addr)<=in_TTCC_TTC_Tria_cont_inst;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC24.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC24.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TTC24/TTC24.srcs/sources_1/new/TTC24.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TTC24 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDCR_TDCR_Thruster combination logic

	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTI_TTI_Triaxial control instruction

);

end TTC24;

architecture Behavioral of TTC24 is

component TTC is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TDCR_TDCR_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TTCC_TTC_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTC_TTCC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TTI_TTI_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TTCCC is

port(

	in_TTC_TTCC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TTCC_TTC_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TTC_TTCC_Thru_comb_logi:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TTCC_TTC_Tria_cont_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TTC_process:TTC port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_TDCR_TDCR_Thru_comb_logi=> in_TDCR_TDCR_Thru_comb_logi,

in_TTCC_TTC_Tria_cont_inst=> m_TTCC_TTC_Tria_cont_inst,

out_TTC_TTCC_Thru_comb_logi=> m_TTC_TTCC_Thru_comb_logi,

out_TTI_TTI_Tria_cont_inst=> out_TTI_TTI_Tria_cont_inst,

out_calc_inst=> m_calc_inst

);

TTCCC_process:TTCCC port map(

in_TTC_TTCC_Thru_comb_logi=> m_TTC_TTCC_Thru_comb_logi,

in_calc_inst=> m_calc_inst,

out_TTCC_TTC_Tria_cont_inst=> m_TTCC_TTC_Tria_cont_inst

);

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TTC24 xilinx.com -library user -taxonomy /UserIP 
