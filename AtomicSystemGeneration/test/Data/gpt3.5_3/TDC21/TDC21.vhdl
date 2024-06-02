library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThrusterDistributionComputing_Top is
    Port (
        -- Input signals
        thruster_power_state_load_instruction : in std_logic;
        triaxial_control_quantity_load_instruction : in std_logic;

        -- Output signals
        thruster_combination_logic : out std_logic_vector(7 downto 0);
        done : out std_logic
    );
end ThrusterDistributionComputing_Top;

architecture Behavioral of ThrusterDistributionComputing_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(7 downto 0);

begin
    ThrusterDistributionComputing_Control_Instance : entity work.ThrusterDistributionComputing_Control
        port map (
            thruster_power_state_load_instruction => thruster_power_state_load_instruction,
            triaxial_control_quantity_load_instruction => triaxial_control_quantity_load_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    ThrusterDistributionComputing_Calculation_Instance : entity work.ThrusterDistributionComputing_Calculation
        port map (
            thruster_power_state => processing_result(7 downto 0),
            triaxial_control_quantity => processing_result(15 downto 8),
            thruster_combination_logic => thruster_combination_logic
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            thruster_combination_logic <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
