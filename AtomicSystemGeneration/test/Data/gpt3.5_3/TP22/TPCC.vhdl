library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity TelemetryProcessing_Calculation is
    Port (
        -- Input signals
        current_mode : in std_logic_vector(7 downto 0);
        triaxial_attitude_angle : in std_logic_vector(15 downto 0);
        triaxial_angular_velocity : in std_logic_vector(15 downto 0);

        -- Output signals
        telemetry_data : out std_logic_vector(31 downto 0)
    );
end TelemetryProcessing_Calculation;

architecture Behavioral of TelemetryProcessing_Calculation is
begin
    process(current_mode, triaxial_attitude_angle, triaxial_angular_velocity)
    begin
        -- Implement your calculation logic here
        -- This is a placeholder; replace it with your actual logic
        -- Example: Concatenate input vectors to create telemetry_data
        telemetry_data <= current_mode & triaxial_attitude_angle & triaxial_angular_velocity;
    end process;

end Behavioral;

