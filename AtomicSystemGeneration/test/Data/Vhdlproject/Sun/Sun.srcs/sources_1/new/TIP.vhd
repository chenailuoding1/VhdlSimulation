library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP is
port(
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TIP;
architecture Behavioral of TIP is
component TIP_con is
port(

    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component TIP_com is
port(
	out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Nex_cyc_mod:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Tel_ins:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
TIP_con_process:TIP_con port map(

in_Tel_ins => in_Tel_ins,
    in_Tel_Ins_Pro_start => in_Tel_Ins_Pro_start,
    out_Nex_cyc_mod_sto_ins => out_Nex_cyc_mod_sto_ins,
    out_Nex_cyc_mod => out_Nex_cyc_mod,
    out_Tel_Ins_Pro_done => out_Tel_Ins_Pro_done,
    in_Nex_cyc_mod => m_Nex_cyc_mod,
    out_Tel_ins => m_Tel_ins,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
TIP_com_process:TIP_com port map(
out_Nex_cyc_mod => m_Nex_cyc_mod,
    in_Tel_ins => m_Tel_ins,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP_con is
port(
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Nex_cyc_mod:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end TIP_con;
architecture Behavioral of TIP_con is
signal RAM_Tel_ins: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Tel_Ins_Pro_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Nex_cyc_mod: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Tel_Ins_Pro_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_0;

out_Tel_Ins_Pro_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Tel_ins<=RAM_Tel_ins ;

when sta_2=>
out_Nex_cyc_mod_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Nex_cyc_mod<=RAM_Nex_cyc_mod ;

when sta_0=>

        end case;
	end process;
process(in_Tel_ins)
	begin
		RAM_Tel_ins<=in_Tel_ins;
	end process;

process(in_Tel_Ins_Pro_start)
	begin
		RAM_Tel_Ins_Pro_start<=in_Tel_Ins_Pro_start;
	end process;

process(in_Nex_cyc_mod)
	begin
		RAM_Nex_cyc_mod<=in_Nex_cyc_mod;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity TIP_com is
port(
    out_Nex_cyc_mod:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_ins:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end TIP_com;
architecture Behavioral of TIP_com is

begin
    process(in_Tel_ins)

    begin


                --



	end process;



end Behavioral;


