----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/28 23:15:49
-- Design Name: 
-- Module Name: tb_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_test is
--  Port ( );
end tb_test;

architecture Behavioral of tb_test is
    component SSS0all is
    port (
    clk_0_0 : in STD_LOGIC;
    out_GD_GD_Gyro_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_SSD_SSD_Sun_sens_powe_stat_0_0_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0_0 : in STD_LOGIC
    );
    end component;
    signal t_clk:std_logic:='1';
    signal t_rst:std_logic:='0';
    signal t_out_GD_GD_Gyro_powe_stat_0_0_0:STD_LOGIC_VECTOR ( 31 downto 0 );
    signal t_out_SSD_SSD_Sun_sens_powe_stat_0_0_0:STD_LOGIC_VECTOR ( 31 downto 0 );
    
    constant period : time := 2 us;
begin
t_clk <= not t_clk after period/2;
process 
    begin 

        wait for 4ms;
        t_rst<='1';
        wait;
    end process;
test:SSS0all port map(
    clk_0_0 =>t_clk,
    out_GD_GD_Gyro_powe_stat_0_0_0=>t_out_GD_GD_Gyro_powe_stat_0_0_0,
    out_SSD_SSD_Sun_sens_powe_stat_0_0_0 =>t_out_SSD_SSD_Sun_sens_powe_stat_0_0_0,
    rst_0_0 =>t_rst
);

end Behavioral;
