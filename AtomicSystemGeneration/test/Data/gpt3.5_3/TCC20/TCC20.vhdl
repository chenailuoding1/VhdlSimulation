library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThrusterControlComputing_Top is
    Port (
        -- Input signals
        triaxial_attitude_angle_load_instruction : in std_logic;
        triaxial_angular_velocity_load_instruction : in std_logic;
        target_angle_load_instruction : in std_logic;
        target_angular_velocity_load_instruction : in std_logic;

        -- Output signals
        triaxial_control_quantity : out std_logic_vector(15 downto 0);
        done : out std_logic
    );
end ThrusterControlComputing_Top;

architecture Behavioral of ThrusterControlComputing_Top is
    signal start_processing : std_logic;
    signal processing_done : std_logic;
    signal processing_result : std_logic_vector(15 downto 0);

begin
    ThrusterControlComputing_Control_Instance : entity work.ThrusterControlComputing_Control
        port map (
            triaxial_attitude_angle_load_instruction => triaxial_attitude_angle_load_instruction,
            triaxial_angular_velocity_load_instruction => triaxial_angular_velocity_load_instruction,
            target_angle_load_instruction => target_angle_load_instruction,
            target_angular_velocity_load_instruction => target_angular_velocity_load_instruction,
            start_processing => start_processing,
            done => processing_done
        );

    ThrusterControlComputing_Calculation_Instance : entity work.ThrusterControlComputing_Calculation
        port map (
            triaxial_attitude_angle => processing_result(15 downto 0),
            triaxial_angular_velocity => processing_result(15 downto 0),
            target_angle => processing_result(7 downto 0),
            target_angular_velocity => processing_result(7 downto 0),
            triaxial_control_quantity => triaxial_control_quantity
        );

    process(processing_done)
    begin
        if processing_done = '1' then
            -- Transfer processing results to
