library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE IEEE.numeric_std.ALL;
entity SGPOI is port(-- Input ports
in_GI_Gyro_powe_on_inst:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Gyro power on instruction load instruction
in_GCOC_Gyro_powe_on_puls:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Gyro power on pulse
-- Output ports
out_GI_Gyro_powe_on_inst_load_inst:out STD_LOGIC; -- output signal for Gyro power on instruction load instruction
out_GCOC_Gyro_powe_on_puls:out STD_LOGIC_VECTOR (31 downto 0); -- output signal for Gyro power on pulse-- Local variables
Gyro_power_on_instruction:STD_LOGIC; -- local variable to store the Gyro power on instruction
Gyro_powe_on_puls:STD_LOGIC_VECTOR (31 downto 0); -- local variable to store the Gyro power on pulse—Process
Begin
process(in_GI_Gyro_powe_on_inst, in_GCOC_Gyro_powe_on_puls)Gyro_power_on_instruction <= in_GI_Gyro_powe_on_inst;
Gyro_powe_on_puls <= in_GCOC_Gyro_powe_on_puls;
end Behavioral; -- end of behavioral model