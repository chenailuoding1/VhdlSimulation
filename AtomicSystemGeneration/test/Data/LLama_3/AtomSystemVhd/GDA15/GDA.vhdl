library IEEE;
use IEEE.STD_LOGIC_VECTOR.ALL;
use IEEE.NUMERIC_STD.ALL;
entity GDA_Top is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_GCO_power_on_inst : in STD_LOGIC_VECTOR (31 downto 0);
out_GCO_power_on_inst_load_inst : out STD_LOGIC;
out_GCO_power_on_pulse : out STD_LOGIC_VECTOR (31 downto 0));