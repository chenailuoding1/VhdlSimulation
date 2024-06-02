library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

--指令（instruction）统一为std_logic数据类型，值（value，signal）统一为STD_LOGIC_VECTOR ( 31 downto 0 )数据类型
eentity TelecontrolInstructionProcessing_Calculation is
    Port (
        -- Input signals
        telecontrol_instruction : in std_logic;

        -- Output signals
        next_cycle_mode : out std_logic_vector(7 downto 0)
    );
end TelecontrolInstructionProcessing_Calculation;

architecture Behavioral of TelecontrolInstructionProcessing_Calculation is
begin
    process(telecontrol_instruction)
    begin
        -- Implement your calculation logic here
        -- This is a placeholder; replace it with your actual logic
        -- Example: Extract bits from telecontrol_instruction to create next_cycle_mode
        next_cycle_mode <= telecontrol_instruction(7 downto 0);
    end process;

end Behavioral;
