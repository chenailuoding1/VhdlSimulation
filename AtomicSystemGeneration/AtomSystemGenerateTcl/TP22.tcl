create_project TP22 ./AtomicSystemGeneration/AtomSystemProject/TP22 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TP22 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_TP_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TP_DMC_Tele_data_tran_instSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TP_MR_Curr_mode_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TP22_process:TP22 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_ADR_ADR_Tria_atti_angl=> t_in_ADR_ADR_Tria_atti_angl,

in_TP_MR_Curr_mode=> t_in_TP_MR_Curr_mode,

in_ADR_ADR_Tria_angu_velo=> t_in_ADR_ADR_Tria_angu_velo,

out_TP_DMC_Tele_data_tran_inst=> t_out_TP_DMC_Tele_data_tran_inst,

out_TP_MR_Curr_mode_load_inst=> t_out_TP_MR_Curr_mode_load_inst

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TP is

port(

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_MR_Current mode

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_TPCC_TP_Tele_data:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCC_TP_Telemetry data

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC;--out_TP_MR_Current mode load instruction

	out_TP_TPCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Current mode

	out_TP_TPCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Triaxial attitude angle

	out_TP_TPCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_TPCC_Triaxial angular velocity

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_DMC_Telemetry data transmission instruction

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TP;

architecture Behavioral of TP is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Curr_mode: ram_type0;

signal Curr_mode_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tria_atti_angl: ram_type1;

signal Tria_atti_angl_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tria_angu_velo: ram_type2;

signal Tria_angu_velo_addr: integer:=1;

type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TP_Tele_data: ram_type3;

signal Tele_data_addr: integer:=1;

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

					out_TP_MR_Curr_mode_load_inst<='1';

				when sta2=> 

					out_TP_TPCC_Curr_mode<=RAM_TP_Curr_mode(Curr_mode_addr);

					out_calc_inst<='1';

					out_TP_TPCC_Tria_atti_angl<=RAM_TP_Tria_atti_angl(Tria_atti_angl_addr);

					out_TP_TPCC_Tria_angu_velo<=RAM_TP_Tria_angu_velo(Tria_angu_velo_addr);

					out_TP_MR_Curr_mode_load_inst<='0';

				when sta3=> 

					out_TP_DMC_Tele_data_tran_inst<=RAM_TP_Tele_data_tran_inst(Tele_data_tran_inst_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_TP_MR_Curr_mode)

	begin

		RAM_TP_Curr_mode(Curr_mode_addr)<=in_TP_MR_Curr_mode;

	end process;

	process(in_ADR_ADR_Tria_atti_angl)

	begin

		RAM_TP_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADR_ADR_Tria_atti_angl;

	end process;

	process(in_ADR_ADR_Tria_angu_velo)

	begin

		RAM_TP_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADR_ADR_Tria_angu_velo;

	end process;

	process(in_TPCC_TP_Tele_data)

	begin

		RAM_TP_Tele_data(Tele_data_addr)<=in_TPCC_TP_Tele_data;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP22.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP22.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TP22/TP22.srcs/sources_1/new/TP22.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TP22 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_MR_Current mode

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_DMC_Telemetry data transmission instruction

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC--out_TP_MR_Current mode load instruction

);

end TP22;

architecture Behavioral of TP22 is

component TP is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TP_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TPCC_TP_Tele_data:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_MR_Curr_mode_load_inst:out STD_LOGIC;

	out_TP_TPCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_TPCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_TPCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TP_DMC_Tele_data_tran_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component TPCC is

port(

	in_TP_TPCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_TPCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TP_TPCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_TPCC_TP_Tele_data:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TP_TPCC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TP_TPCC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TP_TPCC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_TPCC_TP_Tele_data:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TP_process:TP port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_TP_MR_Curr_mode=> in_TP_MR_Curr_mode,

in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,

in_TPCC_TP_Tele_data=> m_TPCC_TP_Tele_data,

out_TP_MR_Curr_mode_load_inst=> out_TP_MR_Curr_mode_load_inst,

out_TP_TPCC_Curr_mode=> m_TP_TPCC_Curr_mode,

out_TP_TPCC_Tria_atti_angl=> m_TP_TPCC_Tria_atti_angl,

out_TP_TPCC_Tria_angu_velo=> m_TP_TPCC_Tria_angu_velo,

out_TP_DMC_Tele_data_tran_inst=> out_TP_DMC_Tele_data_tran_inst,

out_calc_inst=> m_calc_inst

);

TPCC_process:TPCC port map(

in_TP_TPCC_Curr_mode=> m_TP_TPCC_Curr_mode,

in_TP_TPCC_Tria_atti_angl=> m_TP_TPCC_Tria_atti_angl,

in_TP_TPCC_Tria_angu_velo=> m_TP_TPCC_Tria_angu_velo,

in_calc_inst=> m_calc_inst,

out_TPCC_TP_Tele_data=> m_TPCC_TP_Tele_data

);

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TP22 xilinx.com -library user -taxonomy /UserIP 
