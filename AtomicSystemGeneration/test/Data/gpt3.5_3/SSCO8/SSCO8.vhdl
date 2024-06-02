library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SunSensorControlOutput_Top is
    Port (
        -- Input signals
        sun_sensor_power_on_instruction_load_instruction : in std_logic;

        -- Output signals
        sun_sensor_power_on_pulse : out std_logic;
        done : out std_logic
    );
end SunSensorControlOutput_Top;

architecture Behavioral of SunSensorControlOutput_Top is
    signal start_calculation : std_logic;
    signal calculation_done : std_logic;
    signal calculation_result : std_logic;

begin
    SunSensorControlOutput_Control_Instance : entity work.SunSensorControlOutput_Control
        port map (
            sun_sensor_power_on_instruction_load_instruction => sun_sensor_power_on_instruction_load_instruction,
            start_calculation => start_calculation,
            done => calculation_done
        );

    SunSensorControlOutput_Calculation_Instance : entity work.SunSensorControlOutput_Calculation
        port map (
            sun_sensor_power_on_instruction => calculation_result
        );

    process(calculation_done)
    begin
        if calculation_done = '1' then
            -- Transfer calculation results to the output
            sun_sensor_power_on_pulse <= calculation_result;
            done <= '1';  -- Indicate that the calculation is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
