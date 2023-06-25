library ieee;
use ieee.std_logic_1164.all;

entity your_ip_core is
  port (
    input_a : in std_logic;
    input_b : in std_logic;
    output_c : out std_logic
  );
end entity your_ip_core;

architecture rtl of your_ip_core is
begin
  -- 这里是你的IP核的实现
  -- 根据你的需求添加逻辑代码
  -- ...
  output_c<=input_a &input_b;
end architecture rtl;
