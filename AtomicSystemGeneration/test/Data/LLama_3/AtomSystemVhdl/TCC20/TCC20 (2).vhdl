library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TCC is-- Input ports
in_TCC_DMC_Gyro_power_on_instruction:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for gyro power on instructionin_TCC_DMC_Gyro_power_on:in STD_LOGIC; -- input signal for gyro power on instruction-- Output ports
out_TCC_DMC_Gyro_power_on:out STD_LOGIC; -- output signal for gyro power on instruction—Behaviors
behavior Thruster_Control_Computing_2:
process(in_TCC_DMC_Gyro_power_on_instruction, in_TCC_DMC_Gyro_power_on)
begin
-- Code for gyro power on instruction
-- Code for gyro power on pulse
-- Code for target angle load instruction
-- Code for target angular velocity load instruction
end process;
