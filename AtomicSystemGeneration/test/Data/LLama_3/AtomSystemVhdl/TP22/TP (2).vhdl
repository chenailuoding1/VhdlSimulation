library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TelemetryProcessing is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_TP : in STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_ADR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TPCC : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure TelemetryProcess(input_TP : STD_LOGIC_VECTOR (31 downto 0);
) is
begin-- Calculate Current Mode Load Instruction
out_MR <= input_TP xor in_MR;
-- Calculate Triaxial Attitude
out_ADR <= input_TP xor in_ADR;
-- Calculate Angular Velocity
out_value <= input_TP xor in_value;
-- Calculate Telemetry Data
out_TPCC <= input_TP xor in_TPCC;
end;