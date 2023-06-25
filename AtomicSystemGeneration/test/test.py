from vunit import VUnit

# 创建VUnit对象
vu = VUnit.from_argv(compile_builtins=False)
vu.add_vhdl_builtins()

# 添加IP核文件到VUnit项目中
ip_lib = vu.add_library("ip_lib")
ip_lib.add_source_files("your_ip_core.vhd")

# 添加测试文件到VUnit项目中
test_lib = vu.add_library("test_lib")
test_lib.add_source_files("test_dataflow.vhd")

# # 添加约束文件到VUnit项目中
# vu.set_compile_option("ghdl.flags", ["-fexplicit"])  # 如果使用GHDL编译器，请添加此行
# vu.set_sim_option("ghdl.elab_flags", ["-fexplicit"])  # 如果使用GHDL编译器，请添加此行
# vu.add_file("constraints.xdc")

# 运行测试
vu.main()
