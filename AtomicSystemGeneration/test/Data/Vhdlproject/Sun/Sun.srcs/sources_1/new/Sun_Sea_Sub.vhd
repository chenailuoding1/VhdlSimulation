library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;
entity Sun_Sea_Sub is
port(
    in_Ini_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Ins_Pro_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Dat_Acq_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Att_Det_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Mod_Swi_Man_3_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Con_Com_2_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Dis_Com_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Tel_Pro_3_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_Thr_Tri_Con_done:in STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Ini_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Ins_Pro_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Dat_Acq_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Att_Det_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Mod_Swi_Man_3_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Con_Com_2_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Dis_Com_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Tel_Pro_3_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_Thr_Tri_Con_start:out STD_LOGIC_VECTOR ( 31 downto 0 );
clk:in std_logic;
rst:in std_logic


);
end Sun_Sea_Sub;
architecture Behavioral of Sun_Sea_Sub is

Type states is (sta_0,sta_1,sta_while_2,sta_2,sta_3,sta_4,sta_5,sta_6,sta_7,sta_8,sta_at_9,sta_9,sta_while_9);
signal sta:states;
begin
process(clk,rst)
    begin
        if rst = '1' then
            sta <= sta_0;
        elsif clk'event and clk = '1' then
            case sta is
            
when sta_at_9=>
                        if in_128=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_9;
                        end if; 
when sta_while_2=>
                        if in_not=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_2;
                        end if; 
when sta_while_9=>
                        if in_160=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_2;
                        end if; 
when sta_0=>
                        if in_Sun_Sea_Sub_start=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_1;
                        end if; 
when sta_1=>
                        if in_Ini_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_2;
                        end if; 
when sta_2=>
                        if in_Tel_Ins_Pro_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_3;
                        end if; 
when sta_3=>
                        if in_Dat_Acq_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_4;
                        end if; 
when sta_4=>
                        if in_Att_Det_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_5;
                        end if; 
when sta_5=>
                        if in_Mod_Swi_Man_3_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_6;
                        end if; 
when sta_6=>
                        if in_Thr_Con_Com_2_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_7;
                        end if; 
when sta_7=>
                        if in_Thr_Dis_Com_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_8;
                        end if; 
when sta_8=>
                        if in_Tel_Pro_3_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_at_9;
                        end if; 
when sta_9=>
                        if in_Thr_Tri_Con_done=std_logic_vector(to_unsigned(1, 32)) then
                            
sta <=sta_while_9;
                        end if; 
            end case;

        end if;

end process;
process(sta)
    begin
        case  sta is
            
when sta_1=>
out_Ini_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_2=>
out_Tel_Ins_Pro_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_3=>
out_Dat_Acq_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_4=>
out_Att_Det_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_5=>
out_Mod_Swi_Man_3_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_6=>
out_Thr_Con_Com_2_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_7=>
out_Thr_Dis_Com_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_8=>
out_Tel_Pro_3_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_9=>
out_Thr_Tri_Con_start<= std_logic_vector(to_unsigned(1, 32)) ;

when sta_at_9=>
when sta_while_2=>
when sta_while_9=>
when sta_0=>
out_Ini_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Tel_Ins_Pro_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Dat_Acq_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Att_Det_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Mod_Swi_Man_3_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Con_Com_2_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Dis_Com_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Tel_Pro_3_start<= std_logic_vector(to_unsigned(0, 32)) ;

out_Thr_Tri_Con_start<= std_logic_vector(to_unsigned(0, 32)) ;


        end case;
	end process;
end Behavioral;
