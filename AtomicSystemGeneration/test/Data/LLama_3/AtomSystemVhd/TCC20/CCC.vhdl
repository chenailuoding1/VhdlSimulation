library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity ThrusterControlComputing is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_MR : in STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_ADR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TPCC : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure ThrusterProcess(input_MR : STD_LOGIC_VECTOR (31 downto 0);
input_ADR : STD_LOGIC_VECTOR (31 downto 0);
input_value : STD_LOGIC_VECTOR (31 downto 0);
input_TPCC : STD_LOGIC_VECTOR (31 downto 0)) is
begin-- Calculate Gyro Power On Instruction
out_MR <= in_MR;
out_ADR <= in_ADR;
out_value <= in_value;
out_TPCC <= in_TPCC;
end