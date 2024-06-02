library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity TTC is 
Port(-- Input 
Portsin_Gyro_power_on_instruction_load_instruction:in STD_LOGIC;
 -- input signal for Gyro power on instruction load instruction
in_Gyro_power_on_instruction:in STD_LOGIC;
 -- input signal for Gyro power on instruction
in_Gyro_power_on_pulse:in STD_LOGIC;-- input signal for Gyro power on pulse
-- Output 
Portsout_Thruster_power_on_instruction:out STD_LOGIC;-- output signal for Thruster power on instruction
out_Thruster_power_on_pulse:out STD_LOGIC;-- output signal for Thruster power on pulse-- Local variables
signal_Gyro_power_on_instruction_load_instruction:STD_LOGIC;-- local variable for Gyro power on instruction load instruction
signal_Gyro_power_on_instruction:STD_LOGIC;-- local variable for Gyro power on instruction
signal_Gyro_power_on_pulse:STD_LOGIC;-- local variable for Gyro power on pulse
-- Process definitions
process 
Thruster_Triaxial_Control(input signal_Gyro_power_on_instruction_load_instruction,input signal_Gyro_power_on_instruction,input signal_Gyro_power_on_pulse,output signal_Thruster_power_on_instruction,output signal_Thruster_power_on_pulse)
begin
-- Combinational logic
case (signal_Gyro_power_on_instruction_load_instruction) is
when 
Gyro_power_on_instruction_load_instruction =>signal_Thruster_power_on_instruction <= Gyro_power_on_instruction;
when 
others =>signal_Thruster_power_on_instruction <= signal_Gyro_power_on_instruction;
end case;
-- Clocking
always @(posedge signal_Gyro_power_on_instruction_load_instruction)
signal_Thruster_power_on_ <= Gyro_power_on_instruction;
end process;