library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity ThrusterDistributionComputing_Calculation is
    Port (
        -- Input signals
        thruster_power_state : in std_logic_vector(7 downto 0);
        triaxial_control_quantity : in std_logic_vector(15 downto 0);

        -- Output signals
        thruster_combination_logic : out std_logic_vector(7 downto 0)
    );
end ThrusterDistributionComputing_Calculation;

architecture Behavioral of ThrusterDistributionComputing_Calculation is
begin
    process(thruster_power_state, triaxial_control_quantity)
    begin
        -- Implement your calculation logic here
        -- This is a placeholder; replace it with your actual logic
        -- Example: Concatenate input vectors to create thruster_combination_logic
        thruster_combination_logic <= thruster_power_state & triaxial_control_quantity;
    end process;

end Behavioral;
