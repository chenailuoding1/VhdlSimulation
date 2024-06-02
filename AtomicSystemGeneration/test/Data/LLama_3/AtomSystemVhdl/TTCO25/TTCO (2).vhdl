library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TTCO_Top_Level is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_TTI : in STD_LOGIC_VECTOR (31 downto 0);
out_TTCO : out STD_LOGIC_VECTOR (31 downto 0);
out_TCT : out STD_LOGIC_VECTOR (31 downto 0);
);
end;