library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA is
port(
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GDA;
architecture Behavioral of GDA is
component GDA_con is
port(

    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component GDA_com is
port(
	out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Ang_vel_ana:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Pul_cou:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
GDA_con_process:GDA_con port map(

in_Pul_cou => in_Pul_cou,
    in_Gyr_pow_sta => in_Gyr_pow_sta,
    in_Gyr_Dat_Acq_2_start => in_Gyr_Dat_Acq_2_start,
    out_Ang_vel_ana_sto_ins => out_Ang_vel_ana_sto_ins,
    out_Ang_vel_ana => out_Ang_vel_ana,
    out_Gyr_pow_sta_sto_ins => out_Gyr_pow_sta_sto_ins,
    out_Gyr_pow_sta => out_Gyr_pow_sta,
    out_Pul_cou_acq_ins => out_Pul_cou_acq_ins,
    out_Gyr_pow_sta_per_ins => out_Gyr_pow_sta_per_ins,
    out_Gyr_Dat_Acq_2_done => out_Gyr_Dat_Acq_2_done,
    in_Ang_vel_ana => m_Ang_vel_ana,
    out_Pul_cou => m_Pul_cou,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
GDA_com_process:GDA_com port map(
out_Ang_vel_ana => m_Ang_vel_ana,
    in_Pul_cou => m_Pul_cou,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA_con is
port(
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Gyr_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Gyr_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_vel_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Pul_cou:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end GDA_con;
architecture Behavioral of GDA_con is
signal RAM_Pul_cou: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Gyr_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Ang_vel_ana: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Gyr_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;

                        end if;
when sta_1=>
sta <=sta_2;

when sta_2=>
sta <=sta_3;

when sta_3=>
sta <=sta_4;

when sta_4=>
sta <=sta_5;

when sta_5=>
sta <=sta_0;

out_Gyr_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Pul_cou_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Gyr_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Pul_cou<=RAM_Pul_cou ;

when sta_4=>
out_Ang_vel_ana_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Ang_vel_ana<=RAM_Ang_vel_ana ;

when sta_5=>
out_Gyr_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Gyr_pow_sta<=RAM_Gyr_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Pul_cou)
	begin
		RAM_Pul_cou<=in_Pul_cou;
	end process;

process(in_Gyr_pow_sta)
	begin
		RAM_Gyr_pow_sta<=in_Gyr_pow_sta;
	end process;

process(in_Gyr_Dat_Acq_2_start)
	begin
		RAM_Gyr_Dat_Acq_2_start<=in_Gyr_Dat_Acq_2_start;
	end process;

process(in_Ang_vel_ana)
	begin
		RAM_Ang_vel_ana<=in_Ang_vel_ana;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity GDA_com is
port(
    out_Ang_vel_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Pul_cou:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end GDA_com;
architecture Behavioral of GDA_com is

begin
    process(in_Pul_cou)

    begin


                --



	end process;



end Behavioral;


