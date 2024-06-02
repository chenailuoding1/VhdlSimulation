library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ADCC is
Port (
clk : in STD_LOGIC;
in_Gyro_power_on_inst : in STD_LOGIC_VECTOR ( 31 downto 0 );
in_Sun_visible_sign : in STD_LOGIC_VECTOR ( 31 downto 0 );
in_Sun_measurement_angle : in STD_LOGIC_VECTOR ( 31 downto 0 );
in_Current_mode : in STD_LOGIC_VECTOR ( 31 downto 0 );
out_Triaxial_attitude_angle : out STD_LOGIC_VECTOR ( 31 downto 0 );
out_Triaxial_angular_velocity : out STD_LOGIC_VECTOR ( 31 downto 0 ));
end ADCC;
architecture Behavior of ADCC is
begin
process(clk, rst)
begin
if (rst = 1) then
out_Triaxial_attitude_angle <= 0;
elsif (rising_edge(clk)) then
out_Triaxial_attitude_angle <= in_Gyro_power_on_inst;
end if;
end process;
process(in_Sun_visible_sign, in_Sun_measurement_angle)beginout_Current_mode <= in_MR(31 downto 0);
end process;
process(in_Current_mode)
begin
out_Triaxial_angular_velocity <= in_ADR(31 downto 0);
end process;
process(in_Triaxial_attitude_angle, in_Triaxial_angular_velocity)
begin
out_Triaxial_attitude_angle <= in_ADR(31 downto 0);
out_Triaxial_angular_velocity <= in_ADR(31 downto 0);
end process;
end