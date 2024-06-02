library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity TTCO_Comp is
Port ( in_TTI : in STD_LOGIC_VECTOR (31 downto 0);
out_TTCO : out STD_LOGIC_VECTOR (31 downto 0);
out_TCT : out STD_LOGIC_VECTOR (31 downto 0);
);
end;