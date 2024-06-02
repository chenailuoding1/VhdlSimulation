library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity SunSensorDataAcquisition2_Calculation is
    Port (
        -- Input signals
        sun_visible_sign : in std_logic;
        angle_analog : in std_logic;

        -- Output signals
        sun_measurement_angle : out std_logic_vector(15 downto 0)
    );
end SunSensorDataAcquisition2_Calculation;

architecture Behavioral of SunSensorDataAcquisition2_Calculation is
begin
    process(sun_visible_sign, angle_analog)
    begin
        -- Implement your calculation logic here
        -- This is a placeholder; replace it with your actual logic
        -- Example: Concatenate sun_visible_sign and angle_analog to create sun_measurement_angle
        sun_measurement_angle <= sun_visible_sign & angle_analog;
    end process;

end Behavioral;
