library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

entity GDA is
port(
    in_GDA_G_Pulse_count_acquisition_inst: in STD_LOGIC_VECTOR (31 downto 0);
    in_GDA_G_Gyro_power_state_perception_inst: in STD_LOGIC_VECTOR (31 downto 0);
    in_calc_inst: in STD_LOGIC;
    out_GDA_GDACC_Pulse_count: out STD_LOGIC_VECTOR (31 downto 0);
    out_GDA_GDACC_Angular_velocity_analog: out STD_LOGIC_VECTOR (31 downto 0);
    out_GDA_GDACC_Angular_velocity_analog_storage_inst: out STD_LOGIC;
    out_GDA_GDACC_Gyro_power_state_storage_inst: out STD_LOGIC
);
end GDA;

architecture Behavioral of GDA is
    shared variable Count: integer := 0;
    type ram_type0 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
    signal RAM_GDA_G_Pulse_count_acquisition_inst: ram_type0;
    signal Pulse_count_acquisition_inst_addr: integer := 1;
    type ram_type1 is array (1 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
    signal RAM_GDA_G_Gyro_power_state_perception_inst: ram_type1;
    signal Gyro_power_state_perception_inst_addr: integer := 1;
    type states is (sta0, sta1, sta2, sta3, sta4, sta5);
    signal sta: states;
begin
    process(in_calc_inst)
    begin
        if in_calc_inst = '1' then
            Count := 1;
        else
            Count := 0;
        end if;
    end process;

    process(Count, in_calc_inst)
    begin
        if Count = 1 then
            sta <= sta1;
        else
            sta <= sta0;
        end if;
    end process;

    process(sta)
    begin
        case sta is
            when sta0 =>
                out_GDA_GDACC_Pulse_count <= (others => '0');
                out_GDA_GDACC_Angular_velocity_analog <= (others => '0');
                out_GDA_GDACC_Angular_velocity_analog_storage_inst <= '0';
                out_GDA_GDACC_Gyro_power_state_storage_inst <= '0';
            when sta1 =>
                out_GDA_GDACC_Pulse_count <= RAM_GDA_G_Pulse_count_acquisition_inst(Pulse_count_acquisition_inst_addr);
                out_GDA_GDACC_Angular_velocity_analog <= (others => '0');
                out_GDA_GDACC_Angular_velocity_analog_storage_inst <= '0';
                out_GDA_GDACC_Gyro_power_state_storage_inst <= '0';
            when sta2 =>
                out_GDA_GDACC_Angular_velocity_analog_storage_inst <= '1';
            when sta3 =>
                out_GDA_GDACC_Angular_velocity_analog <= RAM_GDA_G_Gyro_power_state_perception_inst(Gyro_power_state_perception_inst_addr);
                out_GDA_GDACC_Angular_velocity_analog_storage_inst <= '0';
                out_GDA_GDACC_Gyro_power_state_storage_inst <= '0';
            when sta4 =>
                out_GDA_GDACC_Gyro_power_state_storage_inst <= '1';
            when sta5 =>
                Pulse_count_acquisition_inst_addr := 1;
                Gyro_power_state_perception_inst_addr := 1;
                Count := 0;
        end case;
    end process;

    process(in_GDA_G_Pulse_count_acquisition_inst)
    begin
        RAM_GDA_G_Pulse_count_acquisition_inst(Pulse_count_acquisition_inst_addr) <= in_GDA_G_Pulse_count_acquisition_inst;
    end process;

    process(in_GDA_G_Gyro_power_state_perception_inst)
    begin
        RAM_GDA_G_Gyro_power_state_perception_inst(Gyro_power_state_perception_inst_addr) <= in_GDA_G_Gyro_power_state_perception_inst;
    end process;

end Behavioral;