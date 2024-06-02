library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TelemetryProcessing_Control is
    Port (
        -- Input signals
        current_mode_load_instruction : in std_logic;
        triaxial_attitude_angle_load_instruction : in std_logic;
        triaxial_angular_velocity_load_instruction : in std_logic;
        telemetry_data_transmission_instruction : in std_logic;

        -- Output signals
        start_processing : out std_logic;
        done : out std_logic
    );
end TelemetryProcessing_Control;

architecture Behavioral of TelemetryProcessing_Control is
    type states is (Idle, LoadData, PerformProcessing, OutputResult);
    signal state : states := Idle;

begin
    process(state)
    begin
        case state is
            when Idle =>
                -- Check conditions to transition to the next state
                if current_mode_load_instruction = '1' or triaxial_attitude_angle_load_instruction = '1' or
                   triaxial_angular_velocity_load_instruction = '1' or telemetry_data_transmission_instruction = '1' then
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
                -- Implement logic for processing telemetry data here
                state <= OutputResult;

            when OutputResult =>
                -- Implement logic for outputting results here
                state <= Idle;
                done <= '1';  -- Indicate that the processing is done

        end case;
    end process;

end Behavioral;
