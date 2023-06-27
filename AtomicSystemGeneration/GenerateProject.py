# 陈琪
# @Time : 2023/4/11 16:24
# @Author : chenqi
# @File : GenerateProject
# @Project : VhdlSimulation
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
from . import  DataHandling
import io
import sys
def Generate_atomsystem_project():


    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录
    cwd = os.getcwd()
    cwd = cwd.replace("\\", "/")
    # 要处理的文件夹名称
    inputpath = "./AtomicSystemGeneration/AtomSystemVhdl/"
    outpath="./AtomicSystemGeneration/AtomSystemProject"
    # 先清理輸出目录

    for files in os.listdir(outpath):
        path = os.path.join(outpath, files)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)

    for foldername in os.listdir(inputpath):

        folderpath = os.path.join(inputpath, foldername)
        # 先清理该目录
        # 打开tcl脚本文件以写入模式
        tcl_script_path = "./AtomicSystemGeneration/AtomSystemGenerateTcl/" + foldername + ".tcl"
        tcl_file = open(tcl_script_path, "w")
        # 写入tcl命令以创建新项目和设计文件
        projectpath = outpath + "/" + foldername
        projectdirpath = projectpath + "/" + foldername + ".srcs/sources_1/new"
        tcl_file.write("create_project " + foldername + " " + projectpath + " -part xc7k70tfbv676-1\n")
        tcl_file.write("set_property target_language VHDL [current_project]\n")

        tcl_file.write("file mkdir " + projectdirpath + "\n")

        for filename in os.listdir(folderpath):

            filepath = os.path.join(folderpath, filename)
            text_to_add = ""
            with open(filepath, 'r', encoding='utf-8') as infile:
                for line in infile:
                    text_to_add = text_to_add + str(line) + "\n"
            filename = filename.split(".")[0]
            tcl_file.write("close [ open " + projectdirpath + "/" + filename + ".vhd w ]\n")

            tcl_file.write("add_files " + projectdirpath + "/" + filename + ".vhd\n")

            # 将文本添加到设计文件中

            tcl_file.write("set file [open \"" + projectdirpath + "/" + filename + ".vhd\" a]\n")
            tcl_file.write("puts $file \"" + text_to_add + "\"\n")
            tcl_file.write("close $file\n")

        tcl_file.write(
            "ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
        # 关闭tcl脚本文件
        tcl_file.close()
        # 使用os模块调用Vivado并运行创建的tcl脚本
        os.system(vivado_path + " -mode batch -source " + tcl_script_path)
        #         subprocess.run([vivado_path, "-mode", "batch", "-source", tcl_script_path])
        #         tcl_start_path="tcl/atomtcl/"+foldername+"start.tcl"
        #         tcl_start_file = open(tcl_start_path, "w")
        #         tcl_start_file.write("start_gui\n")
        #         tcl_start_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")
        #         tcl_start_file.write("ipx::package_project -root_dir "+projectpath+" xilinx.com -library user -taxonomy /UserIP \n")
        #         tcl_start_file.write("catch {close_waves}\n")
        #         tcl_start_file.write("catch {close_sim}\n")
        #         tcl_start_file.write("catch {close_project}\n")
        #         tcl_start_file.write("exit\n")
        #         tcl_start_file.close()

        #         os.system(vivado_path + " -mode batch -source "+tcl_start_path)
        # 打印成功消息
        print(foldername + "Tcl script created successfully.")
def Add_atomsystem_test(foldername):
    # 保存原始的 stdout 和 stderr
    original_stdout = sys.__stdout__
    original_stderr = sys.__stderr__

    # 创建一个用于保存控制台输出的变量
    console_output = ""

    # 重定向 stdout 和 stderr 到变量
    sys.stdout = io.StringIO()
    sys.stderr = sys.stdout




    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录
    cwd = os.getcwd()
    cwd = cwd.replace("\\", "/")
    # 要处理的文件夹名称
    inputpath = "./AtomicSystemGeneration/AtomSystemTest/"
    outpath="./AtomicSystemGeneration/AtomSystemProject"
    # 先清理輸出目录

    folderpath = os.path.join(inputpath, foldername.split(".")[0])
    # 先清理该目录
    # 打开tcl脚本文件以写入模式
    tcl_script_path = "./AtomicSystemGeneration/AtomSystemGenerateTcl/" + foldername + "test.tcl"
    tcl_file = open(tcl_script_path, "w")
    # 写入tcl命令以创建新项目和设计文件
    projectpath = outpath + "/" + foldername
    projectdirpath = projectpath + "/" + foldername + ".srcs/sim_1/new"
    tcl_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")

    tcl_file.write("add_files " + folderpath+"/tb_test.vhdl" + " -norecurse\n")

    tcl_file.write("update_compile_order -fileset sources_1\n")
    tcl_file.write("launch_simulation\n")
    tcl_file.write("open_vcd\n")
    tcl_file.write("log_vcd /\n")
    tcl_file.write("run 5s\n")
    tcl_file.write("close_vcd\n")
    #
    # tcl_file.write(
    #     "ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
    # # 关闭tcl脚本文件
    tcl_file.close()
    # 使用os模块调用Vivado并运行创建的tcl脚本
    # os.system(vivado_path + " -mode batch -source " + tcl_script_path)
    subprocess.run([vivado_path, "-mode", "batch", "-source", tcl_script_path])
    #         tcl_start_path="tcl/atomtcl/"+foldername+"start.tcl"
    #         tcl_start_file = open(tcl_start_path, "w")
    #         tcl_start_file.write("start_gui\n")
    #         tcl_start_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")
    #         tcl_start_file.write("ipx::package_project -root_dir "+projectpath+" xilinx.com -library user -taxonomy /UserIP \n")
    #         tcl_start_file.write("catch {close_waves}\n")
    #         tcl_start_file.write("catch {close_sim}\n")
    #         tcl_start_file.write("catch {close_project}\n")
    #         tcl_start_file.write("exit\n")
    #         tcl_start_file.close()

    #         os.system(vivado_path + " -mode batch -source "+tcl_start_path)

    # 从变量中获取控制台输出
    console_output = sys.stdout.getvalue()

    # 还原原始的 stdout 和 stderr
    sys.stdout = original_stdout
    sys.stderr = original_stderr

    # 打印控制台输出
    print("Console output:")
    print(console_output)

    print(foldername + "testTcl script created successfully.")

def Generate_domain_project(inputpath,outpath):
    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录
    cwd = os.getcwd()
    cwd = cwd.replace("\\", "/")
    # 要处理的文件夹名称

    # outpath = "./AtomicSystemGeneration/DomainProject/"
    # inputpaths = ["./AtomicSystemGeneration/DomainVhdl/biddable_domain/", "./AtomicSystemGeneration/DomainVhdl/causal_domain/", "./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/"]
    # 先清理该目录
    if not os.path.exists(outpath):
        os.makedirs(outpath)

    for files in os.listdir(outpath):
        path = os.path.join(outpath, files)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
    # for inputpath in inputpaths:
    for foldername in os.listdir(inputpath):
        folderpath = os.path.join(inputpath, foldername)
        # 先清理该目录
        # 打开tcl脚本文件以写入模式
        if os.path.isdir(folderpath):
            print()
        else:
            foldername = foldername.split(".")[0]
        tcl_script_path = "./AtomicSystemGeneration/AtomDomainGenerateTcl/" + foldername + ".tcl"
        tcl_file = open(tcl_script_path, "w")
        # 写入tcl命令以创建新项目和设计文件
        projectpath = outpath + "/" + foldername
        projectdirpath = projectpath + "/" + foldername + ".srcs/sources_1/new"
        tcl_file.write("create_project " + foldername + " " + projectpath + " -part xc7k70tfbv676-1\n")
        tcl_file.write("set_property target_language VHDL [current_project]\n")

        tcl_file.write("file mkdir " + projectdirpath + "\n")

        text_to_add = ""
        with open(folderpath, 'r', encoding='utf-8') as infile:
            for line in infile:
                text_to_add = text_to_add + str(line) + "\n"
        text_to_add = DataHandling.escape_quotes(text_to_add)
        tcl_file.write("close [ open " + projectdirpath + "/" + foldername + ".vhd w ]\n")
        tcl_file.write("add_files " + projectdirpath + "/" + foldername + ".vhd\n")
        # 将文本添加到设计文件中
        tcl_file.write("set file [open \"" + projectdirpath + "/" + foldername + ".vhd\" a]\n")
        tcl_file.write("set text \"" + text_to_add + "\"\n")
        tcl_file.write("puts $file $text\n")
        tcl_file.write("close $file\n")

        tcl_file.write(
            "ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
        # 关闭tcl脚本文件
        tcl_file.close()
        # 使用os模块调用Vivado并运行创建的tcl脚本
        os.system(vivado_path + " -mode batch -source " + tcl_script_path)
        #         subprocess.run([vivado_path, "-mode", "batch", "-source", tcl_script_path])
        #         tcl_start_path="tcl/atomtcl/"+foldername+"start.tcl"
        #         tcl_start_file = open(tcl_start_path, "w")
        #         tcl_start_file.write("start_gui\n")
        #         tcl_start_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")
        #         tcl_start_file.write("ipx::package_project -root_dir "+projectpath+" xilinx.com -library user -taxonomy /UserIP \n")
        #         tcl_start_file.write("catch {close_waves}\n")
        #         tcl_start_file.write("catch {close_sim}\n")
        #         tcl_start_file.write("catch {close_project}\n")
        #         tcl_start_file.write("exit\n")
        #         tcl_start_file.close()

        #         os.system(vivado_path + " -mode batch -source "+tcl_start_path)
        # 打印成功消息
        print(foldername + "Tcl script created successfully.")
def Generate_dependency_project():
    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录
    cwd = os.getcwd()
    cwd = cwd.replace("\\", "/")
    # 要处理的文件夹名称

    outpath = "./AtomicSystemGeneration/DependencyProject/"
    inputpath = "./AtomicSystemGeneration/DependencyVhdl/"
    # 先清理该目录


    for foldername in os.listdir(inputpath):
        folderpath = os.path.join(inputpath, foldername)
        # 先清理该目录
        # 打开tcl脚本文件以写入模式
        if os.path.isdir(folderpath):
            print()
        else:
            foldername = foldername.split(".")[0]
        tcl_script_path = "./AtomicSystemGeneration/DenpendcyGenerateTcl/" + foldername + ".tcl"
        tcl_file = open(tcl_script_path, "w")
        # 写入tcl命令以创建新项目和设计文件
        projectpath = outpath + "/" + foldername
        projectdirpath = projectpath + "/" + foldername + ".srcs/sources_1/new"
        tcl_file.write("create_project " + foldername + " " + projectpath + " -part xc7k70tfbv676-1\n")
        tcl_file.write("set_property target_language VHDL [current_project]\n")

        tcl_file.write("file mkdir " + projectdirpath + "\n")

        text_to_add = ""
        with open(folderpath, 'r', encoding='utf-8') as infile:
            for line in infile:
                text_to_add = text_to_add + str(line) + "\n"
        text_to_add = DataHandling.escape_quotes(text_to_add)
        tcl_file.write("close [ open " + projectdirpath + "/" + foldername + ".vhd w ]\n")
        tcl_file.write("add_files " + projectdirpath + "/" + foldername + ".vhd\n")
        # 将文本添加到设计文件中
        tcl_file.write("set file [open \"" + projectdirpath + "/" + foldername + ".vhd\" a]\n")
        tcl_file.write("set text \"" + text_to_add + "\"\n")
        tcl_file.write("puts $file $text\n")
        tcl_file.write("close $file\n")

        tcl_file.write(
            "ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
        # 关闭tcl脚本文件
        tcl_file.close()
        # 使用os模块调用Vivado并运行创建的tcl脚本
        os.system(vivado_path + " -mode batch -source " + tcl_script_path)
        #         subprocess.run([vivado_path, "-mode", "batch", "-source", tcl_script_path])
        #         tcl_start_path="tcl/atomtcl/"+foldername+"start.tcl"
        #         tcl_start_file = open(tcl_start_path, "w")
        #         tcl_start_file.write("start_gui\n")
        #         tcl_start_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")
        #         tcl_start_file.write("ipx::package_project -root_dir "+projectpath+" xilinx.com -library user -taxonomy /UserIP \n")
        #         tcl_start_file.write("catch {close_waves}\n")
        #         tcl_start_file.write("catch {close_sim}\n")
        #         tcl_start_file.write("catch {close_project}\n")
        #         tcl_start_file.write("exit\n")
        #         tcl_start_file.close()

        #         os.system(vivado_path + " -mode batch -source "+tcl_start_path)
        # 打印成功消息
        print(foldername + "Tcl script created successfully.")
# Generate_atomsystem_project()
# Generate_domain_project()