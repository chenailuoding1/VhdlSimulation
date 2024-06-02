library IEEE;
use IEEE.STD_LOGIC_VECTOR;
use IEEE.NUMERIC_STD.ALL;
entity Gyro_Power_On_Instruction_Load_Instruction is
Port ( clk : in STD_LOGIC;
rst : in STD_LOGIC;
start : in STD_LOGIC;
in_Gyro_power_on_inst : in STD_LOGIC_VECTOR (31 downto 0));
end Gyro_Power_On_Instruction_Load_Instruction;
architecture Behavior of Gyro_Power_On_Instruction_Load_Instruction is
begin
process(clk, rst, start)
begin
if (rst = 1) then
out_Gyro_power_on_inst <= '0';
elsif (start = 1) then
out_Gyro_power_on_inst <= in_Gyro_power_on_inst;
end if;
end process;
end Behavior;