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

import io
import sys
from xml.dom import minidom
def Generate_atomsystem_project(vhdlfilelist):


    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录
    cwd = os.getcwd()
    cwd = cwd.replace("\\", "/")
    # 要处理的文件夹名称

    outpath="./AtomicSystemGeneration/test/Data/Vhdlproject"
    # 先清理輸出目录

    for files in os.listdir(outpath):
        path = os.path.join(outpath, files)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)


    # 先清理该目录
    # 打开tcl脚本文件以写入模式
    tcl_script_path = "./AtomicSystemGeneration/test/Data/Tcl/new.tcl"
    tcl_file = open(tcl_script_path, "w")
    foldername="Sun"
    projectpath = outpath + "/" + foldername
    projectdirpath = projectpath + "/" + foldername + ".srcs/sources_1/new"
    # 写入tcl命令以创建新项目和设计文件
    tcl_file.write("create_project " + foldername + " " + projectpath + " -part xc7k70tfbv676-1\n")
    tcl_file.write("set_property target_language VHDL [current_project]\n")

    tcl_file.write("file mkdir " + projectdirpath + "\n")

    for vhdlfile in vhdlfilelist:
        tcl_file.write("close [ open " + projectdirpath + "/" + vhdlfile["name"] + ".vhd w ]\n")

        tcl_file.write("add_files " + projectdirpath + "/" + vhdlfile["name"] + ".vhd\n")
        # 将文本添加到设计文件中
        tcl_file.write("set file [open \"" + projectdirpath + "/" + vhdlfile["name"] + ".vhd\" a]\n")
        tcl_file.write("puts $file \"" + vhdlfile["vhdl"] + "\"\n")
        tcl_file.write("close $file\n")

    tcl_file.write("ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
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
    print("Tcl script created successfully.")
def get_atomsystem_project():
    inputpath = "./AtomicSystemGeneration/AtomSystemProject"
    atomsystems = []
    isright=True
    failatomsystems=[]
    for folder in os.listdir(inputpath):
        path = inputpath + "/" + folder
        if os.path.isdir(path):
            filepath = path + "/component.xml"
            if os.path.exists(filepath):

                # print(filepath)
                doc = minidom.parse(filepath)
                ip_name = doc.getElementsByTagName("spirit:name")[0]
                # print("ip_name:%s" % (ip_name.firstChild.data))
                # ips.append(ip_name.firstChild.data)  # 记录每个分系统所包含的所有IP核的名称

                ports = doc.getElementsByTagName("spirit:port")
                # print(ports)
                port_in = []  # 记录IP核所有的输入端口名称
                port_out = []  # 记录IP核所有的输出端口名称
                for port in ports:
                    name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
                    direction = port.getElementsByTagName("spirit:direction")[0]  # 端口方向
                    # print(" name:%s, direction:%s" %
                    #       (name.firstChild.data, direction.firstChild.data))
                    if direction.firstChild.data == "in":  # 根据端口的方向 判断是输入还是输出
                        port_in.append(name.firstChild.data)
                    else:
                        port_out.append(name.firstChild.data)
                portlist = {}
                portlist["port_in"] = port_in
                portlist["port_out"] = port_out
                portlist["name"] = folder
                # print(portlist)
                atomsystems.append(portlist)
            else:
                isright = False
                failatomsystems.append(folder)
    return atomsystems,isright,failatomsystems
def Add_atomsystem_test(foldername):


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
    simtext=""
    vcdtext = ""
    vcdpath=""
    message =""
    try:
        name=foldername.split(".")[0]
        simpath=outpath+"/"+name+"/"+name+".sim/sim_1/behav/xsim/simulate.log"
        vcdpath = outpath + "/" + name + "/" + name + ".sim/sim_1/behav/xsim/dump.vcd"
        # print(vcdpath)
        # print(simpath)
        with open(simpath,'r') as f:
            simtext = f.read()
        with open(vcdpath,'r') as f:
            vcdtext = f.read()
        print(simtext)
        if "Error:" in simtext:
            message="该原子系统数据流有问题！"
        else:
            message="该原子系统数据流没有问题！"
    except Exception:
        message="无文件"
        simtext=""
        vcdtext=""
    data = {
        'message': message,
        'simtext': simtext
    }
    return data

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
        if check_vhdl_format(foldername):
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
            # text_to_add = DataHandling.escape_quotes(text_to_add)
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
        if check_vhdl_format(foldername):
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
            # text_to_add = DataHandling.escape_quotes(text_to_add)
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
def check_vhdl_format(input_string):
    # 定义匹配模式的正则表达式
    pattern = r'^\w+\.vhdl$'

    # 使用 re.match() 函数来检查输入字符串是否符合格式
    if re.match(pattern, input_string):
        return True
    else:
        return False




