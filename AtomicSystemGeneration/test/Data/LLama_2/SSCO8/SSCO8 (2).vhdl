library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity SSCO is port(-- Input ports
in_SSI_Sun_sensor_power_on_inst:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Sun sensor power on instruction load instruction
in_SSCOCC_Sun_sensor_power_on_pulse:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Sun sensor power on pulse-- Output ports
out_SSI_Sun_sensor_power_on_inst:out STD_LOGIC; -- output signal for Sun sensor power on instruction load instruction
out_SSCOCC_Sun_sensor_power_on_pulse:out STD_LOGIC; -- output signal for Sun sensor power on pulse—Behaviors
behavior Sun_sensor_power_on_instruction_load_instruction:
begin
Sun_sensor_power_on_instruction <= in_SSI_Sun_sensor_power_on_inst;
end;
behavior Sun_sensor_power_on_instruction_compute:
begin
Sun_sensor_power_on_instruction <= Sun_sensor_power_on_instruction;end;behavior Sun_sensor_power_on_pulse:beginSun_sensor_power_on_pulse <= in_SSCOCC_Sun_sensor_power_on_pulse;
end;
behavior Sun_sensor_power_on_pulse_compute:
begin
Sun_sensor_power_on_pulse <= Sun_sensor_power_on_pulse;
end;
behavior Sun_sensor_power_on_pulse_load_instruction:
begin
Sun_sensor_power_on_pulse <= in_SSI_Sun_sensor_power_on_pulse;
end;
