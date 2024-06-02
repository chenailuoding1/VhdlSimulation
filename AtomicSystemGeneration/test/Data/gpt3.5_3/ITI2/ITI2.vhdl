library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.All;

USE ieee.numeric_std.ALL;

entity ThirtyTwoMsInterruptTimerInitialization is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        thirty_two_ms_interrupt_timer_start_instruction : in std_logic;
        thirty_two_ms_interrupt_timer : out std_logic
    );
end ThirtyTwoMsInterruptTimerInitialization;

architecture Behavioral of ThirtyTwoMsInterruptTimerInitialization is
    signal thirty_two_ms_interrupt_timer_internal : std_logic := '0';

begin
    process(clk, reset)
    begin
        if reset = '1' then
            thirty_two_ms_interrupt_timer_internal <= '0';
        elsif rising_edge(clk) then
            -- Implement your 32ms interrupt timer logic here
            if thirty_two_ms_interrupt_timer_start_instruction = '1' then
                thirty_two_ms_interrupt_timer_internal <= '1';
            else
                thirty_two_ms_interrupt_timer_internal <= '0';
            end if;

            -- Output 32ms interrupt timer
            thirty_two_ms_interrupt_timer <= thirty_two_ms_interrupt_timer_internal;
        end if;
    end process;
end Behavioral;
