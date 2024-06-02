library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThrusterPowerControlOutput_Top is
    Port (
        -- Input signals
        thruster_power_on_instruction_load_instruction : in std_logic;

        -- Output signals
        thruster_power_on_pulse : out std_logic_vector(31 downto 0);
        done : out std_logic
    );
end ThrusterPowerControlOutput_Top;

architecture Behavioral of ThrusterPowerControlOutput_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(31 downto 0);

begin
    ThrusterPowerControlOutput_Control_Instance : entity work.ThrusterPowerControlOutput_Control
        port map (
            thruster_power_on_instruction_load_instruction => thruster_power_on_instruction_load_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    ThrusterPowerControlOutput_Calculation_Instance : entity work.ThrusterPowerControlOutput_Calculation
        port map (
            thruster_power_on_instruction => processing_result,
            thruster_power_on_pulse => thruster_power_on_pulse
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            thruster_power_on_pulse <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
