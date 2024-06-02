library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SSDA is-- Input ports
in_SSI_Gyro_power_on_inst:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Gyro power on instruction load instruction
in_SSCOCC_Gyro_power_on_pulse:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Gyro power on pulse
-- Output ports
out_SSI_Gyro_power_on_inst:out STD_LOGIC; -- output signal for Gyro power on instruction load instruction
out_SSDACC_Sun_measurement_angle:out STD_LOGIC; -- output signal for Sun measurement angle
—Behaviors
behavior 
Sun_visible_sign_acquisition_instruction:
Begin
Sun_visible_sign_instruction <= in_SSI_Gyro_power_on_inst;
end;
behavior 
Angle_analog_acquisition_instruction:
begin
Angle_analog_instruction <= in_SSCOCC_Gyro_power_on_pulse;
end;
behavior Sun_sensor_power_state_perception_instruction:
begin
Sun_sensor_power_state_perception_instruction <= in_SSI_Gyro_power_on_inst;
end;
behavior Angle_analog_storage_instruction:
begin
Angle_analog_storage_instruction <= in_SSCOCC_Gyro_power_on_pulse;
end;
behavior 
Sun_visible_sign_storage_instruction:
Begin
Sun_visible_sign_storage_instruction <= in_SSI_Gyro_power_on_inst;
end;
behavior Sun_measurement_angle_storage_instruction:
begin
Sun_measurement_angle_storage_instruction <= in_SSI_Gyro_power_on_inst;end;behavior Sun_sensor_power_state_storage_instruction:
begin
Sun_sensor_power_state_storage_instruction <= in_SSI_Gyro_power_on_inst;
end;