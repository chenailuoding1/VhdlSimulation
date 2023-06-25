create_project AD18 ./AtomicSystemGeneration/AtomSystemProject/AD18 -part xc7k70tfbv676-1
set_property target_language VHDL [current_project]
file mkdir ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new
close [ open ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity AD is

port(

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GD_GD_Angular velocity analog

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun measurement angle

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_MR_Current mode

	in_ADCC_AD_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADCC_AD_Triaxial attitude angle

	in_ADCC_AD_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADCC_AD_Triaxial angular velocity

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC;--out_AD_MR_Current mode load instruction

	out_AD_ADCC_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Angular velocity analog

	out_AD_ADCC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Sun visible sign

	out_AD_ADCC_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Sun measurement angle

	out_AD_ADCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_ADCC_Current mode

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial attitude angle

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial angular velocity

	out_calc_inst:out STD_LOGIC;--out_calculate instruction

    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型



    clk:in std_logic;



    start:in std_logic;



    done:out std_logic;



    rst:in std_logic



);



end AD;

architecture Behavioral of AD is

shared variable Count: integer:=0;

type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Angu_velo_anal: ram_type0;

signal Angu_velo_anal_addr: integer:=1;

type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Sun_visi_sign: ram_type1;

signal Sun_visi_sign_addr: integer:=1;

type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Sun_meas_angl: ram_type2;

signal Sun_meas_angl_addr: integer:=1;

type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Curr_mode: ram_type3;

signal Curr_mode_addr: integer:=1;

type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Tria_atti_angl: ram_type4;

signal Tria_atti_angl_addr: integer:=1;

type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );

signal RAM_AD_Tria_angu_velo: ram_type5;

signal Tria_angu_velo_addr: integer:=1;

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

					out_AD_MR_Curr_mode_load_inst<='1';

				when sta2=> 

					out_AD_ADCC_Angu_velo_anal<=RAM_AD_Angu_velo_anal(Angu_velo_anal_addr);

					out_calc_inst<='1';

					out_AD_ADCC_Sun_visi_sign<=RAM_AD_Sun_visi_sign(Sun_visi_sign_addr);

					out_AD_ADCC_Sun_meas_angl<=RAM_AD_Sun_meas_angl(Sun_meas_angl_addr);

					out_AD_ADCC_Curr_mode<=RAM_AD_Curr_mode(Curr_mode_addr);

					out_AD_MR_Curr_mode_load_inst<='0';

				when sta3=> 

					out_ADR_ADR_Tria_atti_angl<=RAM_AD_Tria_atti_angl(Tria_atti_angl_addr);

					out_calc_inst<='0';

				when sta4=> 

					out_ADR_ADR_Tria_angu_velo<=RAM_AD_Tria_angu_velo(Tria_angu_velo_addr);

					Count:=0;

					done<='1';

				end case;

	end process;

	process(in_GD_GD_Angu_velo_anal)

	begin

		RAM_AD_Angu_velo_anal(Angu_velo_anal_addr)<=in_GD_GD_Angu_velo_anal;

	end process;

	process(in_SSD_SSD_Sun_visi_sign)

	begin

		RAM_AD_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSD_SSD_Sun_visi_sign;

	end process;

	process(in_SSD_SSD_Sun_meas_angl)

	begin

		RAM_AD_Sun_meas_angl(Sun_meas_angl_addr)<=in_SSD_SSD_Sun_meas_angl;

	end process;

	process(in_AD_MR_Curr_mode)

	begin

		RAM_AD_Curr_mode(Curr_mode_addr)<=in_AD_MR_Curr_mode;

	end process;

	process(in_ADCC_AD_Tria_atti_angl)

	begin

		RAM_AD_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADCC_AD_Tria_atti_angl;

	end process;

	process(in_ADCC_AD_Tria_angu_velo)

	begin

		RAM_AD_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADCC_AD_Tria_angu_velo;

	end process;

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD18.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD18.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/AD18.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;



entity AD18 is

port(

clk:in STD_LOGIC;

rst:in STD_LOGIC;

done:out STD_LOGIC;

start:in STD_LOGIC;

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GD_GD_Angular velocity analog

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_MR_Current mode

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun measurement angle

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial attitude angle

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADR_ADR_Triaxial angular velocity

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC--out_AD_MR_Current mode load instruction

);

end AD18;

architecture Behavioral of AD18 is

component AD is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADCC_AD_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_ADCC_AD_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC;

	out_AD_ADCC_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_ADCC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_calc_inst:out STD_LOGIC

);

end component;

component ADCC is

port(

	in_AD_ADCC_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_ADCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_calc_inst:in STD_LOGIC;

	out_ADCC_AD_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADCC_AD_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )

);

end component;

	signal m_AD_ADCC_Angu_velo_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Sun_visi_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Sun_meas_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_AD_ADCC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_calc_inst:STD_LOGIC;--

	signal m_ADCC_AD_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--

	signal m_ADCC_AD_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--

begin

AD_process:AD port map(

clk=>clk,

start=>start,

done=>done,

rst=>rst,

in_GD_GD_Angu_velo_anal=> in_GD_GD_Angu_velo_anal,

in_SSD_SSD_Sun_visi_sign=> in_SSD_SSD_Sun_visi_sign,

in_SSD_SSD_Sun_meas_angl=> in_SSD_SSD_Sun_meas_angl,

in_AD_MR_Curr_mode=> in_AD_MR_Curr_mode,

in_ADCC_AD_Tria_atti_angl=> m_ADCC_AD_Tria_atti_angl,

in_ADCC_AD_Tria_angu_velo=> m_ADCC_AD_Tria_angu_velo,

out_AD_MR_Curr_mode_load_inst=> out_AD_MR_Curr_mode_load_inst,

out_AD_ADCC_Angu_velo_anal=> m_AD_ADCC_Angu_velo_anal,

out_AD_ADCC_Sun_visi_sign=> m_AD_ADCC_Sun_visi_sign,

out_AD_ADCC_Sun_meas_angl=> m_AD_ADCC_Sun_meas_angl,

out_AD_ADCC_Curr_mode=> m_AD_ADCC_Curr_mode,

out_ADR_ADR_Tria_atti_angl=> out_ADR_ADR_Tria_atti_angl,

out_ADR_ADR_Tria_angu_velo=> out_ADR_ADR_Tria_angu_velo,

out_calc_inst=> m_calc_inst

);

ADCC_process:ADCC port map(

in_AD_ADCC_Angu_velo_anal=> m_AD_ADCC_Angu_velo_anal,

in_AD_ADCC_Sun_visi_sign=> m_AD_ADCC_Sun_visi_sign,

in_AD_ADCC_Sun_meas_angl=> m_AD_ADCC_Sun_meas_angl,

in_AD_ADCC_Curr_mode=> m_AD_ADCC_Curr_mode,

in_calc_inst=> m_calc_inst,

out_ADCC_AD_Tria_atti_angl=> m_ADCC_AD_Tria_atti_angl,

out_ADCC_AD_Tria_angu_velo=> m_ADCC_AD_Tria_angu_velo

);

end Behavioral;
"
close $file
close [ open ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/tb_test.vhd w ]
add_files ./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/tb_test.vhd
set file [open "./AtomicSystemGeneration/AtomSystemProject/AD18/AD18.srcs/sources_1/new/tb_test.vhd" a]
puts $file "library IEEE;



use IEEE.STD_LOGIC_1164.ALL;



use IEEE.std_logic_unsigned.All;



USE ieee.numeric_std.ALL;







entity tb_test is



--  Port ( );



end tb_test;







architecture Behavioral of tb_test is

component AD18 is

port(

clk:in std_logic;

start:in std_logic;

done:out std_logic;

rst:in std_logic;

	in_GD_GD_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );

	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_ADR_ADR_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );

	out_AD_MR_Curr_mode_load_inst:out STD_LOGIC

);

end component;

signal t_clk:std_logic;

signal t_start: std_logic;

signal t_done: std_logic;

signal t_rst: std_logic;

signal t_in_GD_GD_Angu_velo_analSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_SSD_SSD_Sun_visi_signSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_AD_MR_Curr_modeSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_in_SSD_SSD_Sun_meas_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_ADR_ADR_Tria_atti_anglSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_ADR_ADR_Tria_angu_veloSTD_LOGIC_VECTOR ( 31 downto 0 );

signal t_out_AD_MR_Curr_mode_load_instSTD_LOGIC;

constant period : time := 2 us;

begin

t_clk <= not t_clk after period/2;

process

begin

AD18_process:AD18 port map(

clk=>t_clk,

start=>t_start,

done=>t_done,

rst=>t_rst,

in_GD_GD_Angu_velo_anal=> t_in_GD_GD_Angu_velo_anal,

in_SSD_SSD_Sun_visi_sign=> t_in_SSD_SSD_Sun_visi_sign,

in_AD_MR_Curr_mode=> t_in_AD_MR_Curr_mode,

in_SSD_SSD_Sun_meas_angl=> t_in_SSD_SSD_Sun_meas_angl,

out_ADR_ADR_Tria_atti_angl=> t_out_ADR_ADR_Tria_atti_angl,

out_ADR_ADR_Tria_angu_velo=> t_out_ADR_ADR_Tria_angu_velo,

out_AD_MR_Curr_mode_load_inst=> t_out_AD_MR_Curr_mode_load_inst

);

end component;

"
close $file
ipx::package_project -root_dir ./AtomicSystemGeneration/AtomSystemProject/AD18 xilinx.com -library user -taxonomy /UserIP 
