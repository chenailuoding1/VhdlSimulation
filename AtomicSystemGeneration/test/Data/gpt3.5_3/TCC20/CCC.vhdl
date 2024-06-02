

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;




--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
entity ThrusterControlComputing_Calculation is
    Port (
        -- Input signals
        triaxial_attitude_angle : in std_logic_vector(15 downto 0);
        triaxial_angular_velocity : in std_logic_vector(15 downto 0);
        target_angle : in std_logic_vector(7 downto 0);
        target_angular_velocity : in std_logic_vector(7 downto 0);

        -- Output signals
        triaxial_control_quantity : out std_logic_vector(15 downto 0)
    );
end ThrusterControlComputing_Calculation;

architecture Behavioral of ThrusterControlComputing_Calculation is
begin
    process(triaxial_attitude_angle, triaxial_angular_velocity, target_angle, target_angular_velocity)
    begin
        -- Implement your calculation logic here
        -- This is a placeholder; replace it with your actual logic
        -- Example: Concatenate input vectors to create triaxial_control_quantity
        triaxial_control_quantity <= triaxial_attitude_angle & triaxial_angular_velocity &
                                   target_angle & target_angular_velocity;
    end process;

end Behavioral;
