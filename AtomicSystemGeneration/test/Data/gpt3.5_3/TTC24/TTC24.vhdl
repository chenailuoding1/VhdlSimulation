library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThrusterTriaxialControl_Top is
    Port (
        -- Input signals
        thruster_combination_logic_load_instruction : in std_logic;

        -- Output signals
        triaxial_control_instruction : out std_logic_vector(31 downto 0);
        done : out std_logic
    );
end ThrusterTriaxialControl_Top;

architecture Behavioral of ThrusterTriaxialControl_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(31 downto 0);

begin
    ThrusterTriaxialControl_Control_Instance : entity work.ThrusterTriaxialControl_Control
        port map (
            thruster_combination_logic_load_instruction => thruster_combination_logic_load_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    ThrusterTriaxialControl_Calculation_Instance : entity work.ThrusterTriaxialControl_Calculation
        port map (
            thruster_combination_logic => processing_result,
            triaxial_control_instruction => triaxial_control_instruction
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            triaxial_control_instruction <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
