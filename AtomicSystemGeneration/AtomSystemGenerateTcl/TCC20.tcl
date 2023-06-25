create_project TCC20 ./AtomicSystemGeneration/AtomSystemProject/TCC20 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component TCC20 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_TCC_MR_Targ_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_TCC_MR_Targ_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_CCR_CCR_Tria_cont_quanSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_TCC_MR_Targ_angl_load_instSTD_LOGIC;

signal t_out_TCC_MR_Targ_angu_velo_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

TCC20_process:TCC20 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_TCC_MR_Targ_angl=> t_in_TCC_MR_Targ_angl,

in_ADR_ADR_Tria_atti_angl=> t_in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> t_in_ADR_ADR_Tria_angu_velo,

in_TCC_MR_Targ_angu_velo=> t_in_TCC_MR_Targ_angu_velo,

out_CCR_CCR_Tria_cont_quan=> t_out_CCR_CCR_Tria_cont_quan,

out_TCC_MR_Targ_angl_load_inst=> t_out_TCC_MR_Targ_angl_load_inst,

out_TCC_MR_Targ_angu_velo_load_inst=> t_out_TCC_MR_Targ_angu_velo_load_inst

);

end component;

"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TCC is

port(

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angle

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angular velocity

	in_CCC_TCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_CCC_TCC_Triaxial control quantity

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;--out_TCC_MR_Target angle load instruction

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC;--out_TCC_MR_Target angular velocity load instruction

	out_TCC_CCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_CCC_Triaxial attitude angle

	out_TCC_CCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_CCC_Triaxial angular velocity

	out_TCC_CCC_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_CCC_Target angle

	out_TCC_CCC_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_CCC_Target angular velocity

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_CCR_CCR_Triaxial control quantity

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end TCC;

architecture Behavioral of TCC is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TCC_Tria_atti_angl: ram_type0;

signal Tria_atti_angl_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TCC_Tria_angu_velo: ram_type1;

signal Tria_angu_velo_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TCC_Targ_angl: ram_type2;

signal Targ_angl_addr: integer:=1;

type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TCC_Targ_angu_velo: ram_type3;

signal Targ_angu_velo_addr: integer:=1;

type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_TCC_Tria_cont_quan: ram_type4;

signal Tria_cont_quan_addr: integer:=1;

Type states is (sta0,sta1,sta2,sta3,sta4);

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

					out_TCC_MR_Targ_angl_load_inst<='1';

				when sta2=> 

					out_TCC_MR_Targ_angu_velo_load_inst<='1';

					out_TCC_MR_Targ_angl_load_inst<='0';

				when sta3=> 

					out_TCC_CCC_Tria_atti_angl<=RAM_TCC_Tria_atti_angl(Tria_atti_angl_addr);

					out_calc_inst<='1';

					out_TCC_CCC_Tria_angu_velo<=RAM_TCC_Tria_angu_velo(Tria_angu_velo_addr);

					out_TCC_CCC_Targ_angl<=RAM_TCC_Targ_angl(Targ_angl_addr);

					out_TCC_CCC_Targ_angu_velo<=RAM_TCC_Targ_angu_velo(Targ_angu_velo_addr);

					out_TCC_MR_Targ_angu_velo_load_inst<='0';

				when sta4=> 

					out_CCR_CCR_Tria_cont_quan<=RAM_TCC_Tria_cont_quan(Tria_cont_quan_addr);

					Count:=0;

					done<='1';

					out_calc_inst<='0';

				end case;

	end process;

	process(in_ADR_ADR_Tria_atti_angl)

	begin

		RAM_TCC_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADR_ADR_Tria_atti_angl;

	end process;

	process(in_ADR_ADR_Tria_angu_velo)

	begin

		RAM_TCC_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADR_ADR_Tria_angu_velo;

	end process;

	process(in_TCC_MR_Targ_angl)

	begin

		RAM_TCC_Targ_angl(Targ_angl_addr)<=in_TCC_MR_Targ_angl;

	end process;

	process(in_TCC_MR_Targ_angu_velo)

	begin

		RAM_TCC_Targ_angu_velo(Targ_angu_velo_addr)<=in_TCC_MR_Targ_angu_velo;

	end process;

	process(in_CCC_TCC_Tria_cont_quan)

	begin

		RAM_TCC_Tria_cont_quan(Tria_cont_quan_addr)<=in_CCC_TCC_Tria_cont_quan;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC20.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC20.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/TCC20/TCC20.srcs/sources_1/new/TCC20.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity TCC20 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angle

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angular velocity

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_CCR_CCR_Triaxial control quantity

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;--out_TCC_MR_Target angle load instruction

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC--out_TCC_MR_Target angular velocity load instruction

);

end TCC20;

architecture Behavioral of TCC20 is

component TCC is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_CCC_TCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_MR_Targ_angl_load_inst:out STD_LOGIC;

	out_TCC_MR_Targ_angu_velo_load_inst:out STD_LOGIC;

	out_TCC_CCC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_TCC_CCC_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_CCR_CCR_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component CCC is

port(

	in_TCC_CCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_TCC_CCC_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_CCC_TCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_TCC_CCC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Targ_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_TCC_CCC_Targ_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_CCC_TCC_Tria_cont_quan:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

TCC_process:TCC port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,

in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,

in_TCC_MR_Targ_angl=> in_TCC_MR_Targ_angl,

in_TCC_MR_Targ_angu_velo=> in_TCC_MR_Targ_angu_velo,

in_CCC_TCC_Tria_cont_quan=> m_CCC_TCC_Tria_cont_quan,

out_TCC_MR_Targ_angl_load_inst=> out_TCC_MR_Targ_angl_load_inst,

out_TCC_MR_Targ_angu_velo_load_inst=> out_TCC_MR_Targ_angu_velo_load_inst,

out_TCC_CCC_Tria_atti_angl=> m_TCC_CCC_Tria_atti_angl,

out_TCC_CCC_Tria_angu_velo=> m_TCC_CCC_Tria_angu_velo,

out_TCC_CCC_Targ_angl=> m_TCC_CCC_Targ_angl,

out_TCC_CCC_Targ_angu_velo=> m_TCC_CCC_Targ_angu_velo,

out_CCR_CCR_Tria_cont_quan=> out_CCR_CCR_Tria_cont_quan,

out_calc_inst=> m_calc_inst

);

CCC_process:CCC port map(

in_TCC_CCC_Tria_atti_angl=> m_TCC_CCC_Tria_atti_angl,

in_TCC_CCC_Tria_angu_velo=> m_TCC_CCC_Tria_angu_velo,

in_TCC_CCC_Targ_angl=> m_TCC_CCC_Targ_angl,

in_TCC_CCC_Targ_angu_velo=> m_TCC_CCC_Targ_angu_velo,

in_calc_inst=> m_calc_inst,

out_CCC_TCC_Tria_cont_quan=> m_CCC_TCC_Tria_cont_quan

);

end Behavioral;
"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/TCC20 xilinx.com -library user -taxonomy /UserIP 
