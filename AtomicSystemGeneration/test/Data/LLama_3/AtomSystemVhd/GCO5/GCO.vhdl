module GCOCC(input clk,input rst,input start,input in_Gyro_power_on_inst,output out_Gyro_power_on_inst,output out_Gyro_power_on_pulse,output out_Gyro_power_on_signal);
architecture Behavior of GCOCC is
begin
process(clk, rst)
begin
if (rst = 1) thenout_Gyro_power_on_inst <= 0;
elsif (rising_edge(clk)) then
out_Gyro_power_on_inst <= in_Gyro_power_on_inst;
end if;
end process;
process(in_Gyro_power_on_inst, in_Gyro_power_on_pulse)beginout_Gyro_power_on_pulse <= in_Gyro_power_on_pulse;
end process;
process(in_Gyro_power_on_pulse, in_Gyro_power_on_signal)beginout_Gyro_power_on_signal <= in_Gyro_power_on_signal;
end process;
end