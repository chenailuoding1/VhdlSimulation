library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA is
port(
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSDA;
architecture Behavioral of SSDA is
component SSDA_con is
port(

    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end component;
component SSDA_com is
port(
	out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end component;
signal m_calc_inst:STD_LOGIC_VECTOR ( 31 downto 0 );--
signal m_Sun_mea_ang:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal m_Ang_ana:STD_LOGIC_VECTOR ( 31 downto 0 );
begin
SSDA_con_process:SSDA_con port map(

in_Sun_vis_sig => in_Sun_vis_sig,
    in_Ang_ana => in_Ang_ana,
    in_Sun_sen_pow_sta => in_Sun_sen_pow_sta,
    in_Sun_Sen_Dat_Acq_2_start => in_Sun_Sen_Dat_Acq_2_start,
    out_Sun_vis_sig_sto_ins => out_Sun_vis_sig_sto_ins,
    out_Sun_vis_sig => out_Sun_vis_sig,
    out_Sun_mea_ang_sto_ins => out_Sun_mea_ang_sto_ins,
    out_Sun_mea_ang => out_Sun_mea_ang,
    out_Sun_sen_pow_sta_sto_ins => out_Sun_sen_pow_sta_sto_ins,
    out_Sun_sen_pow_sta => out_Sun_sen_pow_sta,
    out_Sun_vis_sig_acq_ins => out_Sun_vis_sig_acq_ins,
    out_Ang_ana_acq_ins => out_Ang_ana_acq_ins,
    out_Sun_sen_pow_sta_per_ins => out_Sun_sen_pow_sta_per_ins,
    out_Sun_Sen_Dat_Acq_2_done => out_Sun_Sen_Dat_Acq_2_done,
    in_Sun_mea_ang => m_Sun_mea_ang,
    out_Ang_ana => m_Ang_ana,
out_calc_inst=> m_calc_inst,
clk=>clk,
rst=>rst
);
SSDA_com_process:SSDA_com port map(
out_Sun_mea_ang => m_Sun_mea_ang,
    in_Ang_ana => m_Ang_ana,
in_calc_inst=> m_calc_inst
);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA_con is
port(
    in_Sun_vis_sig:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_sen_pow_sta:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_Sen_Dat_Acq_2_start:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_sto_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_vis_sig_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana_acq_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_sen_pow_sta_per_ins:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Sun_Sen_Dat_Acq_2_done:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Sun_mea_ang:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ang_ana:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end SSDA_con;
architecture Behavioral of SSDA_con is
signal RAM_Sun_vis_sig: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Ang_ana: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_sen_pow_sta: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_Sen_Dat_Acq_2_start: STD_LOGIC_VECTOR ( 31 downto 0 );
    signal RAM_Sun_mea_ang: STD_LOGIC_VECTOR ( 31 downto 0 );
Type states is (sta_0,sta_1,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_0=>
                        if in_Sun_Sen_Dat_Acq_2_start = std_logic_vector(to_unsigned(1, 32)) then
                            
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
sta <=sta_6;

when sta_6=>
sta <=sta_7;

when sta_7=>
sta <=sta_0;

out_Sun_Sen_Dat_Acq_2_done <= std_logic_vector(to_unsigned(1, 32));
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Sun_vis_sig_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_2=>
out_Ang_ana_acq_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_3=>
out_Sun_sen_pow_sta_per_ins<= std_logic_vector(to_unsigned(1, 32));

when sta_4=>
out_Ang_ana<=RAM_Ang_ana ;

when sta_5=>
out_Sun_vis_sig_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_vis_sig<=RAM_Sun_vis_sig ;

when sta_6=>
out_Sun_mea_ang_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_mea_ang<=RAM_Sun_mea_ang ;

when sta_7=>
out_Sun_sen_pow_sta_sto_ins<= std_logic_vector(to_unsigned(1, 32));

out_Sun_sen_pow_sta<=RAM_Sun_sen_pow_sta ;

when sta_0=>

        end case;
	end process;
process(in_Sun_vis_sig)
	begin
		RAM_Sun_vis_sig<=in_Sun_vis_sig;
	end process;

process(in_Ang_ana)
	begin
		RAM_Ang_ana<=in_Ang_ana;
	end process;

process(in_Sun_sen_pow_sta)
	begin
		RAM_Sun_sen_pow_sta<=in_Sun_sen_pow_sta;
	end process;

process(in_Sun_Sen_Dat_Acq_2_start)
	begin
		RAM_Sun_Sen_Dat_Acq_2_start<=in_Sun_Sen_Dat_Acq_2_start;
	end process;

process(in_Sun_mea_ang)
	begin
		RAM_Sun_mea_ang<=in_Sun_mea_ang;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity SSDA_com is
port(
    out_Sun_mea_ang:out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Ang_ana:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )

);
end SSDA_com;
architecture Behavioral of SSDA_com is

begin
    process(in_Ang_ana)

    begin


                --



	end process;



end Behavioral;


