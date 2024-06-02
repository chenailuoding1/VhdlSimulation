library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TTCO_Op is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_TTI : in STD_LOGIC_VECTOR (31 downto 0);
out_TDCR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TTCC : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure ThrusterProcess(input_TTI : STD_LOGIC_VECTOR (31 downto 0);
input_value : STD_LOGIC_VECTOR (31 downto 0);
input_TTCC : STD_LOGIC_VECTOR (31 downto 0);
out_TDCR : out STD_LOGIC_VECTOR (31 downto 0);
out_value : out STD_LOGIC_VECTOR (31 downto 0);
out_TTCC : out STD_LOGIC_VECTOR (31 downto 0));