library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.All;
entity AD is 
Port(
in_Gyro_power_on_inst:in STD_LOGIC;-- input signal for Gyro power on instruction
in_Sun_visible_sign:in STD_LOGIC;-- input signal for Sun visible sign
in_Sun_measurement_angle:in STD_LOGIC;-- input signal for Sun measurement angle
in_Current_mode:in STD_LOGIC;-- input signal for Current mode
out_Angular_velocity_analog:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Angular velocity analog
out_Sun_visible_sign:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Sun visible sign
out_Sun_measurement_angle:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Sun measurement angle
out_Current_mode:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Current mode
out_Triaxial_attitude_angle:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Triaxial attitude angle
in_GD:in STD_LOGIC_VECTOR ( 31 downto 0 );-- input signal for Gyro data
in_SSD:in STD_LOGIC_VECTOR ( 31 downto 0 );-- input signal for Sun sensor datain_MR:in STD_LOGIC_VECTOR ( 31 downto 0 );-- input signal for Mode result
in_ADR:in STD_LOGIC_VECTOR ( 31 downto 0 );-- input signal for Attitude determination result
out_ADCC:out STD_LOGIC_VECTOR ( 31 downto 0 );-- output signal for Attitude determination computing component
architecture Behavioral of AD is 
begin
process(in_Gyro_power_on_inst, in_Sun_visible_sign, in_Sun_measurement_angle, in_Current_mode)
begin
out_Angular_velocity_analog <= in_GD(31 downto 0);
out_Sun_visible_sign <= in_SSD(31 downto 0);
out_Sun_measurement_angle <= in_SSD(31 downto 0);
out_Current_mode <= in_MR(31 downto 0);
out_Triaxial_attitude_angle <= in_ADR(31 downto 0);
end process;
end Behavioral;
