library IEEE;
use IEEE.STD_LOGIC;
use IEEE.NUMERIC_STD;
entity MSMCC is
Port ( 
clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_GD : in STD_LOGIC_VECTOR (31 downto 0);
in_SSD : in STD_LOGIC_VECTOR (31 downto 0);
out_MR : out STD_LOGIC_VECTOR (31 downto 0);
out_ADR : out STD_LOGIC_VECTOR (31 downto 0);
out_MSMCC_next_cycle_mode : out NUMERIC_STD (31 downto 0);
out_MSMCC_current_mode_working_time : out NUMERIC_STD (31 downto 0);
);
-- Component Body
architecture Behavior of MSMCC is
begin-- Calculate Next Cycle Mode
out_MR <= in_MR xor in_SSD;
-- Calculate Current Mode Working Time
out_ADR <= in_ADR xor in_SSD;
-- Calculate Next Cycle Mode
out_MSMCC_next_cycle_mode <= in_MSMCC_next_cycle_mode xor in_SSD;
-- Calculate Current Mode Working Time
out_MSMCC_current_mode_working_time <= in_MSMCC_current_mode_working_time xor in_SSD;
end Behavior;
