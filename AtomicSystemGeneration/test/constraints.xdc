# 设置时钟约束
create_clock -period 10 [get_ports clk]

# 设置输入和输出约束
set_input_delay -clock [get_clocks clk] -min 2 [get_ports input_a]
set_input_delay -clock [get_clocks clk] -max 5 [get_ports input_a]
set_output_delay -clock [get_clocks clk] -min 3 [get_ports output_c]
set_output_delay -clock [get_clocks clk] -max 6 [get_ports output_c]
