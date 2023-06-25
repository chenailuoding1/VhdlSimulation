# 陈琪
# @Time : 2023/4/11 15:30
# @Author : chenqi
# @File : GenerateDomainVhdl
# @Project : VhdlSimulation
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
from . import  DataHandling
def getuser(key):
    code_need_do={}
    with open("./Userjson/"+key+".json", 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    code_need_do = json.loads(data)
#     print(code_need_do)
    return code_need_do
def Generate_PL_Domain_vhdl(inputpath, outputpath):
    domaindict = {}
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    domaindict = json.loads(data)
    print(domaindict)
    # 检查目录是否存在
    if os.path.exists(outputpath):
        # 如果目录存在，则删除其中的所有内容
        for filename in os.listdir(outputpath):
            file_path = os.path.join(outputpath, filename)
            try:
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)
                elif os.path.isdir(file_path):
                    os.rmdir(file_path)
            except Exception as e:
                print('无法删除 %s. 原因: %s' % (file_path, e))
    else:
        # 如果目录不存在，则创建该目录
        os.makedirs(outputpath)
    PLDomaincomplete = []
    for key, value in domaindict.items():
        # 处理键
        filename = key
        falg=False
        # 处理值
        # 每个item为原子系统目录下的一个文件端口、类型信息，subkey为文件名，subvalue为信息字典
        #

        in_port = value["in_port"]
        out_port = value["out_port"]
        print("in_port")
        print(in_port)
        ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
        filepath = outputpath + "/" + filename + ".vhdl"
        with open(filepath, 'w', encoding='utf-8') as file:
            ####1.生成实体部分entity
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part1.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')
                entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
                file.write(entitystr)
                file.write("port(\n")
                ##生成实体输入端口部分，并带有注释
                ##生成实体输入端口部分，并带有注释
                port = {}
                for i in in_port:
                    port[i] = "in"
                for i in out_port:
                    port[i] = "out"
                keys = list(port.keys())
                for i in range(0, len(keys)):
                    portstr = "\t" + DataHandling.abbrportname(keys[i])
                    if port.get(keys[i]) == "in":
                        portstr = portstr + ":in "
                    else:
                        portstr = portstr + ":out "
                    if DataHandling.IsAccessIns(keys[i]):
                        portstr = portstr + "STD_LOGIC"
                    else:
                        portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                    if i != len(keys) - 1:
                        portstr = portstr + ";"
                    portstr = portstr + "--" + keys[i]
                    file.write(portstr)
                    file.write('\n')
                file.write(");\nend " + DataHandling.check_vhdl_entity_name(filename) + ";\n")
                file.write("architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n")

            ####2.生成结构体部分architecture
            storage = {}
            RAM = []
            loadprocess = []
            for i in range(0, len(in_port)):
                ##确定输入端口中有多少存数指令，为生成存储器和存数（procees）做准备
                if ("storage instruction" in in_port[i]):
                    str1 = r"_| "
                    #in_SGPonI_GI_Gyro power on instruction storage instruction
                    #"_".join(re.split(str1, in_port[i])[3:-2])是除去前端的标识后后面的指令，最后为Gyro power on instruction
                    if ("_".join(re.split(str1, in_port[i])[3:-2]) not in RAM):
                        RAM.append("_".join(re.split(str1, in_port[i])[3:-2]))
                    key = "_".join(re.split(str1, in_port[i])[3:])
                    if key in storage:
                        storage[key].append(in_port[i])
                    else:
                        value = []
                        value.append(in_port[i])
                        storage[key] = value
                ##确定输入端口中有多少取指令，为后面生成取数进程（procees）做准备
                elif ("load instruction" in in_port[i]) and (in_port[i] not in RAM):
                    str1 = r"_| "
                    loadprocess.append(in_port[i])
            print(storage)
            for i in range(0, len(RAM)):
                str1 = "type ram_type" + str(i) + " is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );\n"
                str2 = "signal RAM_" + filename + "_" + DataHandling.abbrportname(RAM[i]) + ": ram_type" + str(i) + ";\n"
                str3 = "signal " + DataHandling.abbrportname(RAM[i]) + "_addr: integer:=1;\n"
                file.write(str1)
                file.write(str2)
                file.write(str3)
            for key, value in storage.items():
                if len(value) > 1:
                    falg =True
                    file.write(
                        "signal " + DataHandling.abbrportname(key) + ":STD_LOGIC_VECTOR (" + str(len(value) - 1) + " downto 0 );\n")
            file.write("begin\n")
            for key, value in storage.items():
                inportstr = "\tprocess("
                for i in range(0, len(value)):
                    inportstr = inportstr + DataHandling.abbrportname(value[i])
                    if i != len(value) - 1:
                        inportstr = inportstr + ","
                inportstr = inportstr + ")\n"
                file.write(inportstr)
                file.write("\tbegin\n")
                print(value[0])
                if len(value) > 1:
                    signalstr = "\t\t" + DataHandling.abbrportname(key) + " <= "
                    for i in range(0, len(value)):
                        signalstr = signalstr + DataHandling.abbrportname(value[i])
                        if i != len(value) - 1:
                            signalstr = signalstr + "&"
                    file.write(signalstr + ";\n")
                    codes = DataHandling.generate_codes(len(value))
                    file.write("\t\tcase " + DataHandling.abbrportname(key) + " is\n")
                    str1 = r"_| "
                    RAMname = "_".join(re.split(str1, value[0])[3:-2])
                    ##提示用户补充信息
                    # code_need_do = getuser(DataHandling.abbrportname(key))
                    #                     print("zhi"+code_need_do)
                    file.write("--需要用户补全的信息\n")
                    for code in codes:
                        file.write("\t\t\twhen \"" + str(code) + "\"=>\n")
                        # file.write("\t\t\t\tRAM_" + filename + "_" + DataHandling.abbrportname(RAMname) + "(" + DataHandling.abbrportname(
                        #     RAMname) + "_addr)<=" + code_need_do.get(str(code)) + ";\n")
                        file.write("\t\t\t\t--RAM_" + filename + "_" + DataHandling.abbrportname(
                            RAMname) + "(" + DataHandling.abbrportname(
                            RAMname) + "_addr)<= ;\n")
                    file.write("\t\tend case;\n")
                else:
                    file.write("\t\tif " + DataHandling.abbrportname(value[0]) + "='1' then\n")
                    str1 = r"_| "
                    RAMname = "_".join(re.split(str1, value[0])[3:-2])
                    inname = "_".join(re.split(str1, value[0])[1:-2])
                    file.write("\t\t\tRAM_" + filename + "_" + DataHandling.abbrportname(RAMname) + "(" + DataHandling.abbrportname(
                        RAMname) + "_addr)<=" + "in_" + DataHandling.abbrportname(inname) + ";\n")
                    file.write("\t\tend if;\n")
                # splitportname()作用为将in_xx_xxx变成xx_xxx，或者out_xx_xxx变成xx_xxx,及去除前面的in out
                # DataHandling.abbrportname()作用为简写名称及将in_splitportname_name变成in_spl_nam

                file.write("\tend process;\n")
            for i in range(0, len(loadprocess)):
                inportstr = "\tprocess(" + DataHandling.abbrportname(loadprocess[i]) + ")\n"
                file.write(inportstr)
                file.write("\tbegin\n")
                file.write("\t\tif " + DataHandling.abbrportname(loadprocess[i]) + "='1' then\n")
                # splitportname()作用为将in_xx_xxx变成xx_xxx，或者out_xx_xxx变成xx_xxx,及去除前面的in out
                # DataHandling.abbrportname()作用为简写名称及将in_splitportname_name变成in_spl_nam
                str1 = r"_| "
                RAMname = "_".join(re.split(str1, loadprocess[i])[3:-2])
                outname = "_".join(re.split(str1, loadprocess[i])[1:-2])
                file.write("\t\t\tout_" + DataHandling.abbrportname(outname) + "<=RAM_" + filename + "_" + DataHandling.abbrportname(
                    RAMname) + "(" + DataHandling.abbrportname(RAMname) + "_addr);\n")
                file.write("\t\tend if;\n")
                file.write("\tend process;\n")

            #             with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part2.txt", 'r', encoding='utf-8') as infile:
            #                 for line in infile:
            #                     file.writelines(line)
            #                     file.write('\n')
            #                 file.write("--由输入端口")
            #                 for i in in_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write("得到输出端口")
            #                 for i in out_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write('\n')
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part3.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')
        if falg==True:
            PLDomaincomplete.append(filename)
    return  PLDomaincomplete

def Generate_B_Domain_vhdl(inputpath, outputpath):
    domaindict = {}
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    domaindict = json.loads(data)
    print(domaindict)
    # 检查目录是否存在
    if os.path.exists(outputpath):
        # 如果目录存在，则删除其中的所有内容
        for filename in os.listdir(outputpath):
            file_path = os.path.join(outputpath, filename)
            try:
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)
                elif os.path.isdir(file_path):
                    os.rmdir(file_path)
            except Exception as e:
                print('无法删除 %s. 原因: %s' % (file_path, e))
    else:
        # 如果目录不存在，则创建该目录
        os.makedirs(outputpath)

    for key, value in domaindict.items():
        # 处理键
        filename = key

        # 处理值
        # 每个item为原子系统目录下的一个文件端口、类型信息，subkey为文件名，subvalue为信息字典
        #

        in_port = value["in_port"]
        out_port = value["out_port"]
        ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
        filepath = outputpath + "/" + filename + ".vhdl"
        with open(filepath, 'w', encoding='utf-8') as file:
            ####1.生成实体部分entity
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part1.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')
                entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
                file.write(entitystr)
                file.write("port(\n")
                ##生成实体输入端口部分，并带有注释
                ##生成实体输入端口部分，并带有注释
                port = {}
                for i in in_port:
                    port[i] = "in"
                for i in out_port:
                    port[i] = "out"
                keys = list(port.keys())
                for i in range(0, len(keys)):
                    portstr = "\t" + DataHandling.abbrportname(keys[i])
                    if port.get(keys[i]) == "in":
                        portstr = portstr + ":in "
                    else:
                        portstr = portstr + ":out "
                    if DataHandling.IsAccessIns(keys[i]):
                        portstr = portstr + "STD_LOGIC"
                    else:
                        portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                    if i != len(keys) - 1:
                        portstr = portstr + ";"
                    portstr = portstr + "--" + keys[i]
                    file.write(portstr)
                    file.write('\n')
                file.write(");\nend " + DataHandling.check_vhdl_entity_name(filename) + ";\n")
                file.write("architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n")
                file.write("begin\n")
                file.write("--需要用户补全的信息\n")
            ####2.生成结构体部分architecture

            #             with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part2.txt", 'r', encoding='utf-8') as infile:
            #                 for line in infile:
            #                     file.writelines(line)
            #                     file.write('\n')
            #                 file.write("--由输入端口")
            #                 for i in in_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write("得到输出端口")
            #                 for i in out_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write('\n')
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part3.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')


def Generate_C_Domain_vhdl(inputpath, outputpath):
    domaindict = {}
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    domaindict = json.loads(data)
    print(domaindict)
    # 检查目录是否存在
    if os.path.exists(outputpath):
        # 如果目录存在，则删除其中的所有内容
        for filename in os.listdir(outputpath):
            file_path = os.path.join(outputpath, filename)
            try:
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)
                elif os.path.isdir(file_path):
                    os.rmdir(file_path)
            except Exception as e:
                print('无法删除 %s. 原因: %s' % (file_path, e))
    else:
        # 如果目录不存在，则创建该目录
        os.makedirs(outputpath)
    for key, value in domaindict.items():
        # 处理键
        filename = key

        # 处理值
        # 每个item为原子系统目录下的一个文件端口、类型信息，subkey为文件名，subvalue为信息字典
        #

        in_port = value["in_port"]
        out_port = value["out_port"]
        ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
        filepath = outputpath + "/" + filename + ".vhdl"
        with open(filepath, 'w', encoding='utf-8') as file:
            ####1.生成实体部分entity
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part1.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')
                entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
                file.write(entitystr)
                file.write("port(\n")
                ##生成实体输入端口部分，并带有注释
                port={}
                for i in in_port:
                    port[i]="in"
                for i in out_port:
                    port[i]="out"
                keys = list(port.keys())
                for i in range(0,len(keys)):
                    portstr = "\t" + DataHandling.abbrportname(keys[i])
                    if port.get(keys[i])=="in":
                        portstr =portstr + ":in "
                    else:
                        portstr = portstr + ":out "
                    if DataHandling.IsAccessIns(keys[i]):
                        portstr = portstr + "STD_LOGIC"
                    else:
                        portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                    if i != len(keys) - 1:
                        portstr = portstr + ";"
                    portstr = portstr + "--" + keys[i]
                    file.write(portstr)
                    file.write('\n')
                # for i in in_port:
                #     portinstr = "\t" + DataHandling.abbrportname(i) + ":in "
                #     if DataHandling.IsAccessIns(i):
                #         portinstr = portinstr + "STD_LOGIC;--" + i
                #     else:
                #         portinstr = portinstr + "STD_LOGIC_VECTOR ( 31 downto 0 );--" + i
                #     file.write(portinstr)
                #     file.write('\n')
                # ##生成实体输出端口部分，并带有注释
                # for i in range(0, len(out_port)):
                #     portoutstr = "\t" + DataHandling.abbrportname(out_port[i]) + ":out "
                #     if DataHandling.IsAccessIns(out_port[i]):
                #         portoutstr = portoutstr + "STD_LOGIC"
                #     else:
                #         portoutstr = portoutstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                #     if i != len(out_port) - 1:
                #         portoutstr = portoutstr + ";"
                #     portoutstr = portoutstr + "--" + out_port[i]

                file.write(");\nend " + DataHandling.check_vhdl_entity_name(filename) + ";\n")
                file.write("architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n")
                file.write("begin\n")
                file.write("--需要用户补全的信息\n")
            ####2.生成结构体部分architecture

            #             with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part2.txt", 'r', encoding='utf-8') as infile:
            #                 for line in infile:
            #                     file.writelines(line)
            #                     file.write('\n')
            #                 file.write("--由输入端口")
            #                 for i in in_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write("得到输出端口")
            #                 for i in out_port:
            #                     if "instruction" not in i:
            #                         file.write(DataHandling.abbrportname(i)+"、")
            #                 file.write('\n')
            with open("./AtomicSystemGeneration/Template/atompldomaintemplate/part3.txt", 'r', encoding='utf-8') as infile:
                for line in infile:
                    file.writelines(line)
                    file.write('\n')
# Generate_C_Domain_vhdl("../Extractionjson/causal_domain_dict.json","DomianVhdl/causal_domain")
# Generate_B_Domain_vhdl("../Extractionjson/biddable_domain_dict.json","DomianVhdl/biddable_domain")
# Generate_PL_Domain_vhdl("../Extractionjson/physical_lexical_domain_dict.json","DomianVhdl/physical_lexical_domain")