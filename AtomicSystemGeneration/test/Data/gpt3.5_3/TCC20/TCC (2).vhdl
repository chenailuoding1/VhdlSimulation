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