library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity GCO is 
Port(
in_Gyro_power_on_inst:in STD_LOGIC;
 -- input signal for Gyro power on instructionin_Gyro_power_on_pulse:in STD_LOGIC;
 -- input signal for Gyro power on pulseout_Gyro_power_on:out STD_LOGIC;
 -- output signal for Gyro power onout_Gyro_power_on_instruction:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for Gyro power on instructionout_Gyro_power_on_pulse:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for Gyro power on pulseout_Gyro_power_on_signal:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for Gyro power on signal
architecture Behavioral of GCO is 
begin
process(in_Gyro_power_on_inst, in_Gyro_power_on_pulse)
begin
out_Gyro_power_on <= in_Gyro_power_on_inst;
out_Gyro_power_on_instruction <= in_Gyro_power_on_inst;
out_Gyro_power_on_pulse <= in_Gyro_power_on_pulse;
end process;
end Behavioral;