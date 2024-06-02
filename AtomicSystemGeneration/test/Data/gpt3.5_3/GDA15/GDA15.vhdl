-- 顶层组件模块 GDA2
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GDA2 is
port(
    clk: in STD_LOGIC;
    rst: in STD_LOGIC;
    done: out STD_LOGIC;
    start: in STD_LOGIC;
    in_GDA_G_Pulse_count_acquisition_inst: in STD_LOGIC_VECTOR (31 downto 0);
    in_GDA_G_Gyro_power_state_perception_inst: in STD_LOGIC_VECTOR (31 downto 0);
    in_calc_inst: in STD_LOGIC;
    out_GDA_GDACC_Pulse_count: out STD_LOGIC_VECTOR (31 downto 0);
    out_GDA_GDACC_Pulse_count_storage_inst: out STD_LOGIC
);
end GDA2;

architecture Behavioral of GDA2 is
    component GDA
    port(
        in_GDA_G_Pulse_count_acquisition_inst: in STD_LOGIC_VECTOR (31 downto 0);
        in_GDA_G_Gyro_power_state_perception_inst: in STD_LOGIC_VECTOR (31 downto 0);
        in_calc_inst: in STD_LOGIC;
        out_GDA_GDACC_Pulse_count: out STD_LOGIC_VECTOR (31 downto 0);
        out_GDA_GDACC_Angular_velocity_analog: out STD_LOGIC_VECTOR (31 downto 0);
        out_GDA_GDACC_Angular_velocity_analog_storage_inst: out STD_LOGIC;
        out_GDA_GDACC_Gyro_power_state_storage_inst: out STD_LOGIC
    );
    end component;

    component GDACC
    port(
        in_GDA_GDACC_Angular_velocity_analog: in STD_LOGIC_VECTOR (31 downto 0);
        in_GDA_GDACC_Angular_velocity_analog_storage_inst: in STD_LOGIC;
        out_GDA_GDACC_Pulse_count: out STD_LOGIC_VECTOR (31 downto 0);
        out_GDA_GDACC_Pulse_count_storage_inst: out STD_LOGIC
    );
    end component;

    signal m_GDA_GDACC_Pulse_count: STD_LOGIC_VECTOR (31 downto 0);
    signal m_GDA_GDACC_Pulse_count_storage_inst: STD_LOGIC;

begin
    GDA_component: GDA port map(
        in_GDA_G_Pulse_count_acquisition_inst => in_GDA_G_Pulse_count_acquisition_inst,
        in_GDA_G_Gyro_power_state_perception_inst => in_GDA_G_Gyro_power_state_perception_inst,
        in_calc_inst => in_calc_inst,
        out_GDA_GDACC_Pulse_count => m_GDA_GDACC_Pulse_count,
        out_GDA_GDACC_Angular_velocity_analog => (others => '0'),
        out_GDA_GDACC_Angular_velocity_analog_storage_inst => (others => '0'),
        out_GDA_GDACC_Gyro_power_state_storage_inst => (others => '0')
    );

    GDACC_component: GDACC port map(
        in_GDA_GDACC_Angular_velocity_analog => m_GDA_GDACC_Pulse_count,
        in_GDA_GDACC_Angular_velocity_analog_storage_inst => (others => '0'),
        out_GDA_GDACC_Pulse_count => out_GDA_GDACC_Pulse_count,
        out_GDA_GDACC_Pulse_count_storage_inst => m_GDA_GDACC_Pulse_count_storage_inst
    );

    process(clk, rst)
    begin
        if rst = '1' then
            done <= '0';
        elsif clk'event and clk = '1' then
            done <= m_GDA_GDACC_Pulse_count_storage_inst;
        end if;
    end process;

end Behavioral;