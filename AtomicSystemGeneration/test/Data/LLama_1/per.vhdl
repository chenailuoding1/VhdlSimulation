library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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
	in_SSD_SSD_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun measurement angle
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign
	in_AD_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_MR_Current mode
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity ADCC is
port(
	in_AD_ADCC_Angu_velo_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Angular velocity analog
	in_AD_ADCC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Sun visible sign
	in_AD_ADCC_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Sun measurement angle
	in_AD_ADCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_AD_ADCC_Current mode
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_ADCC_AD_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_ADCC_AD_Triaxial attitude angle
	out_ADCC_AD_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_ADCC_AD_Triaxial angular velocity
);
end ADCC;
architecture Behavioral of ADCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
                out_ADCC_AD_Tria_atti_angl<=in_AD_ADCC_Angu_velo_anal;
                out_ADCC_AD_Tria_angu_velo<=in_AD_ADCC_Sun_meas_angl;
--由输入端口in_AD_ADCC_Angu_velo_anal、in_AD_ADCC_Sun_visi_sign、in_AD_ADCC_Sun_meas_angl、in_AD_ADCC_Curr_mode、得到输出端口out_ADCC_AD_Tria_atti_angl、out_ADCC_AD_Tria_angu_velo、
            end if;

	end process;



end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity DMC is
port(
	in_TP_DMC_Tele_data_tran_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_DMC_Telemetry data transmission instruction
	out_DMC_TIP_Tele_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_DMC_TIP_Telecontrol instruction
);
end DMC;
architecture Behavioral of DMC is
begin
--需要用户补全的信息




end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity DA14Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start2:out std_logic;
done2:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end DA14Dependency;
architecture Behavioral of DA14Dependency is
Type states is (st0,st1,st2) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1,done2) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
start2<='0';
elsif start='1' then
start0<='1';
start1<='0';
start2<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
start2<='0';
if done1='1' then
	next_sta<=st2;
else
	next_sta<=st1;
end if;
when st2=>
start0<='0';
start1<='0';
start2<='1';
if done2='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st2;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity GI3Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end GI3Dependency;
architecture Behavioral of GI3Dependency is
Type states is (st0,st1) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
elsif start='1' then
start0<='1';
start1<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
if done1='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st1;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity I1Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start2:out std_logic;
done2:in std_logic;
start3:out std_logic;
done3:in std_logic;
start4:out std_logic;
done4:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end I1Dependency;
architecture Behavioral of I1Dependency is
Type states is (st0,st1,st2,st3,st4) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1,done2,done3,done4) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
elsif start='1' then
start0<='1';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
start2<='0';
start3<='0';
start4<='0';
if done1='1' then
	next_sta<=st2;
else
	next_sta<=st1;
end if;
when st2=>
start0<='0';
start1<='0';
start2<='1';
start3<='0';
start4<='0';
if done2='1' then
	next_sta<=st3;
else
	next_sta<=st2;
end if;
when st3=>
start0<='0';
start1<='0';
start2<='0';
start3<='1';
start4<='0';
if done3='1' then
	next_sta<=st4;
else
	next_sta<=st3;
end if;
when st4=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='1';
if done4='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st4;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity SSI6Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end SSI6Dependency;
architecture Behavioral of SSI6Dependency is
Type states is (st0,st1) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
elsif start='1' then
start0<='1';
start1<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
if done1='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st1;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity SSS0Dependency is
port(
timeout:in std_logic;
start0:out std_logic;done0:in std_logic;
start1:out std_logic;done1:in std_logic;
start2:out std_logic;done2:in std_logic;
start3:out std_logic;done3:in std_logic;
start4:out std_logic;done4:in std_logic;
start5:out std_logic;done5:in std_logic;
start6:out std_logic;done6:in std_logic;
start7:out std_logic;done7:in std_logic;
start8:out std_logic;done8:in std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end SSS0Dependency;
architecture Behavioral of SSS0Dependency is
Type states is (st0,st1,st2,st3,st4,st5,st6,st7,st8) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,done0,done1,done2,done3,done4,done5,done6,done7,done8) is
begin

        case current_sta is
when st0=>
start0<='1';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
when st1=>
start0<='0';
start1<='1';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done1='1' then
	next_sta<=st2;
else
	next_sta<=st1;
end if;
when st2=>
start0<='0';
start1<='0';
start2<='1';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done2='1' then
	next_sta<=st3;
else
	next_sta<=st2;
end if;
when st3=>
start0<='0';
start1<='0';
start2<='0';
start3<='1';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done3='1' then
	next_sta<=st4;
else
	next_sta<=st3;
end if;
when st4=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='1';
start5<='0';
start6<='0';
start7<='0';
start8<='0';
if done4='1' then
	next_sta<=st5;
else
	next_sta<=st4;
end if;
when st5=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='1';
start6<='0';
start7<='0';
start8<='0';
if done5='1' then
	next_sta<=st6;
else
	next_sta<=st5;
end if;
when st6=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='1';
start7<='0';
start8<='0';
if done6='1' then
	next_sta<=st7;
else
	next_sta<=st6;
end if;
when st7=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='1';
start8<='0';
when st8=>
start0<='0';
start1<='0';
start2<='0';
start3<='0';
start4<='0';
start5<='0';
start6<='0';
start7<='0';
start8<='1';
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity TI9Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end TI9Dependency;
architecture Behavioral of TI9Dependency is
Type states is (st0,st1) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
elsif start='1' then
start0<='1';
start1<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
if done1='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st1;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity TTC23Dependency is
port(
start0:out std_logic;
done0:in std_logic;
start1:out std_logic;
done1:in std_logic;
start:in std_logic;
done:out std_logic;
        clk:in std_logic;

        rst:in std_logic



    );

end TTC23Dependency;
architecture Behavioral of TTC23Dependency is
Type states is (st0,st1) ;
signal current_sta,next_sta:states;

begin
sta_pro:process(current_sta,start,done0,done1) is
begin

        case current_sta is
when st0=>
done<='0';
if start='0' then
start0<='0';
start1<='0';
elsif start='1' then
start0<='1';
start1<='0';
if done0='1' then
	next_sta<=st1;
else
	next_sta<=st0;
end if;
end if;
when st1=>
start0<='0';
start1<='1';
if done1='1' then
	next_sta<=st0;	done<='1';
else
	next_sta<=st1;
end if;
end case;

    end process;

    process(clk,rst) --??

    begin

        if rst = '1' then

                current_sta <= st0;

        elsif clk'event and clk = '1' then

            current_sta <= next_sta;

        end if;

     end process;

end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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
	out_GCO_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC;--out_GCO_GI_Gyro power on instruction load instruction
	out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GCO_G_Gyro power on pulse
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

entity GCOCC is
port(
	in_GCO_GCOC_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GCO_GCOCC_Gyro power on instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_GCOC_GCO_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GCOCC_GCO_Gyro power on pulse
);
end GCOCC;
architecture Behavioral of GCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
	out_GCOC_GCO_Gyro_powe_on_puls<=in_GCO_GCOC_Gyro_powe_on_inst;
--由输入端口in_GCO_GCOC_Gyro_powe_on_inst、得到输出端口out_GCOC_GCO_Gyro_powe_on_puls、
            end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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
	out_GDA_G_Puls_coun_acqu_inst:out STD_LOGIC;--out_GDA_G_Pulse count acquisition instruction
	out_GD_GD_Gyro_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Gyro power state
	out_GD_GD_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_GD_GD_Angular velocity analog
	out_GDA_G_Gyro_powe_stat_perc_inst:out STD_LOGIC--out_GDA_G_Gyro power state perception instruction
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity GDACC is
port(
	in_GDA_GDAC_Puls_coun:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_GDA_GDACC_Pulse count
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_GDAC_GDA_Angu_velo_anal:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GDACC_GDA_Angular velocity analog
);
end GDACC;
architecture Behavioral of GDACC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
	out_GDAC_GDA_Angu_velo_anal<=in_GDA_GDAC_Puls_coun;
--由输入端口in_GDA_GDAC_Puls_coun、得到输出端口out_GDAC_GDA_Angu_velo_anal、
            end if;

	end process;



end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ITI2 is
port(
	out_a32I_a32I_a32m_inte_time_star_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_32ITI_32IT_32ms interrupt timer start instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end ITI2;
architecture Behavioral of ITI2 is
shared variable Count: integer:=0;
type ram_type_init0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_ITI2_a32m_inte_time_star_inst: ram_type_init0;
signal a32m_inte_time_star_inst_addr: integer:=1;
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

		RAM_ITI2_a32m_inte_time_star_inst(a32m_inte_time_star_inst_addr)<=std_logic_vector(to_signed(1,32));
				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
				when sta1=>
					out_a32I_a32I_a32m_inte_time_star_inst<=RAM_ITI2_a32m_inte_time_star_inst(a32m_inte_time_star_inst_addr);
					Count:=0;
					done<='1';
				end case;
	end process;

end Behavioral;

library IEEE;

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
type ram_type_init0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MI12_Curr_mode: ram_type_init0;
signal Curr_mode_addr: integer:=1;
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

		RAM_MI12_Curr_mode(Curr_mode_addr)<=std_logic_vector(to_signed(0,32));
				process(sta)
begin
case
sta is
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity MSM is
port(
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign
	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time
	in_MSMC_MSM_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Next cycle mode
	in_MSMC_MSM_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Current mode working time
	in_MSMC_MSM_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Target angle
	in_MSMC_MSM_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSMCC_MSM_Target angular velocity
	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode load instruction
	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time load instruction
	out_MSM_MSMC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Triaxial attitude angle
	out_MSM_MSMC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Triaxial angular velocity
	out_MSM_MSMC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Sun visible sign
	out_MSM_MSMC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Current mode
	out_MSM_MSMC_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MSMCC_Current mode working time
	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;--out_MSM_MR_Next cycle mode storage instruction
	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Next cycle mode
	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time storage instruction
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Current mode working time
	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angle storage instruction
	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angle
	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angular velocity storage instruction
	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angular velocity
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end MSM;
architecture Behavioral of MSM is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Tria_atti_angl: ram_type0;
signal Tria_atti_angl_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Tria_angu_velo: ram_type1;
signal Tria_angu_velo_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Sun_visi_sign: ram_type2;
signal Sun_visi_sign_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Curr_mode: ram_type3;
signal Curr_mode_addr: integer:=1;
signal Curr_mode_work_time_signal: STD_LOGIC_VECTOR ( 31 downto 0 );
type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Curr_mode_work_time: ram_type4;
signal Curr_mode_work_time_addr: integer:=1;
type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Next_cycl_mode: ram_type5;
signal Next_cycl_mode_addr: integer:=1;
type ram_type6 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Targ_angl: ram_type6;
signal Targ_angl_addr: integer:=1;
type ram_type7 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MSM_Targ_angu_velo: ram_type7;
signal Targ_angu_velo_addr: integer:=1;
Type states is (sta0,sta1,sta2,sta3,sta4,sta5,sta6,sta7);
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
					sta<=sta6;
				when sta6=>
					sta<=sta7;
				when sta7=>
					sta<=sta0;
            end case;

        end if;

    end process;

				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
					out_MSM_MR_Targ_angu_velo_stor_inst<='0';
				when sta1=>
					out_MSM_MR_Curr_mode_load_inst<='1';
				when sta2=>
					out_MSM_MR_Curr_mode_work_time_load_inst<='1';
					out_MSM_MR_Curr_mode_load_inst<='0';
				when sta3=>
					out_MSM_MSMC_Tria_atti_angl<=RAM_MSM_Tria_atti_angl(Tria_atti_angl_addr);
					out_calc_inst<='1';
					out_MSM_MSMC_Tria_angu_velo<=RAM_MSM_Tria_angu_velo(Tria_angu_velo_addr);
					out_MSM_MSMC_Sun_visi_sign<=RAM_MSM_Sun_visi_sign(Sun_visi_sign_addr);
					out_MSM_MSMC_Curr_mode<=RAM_MSM_Curr_mode(Curr_mode_addr);
					out_MSM_MSMC_Curr_mode_work_time<=RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr);
					out_MSM_MR_Curr_mode_work_time_load_inst<='0';
				when sta4=>
					out_MSM_MR_Next_cycl_mode_stor_inst<='1';
					out_MSM_MR_Next_cycl_mode<=RAM_MSM_Next_cycl_mode(Next_cycl_mode_addr);
					out_calc_inst<='0';
				when sta5=>
					out_MSM_MR_Curr_mode_work_time_stor_inst<='1';
					out_MSM_MR_Curr_mode_work_time<=RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr);
					out_MSM_MR_Next_cycl_mode_stor_inst<='0';
				when sta6=>
					out_MSM_MR_Targ_angl_stor_inst<='1';
					out_MSM_MR_Targ_angl<=RAM_MSM_Targ_angl(Targ_angl_addr);
					out_MSM_MR_Curr_mode_work_time_stor_inst<='0';
				when sta7=>
					out_MSM_MR_Targ_angu_velo_stor_inst<='1';
					out_MSM_MR_Targ_angu_velo<=RAM_MSM_Targ_angu_velo(Targ_angu_velo_addr);
					Count:=0;
					done<='1';
					out_MSM_MR_Targ_angl_stor_inst<='0';
				end case;
	end process;
	process(in_ADR_ADR_Tria_atti_angl)
	begin
		RAM_MSM_Tria_atti_angl(Tria_atti_angl_addr)<=in_ADR_ADR_Tria_atti_angl;
	end process;
	process(in_ADR_ADR_Tria_angu_velo)
	begin
		RAM_MSM_Tria_angu_velo(Tria_angu_velo_addr)<=in_ADR_ADR_Tria_angu_velo;
	end process;
	process(in_SSD_SSD_Sun_visi_sign)
	begin
		RAM_MSM_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSD_SSD_Sun_visi_sign;
	end process;
	process(in_MSM_MR_Curr_mode)
	begin
		RAM_MSM_Curr_mode(Curr_mode_addr)<=in_MSM_MR_Curr_mode;
	end process;
	process(in_MSM_MR_Curr_mode_work_time,in_MSMC_MSM_Curr_mode_work_time)
	begin
if in_MSM_MR_Curr_mode_work_time /= Curr_mode_work_time_signal then
	Curr_mode_work_time_signal <= in_MSM_MR_Curr_mode_work_time;
elsif in_MSMC_MSM_Curr_mode_work_time /= Curr_mode_work_time_signal then
	Curr_mode_work_time_signal <= in_MSMC_MSM_Curr_mode_work_time;
	end if;
	end process;
	process(in_MSMC_MSM_Next_cycl_mode)
	begin
		RAM_MSM_Next_cycl_mode(Next_cycl_mode_addr)<=in_MSMC_MSM_Next_cycl_mode;
	end process;
	process(in_MSMC_MSM_Targ_angl)
	begin
		RAM_MSM_Targ_angl(Targ_angl_addr)<=in_MSMC_MSM_Targ_angl;
	end process;
	process(in_MSMC_MSM_Targ_angu_velo)
	begin
		RAM_MSM_Targ_angu_velo(Targ_angu_velo_addr)<=in_MSMC_MSM_Targ_angu_velo;
	end process;
	process(Curr_mode_work_time_signal)
	begin
		RAM_MSM_Curr_mode_work_time(Curr_mode_work_time_addr)<=Curr_mode_work_time_signal;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity MSM19 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial angular velocity
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSD_SSD_Sun visible sign
	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time
	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time load instruction
	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;--out_MSM_MR_Current mode working time storage instruction
	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;--out_MSM_MR_Next cycle mode storage instruction
	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Next cycle mode
	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angle storage instruction
	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;--out_MSM_MR_Current mode load instruction
	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angle
	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Target angular velocity
	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;--out_MSM_MR_Target angular velocity storage instruction
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_MSM_MR_Current mode working time
);
end MSM19;
architecture Behavioral of MSM19 is
component MSM is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_ADR_ADR_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSD_SSD_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSMC_MSM_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSMC_MSM_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSMC_MSM_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSMC_MSM_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Curr_mode_load_inst:out STD_LOGIC;
	out_MSM_MR_Curr_mode_work_time_load_inst:out STD_LOGIC;
	out_MSM_MSMC_Tria_atti_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MSMC_Tria_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MSMC_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MSMC_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MSMC_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;
	out_MSM_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Curr_mode_work_time_stor_inst:out STD_LOGIC;
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Targ_angl_stor_inst:out STD_LOGIC;
	out_MSM_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSM_MR_Targ_angu_velo_stor_inst:out STD_LOGIC;
	out_MSM_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component MSMCC is
port(
	in_MSM_MSMC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MSMC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MSMC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MSMC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_MSM_MSMC_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_MSMC_MSM_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSMC_MSM_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSMC_MSM_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_MSMC_MSM_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_MSM_MSMC_Tria_atti_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSM_MSMC_Tria_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSM_MSMC_Sun_visi_sign:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSM_MSMC_Curr_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSM_MSMC_Curr_mode_work_time:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_MSMC_MSM_Next_cycl_mode:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSMC_MSM_Curr_mode_work_time:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSMC_MSM_Targ_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_MSMC_MSM_Targ_angu_velo:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
MSM_process:MSM port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_ADR_ADR_Tria_atti_angl=> in_ADR_ADR_Tria_atti_angl,
in_ADR_ADR_Tria_angu_velo=> in_ADR_ADR_Tria_angu_velo,
in_SSD_SSD_Sun_visi_sign=> in_SSD_SSD_Sun_visi_sign,
in_MSM_MR_Curr_mode=> in_MSM_MR_Curr_mode,
in_MSM_MR_Curr_mode_work_time=> in_MSM_MR_Curr_mode_work_time,
in_MSMC_MSM_Next_cycl_mode=> m_MSMC_MSM_Next_cycl_mode,
in_MSMC_MSM_Curr_mode_work_time=> m_MSMC_MSM_Curr_mode_work_time,
in_MSMC_MSM_Targ_angl=> m_MSMC_MSM_Targ_angl,
in_MSMC_MSM_Targ_angu_velo=> m_MSMC_MSM_Targ_angu_velo,
out_MSM_MR_Curr_mode_load_inst=> out_MSM_MR_Curr_mode_load_inst,
out_MSM_MR_Curr_mode_work_time_load_inst=> out_MSM_MR_Curr_mode_work_time_load_inst,
out_MSM_MSMC_Tria_atti_angl=> m_MSM_MSMC_Tria_atti_angl,
out_MSM_MSMC_Tria_angu_velo=> m_MSM_MSMC_Tria_angu_velo,
out_MSM_MSMC_Sun_visi_sign=> m_MSM_MSMC_Sun_visi_sign,
out_MSM_MSMC_Curr_mode=> m_MSM_MSMC_Curr_mode,
out_MSM_MSMC_Curr_mode_work_time=> m_MSM_MSMC_Curr_mode_work_time,
out_MSM_MR_Next_cycl_mode_stor_inst=> out_MSM_MR_Next_cycl_mode_stor_inst,
out_MSM_MR_Next_cycl_mode=> out_MSM_MR_Next_cycl_mode,
out_MSM_MR_Curr_mode_work_time_stor_inst=> out_MSM_MR_Curr_mode_work_time_stor_inst,
out_MSM_MR_Curr_mode_work_time=> out_MSM_MR_Curr_mode_work_time,
out_MSM_MR_Targ_angl_stor_inst=> out_MSM_MR_Targ_angl_stor_inst,
out_MSM_MR_Targ_angl=> out_MSM_MR_Targ_angl,
out_MSM_MR_Targ_angu_velo_stor_inst=> out_MSM_MR_Targ_angu_velo_stor_inst,
out_MSM_MR_Targ_angu_velo=> out_MSM_MR_Targ_angu_velo,
out_calc_inst=> m_calc_inst
);
MSMCC_process:MSMCC port map(
in_MSM_MSMC_Tria_atti_angl=> m_MSM_MSMC_Tria_atti_angl,
in_MSM_MSMC_Tria_angu_velo=> m_MSM_MSMC_Tria_angu_velo,
in_MSM_MSMC_Sun_visi_sign=> m_MSM_MSMC_Sun_visi_sign,
in_MSM_MSMC_Curr_mode=> m_MSM_MSMC_Curr_mode,
in_MSM_MSMC_Curr_mode_work_time=> m_MSM_MSMC_Curr_mode_work_time,
in_calc_inst=> m_calc_inst,
out_MSMC_MSM_Next_cycl_mode=> m_MSMC_MSM_Next_cycl_mode,
out_MSMC_MSM_Curr_mode_work_time=> m_MSMC_MSM_Curr_mode_work_time,
out_MSMC_MSM_Targ_angl=> m_MSMC_MSM_Targ_angl,
out_MSMC_MSM_Targ_angu_velo=> m_MSMC_MSM_Targ_angu_velo
);
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;



--鎸囦护锛坕nstruction锛夌粺锟�?涓簊td_logic鏁版嵁绫诲瀷锛岋拷?锟斤紙value锛宻ignal锛夌粺锟�?涓篠TD_LOGIC_VECTOR ( 31 downto 0 )鏁版嵁绫诲瀷

entity MSMCC is

port(

	in_MSM_MSMC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Triaxial attitude angle

	in_MSM_MSMC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Triaxial angular velocity

	in_MSM_MSMC_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Sun visible sign

	in_MSM_MSMC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Current mode

	in_MSM_MSMC_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MSMCC_Current mode working time

	in_calc_inst:in STD_LOGIC;--in_calculate instruction

	out_MSMC_MSM_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Next cycle mode

	out_MSMC_MSM_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Current mode working time

	out_MSMC_MSM_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSMCC_MSM_Target angle

	out_MSMC_MSM_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_MSMCC_MSM_Target angular velocity

);

end MSMCC;

architecture Behavioral of MSMCC is

begin

    process(in_calc_inst)



    begin



            if in_calc_inst='1' then

--鐢辫緭鍏ョ鍙n_MSM_MSMC_Tria_atti_angl銆乮n_MSM_MSMC_Tria_angu_velo銆乮n_MSM_MSMC_Sun_visi_sign銆乮n_MSM_MSMC_Curr_mode銆乮n_MSM_MSMC_Curr_mode_work_time銆佸緱鍒拌緭鍑虹鍙ut_MSMC_MSM_Next_cycl_mode銆乷ut_MSMC_MSM_Curr_mode_work_time銆乷ut_MSMC_MSM_Targ_angl銆乷ut_MSMC_MSM_Targ_angu_velo锟�?
            case to_integer(unsigned(in_MSM_MSMC_Curr_mode)) is

           when 0=>
            if to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))=2 then
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(1,32));
            else
                out_MSMC_MSM_Targ_angl<=std_logic_vector(to_signed(2*to_integer(unsigned(in_MSM_MSMC_Tria_atti_angl)),32));
                out_MSMC_MSM_Targ_angu_velo<=std_logic_vector(to_signed(2*to_integer(unsigned(in_MSM_MSMC_Tria_angu_velo)),32));
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))+1,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            end if;
           when 1=>
           if to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))=2 then
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            else
                out_MSMC_MSM_Targ_angl<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Tria_atti_angl)),32));
                out_MSMC_MSM_Targ_angu_velo<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Tria_angu_velo)),32));
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(to_integer(unsigned(in_MSM_MSMC_Curr_mode_work_time))+1,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(1,32));
            end if;
            when others=>
                out_MSMC_MSM_Curr_mode_work_time<=std_logic_vector(to_signed(0,32));
                out_MSMC_MSM_Next_cycl_mode<=std_logic_vector(to_signed(0,32));
            end case;
            end if;



	end process;







end Behavioral;




library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity GI is
port(
	in_SGPo_GI_Gyro_powe_on_inst_stor_inst:in STD_LOGIC;--in_SGPonI_GI_Gyro power on instruction storage instruction
	in_SGPo_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SGPonI_GI_Gyro power on instruction
	in_GCO_GI_Gyro_powe_on_inst_load_inst:in STD_LOGIC;--in_GCO_GI_Gyro power on instruction load instruction
	out_GCO_GI_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_GCO_GI_Gyro power on instruction
);
end GI;
architecture Behavioral of GI is
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_GI_Gyro_powe_on_inst: ram_type0;
signal Gyro_powe_on_inst_addr: integer:=1;
begin
	process(in_SGPo_GI_Gyro_powe_on_inst_stor_inst)
	begin
		if in_SGPo_GI_Gyro_powe_on_inst_stor_inst='1' then
			RAM_GI_Gyro_powe_on_inst(Gyro_powe_on_inst_addr)<=in_SGPonI_GI_Gyro_powe_on_inst;
		end if;
	end process;
	process(in_GCO_GI_Gyro_powe_on_inst_load_inst)
	begin
		if in_GCO_GI_Gyro_powe_on_inst_load_inst='1' then
			out_GCO_GI_Gyro_powe_on_inst<=RAM_GI_Gyro_powe_on_inst(Gyro_powe_on_inst_addr);
		end if;
	end process;




end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity MR is
port(
	in_TP_MR_Curr_mode_load_inst:in STD_LOGIC;--in_TP_MR_Current mode load instruction
	in_MI_MR_Curr_mode_stor_inst:in STD_LOGIC;--in_MI_MR_Current mode storage instruction
	in_MI_MR_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MI_MR_Current mode
	in_AD_MR_Curr_mode_load_inst:in STD_LOGIC;--in_AD_MR_Current mode load instruction
	in_TCC_MR_Targ_angl_load_inst:in STD_LOGIC;--in_TCC_MR_Target angle load instruction
	in_TCC_MR_Targ_angu_velo_load_inst:in STD_LOGIC;--in_TCC_MR_Target angular velocity load instruction
	in_MSM_MR_Curr_mode_load_inst:in STD_LOGIC;--in_MSM_MR_Current mode load instruction
	in_MSM_MR_Curr_mode_work_time_load_inst:in STD_LOGIC;--in_MSM_MR_Current mode working time load instruction
	in_MSM_MR_Next_cycl_mode_stor_inst:in STD_LOGIC;--in_MSM_MR_Next cycle mode storage instruction
	in_MSM_MR_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Next cycle mode
	in_MSM_MR_Curr_mode_work_time_stor_inst:in STD_LOGIC;--in_MSM_MR_Current mode working time storage instruction
	in_MSM_MR_Curr_mode_work_time:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Current mode working time
	in_MSM_MR_Targ_angl_stor_inst:in STD_LOGIC;--in_MSM_MR_Target angle storage instruction
	in_MSM_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Target angle
	in_MSM_MR_Targ_angu_velo_stor_inst:in STD_LOGIC;--in_MSM_MR_Target angular velocity storage instruction
	in_MSM_MR_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_MSM_MR_Target angular velocity
	in_TIP_MR_Next_cycl_mode_stor_inst:in STD_LOGIC;--in_TIP_MR_Next cycle mode storage instruction
	in_TIP_MR_Next_cycl_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TIP_MR_Next cycle mode
	out_TP_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TP_MR_Current mode
	out_AD_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_AD_MR_Current mode
	out_TCC_MR_Targ_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_MR_Target angle
	out_TCC_MR_Targ_angu_velo:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TCC_MR_Target angular velocity
	out_MSM_MR_Curr_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_MSM_MR_Current mode
	out_MSM_MR_Curr_mode_work_time:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_MSM_MR_Current mode working time
);
end MR;
architecture Behavioral of MR is
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Current_mode: ram_type0;
signal Current_mode_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Next_cycl_mode: ram_type1;
signal Next_cycl_mode_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Current_mode_work_time: ram_type2;
signal Current_mode_work_time_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Target_angl: ram_type3;
signal Target_angl_addr: integer:=1;
type ram_type4 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Target_angu_velo: ram_type4;
signal Target_angu_velo_addr: integer:=1;
type ram_type5 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_MR_Next_cycl_mode: ram_type5;
signal Next_cycl_mode_addr: integer:=1;
signal Next_cycl_mode_stor_inst:STD_LOGIC_VECTOR (1 downto 0 );
begin
	process(in_MI_MR_Curr_mode_stor_inst)
	begin
		if in_MI_MR_Curr_mode_stor_inst='1' then
			RAM_MR_Current_mode(Current_mode_addr)<=in_MI_MR_Curr_mode;
		end if;
	end process;
	process(in_MSM_MR_Next_cycl_mode_stor_inst,in_TIP_MR_Next_cycl_mode_stor_inst)
	begin
		Next_cycl_mode_stor_inst <= in_MSM_MR_Next_cycl_mode_stor_inst&in_TIP_MR_Next_cycl_mode_stor_inst;
		case Next_cycl_mode_stor_inst is
			when "00"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
			when "01"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_MSM_MR_Next_cycl_mode;
			when "10"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
			when "11"=>
				RAM_MR_Next_cycl_mode(Next_cycl_mode_addr)<=in_TIP_MR_Next_cycl_mode;
		end case;
	end process;
	process(in_MSM_MR_Curr_mode_work_time_stor_inst)
	begin
		if in_MSM_MR_Curr_mode_work_time_stor_inst='1' then
			RAM_MR_Current_mode_work_time(Current_mode_work_time_addr)<=in_MSM_MR_Curr_mode_work_time;
		end if;
	end process;
	process(in_MSM_MR_Targ_angl_stor_inst)
	begin
		if in_MSM_MR_Targ_angl_stor_inst='1' then
			RAM_MR_Target_angl(Target_angl_addr)<=in_MSM_MR_Targ_angl;
		end if;
	end process;
	process(in_MSM_MR_Targ_angu_velo_stor_inst)
	begin
		if in_MSM_MR_Targ_angu_velo_stor_inst='1' then
			RAM_MR_Target_angu_velo(Target_angu_velo_addr)<=in_MSM_MR_Targ_angu_velo;
		end if;
	end process;
	process(in_TP_MR_Curr_mode_load_inst)
	begin
		if in_TP_MR_Curr_mode_load_inst='1' then
			out_TP_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_AD_MR_Curr_mode_load_inst)
	begin
		if in_AD_MR_Curr_mode_load_inst='1' then
			out_AD_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_TCC_MR_Targ_angl_load_inst)
	begin
		if in_TCC_MR_Targ_angl_load_inst='1' then
			out_TCC_MR_Targ_angl<=RAM_MR_Target_angl(Target_angl_addr);
		end if;
	end process;
	process(in_TCC_MR_Targ_angu_velo_load_inst)
	begin
		if in_TCC_MR_Targ_angu_velo_load_inst='1' then
			out_TCC_MR_Targ_angu_velo<=RAM_MR_Target_angu_velo(Target_angu_velo_addr);
		end if;
	end process;
	process(in_MSM_MR_Curr_mode_load_inst)
	begin
		if in_MSM_MR_Curr_mode_load_inst='1' then
			out_MSM_MR_Curr_mode<=RAM_MR_Current_mode(Current_mode_addr);
		end if;
	end process;
	process(in_MSM_MR_Curr_mode_work_time_load_inst)
	begin
		if in_MSM_MR_Curr_mode_work_time_load_inst='1' then
			out_MSM_MR_Curr_mode_work_time<=RAM_MR_Current_mode_work_time(Current_mode_work_time_addr);
		end if;
	end process;




end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity SSI is
port(
	in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst:in STD_LOGIC;--in_SSSPonI_SSI_Sun sensor power on instruction storage instruction
	in_SSSP_SSI_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSSPonI_SSI_Sun sensor power on instruction
	in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst:in STD_LOGIC;--in_SSCO_SSI_Sun sensor power on instruction load instruction
	out_SSCO_SSI_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSCO_SSI_Sun sensor power on instruction
);
end SSI;
architecture Behavioral of SSI is
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSI_Sun_sens_powe_on_inst: ram_type0;
signal Sun_sens_powe_on_inst_addr: integer:=1;
begin
	process(in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst)
	begin
		if in_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst='1' then
			RAM_SSI_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr)<=in_SSSPonI_SSI_Sun_sens_powe_on_inst;
		end if;
	end process;
	process(in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst)
	begin
		if in_SSCO_SSI_Sun_sens_powe_on_inst_load_inst='1' then
			out_SSCO_SSI_Sun_sens_powe_on_inst<=RAM_SSI_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr);
		end if;
	end process;




end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TPI is
port(
	in_TPCO_TPI_Thru_powe_on_inst_load_inst:in STD_LOGIC;--in_TPCO_TPI_Thruster power on instruction load instruction
	in_STPo_TPI_Thru_powe_on_inst_stor_inst:in STD_LOGIC;--in_STPonI_TPI_Thruster power on instruction storage instruction
	in_STPo_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_STPonI_TPI_Thruster power on instruction
	out_TPCO_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCO_TPI_Thruster power on instruction
);
end TPI;
architecture Behavioral of TPI is
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TPI_Thruster_powe_on_inst: ram_type0;
signal Thruster_powe_on_inst_addr: integer:=1;
begin
	process(in_STPo_TPI_Thru_powe_on_inst_stor_inst)
	begin
		if in_STPo_TPI_Thru_powe_on_inst_stor_inst='1' then
			RAM_TPI_Thruster_powe_on_inst(Thruster_powe_on_inst_addr)<=in_STPonI_TPI_Thru_powe_on_inst;
		end if;
	end process;
	process(in_TPCO_TPI_Thru_powe_on_inst_load_inst)
	begin
		if in_TPCO_TPI_Thru_powe_on_inst_load_inst='1' then
			out_TPCO_TPI_Thru_powe_on_inst<=RAM_TPI_Thruster_powe_on_inst(Thruster_powe_on_inst_addr);
		end if;
	end process;




end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SGPoI4 is
port(
	out_SGPo_GI_Gyro_powe_on_inst_stor_inst:out STD_LOGIC;--out_SGPonI_GI_Gyro power on instruction storage instruction
	out_SGPo_GI_Gyro_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SGPonI_GI_Gyro power on instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end SGPoI4;
architecture Behavioral of SGPoI4 is
shared variable Count: integer:=0;
type ram_type_init0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SGPoI4_Gyro_powe_on_inst: ram_type_init0;
signal Gyro_powe_on_inst_addr: integer:=1;
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

		RAM_SGPoI4_Gyro_powe_on_inst(Gyro_powe_on_inst_addr)<=std_logic_vector(to_signed(1,32));
				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
					out_SGPo_GI_Gyro_powe_on_inst_stor_inst<='0';
				when sta1=>
					out_SGPo_GI_Gyro_powe_on_inst_stor_inst<='1';
					out_SGPo_GI_Gyro_powe_on_inst<=RAM_SGPoI4_Gyro_powe_on_inst(Gyro_powe_on_inst_addr);
					Count:=0;
					done<='1';
				end case;
	end process;

end Behavioral;

library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity SSCOCC is
port(
	in_SSCO_SSCO_Sun_sens_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSCO_SSCOCC_Sun sensor power on instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_SSCO_SSCO_Sun_sens_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSCOCC_SSCO_Sun sensor power on pulse
);
end SSCOCC;
architecture Behavioral of SSCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
	out_SSCO_SSCO_Sun_sens_powe_on_puls<=in_SSCO_SSCO_Sun_sens_powe_on_inst;
--由输入端口in_SSCO_SSCO_Sun_sens_powe_on_inst、得到输出端口out_SSCO_SSCO_Sun_sens_powe_on_puls、
            end if;

	end process;



end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SSDA is
port(
	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun visible sign
	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Angle analog
	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun sensor power state
	in_SSDA_SSDA_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDACC_SSDA_Sun measurement angle
	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Sun visible sign acquisition instruction
	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Angle analog acquisition instruction
	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;--out_SSDA_SS_Sun sensor power state perception instruction
	out_SSDA_SSDA_Angl_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSDA_SSDACC_Angle analog
	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun visible sign
	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun measurement angle
	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun sensor power state
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end SSDA;
architecture Behavioral of SSDA is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_visi_sign: ram_type0;
signal Sun_visi_sign_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Angl_anal: ram_type1;
signal Angl_anal_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_sens_powe_stat: ram_type2;
signal Sun_sens_powe_stat_addr: integer:=1;
type ram_type3 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSDA_Sun_meas_angl: ram_type3;
signal Sun_meas_angl_addr: integer:=1;
Type states is (sta0,sta1,sta2,sta3,sta4,sta5,sta6,sta7);
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
					sta<=sta6;
				when sta6=>
					sta<=sta7;
				when sta7=>
					sta<=sta0;
            end case;

        end if;

    end process;

				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
				when sta1=>
					out_SSDA_SS_Sun_visi_sign_acqu_inst<='1';
				when sta2=>
					out_SSDA_SS_Angl_anal_acqu_inst<='1';
					out_SSDA_SS_Sun_visi_sign_acqu_inst<='0';
				when sta3=>
					out_SSDA_SS_Sun_sens_powe_stat_perc_inst<='1';
					out_SSDA_SS_Angl_anal_acqu_inst<='0';
				when sta4=>
					out_SSDA_SSDA_Angl_anal<=RAM_SSDA_Angl_anal(Angl_anal_addr);
					out_calc_inst<='1';
					out_SSDA_SS_Sun_sens_powe_stat_perc_inst<='0';
				when sta5=>
					out_SSD_SSD_Sun_visi_sign<=RAM_SSDA_Sun_visi_sign(Sun_visi_sign_addr);
					out_calc_inst<='0';
				when sta6=>
					out_SSD_SSD_Sun_meas_angl<=RAM_SSDA_Sun_meas_angl(Sun_meas_angl_addr);
				when sta7=>
					out_SSD_SSD_Sun_sens_powe_stat<=RAM_SSDA_Sun_sens_powe_stat(Sun_sens_powe_stat_addr);
					Count:=0;
					done<='1';
				end case;
	end process;
	process(in_SSDA_SS_Sun_visi_sign)
	begin
		RAM_SSDA_Sun_visi_sign(Sun_visi_sign_addr)<=in_SSDA_SS_Sun_visi_sign;
	end process;
	process(in_SSDA_SS_Angl_anal)
	begin
		RAM_SSDA_Angl_anal(Angl_anal_addr)<=in_SSDA_SS_Angl_anal;
	end process;
	process(in_SSDA_SS_Sun_sens_powe_stat)
	begin
		RAM_SSDA_Sun_sens_powe_stat(Sun_sens_powe_stat_addr)<=in_SSDA_SS_Sun_sens_powe_stat;
	end process;
	process(in_SSDA_SSDA_Sun_meas_angl)
	begin
		RAM_SSDA_Sun_meas_angl(Sun_meas_angl_addr)<=in_SSDA_SSDA_Sun_meas_angl;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SSDA16 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun sensor power state
	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Angle analog
	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SS_Sun visible sign
	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun measurement angle
	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Angle analog acquisition instruction
	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSD_SSD_Sun visible sign
	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;--out_SSDA_SS_Sun visible sign acquisition instruction
	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;--out_SSDA_SS_Sun sensor power state perception instruction
	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSD_SSD_Sun sensor power state
);
end SSDA16;
architecture Behavioral of SSDA16 is
component SSDA is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_SSDA_SS_Sun_visi_sign:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSDA_SS_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSDA_SS_Sun_sens_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_SSDA_SSDA_Sun_meas_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSDA_SS_Sun_visi_sign_acqu_inst:out STD_LOGIC;
	out_SSDA_SS_Angl_anal_acqu_inst:out STD_LOGIC;
	out_SSDA_SS_Sun_sens_powe_stat_perc_inst:out STD_LOGIC;
	out_SSDA_SSDA_Angl_anal:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSD_SSD_Sun_visi_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSD_SSD_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_SSD_SSD_Sun_sens_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component SSDACC is
port(
	in_SSDA_SSDA_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_SSDA_SSDA_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_SSDA_SSDA_Angl_anal:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_SSDA_SSDA_Sun_meas_angl:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
SSDA_process:SSDA port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_SSDA_SS_Sun_visi_sign=> in_SSDA_SS_Sun_visi_sign,
in_SSDA_SS_Angl_anal=> in_SSDA_SS_Angl_anal,
in_SSDA_SS_Sun_sens_powe_stat=> in_SSDA_SS_Sun_sens_powe_stat,
in_SSDA_SSDA_Sun_meas_angl=> m_SSDA_SSDA_Sun_meas_angl,
out_SSDA_SS_Sun_visi_sign_acqu_inst=> out_SSDA_SS_Sun_visi_sign_acqu_inst,
out_SSDA_SS_Angl_anal_acqu_inst=> out_SSDA_SS_Angl_anal_acqu_inst,
out_SSDA_SS_Sun_sens_powe_stat_perc_inst=> out_SSDA_SS_Sun_sens_powe_stat_perc_inst,
out_SSDA_SSDA_Angl_anal=> m_SSDA_SSDA_Angl_anal,
out_SSD_SSD_Sun_visi_sign=> out_SSD_SSD_Sun_visi_sign,
out_SSD_SSD_Sun_meas_angl=> out_SSD_SSD_Sun_meas_angl,
out_SSD_SSD_Sun_sens_powe_stat=> out_SSD_SSD_Sun_sens_powe_stat,
out_calc_inst=> m_calc_inst
);
SSDACC_process:SSDACC port map(
in_SSDA_SSDA_Angl_anal=> m_SSDA_SSDA_Angl_anal,
in_calc_inst=> m_calc_inst,
out_SSDA_SSDA_Sun_meas_angl=> m_SSDA_SSDA_Sun_meas_angl
);
end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity SSDACC is
port(
	in_SSDA_SSDA_Angl_anal:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_SSDA_SSDACC_Angle analog
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_SSDA_SSDA_Sun_meas_angl:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_SSDACC_SSDA_Sun measurement angle
);
end SSDACC;
architecture Behavioral of SSDACC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_SSDA_SSDA_Angl_anal、得到输出端口out_SSDA_SSDA_Sun_meas_angl、
	out_SSDA_SSDA_Sun_meas_angl<=in_SSDA_SSDA_Angl_anal;
            end if;

	end process;



end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SSSPoI7 is
port(
	out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst:out STD_LOGIC;--out_SSSPonI_SSI_Sun sensor power on instruction storage instruction
	out_SSSP_SSI_Sun_sens_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_SSSPonI_SSI_Sun sensor power on instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end SSSPoI7;
architecture Behavioral of SSSPoI7 is
shared variable Count: integer:=0;
type ram_type_init0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_SSSPoI7_Sun_sens_on_inst: ram_type_init0;
signal Sun_sens_on_inst_addr: integer:=1;
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

		RAM_SSSPoI7_Sun_sens_on_inst(Sun_sens_on_inst_addr)<=std_logic_vector(to_signed(1,32));
				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
					out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst<='0';
				when sta1=>
					out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst<='1';
					out_SSSP_SSI_Sun_sens_powe_on_inst<=RAM_SSSPoI7_Sun_sens_powe_on_inst(Sun_sens_powe_on_inst_addr);
					Count:=0;
					done<='1';
				end case;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity STPoI10 is
port(
	out_STPo_TPI_Thru_powe_on_inst_stor_inst:out STD_LOGIC;--out_STPonI_TPI_Thruster power on instruction storage instruction
	out_STPo_TPI_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_STPonI_TPI_Thruster power on instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end STPoI10;
architecture Behavioral of STPoI10 is
shared variable Count: integer:=0;
type ram_type_init0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_STPoI10_Thru_powe_inst: ram_type_init0;
signal Thru_powe_inst_addr: integer:=1;
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

		RAM_STPoI10_Thru_powe_inst(Thru_powe_inst_addr)<=std_logic_vector(to_signed(1,32));
				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
					out_STPo_TPI_Thru_powe_on_inst_stor_inst<='0';
				when sta1=>
					out_STPo_TPI_Thru_powe_on_inst_stor_inst<='1';
					out_STPo_TPI_Thru_powe_on_inst<=RAM_STPoI10_Thru_powe_on_inst(Thru_powe_on_inst_addr);
					Count:=0;
					done<='1';
				end case;
	end process;

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;




--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity CCC is
port(
	in_TCC_CCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Triaxial attitude angle
	in_TCC_CCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Triaxial angular velocity
	in_TCC_CCC_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Target angle
	in_TCC_CCC_Targ_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_CCC_Target angular velocity
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_CCC_TCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_CCC_TCC_Triaxial control quantity
);
end CCC;
architecture Behavioral of CCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TCC_CCC_Tria_atti_angl、in_TCC_CCC_Tria_angu_velo、in_TCC_CCC_Targ_angl、in_TCC_CCC_Targ_angu_velo、得到输出端口out_CCC_TCC_Tria_cont_quan、
            if to_integer(unsigned(in_TCC_CCC_Targ_angl))<to_integer(unsigned(in_TCC_CCC_Targ_angu_velo)) then
                out_CCC_TCC_Tria_cont_quan<=std_logic_vector(to_signed(1,32));
            else
                out_CCC_TCC_Tria_cont_quan<=std_logic_vector(to_signed(2,32));
            end if;
	end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TCC20 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_ADR_ADR_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_ADR_ADR_Triaxial attitude angle
	in_TCC_MR_Targ_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TCC_MR_Target angle
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TDA17 is
port(
	in_TDA_TCT_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDA_TCT_Thruster power state
	out_TDA_TCT_Thru_powe_stat_perc_inst:out STD_LOGIC;--out_TDA_TCT_Thruster power state perception instruction
	out_TD_TD_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TD_TD_Thruster power state
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end TDA17;
architecture Behavioral of TDA17 is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TDA17_Thru_powe_stat: ram_type0;
signal Thru_powe_stat_addr: integer:=1;
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

				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
				when sta1=>
					out_TDA_TCT_Thru_powe_stat_perc_inst<='1';
				when sta2=>
					out_TD_TD_Thru_powe_stat<=RAM_TDA17_Thru_powe_stat(Thru_powe_stat_addr);
					Count:=0;
					done<='1';
					out_TDA_TCT_Thru_powe_stat_perc_inst<='0';
				end case;
	end process;
	process(in_TDA_TCT_Thru_powe_stat)
	begin
		RAM_TDA17_Thru_powe_stat(Thru_powe_stat_addr)<=in_TDA_TCT_Thru_powe_stat;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TDC is
port(
	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TD_TD_Thruster power state
	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_CCR_CCR_Triaxial control quantity
	in_TDCC_TDC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDCC_TDC_Thruster combination logic
	out_TDC_TDCC_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDC_TDCC_Thruster power state
	out_TDC_TDCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDC_TDCC_Triaxial control quantity
	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TDCR_TDCR_Thruster combination logic
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end TDC;
architecture Behavioral of TDC is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TDC_Thru_powe_stat: ram_type0;
signal Thru_powe_stat_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TDC_Tria_cont_quan: ram_type1;
signal Tria_cont_quan_addr: integer:=1;
type ram_type2 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TDC_Thru_comb_logi: ram_type2;
signal Thru_comb_logi_addr: integer:=1;
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

				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
				when sta1=>
					out_TDC_TDCC_Thru_powe_stat<=RAM_TDC_Thru_powe_stat(Thru_powe_stat_addr);
					out_calc_inst<='1';
					out_TDC_TDCC_Tria_cont_quan<=RAM_TDC_Tria_cont_quan(Tria_cont_quan_addr);
				when sta2=>
					out_TDCR_TDCR_Thru_comb_logi<=RAM_TDC_Thru_comb_logi(Thru_comb_logi_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_TD_TD_Thru_powe_stat)
	begin
		RAM_TDC_Thru_powe_stat(Thru_powe_stat_addr)<=in_TD_TD_Thru_powe_stat;
	end process;
	process(in_CCR_CCR_Tria_cont_quan)
	begin
		RAM_TDC_Tria_cont_quan(Tria_cont_quan_addr)<=in_CCR_CCR_Tria_cont_quan;
	end process;
	process(in_TDCC_TDC_Thru_comb_logi)
	begin
		RAM_TDC_Thru_comb_logi(Thru_comb_logi_addr)<=in_TDCC_TDC_Thru_comb_logi;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TDC21 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_CCR_CCR_Triaxial control quantity
	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TD_TD_Thruster power state
	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TDCR_TDCR_Thruster combination logic
);
end TDC21;
architecture Behavioral of TDC21 is
component TDC is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TD_TD_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_CCR_CCR_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TDCC_TDC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TDC_TDCC_Thru_powe_stat:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TDC_TDCC_Tria_cont_quan:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TDCR_TDCR_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component TDCC is
port(
	in_TDC_TDCC_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TDC_TDCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_TDCC_TDC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_TDC_TDCC_Thru_powe_stat:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_TDC_TDCC_Tria_cont_quan:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_TDCC_TDC_Thru_comb_logi:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
TDC_process:TDC port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_TD_TD_Thru_powe_stat=> in_TD_TD_Thru_powe_stat,
in_CCR_CCR_Tria_cont_quan=> in_CCR_CCR_Tria_cont_quan,
in_TDCC_TDC_Thru_comb_logi=> m_TDCC_TDC_Thru_comb_logi,
out_TDC_TDCC_Thru_powe_stat=> m_TDC_TDCC_Thru_powe_stat,
out_TDC_TDCC_Tria_cont_quan=> m_TDC_TDCC_Tria_cont_quan,
out_TDCR_TDCR_Thru_comb_logi=> out_TDCR_TDCR_Thru_comb_logi,
out_calc_inst=> m_calc_inst
);
TDCC_process:TDCC port map(
in_TDC_TDCC_Thru_powe_stat=> m_TDC_TDCC_Thru_powe_stat,
in_TDC_TDCC_Tria_cont_quan=> m_TDC_TDCC_Tria_cont_quan,
in_calc_inst=> m_calc_inst,
out_TDCC_TDC_Thru_comb_logi=> m_TDCC_TDC_Thru_comb_logi
);
end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TDCC is
port(
	in_TDC_TDCC_Thru_powe_stat:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDC_TDCC_Thruster power state
	in_TDC_TDCC_Tria_cont_quan:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TDC_TDCC_Triaxial control quantity
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TDCC_TDC_Thru_comb_logi:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TDCC_TDC_Thruster combination logic
);
end TDCC;
architecture Behavioral of TDCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TDC_TDCC_Thru_powe_stat、in_TDC_TDCC_Tria_cont_quan、得到输出端口out_TDCC_TDC_Thru_comb_logi、
                if to_integer(unsigned(in_TDC_TDCC_Thru_powe_stat))=1 then
	                   out_TDCC_TDC_Thru_comb_logi<=in_TDC_TDCC_Tria_cont_quan;
	            else
	                   out_TDCC_TDC_Thru_comb_logi<=std_logic_vector(to_signed(0,32));
	            end if;
            end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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
	out_TIP_MR_Next_cycl_mode_stor_inst:out STD_LOGIC;--out_TIP_MR_Next cycle mode storage instruction
	out_TIP_MR_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TIP_MR_Next cycle mode
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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TIPCC is
port(
	in_TIP_TIPC_Tele_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TIP_TIPCC_Telecontrol instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TIPC_TIP_Next_cycl_mode:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TIPCC_TIP_Next cycle mode
);
end TIPCC;
architecture Behavioral of TIPCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TIP_TIPC_Tele_inst、得到输出端口out_TIPC_TIP_Next_cycl_mode、
	out_TIPC_TIP_Next_cycl_mode<=in_TIP_TIPC_Tele_inst;
            end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TPCC is
port(
	in_TP_TPCC_Curr_mode:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Current mode
	in_TP_TPCC_Tria_atti_angl:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Triaxial attitude angle
	in_TP_TPCC_Tria_angu_velo:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TP_TPCC_Triaxial angular velocity
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TPCC_TP_Tele_data:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCC_TP_Telemetry data
);
end TPCC;
architecture Behavioral of TPCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TP_TPCC_Curr_mode、in_TP_TPCC_Tria_atti_angl、in_TP_TPCC_Tria_angu_velo、得到输出端口out_TPCC_TP_Tele_data、
	out_TPCC_TP_Tele_data<=in_TP_TPCC_Curr_mode;
            end if;

	end process;



end Behavioral;


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TPCO is
port(
	in_TPCO_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TPI_Thruster power on instruction
	in_TPCO_TPCO_Thru_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCOCC_TPCO_Thruster power on pulse
	out_TPCO_TPI_Thru_powe_on_inst_load_inst:out STD_LOGIC;--out_TPCO_TPI_Thruster power on instruction load instruction
	out_TPCO_TPCO_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TPCO_TPCOCC_Thruster power on instruction
	out_TPCO_TCT_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );--out_TPCO_TCT_Thruster power on pulse
	out_calc_inst:out STD_LOGIC;--out_calculate instruction
    --指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型

    clk:in std_logic;

    start:in std_logic;

    done:out std_logic;

    rst:in std_logic

);

end TPCO;
architecture Behavioral of TPCO is
shared variable Count: integer:=0;
type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TPCO_Thru_powe_on_inst: ram_type0;
signal Thru_powe_on_inst_addr: integer:=1;
type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );
signal RAM_TPCO_Thru_powe_on_puls: ram_type1;
signal Thru_powe_on_puls_addr: integer:=1;
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

				process(sta)
begin
case
sta is
				when sta0=>
					done<='0';
				when sta1=>
					out_TPCO_TPI_Thru_powe_on_inst_load_inst<='1';
				when sta2=>
					out_TPCO_TPCO_Thru_powe_on_inst<=RAM_TPCO_Thru_powe_on_inst(Thru_powe_on_inst_addr);
					out_calc_inst<='1';
					out_TPCO_TPI_Thru_powe_on_inst_load_inst<='0';
				when sta3=>
					out_TPCO_TCT_Thru_powe_on_puls<=RAM_TPCO_Thru_powe_on_puls(Thru_powe_on_puls_addr);
					Count:=0;
					done<='1';
					out_calc_inst<='0';
				end case;
	end process;
	process(in_TPCO_TPI_Thru_powe_on_inst)
	begin
		RAM_TPCO_Thru_powe_on_inst(Thru_powe_on_inst_addr)<=in_TPCO_TPI_Thru_powe_on_inst;
	end process;
	process(in_TPCO_TPCO_Thru_powe_on_puls)
	begin
		RAM_TPCO_Thru_powe_on_puls(Thru_powe_on_puls_addr)<=in_TPCO_TPCO_Thru_powe_on_puls;
	end process;

end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TPCO11 is
port(
clk:in STD_LOGIC;
rst:in STD_LOGIC;
done:out STD_LOGIC;
start:in STD_LOGIC;
	in_TPCO_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TPI_Thruster power on instruction
	out_TPCO_TPI_Thru_powe_on_inst_load_inst:out STD_LOGIC;--out_TPCO_TPI_Thruster power on instruction load instruction
	out_TPCO_TCT_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCO_TCT_Thruster power on pulse
);
end TPCO11;
architecture Behavioral of TPCO11 is
component TPCO is
port(
clk:in std_logic;
start:in std_logic;
done:out std_logic;
rst:in std_logic;
	in_TPCO_TPI_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_TPCO_TPCO_Thru_powe_on_puls:in STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TPCO_TPI_Thru_powe_on_inst_load_inst:out STD_LOGIC;
	out_TPCO_TPCO_Thru_powe_on_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_TPCO_TCT_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );
	out_calc_inst:out STD_LOGIC
);
end component;
component TPCOCC is
port(
	in_TPCO_TPCO_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );
	in_calc_inst:in STD_LOGIC;
	out_TPCO_TPCO_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )
);
end component;
	signal m_TPCO_TPCO_Thru_powe_on_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
	signal m_calc_inst:STD_LOGIC;--
	signal m_TPCO_TPCO_Thru_powe_on_puls:STD_LOGIC_VECTOR ( 31 downto 0 );--
begin
TPCO_process:TPCO port map(
clk=>clk,
start=>start,
done=>done,
rst=>rst,
in_TPCO_TPI_Thru_powe_on_inst=> in_TPCO_TPI_Thru_powe_on_inst,
in_TPCO_TPCO_Thru_powe_on_puls=> m_TPCO_TPCO_Thru_powe_on_puls,
out_TPCO_TPI_Thru_powe_on_inst_load_inst=> out_TPCO_TPI_Thru_powe_on_inst_load_inst,
out_TPCO_TPCO_Thru_powe_on_inst=> m_TPCO_TPCO_Thru_powe_on_inst,
out_TPCO_TCT_Thru_powe_on_puls=> out_TPCO_TCT_Thru_powe_on_puls,
out_calc_inst=> m_calc_inst
);
TPCOCC_process:TPCOCC port map(
in_TPCO_TPCO_Thru_powe_on_inst=> m_TPCO_TPCO_Thru_powe_on_inst,
in_calc_inst=> m_calc_inst,
out_TPCO_TPCO_Thru_powe_on_puls=> m_TPCO_TPCO_Thru_powe_on_puls
);
end Behavioral;

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TPCOCC is
port(
	in_TPCO_TPCO_Thru_powe_on_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TPCO_TPCOCC_Thruster power on instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TPCO_TPCO_Thru_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TPCOCC_TPCO_Thruster power on pulse
);
end TPCOCC;
architecture Behavioral of TPCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TPCO_TPCO_Thru_powe_on_inst、得到输出端口out_TPCO_TPCO_Thru_powe_on_puls、
	out_TPCO_TPCO_Thru_powe_on_puls<=in_TPCO_TPCO_Thru_powe_on_inst;
            end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TTCCC is
port(
	in_TTC_TTCC_Thru_comb_logi:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTC_TTCCC_Thruster combination logic
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TTCC_TTC_Tria_cont_inst:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCCC_TTC_Triaxial control instruction
);
end TTCCC;
architecture Behavioral of TTCCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TTC_TTCC_Thru_comb_logi、得到输出端口out_TTCC_TTC_Tria_cont_inst、
	out_TTCC_TTC_Tria_cont_inst<=in_TTC_TTCC_Thru_comb_logi;
            end if;

	end process;



end Behavioral;


library IEEE;

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

				process(sta)
begin
case
sta is
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

library IEEE;

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

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TTCOCC is
port(
	in_TTCO_TTCO_Tria_cont_inst:in STD_LOGIC_VECTOR ( 31 downto 0 );--in_TTCO_TTCOCC_Triaxial control instruction
	in_calc_inst:in STD_LOGIC;--in_calculate instruction
	out_TTCO_TTCO_Tria_cont_sign:out STD_LOGIC_VECTOR ( 31 downto 0 )--out_TTCOCC_TTCO_Triaxial control signal
);
end TTCOCC;
architecture Behavioral of TTCOCC is
begin
    process(in_calc_inst)

    begin

            if in_calc_inst='1' then
--由输入端口in_TTCO_TTCO_Tria_cont_inst、得到输出端口out_TTCO_TTCO_Tria_cont_sign、
	out_TTCO_TTCO_Tria_cont_sign<=in_TTCO_TTCO_Tria_cont_inst;
            end if;

	end process;



end Behavioral;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed Aug  2 23:50:48 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target DA14_wrapper.bd
--Design      : DA14_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DA14_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GDA_G_Gyro_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDA_TCT_Thru_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GD_GD_Gyro_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end DA14_wrapper;

architecture STRUCTURE of DA14_wrapper is
  component DA14 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TDA_TCT_Thru_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TDA_TCT_Thru_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_TD_TD_Thru_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Angl_anal_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_sens_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_SSDA_SS_Sun_visi_sign_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSDA_SS_Angl_anal_acqu_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_SSDA_SS_Sun_visi_sign_acqu_inst_0 : out STD_LOGIC;
    out_SSD_SSD_Sun_meas_angl_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_visi_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Gyro_powe_stat_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_GDA_G_Puls_coun_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GDA_G_Gyro_powe_stat_perc_inst_0 : out STD_LOGIC;
    out_GDA_G_Puls_coun_acqu_inst_0 : out STD_LOGIC;
    out_GD_GD_Angu_velo_anal_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GD_GD_Gyro_powe_stat_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component DA14;
begin
DA14_i: component DA14
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GDA_G_Gyro_powe_stat_0(31 downto 0) => in_GDA_G_Gyro_powe_stat_0(31 downto 0),
      in_GDA_G_Puls_coun_0(31 downto 0) => in_GDA_G_Puls_coun_0(31 downto 0),
      in_SSDA_SS_Angl_anal_0(31 downto 0) => in_SSDA_SS_Angl_anal_0(31 downto 0),
      in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0) => in_SSDA_SS_Sun_sens_powe_stat_0(31 downto 0),
      in_SSDA_SS_Sun_visi_sign_0(31 downto 0) => in_SSDA_SS_Sun_visi_sign_0(31 downto 0),
      in_TDA_TCT_Thru_powe_stat_0(31 downto 0) => in_TDA_TCT_Thru_powe_stat_0(31 downto 0),
      out_GDA_G_Gyro_powe_stat_perc_inst_0 => out_GDA_G_Gyro_powe_stat_perc_inst_0,
      out_GDA_G_Puls_coun_acqu_inst_0 => out_GDA_G_Puls_coun_acqu_inst_0,
      out_GD_GD_Angu_velo_anal_0(31 downto 0) => out_GD_GD_Angu_velo_anal_0(31 downto 0),
      out_GD_GD_Gyro_powe_stat_0(31 downto 0) => out_GD_GD_Gyro_powe_stat_0(31 downto 0),
      out_SSDA_SS_Angl_anal_acqu_inst_0 => out_SSDA_SS_Angl_anal_acqu_inst_0,
      out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0 => out_SSDA_SS_Sun_sens_powe_stat_perc_inst_0,
      out_SSDA_SS_Sun_visi_sign_acqu_inst_0 => out_SSDA_SS_Sun_visi_sign_acqu_inst_0,
      out_SSD_SSD_Sun_meas_angl_0(31 downto 0) => out_SSD_SSD_Sun_meas_angl_0(31 downto 0),
      out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0) => out_SSD_SSD_Sun_sens_powe_stat_0(31 downto 0),
      out_SSD_SSD_Sun_visi_sign_0(31 downto 0) => out_SSD_SSD_Sun_visi_sign_0(31 downto 0),
      out_TDA_TCT_Thru_powe_stat_perc_inst_0 => out_TDA_TCT_Thru_powe_stat_perc_inst_0,
      out_TD_TD_Thru_powe_stat_0(31 downto 0) => out_TD_TD_Thru_powe_stat_0(31 downto 0),
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed Aug  2 23:49:39 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target GI3_wrapper.bd
--Design      : GI3_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GI3_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end GI3_wrapper;

architecture STRUCTURE of GI3_wrapper is
  component GI3 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_GCO_GI_Gyro_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_GCO_G_Gyro_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component GI3;
begin
GI3_i: component GI3
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0) => in_GCO_GI_Gyro_powe_on_inst_0(31 downto 0),
      out_GCO_GI_Gyro_powe_on_inst_load_inst_0 => out_GCO_GI_Gyro_powe_on_inst_load_inst_0,
      out_GCO_G_Gyro_powe_on_puls_0(31 downto 0) => out_GCO_G_Gyro_powe_on_puls_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0) => out_SGPo_GI_Gyro_powe_on_inst_0(31 downto 0),
      out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0 => out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed Aug  2 23:49:56 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target SSI6_wrapper.bd
--Design      : SSI6_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SSI6_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end SSI6_wrapper;

architecture STRUCTURE of SSI6_wrapper is
  component SSI6 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_SSCO_SSI_Sun_sens_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_SSCO_SS_Sun_sens_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component SSI6;
begin
SSI6_i: component SSI6
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => in_SSCO_SSI_Sun_sens_powe_on_inst_0(31 downto 0),
      out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0 => out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0,
      out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0) => out_SSCO_SS_Sun_sens_powe_on_puls_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0) => out_SSSP_SSI_Sun_sens_powe_on_inst_0(31 downto 0),
      out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0 => out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Sun Dec 18 13:27:07 2022
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target sun_wrapper.bd
--Design      : sun_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sun_wrapper is
  port (
    Gyro_power_state_acqins_0_0 : out STD_LOGIC;
    Gyro_power_states_0_0 : in STD_LOGIC;
    Jet_interval_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Jet_interval_acquisition_instruction_0_0 : out STD_LOGIC;
    Out_Thruster_power_state_0_0 : out STD_LOGIC;
    SSDA_Sun_sensor_power_state_0_0 : out STD_LOGIC;
    Sun_measurement_angle_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Sun_measurement_angle_acquisition_0_0 : out STD_LOGIC;
    Sun_sensor_power_state_0_0 : in STD_LOGIC;
    Sun_sensor_power_state_perception_0_0 : out STD_LOGIC;
    Sun_visible_sign_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Sun_visible_sign_acquisition_0_0 : out STD_LOGIC;
    Telecontrol_ins_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Thruster_power_state_0_0 : in STD_LOGIC;
    Thruster_power_state_perception_instruction_0_0 : out STD_LOGIC;
    Triaxial_contorl_signal1_0 : out STD_LOGIC;
    Triaxial_contorl_signal2_0 : out STD_LOGIC;
    Triaxial_contorl_signal3_0 : out STD_LOGIC;
    clk_0 : in STD_LOGIC;
    gyro_power_off_signal_0_0 : out STD_LOGIC;
    gyro_power_on_signal_0_0 : out STD_LOGIC;
    out_Telemetry_data_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pulse_count_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pulse_count_acquisition_ins_0_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    sun_power_off_signal_0_0 : out STD_LOGIC;
    sun_power_on_signal_0_0 : out STD_LOGIC;
    thruster_power_off_signal_0_0 : out STD_LOGIC;
    thruster_power_on_signal_0_0 : out STD_LOGIC
  );
end sun_wrapper;

architecture STRUCTURE of sun_wrapper is
  component sun is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    Triaxial_contorl_signal1_0 : out STD_LOGIC;
    Triaxial_contorl_signal2_0 : out STD_LOGIC;
    Triaxial_contorl_signal3_0 : out STD_LOGIC;
    out_Telemetry_data_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gyro_power_off_signal_0_0 : out STD_LOGIC;
    gyro_power_on_signal_0_0 : out STD_LOGIC;
    sun_power_off_signal_0_0 : out STD_LOGIC;
    sun_power_on_signal_0_0 : out STD_LOGIC;
    thruster_power_off_signal_0_0 : out STD_LOGIC;
    thruster_power_on_signal_0_0 : out STD_LOGIC;
    Gyro_power_state_acqins_0_0 : out STD_LOGIC;
    Gyro_power_states_0_0 : in STD_LOGIC;
    Jet_interval_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Jet_interval_acquisition_instruction_0_0 : out STD_LOGIC;
    Out_Thruster_power_state_0_0 : out STD_LOGIC;
    SSDA_Sun_sensor_power_state_0_0 : out STD_LOGIC;
    Sun_measurement_angle_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Sun_measurement_angle_acquisition_0_0 : out STD_LOGIC;
    Sun_sensor_power_state_0_0 : in STD_LOGIC;
    Sun_sensor_power_state_perception_0_0 : out STD_LOGIC;
    Sun_visible_sign_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Sun_visible_sign_acquisition_0_0 : out STD_LOGIC;
    Thruster_power_state_0_0 : in STD_LOGIC;
    Thruster_power_state_perception_instruction_0_0 : out STD_LOGIC;
    pulse_count_0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pulse_count_acquisition_ins_0_0 : out STD_LOGIC;
    Telecontrol_ins_0 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component sun;
begin
sun_i: component sun
     port map (
      Gyro_power_state_acqins_0_0 => Gyro_power_state_acqins_0_0,
      Gyro_power_states_0_0 => Gyro_power_states_0_0,
      Jet_interval_0_0(31 downto 0) => Jet_interval_0_0(31 downto 0),
      Jet_interval_acquisition_instruction_0_0 => Jet_interval_acquisition_instruction_0_0,
      Out_Thruster_power_state_0_0 => Out_Thruster_power_state_0_0,
      SSDA_Sun_sensor_power_state_0_0 => SSDA_Sun_sensor_power_state_0_0,
      Sun_measurement_angle_0_0(31 downto 0) => Sun_measurement_angle_0_0(31 downto 0),
      Sun_measurement_angle_acquisition_0_0 => Sun_measurement_angle_acquisition_0_0,
      Sun_sensor_power_state_0_0 => Sun_sensor_power_state_0_0,
      Sun_sensor_power_state_perception_0_0 => Sun_sensor_power_state_perception_0_0,
      Sun_visible_sign_0_0(31 downto 0) => Sun_visible_sign_0_0(31 downto 0),
      Sun_visible_sign_acquisition_0_0 => Sun_visible_sign_acquisition_0_0,
      Telecontrol_ins_0(31 downto 0) => Telecontrol_ins_0(31 downto 0),
      Thruster_power_state_0_0 => Thruster_power_state_0_0,
      Thruster_power_state_perception_instruction_0_0 => Thruster_power_state_perception_instruction_0_0,
      Triaxial_contorl_signal1_0 => Triaxial_contorl_signal1_0,
      Triaxial_contorl_signal2_0 => Triaxial_contorl_signal2_0,
      Triaxial_contorl_signal3_0 => Triaxial_contorl_signal3_0,
      clk_0 => clk_0,
      gyro_power_off_signal_0_0 => gyro_power_off_signal_0_0,
      gyro_power_on_signal_0_0 => gyro_power_on_signal_0_0,
      out_Telemetry_data_0(31 downto 0) => out_Telemetry_data_0(31 downto 0),
      pulse_count_0_0(31 downto 0) => pulse_count_0_0(31 downto 0),
      pulse_count_acquisition_ins_0_0 => pulse_count_acquisition_ins_0_0,
      rst_0 => rst_0,
      sun_power_off_signal_0_0 => sun_power_off_signal_0_0,
      sun_power_on_signal_0_0 => sun_power_on_signal_0_0,
      thruster_power_off_signal_0_0 => thruster_power_off_signal_0_0,
      thruster_power_on_signal_0_0 => thruster_power_on_signal_0_0
    );
end STRUCTURE;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Thu Aug  3 09:13:10 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TI9_wrapper.bd
--Design      : TI9_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TI9_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 : out STD_LOGIC;
    out_TPCO_TCT_Thru_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 : out STD_LOGIC;
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end TI9_wrapper;

architecture STRUCTURE of TI9_wrapper is
  component TI9 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TPCO_TPI_Thru_powe_on_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TCT_Thru_powe_on_puls_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 : out STD_LOGIC;
    out_STPo_TPI_Thru_powe_on_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 : out STD_LOGIC
  );
  end component TI9;
begin
TI9_i: component TI9
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0) => in_TPCO_TPI_Thru_powe_on_inst_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0) => out_STPo_TPI_Thru_powe_on_inst_0(31 downto 0),
      out_STPo_TPI_Thru_powe_on_inst_stor_inst_0 => out_STPo_TPI_Thru_powe_on_inst_stor_inst_0,
      out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0) => out_TPCO_TCT_Thru_powe_on_puls_0(31 downto 0),
      out_TPCO_TPI_Thru_powe_on_inst_load_inst_0 => out_TPCO_TPI_Thru_powe_on_inst_load_inst_0,
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;


--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
--Date        : Wed Aug  2 23:51:06 2023
--Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
--Command     : generate_target TTC23_wrapper.bd
--Design      : TTC23_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TTC23_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    in_TDCR_TDCR_Thru_comb_logi_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TTI_TTI_Tria_cont_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTI_TTI_Tria_cont_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    start_0 : in STD_LOGIC
  );
end TTC23_wrapper;

architecture STRUCTURE of TTC23_wrapper is
  component TTC23 is
  port (
    clk_0 : in STD_LOGIC;
    rst_0 : in STD_LOGIC;
    done_0 : out STD_LOGIC;
    start_0 : in STD_LOGIC;
    in_TTI_TTI_Tria_cont_inst_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTCO_TCT_Tria_cont_sign_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_TDCR_TDCR_Thru_comb_logi_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_TTI_TTI_Tria_cont_inst_0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TTC23;
begin
TTC23_i: component TTC23
     port map (
      clk_0 => clk_0,
      done_0 => done_0,
      in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0) => in_TDCR_TDCR_Thru_comb_logi_0(31 downto 0),
      in_TTI_TTI_Tria_cont_inst_0(31 downto 0) => in_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      out_TTCO_TCT_Tria_cont_sign_0(31 downto 0) => out_TTCO_TCT_Tria_cont_sign_0(31 downto 0),
      out_TTI_TTI_Tria_cont_inst_0(31 downto 0) => out_TTI_TTI_Tria_cont_inst_0(31 downto 0),
      rst_0 => rst_0,
      start_0 => start_0
    );
end STRUCTURE;


//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
//Date        : Thu Aug  3 11:39:29 2023
//Host        : LAPTOP-3BUPBFF6 running 64-bit major release  (build 9200)
//Command     : generate_target I1_wrapper.bd
//Design      : I1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module I1_wrapper
   (clk_0,
    done_0,
    in_GCO_GI_Gyro_powe_on_inst_0_0,
    in_SSCO_SSI_Sun_sens_powe_on_inst_0_0,
    in_TPCO_TPI_Thru_powe_on_inst_0_0,
    out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0,
    out_GCO_G_Gyro_powe_on_puls_0_0,
    out_MI_MR_Curr_mode_0,
    out_MI_MR_Curr_mode_stor_inst_0,
    out_SGPo_GI_Gyro_powe_on_inst_0_0,
    out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0,
    out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0,
    out_SSCO_SS_Sun_sens_powe_on_puls_0_0,
    out_SSSP_SSI_Sun_sens_powe_on_inst_0_0,
    out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0,
    out_STPo_TPI_Thru_powe_on_inst_0_0,
    out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0,
    out_TPCO_TCT_Thru_powe_on_puls_0_0,
    out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0,
    out_a32I_a32I_a32m_inte_time_star_inst_0,
    rst_0,
    start_0);
  input clk_0;
  output done_0;
  input [31:0]in_GCO_GI_Gyro_powe_on_inst_0_0;
  input [31:0]in_SSCO_SSI_Sun_sens_powe_on_inst_0_0;
  input [31:0]in_TPCO_TPI_Thru_powe_on_inst_0_0;
  output out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0;
  output [31:0]out_GCO_G_Gyro_powe_on_puls_0_0;
  output [31:0]out_MI_MR_Curr_mode_0;
  output out_MI_MR_Curr_mode_stor_inst_0;
  output [31:0]out_SGPo_GI_Gyro_powe_on_inst_0_0;
  output out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0;
  output out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0;
  output [31:0]out_SSCO_SS_Sun_sens_powe_on_puls_0_0;
  output [31:0]out_SSSP_SSI_Sun_sens_powe_on_inst_0_0;
  output out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0;
  output [31:0]out_STPo_TPI_Thru_powe_on_inst_0_0;
  output out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0;
  output [31:0]out_TPCO_TCT_Thru_powe_on_puls_0_0;
  output out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0;
  output [31:0]out_a32I_a32I_a32m_inte_time_star_inst_0;
  input rst_0;
  input start_0;

  wire clk_0;
  wire done_0;
  wire [31:0]in_GCO_GI_Gyro_powe_on_inst_0_0;
  wire [31:0]in_SSCO_SSI_Sun_sens_powe_on_inst_0_0;
  wire [31:0]in_TPCO_TPI_Thru_powe_on_inst_0_0;
  wire out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0;
  wire [31:0]out_GCO_G_Gyro_powe_on_puls_0_0;
  wire [31:0]out_MI_MR_Curr_mode_0;
  wire out_MI_MR_Curr_mode_stor_inst_0;
  wire [31:0]out_SGPo_GI_Gyro_powe_on_inst_0_0;
  wire out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0;
  wire out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0;
  wire [31:0]out_SSCO_SS_Sun_sens_powe_on_puls_0_0;
  wire [31:0]out_SSSP_SSI_Sun_sens_powe_on_inst_0_0;
  wire out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0;
  wire [31:0]out_STPo_TPI_Thru_powe_on_inst_0_0;
  wire out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0;
  wire [31:0]out_TPCO_TCT_Thru_powe_on_puls_0_0;
  wire out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0;
  wire [31:0]out_a32I_a32I_a32m_inte_time_star_inst_0;
  wire rst_0;
  wire start_0;

  I1 I1_i
       (.clk_0(clk_0),
        .done_0(done_0),
        .in_GCO_GI_Gyro_powe_on_inst_0_0(in_GCO_GI_Gyro_powe_on_inst_0_0),
        .in_SSCO_SSI_Sun_sens_powe_on_inst_0_0(in_SSCO_SSI_Sun_sens_powe_on_inst_0_0),
        .in_TPCO_TPI_Thru_powe_on_inst_0_0(in_TPCO_TPI_Thru_powe_on_inst_0_0),
        .out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0(out_GCO_GI_Gyro_powe_on_inst_load_inst_0_0),
        .out_GCO_G_Gyro_powe_on_puls_0_0(out_GCO_G_Gyro_powe_on_puls_0_0),
        .out_MI_MR_Curr_mode_0(out_MI_MR_Curr_mode_0),
        .out_MI_MR_Curr_mode_stor_inst_0(out_MI_MR_Curr_mode_stor_inst_0),
        .out_SGPo_GI_Gyro_powe_on_inst_0_0(out_SGPo_GI_Gyro_powe_on_inst_0_0),
        .out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0(out_SGPo_GI_Gyro_powe_on_inst_stor_inst_0_0),
        .out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0(out_SSCO_SSI_Sun_sens_powe_on_inst_load_inst_0_0),
        .out_SSCO_SS_Sun_sens_powe_on_puls_0_0(out_SSCO_SS_Sun_sens_powe_on_puls_0_0),
        .out_SSSP_SSI_Sun_sens_powe_on_inst_0_0(out_SSSP_SSI_Sun_sens_powe_on_inst_0_0),
        .out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0(out_SSSP_SSI_Sun_sens_powe_on_inst_stor_inst_0_0),
        .out_STPo_TPI_Thru_powe_on_inst_0_0(out_STPo_TPI_Thru_powe_on_inst_0_0),
        .out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0(out_STPo_TPI_Thru_powe_on_inst_stor_inst_0_0),
        .out_TPCO_TCT_Thru_powe_on_puls_0_0(out_TPCO_TCT_Thru_powe_on_puls_0_0),
        .out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0(out_TPCO_TPI_Thru_powe_on_inst_load_inst_0_0),
        .out_a32I_a32I_a32m_inte_time_star_inst_0(out_a32I_a32I_a32m_inte_time_star_inst_0),
        .rst_0(rst_0),
        .start_0(start_0));
endmodule
