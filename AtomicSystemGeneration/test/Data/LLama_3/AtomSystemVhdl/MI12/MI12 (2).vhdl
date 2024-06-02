library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity MI is 
Port(
in_Current_mode:in STD_LOGIC;-- input signal for current mode
out_Current_mode_storage_instruction:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for current mode storage instruction
out_Gyro_power_on_instruction_load_instruction:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for gyro power on instruction load instruction
out_Gyro_power_on_instruction:out STD_LOGIC;
 -- output signal for gyro power on instruction
out_Gyro_power_on_pulse:out STD_LOGIC_VECTOR (31 downto 0);-- output signal for gyro power on pulse
out_Gyro_power_on:out STD_LOGIC;-- output signal for gyro power on
architecture Behavioral of MI is 
begin
process(in_Current_mode)
begin
out_Current_mode_storage_instruction <= in_Current_mode;
end process;
process(out_Gyro_power_on_instruction_load_instruction)
begin
out_Gyro_power_on_instruction <= out_Gyro_power_on_instruction_load_instruction;
end process;
process(out_Gyro_power_on_pulse)
begin
out_Gyro_power_on_instruction <= out_Gyro_power_on_pulse;
end process;
process(out_Gyro_power_on)
begin
out_Gyro_power_on_instruction <= out_Gyro_power_on;
end process;
end Behavioral;
