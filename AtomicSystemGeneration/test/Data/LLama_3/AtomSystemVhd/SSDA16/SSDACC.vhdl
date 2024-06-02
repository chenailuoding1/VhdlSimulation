library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity SSDACC is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_SS : in STD_LOGIC;
out_SS : out STD_LOGIC;
out_SSDACC : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_pulse : out STD_LOGIC);
-- Component Processes
procedure SunSensorControlOutputProcess(input_SS : STD_LOGIC;
) is
begin-- Calculate Sun Sensor Power State Perception
out_SS <= input_SS xor in_SS;
-- Calculate Sun Measurement Angle
out_SSDACC <= input_SS xor in_SS;
-- Calculate Sun Visible Sign Storage
out_value <= input_SS xor in_SS;
-- Calculate Next Cycle Mode
out_pulse <= in_pulse xor in_SS;
end SunSensorControlOutputProcess;