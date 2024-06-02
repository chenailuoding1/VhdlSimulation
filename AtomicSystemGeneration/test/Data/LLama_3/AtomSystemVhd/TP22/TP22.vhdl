library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TP is-- Input ports
in_TP_DMC_Current_mode:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for current mode load instruction
in_TP_DMC_Triaxial_attitude_angle:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for triaxial attitude angle load instruction
in_TP_DMC_Triaxial_angular_velocity:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for triaxial angular velocity load instruction
-- Output ports
out_TP_DMC_Current_mode:out STD_LOGIC; -- output signal for current mode load instruction
out_TP_DMC_Triaxial_attitude_angle:out STD_LOGIC_VECTOR (31 downto 0); 
-- output signal for triaxial attitude angle load instruction
out_TP_DMC_Triaxial_angular_velocity:out STD_LOGIC_VECTOR (31 downto 0); -- output signal for triaxial angular velocity load instruction—Behaviors
behavior 
Telemetry_Processing_3:process(in_TP_DMC_Current_mode, in_TP_DMC_Triaxial_attitude_angle, in_TP_DMC_Triaxial_angular_velocity)
begin-- Code for current mode load instruction
-- Code for triaxial attitude angle load instruction
-- Code for triaxial angular velocity load instruction
end process;