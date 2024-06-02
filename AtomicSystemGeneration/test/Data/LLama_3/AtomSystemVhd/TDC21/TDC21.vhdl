library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TDC is-- Input ports
in_TDC_TD_Gyro_power_on_instruction:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for gyro power on instruction
in_TDC_TD_Gyro_power_on:in STD_LOGIC; -- input signal for gyro power on instruction
-- Output ports
out_TDC_TDCR_Gyro_power_on:out STD_LOGIC_VECTOR (31 downto 0); -- output signal for gyro power on instruction
—Behaviors
behavior Thruster_Distribution_Computing:process(in_TDC_TD_Gyro_power_on_instruction, in_TDC_TD_Gyro_power_on)
begin
-- Code for gyro power on instruction
-- Code for gyro power on pulse

-- Code for target angle load instruction-- Code for target angular velocity load instruction
end process;