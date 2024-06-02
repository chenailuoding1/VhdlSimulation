library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TIP is
Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_TIP : in STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_TIP : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure TelecontrolInstructionProcess(input_TIP : STD_LOGIC_VECTOR (31 downto 0);
) isbegin-- Calculate Next Cycle Mode
out_MR <= input_TIP xor in_MR;
-- Calculate Gyro Power On Instruction Load Instruction
out_TIP <= input_TIP xor in_TIP;
-- Calculate Gyro Power On Instruction
out_value <= input_TIP xor in_value;
-- Calculate Next Cycle Mode Storage Instruction
out_MR <= input_MR xor in_MR;
end TelecontrolInstructionProcess;