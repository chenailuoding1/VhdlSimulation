library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity StoreThrusterPowerOnInstruction is
    Port (
        -- Input signals
        thruster_power_on_instruction_load_instruction : in std_logic;

        -- Output signals
        thruster_power_on_instruction : out std_logic_vector(7 downto 0)
    );
end StoreThrusterPowerOnInstruction;

architecture Behavioral of StoreThrusterPowerOnInstruction is
begin
    process(thruster_power_on_instruction_load_instruction)
    begin
        -- Implement your Store Thruster Power on Instruction logic here

        -- Sample data based on conditions
        if thruster_power_on_instruction_load_instruction = '1' then
            -- Load thruster power on instruction
            -- Set thruster_power_on_instruction based on your requirements
        end if;

        -- Output sampled data
        thruster_power_on_instruction <= std_logic_vector(to_unsigned(thruster_power_on_instruction_internal, 8));
    end process;

end Behavioral;
