library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TelecontrolInstructionProcessing_Top is
    Port (
        -- Input signals
        telecontrol_instruction : in std_logic;

        -- Output signals
        next_cycle_mode : out std_logic_vector(7 downto 0);
        done : out std_logic
    );
end TelecontrolInstructionProcessing_Top;

architecture Behavioral of TelecontrolInstructionProcessing_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(7 downto 0);

begin
    TelecontrolInstructionProcessing_Control_Instance : entity work.TelecontrolInstructionProcessing_Control
        port map (
            telecontrol_instruction => telecontrol_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    TelecontrolInstructionProcessing_Calculation_Instance : entity work.TelecontrolInstructionProcessing_Calculation
        port map (
            telecontrol_instruction => telecontrol_instruction,
            next_cycle_mode => processing_result
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            next_cycle_mode <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
