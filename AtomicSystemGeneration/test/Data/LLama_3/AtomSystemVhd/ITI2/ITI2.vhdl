library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity 32ITI is 
Port(
in_32ms_interrupt_timer_start_inst:in STD_LOGIC;-- input signal for 32ms interrupt timer start instruction
out_GCO_GI_Gyro_powe_on_inst:out STD_LOGIC;-- output signal for Gyro power on instruction
out_GCOC_GCO_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Gyro power on pulse
out_GCO_G_Gyro_powe_on_puls:out STD_LOGIC_VECTOR ( 31 downto 0 ); -- output signal for Gyro power on pulse
out_calc_inst:out STD_LOGIC;-- output signal for calculate instruction);
architecture Behavioral of 32ITI is 
begin
process(in_32ms_interrupt_timer_start_inst)
begin
out_GCO_GI_Gyro_powe_on_inst <= in_32ms_interrupt_timer_start_inst;
out_GCOC_GCO_Gyro_powe_on_puls <= (others => '0');
out_GCO_G_Gyro_powe_on_puls <= (others => '0');
out_calc_inst <= '0';
end process;
end Behavioral;
