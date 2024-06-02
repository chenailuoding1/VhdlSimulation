module AD18(input clk,input rst,output done,input in_Gyro_power_on_inst,input in_Sun_visible_sign,input in_Sun_measurement_angle,input in_Current_mode,output out_Angular_velocity_analog,output out_Sun_visible_sign,output out_Sun_measurement_angle,output out_Current_mode,output out_Triaxial_attitude_angle);
architecture Behavior of AD18 is
begin
process(in_Gyro_power_on_inst, in_Sun_visible_sign, in_Sun_measurement_angle, in_Current_mode)beginout_Angular_velocity_analog <= in_GD(31 downto 0);
out_Sun_visible_sign <= in_SSD(31 downto 0);
out_Sun_measurement_angle <= in_SSD(31 downto 0);
out_Current_mode <= in_MR(31 downto 0);
out_Triaxial_attitude_angle <= in_ADR(31 downto 0);
end process;
end Behavior;
