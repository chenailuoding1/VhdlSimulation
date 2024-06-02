library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE IEEE.numeric_std.ALL;
entity STPOI is port(-- Input ports
in_TPI_Thruster_power_on_inst:in STD_LOGIC_VECTOR (31 downto 0); -- input signal for Thruster power on instruction load instruction
-- Output ports
out_TPI_Thruster_power_on_inst:out STD_LOGIC; -- output signal for Thruster power on instruction load instruction
-- Local variables
Thruster_power_on_instruction:STD_LOGIC; -- local variable to store the Thruster power on instruction—Process
begin
process(in_TPI_Thruster_power_on_inst)
Thruster_power_on_instruction <= in_TPI_Thruster_power_on_inst;
end Behavioral; -- end of behavioral model