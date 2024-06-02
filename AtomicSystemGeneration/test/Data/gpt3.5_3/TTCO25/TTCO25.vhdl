library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
USE ieee.numeric_std.ALL;

entity ThrusterTriaxialControlOutput_Top is
    Port (
        -- Input signals
        triaxial_control_instruction_load_instruction : in std_logic;

        -- Output signals
        triaxial_control_signal : out std_logic_vector(31 downto 0);
        done : out std_logic
    );
end ThrusterTriaxialControlOutput_Top;

architecture Behavioral of ThrusterTriaxialControlOutput_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(31 downto 0);

begin
    ThrusterTriaxialControlOutput_Control_Instance : entity work.ThrusterTriaxialControlOutput_Control
        port map (
            triaxial_control_instruction_load_instruction => triaxial_control_instruction_load_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    ThrusterTriaxialControlOutput_Calculation_Instance : entity work.ThrusterTriaxialControlOutput_Calculation
        port map (
            triaxial_control_instruction => processing_result,
            triaxial_control_signal => triaxial_control_signal
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            triaxial_control_signal <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
