library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity SGPOI is 
Port(
in_Triaxial_attitude_angle_load_instruction:in STD_LOGIC;-- input signal for Triaxial attitude angle load instruction
out_Next_cycle_mode:out STD_LOGIC;-- output signal for Next cycle mode
out_Current_mode_working_time:out STD_LOGIC;-- output signal for Current mode working time
out_Target_angle:out STD_LOGIC;-- output signal for Target angle
out_Target_angular_velocity:out STD_LOGIC;-- output signal for Target angular velocity
in_Mode_Switching_Management_Computing_Component:in STD_LOGIC;
 -- input signal for Mode switching management computing component);
architecture Behavior of SGPOI is
begin
-- Triaxial attitude angle load instruction
when in_Triaxial_attitude_angle_load_instruction = '1' and out_Current_mode_working_time = '1' then
out_Next_cycle_mode <= '1';
out_Target_angle <= in_Triaxial_attitude_angle_load_instruction;
out_Target_angular_velocity <= in_Triaxial_angular_velocity_load_instruction;
-- Triaxial angular velocity load instruction
when in_Triaxial_angular_velocity_load_instruction = '1' and out_Current_mode_working_time = '1' then
out_Next_cycle_mode <= '1';
out_Target_angle <= in_Sun_visible_sign_load_instruction;
out_Target_angular_velocity <= in_Triaxial_angular_velocity_load_instruction;
-- Sun visible sign load instruction
when in_Sun_visible_sign_load_instruction = '1' and out_Current_mode_working_time = '1' thenout_Next_cycle_mode <= '1';
out_Target_angle <= in_Sun_visible_sign_load_instruction;
out_Target_angular_velocity <= in_Triaxial_angular_velocity_load_instruction;
end Behavior;