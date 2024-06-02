library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThrusterPowerControlOutput_Control is
    Port (
        -- Input signals
        thruster_power_on_instruction_load_instruction : in std_logic;
        
        -- Output signals
        start_processing : out std_logic;
        done : out std_logic
    );
end ThrusterPowerControlOutput_Control;

architecture Behavioral of ThrusterPowerControlOutput_Control is
    type states is (Idle, LoadInstruction, PerformProcessing, OutputResult);
    signal state : states := Idle;

begin
    process(state)
    begin
        case state is
            when Idle =>
                -- Check conditions to transition to the next state
                if thruster_power_on_instruction_load_instruction = '1' then
                    state <= LoadInstruction;
                    start_processing <= '1';
                else
                    state <= Idle;
                    start_processing <= '0';
                end if;

            when LoadInstruction =>
                -- Check conditions to transition to the next state
                state <= PerformProcessing;

            when PerformProcessing =>
                -- Implement logic for processing thruster power control data here
                state <= OutputResult;

            when OutputResult =>
                -- Implement logic for outputting results here
                state <= Idle;
                done <= '1';  -- Indicate that the processing is done

        end case;
    end process;

end Behavioral;
