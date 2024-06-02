library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD.ALL;
entity MSM3 is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_MSMCC : in MSM_COMPUTING_COMPONENT;
out_MSMCC : out MSM_COMPUTING_COMPONENT;
out_GD : out STD_LOGIC_VECTOR (31 downto 0);
out_SSD : out STD_LOGIC_VECTOR (31 downto 0);
out_MR : out NATURAL;
out_ADR : out STD_LOGIC_VECTOR (31 downto 0);
out_SSR : out STD_LOGIC_VECTOR (31 downto 0));
-- Component Processes
procedure ModeSwitchingManagementProcess(input_MSMCC : MSM_COMPUTING_COMPONENT;
) is
begin-- Calculate Next Cycle Mode
out_MSMCC <= input_MSMCC xor in_MSMCC;
-- Calculate Current Mode Working Time
out_MR <= in_MR + 1;
-- Calculate Next Cycle Mode
out_ADR <= in_ADR xor in_MSMCC;
-- Calculate Next Cycle Mode
out_SSR <= in_SSR xor in_MSMCC;
end ModeSwitchingManagementProcess;