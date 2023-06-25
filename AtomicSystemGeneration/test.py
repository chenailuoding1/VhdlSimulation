
from vunit import VUnit

# 创建 VUnit 对象
vu = VUnit.from_argv(compile_builtins=False)
vu.add_vhdl_builtins()

# 添加 VHDL 文件到 VUnit 项目中
library = vu.add_library("IEEE")
library.add_source_files("/AtomSystemVhdl/AD18/AD18.vhdl")

# 获取顶层模块
top_module = library.get_entity("AD18")

# 生成仿真激励文件
stimulus_file = "stimulus_file.txt"
vu.main(post_run=[lambda: top_module.generate_simulator_input(stimulus_file)])

print("仿真激励文件已生成！")
