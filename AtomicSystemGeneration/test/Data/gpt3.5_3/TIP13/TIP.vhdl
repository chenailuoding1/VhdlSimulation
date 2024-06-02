library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TelecontrolInstructionProcessing_Control is
    Port (
        -- Input signals
        telecontrol_instruction : in std_logic;

        -- Output signals
        start_processing : out std_logic;
        done : out std_logic
    );
end TelecontrolInstructionProcessing_Control;

architecture Behavioral of TelecontrolInstructionProcessing_Control is
    type states is (Idle, LoadData, PerformProcessing, OutputResult);
    signal state : states := Idle;

begin
    process(state)
    begin
        case state is
            when Idle =>
                -- Check conditions to transition to the next state
                if telecontrol_instruction = '1' then
                    state <= LoadData;
                    start_processing <= '1';
                else
                    state <= Idle;
                    start_processing <= '0';
                end if;

            when LoadData =>
                -- Check conditions to transition to the next state
                state <= PerformProcessing;

            when PerformProcessing =>
                -- Check conditions to transition to the next state
                -- Implement logic for processing the telecontrol instruction here
                state <= OutputResult;

            when OutputResult =>
                -- Implement logic for outputting results here
                state <= Idle;
                done <= '1';  -- Indicate that the processing is done

        end case;
    end process;

end Behavioral;
