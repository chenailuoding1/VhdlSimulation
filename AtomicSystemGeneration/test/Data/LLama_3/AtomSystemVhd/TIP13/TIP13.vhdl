library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity TIPCC is 
Port(-- Input 
Portsin_Gyro_power_on_instruction:in STD_LOGIC;
 -- input signal for Gyro power on instruction
in_Telecontrol_instruction:in STD_LOGIC;
 -- input signal for Telecontrol instruction-- Output Ports
out_Next_cycle_mode:out STD_LOGIC_Unsigned;
 -- output signal for Next cycle mode
out_Telecontrol_instruction_storage:out STD_LOGIC;
 -- output signal for Telecontrol instruction storage
-- Local variables
signal_Gyro_power_on_instruction:STD_LOGIC;-- local variable for Gyro power on instruction
signal_Telecontrol_instruction:STD_LOGIC;-- local variable for Telecontrol instruction
signal_Next_cycle_mode:STD_LOGIC_Unsigned;-- local variable for Next cycle mode
begin
-- Synthesis of the system
TIP_Computing_Component(TIPCC):process(in_Gyro_power_on_instruction,in_Telecontrol_instruction)
begin
-- Calculate the Next cycle mode
signal_Next_cycle_mode <= in_Telecontrol_instruction;
-- Store the Telecontrol instruction in storage
out_Telecontrol_instruction_storage <= in_Telecontrol_instruction;
end