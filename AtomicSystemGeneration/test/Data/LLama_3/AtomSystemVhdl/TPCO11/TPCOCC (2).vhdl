library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TPCO_Op is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_TDCR : in STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TPCC : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure ThrusterProcess(input_TDCR : STD_LOGIC_VECTOR (31 downto 0);
input_value : STD_LOGIC_VECTOR (31 downto 0);
input_TPCC : STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TPCC : out STD_LOGIC_VECTOR (31 downto 0));