library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
entity ModeSwitchingManagement3_Top is
    Port (
        -- Input signals
        triaxial_attitude_angle_load_instruction : in std_logic;
        triaxial_angular_velocity_load_instruction : in std_logic;
        sun_visible_sign_load_instruction : in std_logic;
        current_mode_load_instruction : in std_logic;
        current_mode_working_time_load_instruction : in std_logic;

        -- Output signals
        triaxial_attitude_angle : out std_logic_vector(15 downto 0);
        triaxial_angular_velocity : out std_logic_vector(15 downto 0);
        sun_visible_sign : out std_logic_vector(7 downto 0);
        current_mode : out std_logic_vector(7 downto 0);
        current_mode_working_time : out std_logic_vector(15 downto 0);
        done : out std_logic
    );
end ModeSwitchingManagement3_Top;

architecture Behavioral of ModeSwitchingManagement3_Top is
    signal start_calculation : std_logic;
    signal calculation_done : std_logic;
    signal calculation_result : std_logic_vector(31 downto 0);

begin
    ModeSwitchingManagement3_Control_Instance : entity work.ModeSwitchingManagement3_Control
        port map (
            triaxial_attitude_angle_load_instruction => triaxial_attitude_angle_load_instruction,
            triaxial_angular_velocity_load_instruction => triaxial_angular_velocity_load_instruction,
            sun_visible_sign_load_instruction => sun_visible_sign_load_instruction,
            current_mode_load_instruction => current_mode_load_instruction,
            current_mode_working_time_load_instruction => current_mode_working_time_load_instruction,
            start_calculation => start_calculation,
            done => calculation_done
        );

    ModeSwitchingManagement3_Calculation_Instance : entity work.ModeSwitchingManagement3_Calculation
        port map (
            triaxial_attitude_angle => triaxial_attitude_angle,
            triaxial_angular_velocity => triaxial_angular_velocity,
            sun_visible_sign => sun_visible_sign,
            current_mode => current_mode,
            current_mode_working_time => current_mode_working_time,
            result => calculation_result
        );

    process(calculation_done)
    begin
        if calculation_done = '1' then
            -- Transfer calculation results to the output
            triaxial_attitude_angle <= calculation_result(15 downto 0);
            triaxial_angular_velocity <= calculation_result(31 downto 16);
            sun_visible_sign <= calculation_result(39 downto 32);
            current_mode <= calculation_result(47 downto 40);
            current_mode_working_time <= calculation_result(63 downto 48);
            done <= '1';  -- Indicate that the calculation is done
        else
            done <= '0';
        end if;
    end process;

end Behavioral;
