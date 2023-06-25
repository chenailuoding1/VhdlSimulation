library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use vunit_pkg.all;

entity test_dataflow is
end entity test_dataflow;

architecture sim of test_dataflow is
  -- 添加测试信号
  signal input_a : std_logic := '0';
  signal input_b : std_logic := '1';
  signal output_c : std_logic;

begin
  -- 实例化IP核
  uut : entity work.your_ip_core
    port map (
      input_a => input_a,
      input_b => input_b,
      output_c => output_c
    );

  -- 添加仿真模式和数据流测试
  process
  begin
    -- 设置输入模式和数据
    input_a <= '0';
    input_b <= '1';

    -- 在仿真时钟周期内等待
    wait for 10 ns;

    -- 验证输出结果
    assert output_c = '0' report "Test failed: output_c should be '0'" severity error;

    -- 在仿真时钟周期内等待
    wait for 10 ns;

    -- 更新输入数据
    input_a <= '1';
    input_b <= '0';

    -- 在仿真时钟周期内等待
    wait for 10 ns;

    -- 验证输出结果
    assert output_c = '1' report "Test failed: output_c should be '1'" severity error;

    -- 在仿真时钟周期内等待
    wait for 10 ns;

    -- 更多测试模式和数据流验证
    -- ...

    -- 结束仿真
    wait;
  end process;
end architecture sim;
