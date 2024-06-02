library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity GCO is 
Port(
in_Pulse_count_acquisition_inst:in STD_LOGIC;-- input signal for pulse count acquisition instruction
in_Gyro_power_state_perception_inst:in STD_LOGIC;-- input signal for gyro power state perception instruction
out_Gyro_power_on_instruction:out STD_LOGIC_VECTOR (31 downto 0);-- output signal for gyro power on instruction
out_Gyro_power_state_storage_instruction:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for gyro power state storage instruction
out_Angular_velocity_analog:out STD_LOGIC_VECTOR (31 downto 0);
 -- output signal for angular velocity analog
out_Gyro_power_state:out STD_LOGIC_VECTOR (31 downto 0);-- output signal for gyro power state
architecture Behavioral of GCO is 
begin
process(in_Pulse_count_acquisition_inst, in_Gyro_power_state_perception_inst)
begin
out_Gyro_power_on_instruction <= in_Pulse_count_acquisition_inst;
out_Gyro_power_state_storage_instruction <= in_Gyro_power_state_perception_inst;
end process;
process(out_Angular_velocity_analog)
begin
out_Gyro_power_state <= out_Angular_velocity_analog;
end process;
end Behavioral;