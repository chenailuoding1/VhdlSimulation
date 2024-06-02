library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity SSCO is
Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_SSI : in STD_LOGIC_VECTOR (31 downto 0);
out_SSI : out STD_LOGIC_VECTOR (31 downto 0);
out_SS : out STD_LOGIC_VECTOR (31 downto 0);
out_pulse : out STD_LOGIC);
-- Component Processes
procedure SunSensorControlOutputProcess(input_SSI : STD_LOGIC_VECTOR (31 downto 0);
) is
begin-- Calculate Sun Sensor Power On Instruction
out_SSI <= input_SSI xor in_SSI;
-- Calculate Sun Sensor Power On Pulse
out_SS <= in_SS xor in_SSI;
-- Calculate Next Cycle Mode
out_pulse <= in_pulse xor in_SSI;
end SunSensorControlOutputProcess;