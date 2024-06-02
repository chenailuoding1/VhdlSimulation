library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity TelemetryProcessing_Top is
    Port (
        -- Input signals
        current_mode_load_instruction : in std_logic;
        triaxial_attitude_angle_load_instruction : in std_logic;
        triaxial_angular_velocity_load_instruction : in std_logic;
        telemetry_data_transmission_instruction : in std_logic;

        -- Output signals
        telemetry_data : out std_logic_vector(31 downto 0);
        done : out std_logic
    );
end TelemetryProcessing_Top;

architecture Behavioral of TelemetryProcessing_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(31 downto 0);

begin
    TelemetryProcessing_Control_Instance : entity work.TelemetryProcessing_Control
        port map (
            current_mode_load_instruction => current_mode_load_instruction,
            triaxial_attitude_angle_load_instruction => triaxial_attitude_angle_load_instruction,
            triaxial_angular_velocity_load_instruction => triaxial_angular_velocity_load_instruction,
            telemetry_data_transmission_instruction => telemetry_data_transmission_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    TelemetryProcessing_Calculation_Instance : entity work.TelemetryProcessing_Calculation
        port map (
            current_mode => processing_result(31 downto 24),
            triaxial_attitude_angle => processing_result(23 downto 8),
            triaxial_angular_velocity => processing_result(7 downto 0),
            telemetry_data => telemetry_data
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to the output
            telemetry_data <= processing_result;
            done <= '1';  -- Indicate that the processing is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
