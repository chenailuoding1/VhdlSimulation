library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SunSensorControlOutput_Control is
    Port (
        -- Input signals
        sun_sensor_power_on_instruction_load_instruction : in std_logic;
        
        -- Output signals
        start_calculation : out std_logic;
        done : out std_logic
    );
end SunSensorControlOutput_Control;

architecture Behavioral of SunSensorControlOutput_Control is
    type states is (Idle, LoadData, PerformCalculation, OutputResult);
    signal state : states := Idle;

begin
    process(state)
    begin
        case state is
            when Idle =>
                -- Check conditions to transition to the next state
                if sun_sensor_power_on_instruction_load_instruction = '1' then
                    state <= LoadData;
                    start_calculation <= '1';
                else
                    state <= Idle;
                    start_calculation <= '0';
                end if;

            when LoadData =>
                -- Check conditions to transition to the next state
                state <= PerformCalculation;

            when PerformCalculation =>
                -- Check conditions to transition to the next state
                -- Implement logic for performing calculations here
                state <= OutputResult;

            when OutputResult =>
                -- Implement logic for outputting results here
                state <= Idle;
                done <= '1';  -- Indicate that the calculation is done

        end case;
    end process;

end Behavioral;
