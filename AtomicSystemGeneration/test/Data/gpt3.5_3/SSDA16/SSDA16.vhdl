library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SunSensorDataAcquisition2_Top is
    Port (
        -- Input signals
        sun_visible_sign_acquisition_instruction : in std_logic;
        angle_analog_acquisition_instruction : in std_logic;
        sun_sensor_power_state_perception_instruction : in std_logic;

        -- Output signals
        sun_measurement_angle : out std_logic_vector(15 downto 0);
        done : out std_logic
    );
end SunSensorDataAcquisition2_Top;

architecture Behavioral of SunSensorDataAcquisition2_Top is
    signal start_calculation : std_logic;
    signal calculation_done : std_logic;
    signal calculation_result : std_logic_vector(15 downto 0);

begin
    SunSensorDataAcquisition2_Control_Instance : entity work.SunSensorDataAcquisition2_Control
        port map (
            sun_visible_sign_acquisition_instruction => sun_visible_sign_acquisition_instruction,
            angle_analog_acquisition_instruction => angle_analog_acquisition_instruction,
            sun_sensor_power_state_perception_instruction => sun_sensor_power_state_perception_instruction,
            start_calculation => start_calculation,
            done => calculation_done
        );

    SunSensorDataAcquisition2_Calculation_Instance : entity work.SunSensorDataAcquisition2_Calculation
        port map (
            sun_visible_sign => calculation_result(15 downto 8),
            angle_analog => calculation_result(7 downto 0)
        );

    process(calculation_done)
    begin
        if calculation_done = '1' then
            -- Transfer calculation results to the output
            sun_measurement_angle <= calculation_result;
            done <= '1';  -- Indicate that the calculation is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
