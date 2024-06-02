entity ModeInitialization is
    Port (
        -- Input signals
        current_mode_storage_instruction : in std_logic;

        -- Output signals
        current_mode : out integer range 0 to 255
    );
end ModeInitialization;

architecture Behavioral of ModeInitialization is
    signal current_mode_internal : integer range 0 to 255 := 1;

begin
    process(current_mode_storage_instruction)
    begin
        -- Implement your Mode Initialization logic here

        -- Sample data based on conditions
        if current_mode_storage_instruction = '1' then
            current_mode_internal <= 1; -- Set your desired initial mode value
        end if;

        -- Output sampled data
        current_mode <= current_mode_internal;
    end process;

end Behavioral;
