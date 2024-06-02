entity Initialization is
  port (
    clk : in std_logic;
    rst : in std_logic;
    ctrl_reg_addr : in std_logic_vector(15 downto 0);
    switch_ctrl : out std_logic;
    timer_int_enable : out std_logic;
    gyro_ctrl : out std_logic;
    sun_sensor_ctrl : out std_logic;
    timer_interrupt : out std_logic
    -- Add other input and output ports as needed
  );
end entity Initialization;

architecture Behavioral of Initialization is
  signal mode_word : std_logic_vector(7 downto 0) := (others => '0');
  signal timer : integer range 0 to 2**32 - 1 := 0;

begin
  process(clk, rst)
  begin
    if rst = '1' then
      -- Reset logic goes here
      mode_word <= (others => '0');
      timer <= 0;
      switch_ctrl <= '0';
      timer_int_enable <= '0';
      gyro_ctrl <= '0';
      sun_sensor_ctrl <= '0';
      timer_interrupt <= '0';
    elsif rising_edge(clk) then
      -- Initialization logic goes here
      if mode_word = "00000000" then
        mode_word <= "00000001";  -- Set initial mode
        -- Additional initialization logic
      end if;

      -- Timer logic
      if timer < 2**32 - 1 then
        timer <= timer + 1;
      else
        timer <= 0;
      end if;

      -- Example: Timer interrupt generation
      if timer = 32_000_000 then  -- Assuming a 32ms clock period
        timer_interrupt <= '1';
      else
        timer_interrupt <= '0';
      end if;

      -- Example: Switch control logic
      if timer = 5_000_000 then
        switch_ctrl <= '1';
      else
        switch_ctrl <= '0';
      end if;

      -- Example: Gyro and sun sensor control
      gyro_ctrl <= '1';  -- Turn on gyro
      sun_sensor_ctrl <= '1';  -- Turn on sun sensor

      -- Update other outputs based on initialization logic
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity RemoteControl is
  port (
    clk : in std_logic;
    remote_ctrl_addr : in std_logic_vector(15 downto 0);
    mode_word : out std_logic_vector(7 downto 0)
    -- Add other input and output ports as needed
  );
end entity RemoteControl;

architecture Behavioral of RemoteControl is
  signal data_received : std_logic_vector(7 downto 0) := (others => '0');
  signal byte_counter : integer range 0 to 3 := 0;
  signal checksum : std_logic := '0';

begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- Asynchronous serial receive logic
      if byte_counter < 4 then
        -- Assuming 8-bit data, LSB first
        data_received(byte_counter * 8 + 7 downto byte_counter * 8) <= remote_ctrl_addr(byte_counter * 8 + 7 downto byte_counter * 8);
        byte_counter <= byte_counter + 1;
      else
        -- Validate received data
        if data_received(7 downto 0) = "11100001" and
           data_received(15 downto 8) = "11100000" and
           data_received(23 downto 16) = "00000000" and
           data_received(31 downto 24) = checksum then
          -- Valid data, update mode_word
          mode_word <= data_received(39 downto 32);
        end if;

        -- Reset counters for the next cycle
        byte_counter <= 0;
        checksum <= '0';
      end if;

      -- Example: Update checksum
      checksum <= std_logic_xor(data_received(7 downto 0), checksum);
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity GyroDataCollection is
  port (
    clk : in std_logic;
    gyro_ctrl_addr : out std_logic_vector(15 downto 0);
    gyro_data : in std_logic_vector(15 downto 0);
    power_status : out std_logic;
    angular_velocity : out std_logic_vector(11 downto 0)
    -- Add other input and output ports as needed
  );
end entity GyroDataCollection;

architecture Behavioral of GyroDataCollection is
  signal gyro_request_sent : boolean := false;
  signal gyro_data_received : std_logic_vector(15 downto 0);

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if not gyro_request_sent then
        -- Send gyro data request command
        gyro_ctrl_addr <= "1000101110010001";
        gyro_request_sent <= true;
      else
        -- Receive and process gyro data
        gyro_data_received <= gyro_data;

        -- Process received data and update output signals
        power_status <= gyro_data_received(15);
        angular_velocity <= gyro_data_received(11 downto 0);

        -- Reset for the next cycle
        gyro_request_sent <= false;
      end if;
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity SunSensorDataCollection is
  port (
    clk : in std_logic;
    ad_ctrl_addr : out std_logic_vector(15 downto 0);
    ad_data : in std_logic_vector(11 downto 0);
    power_status : out std_logic;
    sun_visible : out std_logic;
    measured_angle : out std_logic_vector(11 downto 0)
    -- Add other input and output ports as needed
  );
end entity SunSensorDataCollection;

architecture Behavioral of SunSensorDataCollection is
  signal sun_sensor_request_sent : boolean := false;
  signal sun_sensor_data_received : std_logic_vector(11 downto 0);

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if not sun_sensor_request_sent then
        -- Send sun sensor data request command
        ad_ctrl_addr <= "1000100011011010";
        sun_sensor_request_sent <= true;
      else
        -- Receive and process sun sensor data
        sun_sensor_data_received <= ad_data;

        -- Process received data and update output signals
        power_status <= sun_sensor_data_received(11);
        sun_visible <= sun_sensor_data_received(10);
        measured_angle <= sun_sensor_data_received(9 downto 0);

        -- Reset for the next cycle
        sun_sensor_request_sent <= false;
      end if;
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity ThrusterDataCollection is
  port (
    clk : in std_logic;
    ad_ctrl_addr : out std_logic_vector(15 downto 0);
    ad_data : in std_logic_vector(3 downto 0);
    power_status_main : out std_logic;
    power_status_backup : out std_logic
    -- Add other input and output ports as needed
  );
end entity ThrusterDataCollection;

architecture Behavioral of ThrusterDataCollection is
  signal thruster_request_sent : boolean := false;
  signal thruster_data_received : std_logic_vector(3 downto 0);

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if not thruster_request_sent then
        -- Send thruster data request command
        ad_ctrl_addr <= "1110000000000000";
        thruster_request_sent <= true;
      else
        -- Receive and process thruster data
        thruster_data_received <= ad_data;

        -- Process received data and update output signals
        power_status_main <= thruster_data_received(3);
        power_status_backup <= thruster_data_received(4);

        -- Reset for the next cycle
        thruster_request_sent <= false;
      end if;
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity AttitudeDetermination is
  port (
    clk : in std_logic;
    gyro_angular_velocity : in std_logic_vector(11 downto 0);
    sun_visible : in std_logic;
    sun_angle : in std_logic_vector(11 downto 0);
    mode_word : in std_logic_vector(7 downto 0);
    attitude_angle_roll : out std_logic_vector(11 downto 0);
    attitude_angle_pitch : out std_logic_vector(11 downto 0);
    attitude_angle_yaw : out std_logic_vector(11 downto 0);
    attitude_angular_velocity_roll : out std_logic_vector(11 downto 0);
    attitude_angular_velocity_pitch : out std_logic_vector(11 downto 0);
    attitude_angular_velocity_yaw : out std_logic_vector(11 downto 0);
    next_mode_word : out std_logic_vector(7 downto 0)
    -- Add other input and output ports as needed
  );
end entity AttitudeDetermination;

architecture Behavioral of AttitudeDetermination is
  signal estimated_attitude_angle_roll : std_logic_vector(11 downto 0) := (others => '0');
  signal estimated_attitude_angle_pitch : std_logic_vector(11 downto 0) := (others => '0');
  signal estimated_attitude_angle_yaw : std_logic_vector(11 downto 0) := (others => '0');
  signal estimated_attitude_angular_velocity_roll : std_logic_vector(11 downto 0) := (others => '0');
  signal estimated_attitude_angular_velocity_pitch : std_logic_vector(11 downto 0) := (others => '0');
  signal estimated_attitude_angular_velocity_yaw : std_logic_vector(11 downto 0) := (others => '0');

begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- Calculate estimated attitude angles and angular velocities
      estimated_attitude_angle_roll <= ... ; -- Implement angle estimation logic
      estimated_attitude_angle_pitch <= ... ; -- Implement angle estimation logic
      estimated_attitude_angle_yaw <= ... ; -- Implement angle estimation logic
      estimated_attitude_angular_velocity_roll <= gyro_angular_velocity;
      estimated_attitude_angular_velocity_pitch <= gyro_angular_velocity;
      estimated_attitude_angular_velocity_yaw <= gyro_angular_velocity;

      -- Determine attitude angles based on mode word and sun visibility
      if mode_word = "00000001" then
        -- Cruise mode
        if sun_visible = '1' then
          attitude_angle_roll <= sun_angle;
          attitude_angle_pitch <= sun_angle;
          attitude_angle_yaw <= sun_angle;
        else
          attitude_angle_roll <= estimated_attitude_angle_roll;
          attitude_angle_pitch <= estimated_attitude_angle_pitch;
          attitude_angle_yaw <= estimated_attitude_angle_yaw;
        end if;
      else
        -- Other modes
        attitude_angle_roll <= "000000000000";
        attitude_angle_pitch <= "000000000000";
        attitude_angle_yaw <= "000000000000";
      end if;

      -- Output estimated angular velocities
      attitude_angular_velocity_roll <= estimated_attitude_angular_velocity_roll;
      attitude_angular_velocity_pitch <= estimated_attitude_angular_velocity_pitch;
      attitude_angular_velocity_yaw <= estimated_attitude_angular_velocity_yaw;

      -- Update next mode word (example: increment by 1)
      next_mode_word <= mode_word + 1;
    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity ModeSwitching is
  port (
    clk : in std_logic;
    current_mode_word : in std_logic_vector(7 downto 0);
    current_mode_working_time : in std_logic_vector(15 downto 0);
    sun_visible : in std_logic;
    attitude_angle_roll : in std_logic_vector(11 downto 0);
    attitude_angle_pitch : in std_logic_vector(11 downto 0);
    attitude_angle_yaw : in std_logic_vector(11 downto 0);
    attitude_angular_velocity_roll : in std_logic_vector(11 downto 0);
    attitude_angular_velocity_pitch : in std_logic_vector(11 downto 0);
    attitude_angular_velocity_yaw : in std_logic_vector(11 downto 0);
    next_mode_word : out std_logic_vector(7 downto 0);
    current_mode_working_time_accumulated : out std_logic_vector(15 downto 0)
    -- Add other input and output ports as needed
  );
end entity ModeSwitching;

architecture Behavioral of ModeSwitching is
  signal control_target_roll : std_logic_vector(11 downto 0) := (others => '0');
  signal control_target_pitch : std_logic_vector(11 downto 0) := (others => '0');
  signal control_target_yaw : std_logic_vector(11 downto 0) := (others => '0');

  signal accumulated_working_time : std_logic_vector(15 downto 0) := (others => '0');

begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- Default values
      next_mode_word <= current_mode_word;
      accumulated_working_time <= current_mode_working_time;

      -- Mode-specific logic
      case current_mode_word is
        when "00000000" =>
          -- Mode 0: Rate Damping
          control_target_roll <= "000000000000";
          control_target_pitch <= "000000000000";
          control_target_yaw <= "000000000000";

          -- Check for mode switch conditions
          if some_condition_for_mode_switching then
            next_mode_word <= "00000001";
            accumulated_working_time <= accumulated_working_time + 1;
          end if;

        when "00000001" =>
          -- Mode 1: Pitch Search
          control_target_roll <= "000000000000";
          control_target_pitch <= "111111111111"; -- Example: rotate at -0.5°/s
          control_target_yaw <= "000000000000";

          -- Check for mode switch conditions
          if some_condition_for_mode_switching then
            next_mode_word <= "00000010";
            accumulated_working_time <= accumulated_working_time + 1;
          end if;

        when "00000010" =>
          -- Mode 2: Roll Search
          control_target_roll <= "111111111111"; -- Example: rotate at 0.5°/s
          control_target_pitch <= "000000000000";
          control_target_yaw <= "000000000000";

          -- Check for mode switch conditions
          if some_condition_for_mode_switching then
            next_mode_word <= "00000001";
            accumulated_working_time <= accumulated_working_time + 1;
          end if;

        when "00000011" =>
          -- Mode 3: Sun Tracking
          control_target_roll <= "000000000000";
          control_target_pitch <= "000000000000";
          control_target_yaw <= "000000000000";

          -- Check for mode switch conditions
          if some_condition_for_mode_switching then
            next_mode_word <= "00000000";
            accumulated_working_time <= accumulated_working_time + 1;
          end if;

        when others =>
          -- Handle other modes if needed
      end case;

    end if;
  end process;

  -- Add other internal signals and logic as needed

end Behavioral;
entity ControlOutput is
  port (
    clk : in std_logic;
    gyro_control_switch_reg_addr : in std_logic_vector(15 downto 0);
    sun_sensor_control_switch_reg_addr : in std_logic_vector(15 downto 0);
    thruster_control_signal_reg_addr : in std_logic_vector(15 downto 0);
    thruster_enable_signal_reg_addr : in std_logic_vector(15 downto 0);
    thruster_pulse_switch_reg_addr : in std_logic_vector(15 downto 0);
    thruster_combination : out std_logic_vector(7 downto 0);
    thruster_enable_signal : out std_logic_vector(7 downto 0);
    thruster_pulse_switch_enable : out std_logic_vector(7 downto 0)
    -- Add other input and output ports as needed
  );
end entity ControlOutput;

architecture Behavioral of ControlOutput is
  signal gyro_control_switch : std_logic := '0';
  signal sun_sensor_control_switch : std_logic := '0';
  signal thruster_enable_signal_internal : std_logic_vector(7 downto 0) := (others => '0');
  signal thruster_pulse_switch_enable_internal : std_logic_vector(7 downto 0) := (others => '0');

begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- Default values
      thruster_combination <= "00000000";
      thruster_enable_signal <= (others => '0');
      thruster_pulse_switch_enable <= (others => '0');

      -- Gyro Control Output
      if some_condition_for_gyro_control_output then
        gyro_control_switch <= '1';
      else
        gyro_control_switch <= '0';
      end if;

      -- Sun Sensor Control Output
      if some_condition_for_sun_sensor_control_output then
        sun_sensor_control_switch <= '1';
      else
        sun_sensor_control_switch <= '0';
      end if;

      -- Thruster Output
      thruster_enable_signal_internal <= "00000000";
      thruster_pulse_switch_enable_internal <= "00000000";

      -- Thruster Combination Logic
      case thruster_combination_logic is
        when "00" =>
          thruster_enable_signal_internal(0) <= '1';
          thruster_enable_signal_internal(1) <= '0';
          thruster_enable_signal_internal(2) <= '0';
          thruster_enable_signal_internal(3) <= '1';
          thruster_enable_signal_internal(4) <= '0';
          thruster_enable_signal_internal(5) <= '1';
          thruster_enable_signal_internal(6) <= '0';
          thruster_enable_signal_internal(7) <= '0';

        when "01" =>
          -- Handle other combinations if needed

        when others =>
          -- Handle default case
      end case;

      -- Thruster Pulse Switch Logic
      if some_condition_for_thruster_pulse_switch then
        thruster_pulse_switch_enable_internal <= "11111111";
      else
        thruster_pulse_switch_enable_internal <= "00000000";
      end if;

    end if;
  end process;

  -- Assign output signals
  thruster_combination <= thruster_enable_signal_internal;
  thruster_enable_signal <= thruster_enable_signal_internal;
  thruster_pulse_switch_enable <= thruster_pulse_switch_enable_internal;

  -- Add other internal signals and logic as needed

end Behavioral;
entity TelemetryProcessing is
  port (
    clk : in std_logic;
    mode_reg : in std_logic_vector(15 downto 0);
    roll_angle_reg : in std_logic_vector(15 downto 0);
    pitch_angle_reg : in std_logic_vector(15 downto 0);
    roll_rate_reg : in std_logic_vector(15 downto 0);
    pitch_rate_reg : in std_logic_vector(15 downto 0);
    yaw_rate_reg : in std_logic_vector(15 downto 0);
    telemetry_data_out : out std_logic_vector(31 downto 0);
    serial_out : out std_logic
    -- Add other input and output ports as needed
  );
end entity TelemetryProcessing;

architecture Behavioral of TelemetryProcessing is
  signal telemetry_data_internal : std_logic_vector(31 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      -- Default values
      telemetry_data_internal <= (others => '0');

      -- Populate telemetry_data_internal based on your requirements
      -- For example, you can concatenate different registers and add headers

      -- Serial Output control (assuming synchronous serial communication)
      serial_out <= '1'; -- Start bit
      for i in 31 downto 0 loop
        serial_out <= telemetry_data_internal(i);
      end loop;
      serial_out <= '0'; -- Stop bit
    end if;
  end process;

  -- Output Telemetry Data
  telemetry_data_out <= telemetry_data_internal;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity YourTopLevelEntity is
  port (
    -- Top-level ports
    clk : in std_logic;
    rst : in std_logic;
    -- Add other top-level ports as needed

    -- Ports for Initialization module
    ctrl_reg_addr : in std_logic_vector(15 downto 0);
    switch_ctrl : out std_logic;
    timer_int_enable : out std_logic;
    gyro_ctrl : out std_logic;
    sun_sensor_ctrl : out std_logic;
    timer_interrupt : out std_logic
  );
end entity YourTopLevelEntity;

architecture Behavioral of YourTopLevelEntity is
  -- Signal declarations for connecting submodules
  signal remote_ctrl_mode_word : std_logic_vector(7 downto 0);
  signal gyro_data : std_logic_vector(15 downto 0);
  signal ad_data : std_logic_vector(11 downto 0);
  signal thruster_ad_data : std_logic_vector(3 downto 0);
  signal gyro_angular_velocity : std_logic_vector(11 downto 0);
  signal sun_angle : std_logic_vector(11 downto 0);
  signal attitude_angle_roll : std_logic_vector(11 downto 0);
  signal attitude_angle_pitch : std_logic_vector(11 downto 0);
  signal attitude_angle_yaw : std_logic_vector(11 downto 0);
  signal current_mode_word : std_logic_vector(7 downto 0);
  signal current_mode_working_time : std_logic_vector(15 downto 0);
  signal attitude_angular_velocity_roll : std_logic_vector(11 downto 0);
  signal attitude_angular_velocity_pitch : std_logic_vector(11 downto 0);
  signal attitude_angular_velocity_yaw : std_logic_vector(11 downto 0);
  signal next_mode_word : std_logic_vector(7 downto 0);
  signal current_mode_working_time_accumulated : std_logic_vector(15 downto 0);
  signal thruster_combination_logic : std_logic_vector(1 downto 0);
  signal thruster_combination : std_logic_vector(7 downto 0);
  signal thruster_enable_signal : std_logic_vector(7 downto 0);
  signal thruster_pulse_switch_enable : std_logic_vector(7 downto 0);
  signal telemetry_data_out : std_logic_vector(31 downto 0);
  signal serial_out : std_logic;

  -- Component instantiations
  component Initialization
    port (
      clk : in std_logic;
      rst : in std_logic;
      ctrl_reg_addr : in std_logic_vector(15 downto 0);
      switch_ctrl : out std_logic;
      timer_int_enable : out std_logic;
      gyro_ctrl : out std_logic;
      sun_sensor_ctrl : out std_logic;
      timer_interrupt : out std_logic
    );
  end component;

  component RemoteControl
    port (
      clk : in std_logic;
      remote_ctrl_addr : in std_logic_vector(15 downto 0);
      mode_word : out std_logic_vector(7 downto 0)
    );
  end component;

  component GyroDataCollection
    port (
      clk : in std_logic;
      gyro_ctrl_addr : out std_logic_vector(15 downto 0);
      gyro_data : in std_logic_vector(15 downto 0);
      power_status : out std_logic;
      angular_velocity : out std_logic_vector(11 downto 0)
    );
  end component;

  component SunSensorDataCollection
    port (
      clk : in std_logic;
      ad_ctrl_addr : out std_logic_vector(15 downto 0);
      ad_data : in std_logic_vector(11 downto 0);
      power_status : out std_logic;
      sun_visible : out std_logic;
      measured_angle : out std_logic_vector(11 downto 0)
    );
  end component;

  component ThrusterDataCollection
    port (
      clk : in std_logic;
      ad_ctrl_addr : out std_logic_vector(15 downto 0);
      ad_data : in std_logic_vector(3 downto 0);
      power_status_main : out std_logic;
      power_status_backup : out std_logic
    );
  end component;

  component AttitudeDetermination
    port (
      clk : in std_logic;
      gyro_angular_velocity : in std_logic_vector(11 downto 0);
      sun_visible : in std_logic;
      sun_angle : in std_logic_vector(11 downto 0);
      mode_word : in std_logic_vector(7 downto 0);
      attitude_angle_roll : out std_logic_vector(11 downto 0);
      attitude_angle_pitch : out std_logic_vector(11 downto 0);
      attitude_angle_yaw : out std_logic_vector(11 downto 0);
      attitude_angular_velocity_roll : out std_logic_vector(11 downto 0);
      attitude_angular_velocity_pitch : out std_logic_vector(11 downto 0);
      attitude_angular_velocity_yaw : out std_logic_vector(11 downto 0);
      next_mode_word : out std_logic_vector(7 downto 0)
    );
  end component;

  component ModeSwitching
    port (
      clk : in std_logic;
      current_mode_word : in std_logic_vector(7 downto 0);
      current_mode_working_time : in std_logic_vector(15 downto 0);
      sun_visible : in std_logic;
      attitude_angle_roll : in std_logic_vector(11 downto 0);
      attitude_angle_pitch : in std_logic_vector(11 downto 0);
      attitude_angle_yaw : in std_logic_vector(11 downto 0);
      attitude_angular_velocity_roll : in std_logic_vector(11 downto 0);
      attitude_angular_velocity_pitch : in std_logic_vector(11 downto 0);
      attitude_angular_velocity_yaw : in std_logic_vector(11 downto 0);
      next_mode_word : out std_logic_vector(7 downto 0);
      current_mode_working_time_accumulated : out std_logic_vector(15 downto 0)
    );
  end component;

  component ControlOutput
    port (
      clk : in std_logic;
      gyro_control_switch_reg_addr : in std_logic_vector(15 downto 0);
      sun_sensor_control_switch_reg_addr : in std_logic_vector(15 downto 0);
      thruster_control_signal_reg_addr : in std_logic_vector(15 downto 0);
      thruster_enable_signal_reg_addr : in std_logic_vector(15 downto 0);
      thruster_pulse_switch_reg_addr : in std_logic_vector(15 downto 0);
      thruster_combination : out std_logic_vector(7 downto 0);
      thruster_enable_signal : out std_logic_vector(7 downto 0);
      thruster_pulse_switch_enable : out std_logic_vector(7 downto 0)
    );
  end component;

  component TelemetryProcessing
    port (
      clk : in std_logic;
      mode_reg : in std_logic_vector(15 downto 0);
      roll_angle_reg : in std_logic_vector(15 downto 0);
      pitch_angle_reg : in std_logic_vector(15 downto 0);
      roll_rate_reg : in std_logic_vector(15 downto 0);
      pitch_rate_reg : in std_logic_vector(15 downto 0);
      yaw_rate_reg : in std_logic_vector(15 downto 0);
      telemetry_data_out : out std_logic_vector(31 downto 0);
      serial_out : out std_logic
    );
  end component;

begin
  -- Initialization module
  Initialization_inst : Initialization
    port map (
      clk => clk,
      rst => rst,
      ctrl_reg_addr => ctrl_reg_addr,
      switch_ctrl => switch_ctrl,
      timer_int_enable => timer_int_enable,
      gyro_ctrl => gyro_ctrl,
      sun_sensor_ctrl => sun_sensor_ctrl,
      timer_interrupt => timer_interrupt
    );

  -- RemoteControl module
  RemoteControl_inst : RemoteControl
    port map (
      clk => clk,
      remote_ctrl_addr => ctrl_reg_addr,
      mode_word => remote_ctrl_mode_word
    );

  -- GyroDataCollection module
  GyroDataCollection_inst : GyroDataCollection
    port map (
      clk => clk,
      gyro_ctrl_addr => "0000000000000000", -- You need to provide the actual address
      gyro_data => gyro_data,
      power_status => open,  -- Connect to actual power_status signal
      angular_velocity => gyro_angular_velocity
    );

  -- SunSensorDataCollection module
  SunSensorDataCollection_inst : SunSensorDataCollection
    port map (
      clk => clk,
      ad_ctrl_addr => "0000000000000000", -- You need to provide the actual address
      ad_data => ad_data,
      power_status => open,  -- Connect to actual power_status signal
      sun_visible => open,   -- Connect to actual sun_visible signal
      measured_angle => sun_angle
    );

  -- ThrusterDataCollection module
  ThrusterDataCollection_inst : ThrusterDataCollection
    port map (
      clk => clk,
      ad_ctrl_addr => "0000000000000000", -- You need to provide the actual address
      ad_data => thruster_ad_data,
      power_status_main => open,     -- Connect to actual power_status_main signal
      power_status_backup => open    -- Connect to actual power_status_backup signal
    );

  -- AttitudeDetermination module
  AttitudeDetermination_inst : AttitudeDetermination
    port map (
      clk => clk,
      gyro_angular_velocity => gyro_angular_velocity,
      sun_visible => open,  -- Connect to actual sun_visible signal
      sun_angle => sun_angle,
      mode_word => remote_ctrl_mode_word,
      attitude_angle_roll => attitude_angle_roll,
      attitude_angle_pitch => attitude_angle_pitch,
      attitude_angle_yaw => attitude_angle_yaw,
      attitude_angular_velocity_roll => attitude_angular_velocity_roll,
      attitude_angular_velocity_pitch => attitude_angular_velocity_pitch,
      attitude_angular_velocity_yaw => attitude_angular_velocity_yaw,
      next_mode_word => next_mode_word
    );

  -- ModeSwitching module
  ModeSwitching_inst : ModeSwitching
    port map (
      clk => clk,
      current_mode_word => remote_ctrl_mode_word,
      current_mode_working_time => current_mode_working_time,
      sun_visible => open,  -- Connect to actual sun_visible signal
      attitude_angle_roll => attitude_angle_roll,
      attitude_angle_pitch => attitude_angle_pitch,
      attitude_angle_yaw => attitude_angle_yaw,
      attitude_angular_velocity_roll => attitude_angular_velocity_roll,
      attitude_angular_velocity_pitch => attitude_angular_velocity_pitch,
      attitude_angular_velocity_yaw => attitude_angular_velocity_yaw,
      next_mode_word => next_mode_word,
      current_mode_working_time_accumulated => current_mode_working_time_accumulated
    );

  -- ControlOutput module
  ControlOutput_inst : ControlOutput
    port map (
      clk => clk,
      gyro_control_switch_reg_addr => "0000000000000000", -- You need to provide the actual address
      sun_sensor_control_switch_reg_addr => "0000000000000000", -- You need to provide the actual address
      thruster_control_signal_reg_addr => "0000000000000000", -- You need to provide the actual address
      thruster_enable_signal_reg_addr => "0000000000000000", -- You need to provide the actual address
      thruster_pulse_switch_reg_addr => "0000000000000000", -- You need to provide the actual address
      thruster_combination => thruster_combination,
      thruster_enable_signal => thruster_enable_signal,
      thruster_pulse_switch_enable => thruster_pulse_switch_enable
    );

  -- TelemetryProcessing module
  TelemetryProcessing_inst : TelemetryProcessing
    port map (
      clk => clk,
      mode_reg => remote_ctrl_mode_word,
      roll_angle_reg => attitude_angle_roll,
      pitch_angle_reg => attitude_angle_pitch,
      roll_rate_reg => attitude_angular_velocity_roll,
      pitch_rate_reg => attitude_angular_velocity_pitch,
      yaw_rate_reg => attitude_angular_velocity_yaw,
      telemetry_data_out => telemetry_data_out,
      serial_out => serial_out
    );

end Behavioral;
