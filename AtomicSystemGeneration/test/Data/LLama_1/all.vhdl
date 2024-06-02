library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity fpga_design is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           work_mode : out  STD_LOGIC_VECTOR (3 downto 0);
           remote_control_data : in  STD_LOGIC_VECTOR (31 downto 0);
           remote_control_command : out  STD_LOGIC_VECTOR (3 downto 0));
end fpga_design;

architecture Behavioral of fpga_design is
    process(clk, reset)
    begin
        if (reset = '1') then
            work_mode <= "0000";
        elsif (clk'event and clk = '1') then
            if (work_mode = "0000") then
                -- Initialize software settings
                work_mode <= "0001";
            end if;
        end if;
    end process;

    process(remote_control_data, remote_control_command)
    begin
        if (remote_control_data = "0xE100") then
            remote_control_command <= "0";
        elsif (remote_control_data = "0xE101") then
            remote_control_command <= "1";
        elsif (remote_control_data = "0xE102") then
            remote_control_command <= "2";
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity data_acquisition_system is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           tilt_sensor_data : out  STD_LOGIC_VECTOR (31 downto 0);
           ad_converter_data : out  STD_LOGIC_VECTOR (31 downto 0);
           encoder_data : out  STD_LOGIC_VECTOR (31 downto 0);
           data_ready : out  STD_LOGIC);
end data_acquisition_system;

architecture Behavioral of data_acquisition_system is
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            tilt_sensor_data <= "0000000000000000";
            ad_converter_data <= "0000000000000000";
            encoder_data <= "0000000000000000";
            data_ready <= '0';
        elsif (clk'event and clk = '1') then
            -- Tilt sensor data acquisition
            if (tilt_sensor_data_ready = '1') then
                tilt_sensor_data <= tilt_sensor_data_out;
            end if;
            
            -- AD converter data acquisition
            if (ad_converter_data_ready = '1') then
                ad_converter_data <= ad_converter_data_out;
            end if;
            
            -- Encoder data acquisition
            if (encoder_data_ready = '1') then
                encoder_data <= encoder_data_out;
            end if;
            
            -- Data ready signal
            data_ready <= tilt_sensor_data_ready xor ad_converter_data_ready xor encoder_data_ready;
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity solar_sensor_collector is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ad_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           ad_data : out  STD_LOGIC_VECTOR (11 downto 0);
           solar_detect : out  STD_LOGIC;
           solar_visible : out  STD_LOGIC;
           measurement_angle : out  STD_LOGIC_VECTOR (12 downto 0));
end solar_sensor_collector;

architecture Behavioral of solar_sensor_collector is
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            solar_detect <= '0';
            solar_visible <= '0';
            measurement_angle <= "0000000000";
        elsif (clk'event and clk = '1') then
            -- Solar Sensor Data Collection
            if (ad_addr = "0000") then
                solar_detect <= ad_data(12);
                solar_visible <= ad_data(13);
                measurement_angle <= ad_data(14 downto 0);
            end if;
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity attitude_determination is
    Port ( gyro_x : out STD_LOGIC_VECTOR (3 downto 0);
           gyro_y : out STD_LOGIC_VECTOR (3 downto 0);
           gyro_z : out STD_LOGIC_VECTOR (3 downto 0);
           sun_angle : out STD_LOGIC_VECTOR (3 downto 0);
           attitude_angle : out STD_LOGIC_VECTOR (3 downto 0));
end entity;

architecture Behavior of attitude_determination is
begin
    process(gyro_x, gyro_y, gyro_z, sun_angle)
    begin
        -- Calculate the attitude angles based on the gyroscope measurements
        attitude_angle <= (gyro_x * gyro_y * gyro_z) / (gyro_x * gyro_x + gyro_y * gyro_y + gyro_z * gyro_z);
        -- Calculate the sun angle based on the gyroscope measurements
        sun_angle <= (gyro_x * gyro_y * gyro_z) / (gyro_x * gyro_x + gyro_y * gyro_y + gyro_z * gyro_z);
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity SolarSearchModeMgmt is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           currentMode : in  STD_LOGIC_VECTOR (3 downto 0);
           currentTime : in  REAL;
           solarVisible : in  STD_LOGIC;
           satelliteAttitude : in  REAL;
           satelliteVelocity : in  REAL;
           nextMode : out  STD_LOGIC_VECTOR (3 downto 0);
           nextTime : out  REAL);
end SolarSearchModeMgmt;

architecture Behavior of SolarSearchModeMgmt is
    function speedRDSM(currentTime : REAL) return STD_LOGIC_VECTOR (3 downto 0) is
        -- Calculate the speed ratio based on the current time
        speedRatio : REAL := (currentTime - previousTime) / 160;
        -- Set the speed mode based on the speed ratio
        case speedRatio is
            when 0 to 0.5 => nextMode <= "0000";
            when 0.5 to 1 => nextMode <= "0001";
            when 1 to 2 => nextMode <= "0010";
            when 2 to 3 => nextMode <= "0011";
            when others => nextMode <= "0100";
        end case;
    end function speedRDSM;

    function pitchSearchPASM(currentTime : REAL) return STD_LOGIC_VECTOR (3 downto 0) is
        -- Calculate the pitch angle based on the current time
        pitchAngle : REAL := atan2(satelliteVelocity * cos(satelliteAttitude), satelliteVelocity * sin(satelliteAttitude));
        -- Set the pitch mode based on the pitch angle
        case pitchAngle is
            when 0 to 30 => nextMode <= "0000";
            when 30 to 60 => nextMode <= "0001";
            when 60 to 90 => nextMode <= "0010";
            when 90 to 120 => nextMode <= "0011";
            when others => nextMode <= "0100";
        end case;
    end function pitchSearchPASM;

    function rollSearchRASM(currentTime : REAL) return STD_LOGIC_VECTOR (3 downto 0) is
        -- Calculate the roll angle based on the current time
        rollAngle : REAL := atan2(satelliteVelocity * cos(satelliteAttitude), satelliteVelocity * sin(satelliteAttitude));
        -- Set the roll mode based on the roll angle
        case rollAngle is
            when 0 to 30 => nextMode <= "0000";
            when 30 to 60 => nextMode <= "0001";
            when 60 to 90 => nextMode <= "0010";
            when 90 to 120 => nextMode <= "0011";
            when others => nextMode <= "0100";
        end case;
    end function roll
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity speed_nyquist_filter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           angular_velocity : in  real;
           target_angular_velocity : out real);
end entity;

architecture Behavioral of speed_nyquist_filter is
begin
    process(clk, en)
    begin
        if (en = '1') then
            if (angular_velocity < target_angular_velocity) then
                angular_velocity <= angular_velocity + (target_angular_velocity - angular_velocity) * (clk'event and en = '1');
            end if;
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity pitch_search_mode is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           angular_velocity : in  real;
           target_angular_velocity : out real);
end entity;

architecture Behavioral of pitch_search_mode is
begin
    process(clk, en)
    begin
        if (en = '1') then
            if (angular_velocity < target_angular_velocity) then
                angular_velocity <= angular_velocity + (target_angular_velocity - angular_velocity) * (clk'event and en = '1');
            end if;
            if (angular_velocity > target_angular_velocity) then
                angular_velocity <= angular_velocity - (target_angular_velocity - angular_velocity) * (clk'event and en = '1');
            end if;
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity yaw_search_mode is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           angular_velocity : in  real;
           target_angular_velocity : out real);
end entity;

architecture Behavioral of yaw_search_mode is
begin
    process(clk, en)
    begin
        if (en = '1') then
            if (angular_velocity < target_angular_velocity) then
                angular_velocity <= angular_velocity + (target_angular_velocity - angular_velocity) * (clk'event and en = '1');
            end if;
            if (angular_velocity > target_angular_velocity) then
                angular_velocity <= angular_velocity - (target_angular_velocity - angular_velocity) * (clk'event and en = '1');
            end if;
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity SatelliteControl is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sun_detected : out  STD_LOGIC;
           solar_tracking : out  STD_LOGIC;
           x_axis_speed : in  real;
           y_axis_speed : in  real;
           z_axis_speed : in  real;
           current_mode : in  integer range <>)
end SatelliteControl;

architecture Behavior of SatelliteControl is
begin
    process(clock, reset)
    begin
        if (reset = '1') then
            sun_detected <= '0';
            solar_tracking <= '0';
        elsif (clock'event and clock = '1') then
            -- Sun-seeking mode
            if (current_mode = 3) then
                if (x_axis_speed = 0) then
                    sun_detected <= '1';
                    solar_tracking <= '1';
                end if;
            -- Solar-tracking mode
            else if (current_mode = 4) then
                if (x_axis_speed = 0) then
                    solar_tracking <= '1';
                end if;
            end if;
        end if;
    end process;
end Behavior;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity control_system is
    Port (
        attitude_input : in  STD_LOGIC_VECTOR (31 downto 0);  -- Current attitude of the satellite
        target_attitude : in  STD_LOGIC_VECTOR (31 downto 0);  -- Target attitude of the satellite
        control_output : out STD_LOGIC_VECTOR (31 downto 0);  -- Control quantities (torque, roll, pitch, yaw)
        fault_output : out STD_LOGIC_VECTOR (1 downto 0)  -- Fault diagnosis and isolation signal
    );
end entity;

architecture Behavioral of control_system is
begin
    -- Control quantity computation
    process(attitude_input, target_attitude)
    begin
        -- Calculate the control output
        control_output <= (target_attitude - attitude_input) * 1000;
    end process;

    -- Fault diagnosis and isolation
    process(attitude_input, target_attitude)
    begin
        -- Detect faults
        if (attitude_input /= target_attitude) then
            fault_output <= "1";  -- Fault detected
        elsif (attitude_input /= attitude_input) then
            fault_output <= "0";  -- Fault isolated
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity solar_search_failure_detector is
    Port ( solar_visible : in  STD_LOGIC;
           solar_search_failure : out STD_LOGIC;
           thruster_enable : out STD_LOGIC);
end entity;

architecture Behavioral of solar_search_failure_detector is
begin
    process(solar_visible)
    begin
        if (solar_visible = '1') and (solar_search_failure = '0') then
            if (solar_search_failure = '1') then
                solar_search_failure <= '1';
                thruster_enable <= '1';
            end else
                solar_search_failure <= '0';
        end if;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;

entity thrusters_frequent_firing_detector is
    Port ( thruster_firing_interval : in  TIME;
           frequent_firing : out STD_LOGIC);
end entity;

architecture Behavioral of thrusters_frequent_firing_detector is
begin
    process(thruster_firing_interval)
    begin
        if (thruster_firing_interval < 1) then
            frequent_firing <= '1';
        else
            frequent_firing <= '0';
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity torque_sensor_comm_failure_detector is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           error_count : in  NATURAL range <5>;
           enable : out  STD_LOGIC);
end entity;

architecture Behavioral of torque_sensor_comm_failure_detector is
    signal error_count_reg : NATURAL range <5>;
    signal last_error_time : TIME;
    signal last_error_count : NATURAL range <5>;
    signal enable_out : STD_LOGIC;

begin
    process(clk, reset)
    begin
        if (reset = '1') then
            error_count_reg <= 0;
        elsif (clk'event and clk = '1') then
            if (error_count_reg = error_count) then
                error_count_reg <= error_count + 1;
                last_error_time <= now();
                last_error_count <= error_count;
            end if;
        end if;
    end process;

    enable_out <= '1' when (error_count_reg = error_count) and (last_error_time > 5 * 10^-3) else '0';
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity control_output is
    Port ( control_quantities : in  STD_LOGIC_VECTOR (3 downto 0);
           control_outputs : out STD_LOGIC_VECTOR (3 downto 0));
end entity;

architecture Behavioral of control_output is
begin
    process(control_quantities)
    begin
        case (control_quantities) is
            when "0000" => control_outputs <= "0000"; -- 陀螺控制输出
            when "0001" => control_outputs <= "0010"; -- 太阳敏感器控制输出
            when "0010" => control_outputs <= "0100"; -- 推力器加电开关控制输出
            when others => control_outputs <= "0000"; -- 其他情况输出
        end case;
    end process;
end architecture;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity SolarSensorController is
    Port ( Enable : out STD_LOGIC;
           Output : out STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (1 downto 0));
end SolarSensorController;

architecture Behavioral of SolarSensorController is
begin
    process(Address)
    begin
        if (Address = "00") then
            Output <= '0';
        elsif (Address = "01") then
            Output <= '1';
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity push_pull_driver is
    Port ( control_voltage : in  STD_LOGIC_VECTOR (3 downto 0);
           Trx : out  STD_LOGIC;
           Try : out  STD_LOGIC;
           Trz : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture Behavioral of push_pull_driver is
begin
    process(control_voltage)
    begin
        case (control_voltage) is
            when "000" =>
                Trx <= '0';
                Try <= '0';
                Trz <= '0';
            when "001" =>
                Trx <= '1';
                Try <= '0';
                Trz <= '0';
            when "010" =>
                Trx <= '0';
                Try <= '1';
                Trz <= '0';
            when "011" =>
                Trx <= '0';
                Try <= '0';
                Trz <= '1';
            when "100" =>
                Trx <= '1';
                Try <= '1';
                Trz <= '0';
            when "101" =>
                Trx <= '1';
                Try <= '0';
                Trz <= '1';
            when "110" =>
                Trx <= '0';
                Try <= '1';
                Trz <= '1';
            when "111" =>
                Trx <= '0';
                Try <= '0';
                Trz <= '1';
        end case;
    end process;
end architecture Behavioral;
library IEEE;
use IEEE.STD_LOGIC_16;
use IEEE.NUMERIC_STD.ALL;

entity remote_sensing_system is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (26 downto 0);
           data_in : in  STD_LOGIC_VECTOR (26 downto 0));
end entity;

architecture Behavioral of remote_sensing_system is
    type state_type is (idle, running);
    signal state : state_type;
    signal angle : real;
    signal checksum : real;

begin
    process(clk, reset)
    begin
        if (reset = '1') then
            state <= idle;
        elsif (clk'event and clk = '1') then
            if (state = idle) then
                state <= running;
                angle <= 0.0;
                checksum <= 0.0;
            else
                angle <= angle + 0.01;
                checksum <= calculate_checksum(data_in);
                if (checksum /= data_out) then
                    state <= idle;
                end if;
            end if;
        end if;
    end process;

    function calculate_checksum(data : STD_LOGIC_VECTOR (26 downto 0)) return real is
        variable sum : real;
        variable i : natural range 0 to 26;
    begin
        sum := 0;
        for i in 0 to 26 loop
            sum := sum + data(i);
        end loop;
        return sum;
    end function;

    -- Data output
    data_out <= std_logic_vector(to_signed(angle, 16));

end architecture Behavioral;
