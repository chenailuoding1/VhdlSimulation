# 陈琪
# @Time : 2023/4/11 14:35
# @Author : chenqi
# @File : GenerateAtomsystemVhdl
# @Project : VhdlSimulation
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
from . import  DataHandling
def Generate_atomsystem_vhdl(inputpath):
    insysdict_atomsys = {}
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    insysdict_atomsys = json.loads(data)
    print(insysdict_atomsys)
    # 先清理该目录
    rootdir = "./AtomicSystemGeneration/AtomSystemVhdl/"
    for files in os.listdir(rootdir):
        path = os.path.join(rootdir, files)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
    computerdict={}
    tbtestdict = {}
    ###每个item为一个原子系统，key为原子系统名称简写，value为原子系统目录结构及端口信息的字典
    # 'GDA15': {'GDA': {'type': 'controler', 'in_port': ['in_G_Pulse count', 'in_G_Gyro power state', 'in_GDACC_Angular velocity analog'], 'out_port': ['out_G_Pulse count acquisition instruction', 'out_G_Gyro power state perception instruction', 'out_GDACC_Pulse count', 'out_GD_Angular velocity analog', 'out_GD_Gyro power state', 'out_calculate instruction'], 'stacount': 5, 'stasprocess': [{'port': ['out_G_Pulse count acquisition instruction'], 'type': 0}, {'port': ['out_G_Gyro power state perception instruction'], 'type': 0}, {'port': ['out_GDACC_Pulse count', 'out_calculate instruction'], 'type': 1}, {'port': ['out_GD_Angular velocity analog'], 'type': 0}, {'port': ['out_GD_Gyro power state'], 'type': 0}]}
    for key, value in insysdict_atomsys.items():
        # 处理键
        dirname = key

        # 创建目录
        os.mkdir(rootdir + dirname)
        # 处理值
        # 每个item为原子系统目录下的一个文件端口、类型信息，subkey为文件名，subvalue为信息字典
        #
        hasccfalg = False
        controler_port = []
        controler_port_in=[]
        controler_port_out=[]
        controler_name = ""
        computer_port = []
        computer_name = ""
        for subkey, subvalue in value.items():
            # 处理子键和子值
            print(subkey)
            filename = subkey
            # 获取文件类型分为三种controler、computer、topfile
            filetype = subvalue["type"]
            print(filetype)

            if filetype == "controler":
                ####dirname为原子系统项目目录，filename为原子系统内部文件
                if len(value)>1:
                    Generate_controler_vhdl(dirname, filename, subvalue)
                else:
                    Generate_controler_vhdl(dirname, dirname, subvalue)
                controler_port = subvalue["in_port"] + subvalue["out_port"]
                controler_port_in = subvalue["in_port"]

                controler_port_out = subvalue["out_port"]
                controler_name = filename
            elif filetype == "computer":
                Generate_computer_vhdl(dirname, filename, subvalue)
                computer_port = subvalue["in_port"] + subvalue["out_port"]
                computer_name = filename
                computerdict[filename]=dirname
            else:
                hasccfalg = True

        if hasccfalg == True:
            topfile_port = value[dirname]["in_port"] + value[dirname]["out_port"]
            Generate_topfile_vhdl(dirname, dirname, controler_port, computer_port, topfile_port, controler_name,
                                  computer_name)
            Generate_tb_vhdl(dirname, dirname, topfile_port)
            ports={}
            ports["input"]=[]
            ports["output"] = []

            for i in list(set(value[dirname]["in_port"]).union(set(["clk","rst","start"]))):
                port={}
                port["name"]=i
                if DataHandling.IsAccessIns(i):

                    port["type"] ="STD_LOGIC"
                else:
                    port["type"] ="STD_LOGIC_VECTOR ( 31 downto 0 )"
                # print(i)
                # print(DataHandling.IsAccessIns(i))
                ports["input"].append(port)

            for i in list(set(value[dirname]["out_port"]).union(set(["done"]))):
                port={}
                port["name"]=i
                if DataHandling.IsAccessIns(i):
                    port["type"] ="STD_LOGIC"
                else:
                    port["type"] ="STD_LOGIC_VECTOR ( 31 downto 0 )"
                # print(i)
                # print(DataHandling.IsAccessIns(i))
                ports["output"].append(port)
            tbtestdict[dirname]=ports
        else:
            Generate_tb_vhdl(dirname, controler_name , controler_port)
            # print("print(controler_port_out)")
            # print(controler_port_out)
            ports = {}
            ports["input"] = []
            ports["output"] = []
            for i in set(controler_port_in).union(set(["clk", "rst", "start"])):
                port = {}
                port["name"] = i
                if DataHandling.IsAccessIns(i):
                    port["type"] = "STD_LOGIC"
                else:
                    port["type"] = "STD_LOGIC_VECTOR ( 31 downto 0 )"
                ports["input"].append(port)
            #
            # print(ports)
            # print("set")
            # print(set(controler_port_out).union(set(["done"])))
            for i in set(controler_port_out).union(set(["done"])):
                port = {}
                port["name"] = i
                if DataHandling.IsAccessIns(i):
                    port["type"] = "STD_LOGIC"
                else:
                    port["type"] = "STD_LOGIC_VECTOR ( 31 downto 0 )"
                # print("port")
                # print(port)
                ports["output"].append(port)
            # print("ports")
            # print(ports)
            tbtestdict[dirname] = ports

    json_str = json.dumps(computerdict)
    # 将JSON格式的字符串写入文件
    with open("./Extractionjson/computerdict.json", "w") as f:
        f.write(json_str)
    json_tb = json.dumps(tbtestdict)
    # 将JSON格式的字符串写入文件
    with open("./Extractionjson/tbtestdict.json", "w") as f:
        f.write(json_tb)


def Generate_tb_vhdl(dirname, componetname, topfile_port):
    filepath = "./AtomicSystemGeneration/AtomSystemVhdl/"+ dirname + "/" + "tb_test.vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity   --测试平台文件的空实体（不需要端口定义)
        with open("./AtomicSystemGeneration/Template/atomtbtesttemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            ####2.被测试元件的声明
            file.write("component " + componetname + " is\nport(\n")
            file.write("clk:in std_logic;\nstart:in std_logic;\ndone:out std_logic;\nrst:in std_logic;\n")
            for i in range(0, len(topfile_port)):

                portstr = "\t" + DataHandling.abbrportname(topfile_port[i])
                if topfile_port[i].split('_')[0] == "in":
                    portstr = portstr + ":in "
                else:
                    portstr = portstr + ":out "
                if DataHandling.IsAccessIns(topfile_port[i]):
                    portstr = portstr + "STD_LOGIC"
                else:
                    portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                if i != len(topfile_port) - 1:
                    portstr = portstr + ";"
                file.write(portstr)
                file.write('\n')

            file.write(");\nend component;\n")
            ####computer


            ###3.中间信号变量
            file.write("signal t_clk:std_logic;\nsignal t_start: std_logic;\nsignal t_done: std_logic;\nsignal t_rst: std_logic;\n")
            midsignal_port = ["t_"+DataHandling.abbrportname(i) for i in topfile_port]
            for i in range(0,len(midsignal_port)):
                if DataHandling.IsAccessIns(topfile_port[i]):
                    file.write("signal "+midsignal_port[i]+ "STD_LOGIC"+";\n")
                else:
                    file.write("signal " + midsignal_port[i] + "STD_LOGIC_VECTOR ( 31 downto 0 )" + ";\n")
            ###4.--产生时钟信号
            file.write("constant period : time := 2 us;\n")##--时钟周期的定义
            file.write("begin\n")
            file.write("t_clk <= not t_clk after period/2;\n")
            ###5.
            file.write(componetname + "_process:" + componetname + " port map(\n")
            file.write("clk=>t_clk,\nstart=>t_start,\ndone=>t_done,\nrst=>t_rst,\n")
            for i in range(0,len(midsignal_port)):
                portstr = DataHandling.abbrportname(topfile_port[i]) + "=> " +midsignal_port[i]
                if i != len(topfile_port) - 1:
                    portstr = portstr + ","
                file.write(portstr)
                file.write('\n')

            file.write(");\nend component;\n")




def Generate_controler_vhdl(dirname, filename, filedict):
    in_port = filedict["in_port"]
    out_port = filedict["out_port"]
    stacount = filedict["stacount"]
    stasprocess = filedict["stasprocess"]

    ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
    filepath = "./AtomicSystemGeneration/AtomSystemVhdl/" + dirname + "/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("./AtomicSystemGeneration/Template/atomcontrolertemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            # 实体名称不允许
            entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(entitystr)
            file.write("port(\n")
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
                    portstr = portstr + "STD_LOGIC;"
                else:
                    portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 );"
                # if i != len(keys) - 1:
                #     portstr = portstr + ";"
                portstr = portstr + "--" + keys[i]
                file.write(portstr)
                file.write('\n')

        ####2.生成结构体部分architecture
        with open("./AtomicSystemGeneration/Template/atomcontrolertemplate/part2.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            endstr = "end " + DataHandling.check_vhdl_entity_name(filename) + ";\n"
            file.write(endstr)
            Behavioralstr = "architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(Behavioralstr)
            file.write("shared variable Count: integer:=0;\n")
            #统计寄存器名称数组
            ramlist=[]
            for i in range(0, len(in_port)):
                if DataHandling.renewname(DataHandling.abbrportname(in_port[i])) not in ramlist:
                    ramlist.append(DataHandling.renewname(DataHandling.abbrportname(in_port[i])))
            for i in range(0, len(ramlist)):
                str1 = "type ram_type" + str(i) + " is array (1 downto 0) of STD_LOGIC_VECTOR ( 31 downto 0 );\n"
                str2 = "signal RAM_" + filename + "_" + ramlist[i] + ": ram_type" + str(
                    i) + ";\n"
                str3 = "signal " +ramlist[i] + "_addr: integer:=1;\n"
                file.write(str1)
                file.write(str2)
                file.write(str3)
            stastr = "Type states is ("
            for i in range(0, stacount + 1):
                stastr = stastr + "sta" + str(i)
                if i != stacount:
                    stastr = stastr + ","
                else:
                    stastr = stastr + ");\n"
            file.writelines(stastr)
            file.writelines("signal sta:states;\n")

        with open("./AtomicSystemGeneration/Template/atomcontrolertemplate/part3.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            for i in range(1, stacount + 1):
                file.write("\t\t\t\twhen sta" + str(i) + "=> \n")
                if i != stacount:
                    file.write("\t\t\t\t\tsta<=sta" + str(i + 1) + ";\n")
                else:
                    file.write("\t\t\t\t\tsta<=sta" + str(0) + ";\n")

        with open("./AtomicSystemGeneration/Template/atomcontrolertemplate/part4.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            for i in range(0, stacount + 1):
                file.write("\t\t\t\twhen sta" + str(i) + "=> \n")

                if i == 0:
                    file.write("\t\t\t\t\tdone<='0';\n")
                    proport = stasprocess[-1]["port"]
                    for port in proport:
                        if DataHandling.IsAccessIns(port):
                            file.write("\t\t\t\t\t" + DataHandling.abbrportname(port) + "<='0';\n")
                else:

                    curport = stasprocess[i - 1]["port"]

                    for port in curport:
                        if DataHandling.IsAccessIns(port):
                            file.write("\t\t\t\t\t" + DataHandling.abbrportname(port) + "<='1';\n")
                        else:

                            valuestr = DataHandling.abbrportname(port) + "<=RAM_" + filename + "_" + str(
                                DataHandling.renewname(DataHandling.abbrportname(port))) + "(" + str(DataHandling.renewname(DataHandling.abbrportname(port))) + "_addr);\n"
                            file.write("\t\t\t\t\t" + valuestr)
                    if i == stacount:
                        file.write("\t\t\t\t\tCount:=0;\n")
                        file.write("\t\t\t\t\tdone<='1';\n")
                    if i != 1:
                        proport = stasprocess[i - 2]["port"]
                        for port in proport:
                            if DataHandling.IsAccessIns(port):
                                file.write("\t\t\t\t\t" + DataHandling.abbrportname(port) + "<='0';\n")
        file.write("\t\t\t\tend case;\n")
        file.write("\tend process;\n")
        for i in range(0, len(in_port)):
            inportstr = "\tprocess(" + DataHandling.abbrportname(in_port[i]) + ")\n"
            file.write(inportstr)
            file.write("\tbegin\n")
            # DataHandling.splitportname()作用为将in_xx_xxx变成xx_xxx，或者out_xx_xxx变成xx_xxx,及去除前面的in out
            # DataHandling.abbrportname()作用为简写名称及将in_DataHandling.splitportname_name变成in_spl_nam
            file.write("\t\tRAM_" + filename + "_" + DataHandling.renewname(DataHandling.abbrportname(in_port[i])) + "(" + DataHandling.renewname(
                DataHandling.abbrportname(in_port[i])) + "_addr)<=" + DataHandling.abbrportname(in_port[i]) + ";\n")
            file.write("\tend process;\n")
        file.write("end Behavioral;")


def Generate_computer_vhdl(dirname, filename, filedict):
    in_port = filedict["in_port"]
    out_port = filedict["out_port"]
    ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
    filepath = "./AtomicSystemGeneration/ComputerVhdl/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("./AtomicSystemGeneration/Template/atomcomputertemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(entitystr)
            file.write("port(\n")
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
        ####2.生成结构体部分architecture

        with open("./AtomicSystemGeneration/Template/atomcomputertemplate/part2.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            file.write("--由输入端口")
            for i in in_port:
                if not DataHandling.IsAccessIns(i):
                    file.write(DataHandling.abbrportname(i) + "、")
            file.write("得到输出端口")
            for i in out_port:
                if not DataHandling.IsAccessIns(i):
                    file.write(DataHandling.abbrportname(i) + "、")
            file.write('\n')
        with open("./AtomicSystemGeneration/Template/atomcomputertemplate/part3.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')


def Generate_topfile_vhdl(dirname, filename, controler_port, computer_port, topfile_port, controler_name,
                          computer_name):
    filepath = "./AtomicSystemGeneration/AtomSystemVhdl/" + dirname + "/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("./AtomicSystemGeneration/Template/atomtopfiletemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(entitystr)
            file.write("port(\n")
            file.write("clk:in STD_LOGIC;\n")
            file.write("rst:in STD_LOGIC;\n")
            file.write("done:out STD_LOGIC;\n")
            file.write("start:in STD_LOGIC;\n")
            ##生成实体端口部分，并带有注释
            for i in range(0, len(topfile_port)):

                portstr = "\t" + DataHandling.abbrportname(topfile_port[i])
                if topfile_port[i].split('_')[0] == "in":
                    portstr = portstr + ":in "
                else:
                    portstr = portstr + ":out "
                if DataHandling.IsAccessIns(topfile_port[i]):
                    portstr = portstr + "STD_LOGIC"
                else:
                    portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                if i != len(topfile_port) - 1:
                    portstr = portstr + ";"
                portstr = portstr + "--" + topfile_port[i]
                file.write(portstr)
                file.write('\n')

            file.write(");\nend " + DataHandling.check_vhdl_entity_name(filename) + ";\n")
            file.write("architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n")
            ####2.生成结构体部分architecture
            ####controler
            file.write("component " + controler_name + " is\nport(\n")
            file.write("clk:in std_logic;\nstart:in std_logic;\ndone:out std_logic;\nrst:in std_logic;\n")
            for i in range(0, len(controler_port)):

                portstr = "\t" + DataHandling.abbrportname(controler_port[i])
                if controler_port[i].split('_')[0] == "in":
                    portstr = portstr + ":in "
                else:
                    portstr = portstr + ":out "
                if DataHandling.IsAccessIns(controler_port[i]):
                    portstr = portstr + "STD_LOGIC"
                else:
                    portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                if i != len(controler_port) - 1:
                    portstr = portstr + ";"
                file.write(portstr)
                file.write('\n')

            file.write(");\nend component;\n")
            ####computer
            file.write("component " + computer_name + " is\nport(\n")
            for i in range(0, len(computer_port)):

                portstr = "\t" + DataHandling.abbrportname(computer_port[i])
                if computer_port[i].split('_')[0] == "in":
                    portstr = portstr + ":in "
                else:
                    portstr = portstr + ":out "
                if DataHandling.IsAccessIns(computer_port[i]):
                    portstr = portstr + "STD_LOGIC"
                else:
                    portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 )"
                if i != len(computer_port) - 1:
                    portstr = portstr + ";"
                file.write(portstr)
                file.write('\n')
            file.write(");\nend component;\n")
            ####signal
            for i in computer_port:

                portstr = "\tsignal " + DataHandling.abbrportname("m_" + DataHandling.splitportname(i))

                if DataHandling.IsAccessIns(i):
                    portstr = portstr + ":STD_LOGIC;--"
                else:
                    portstr = portstr + ":STD_LOGIC_VECTOR ( 31 downto 0 );--"
                file.write(portstr)
                file.write('\n')
            file.write("begin\n")
            ###端口连接
            ###controler
            ccabbr_port = [DataHandling.splitportname(i) for i in computer_port]
            file.write(controler_name + "_process:" + controler_name + " port map(\n")
            file.write("clk=>clk,\nstart=>start,\ndone=>done,\nrst=>rst,\n")
            for i in range(0, len(controler_port)):

                if DataHandling.splitportname(controler_port[i]) in ccabbr_port:
                    portstr = DataHandling.abbrportname(controler_port[i]) + "=> " + DataHandling.abbrportname(
                        "m_" + DataHandling.splitportname(controler_port[i]))
                else:
                    portstr = DataHandling.abbrportname(controler_port[i]) + "=> " + DataHandling.abbrportname(controler_port[i])

                if i != len(controler_port) - 1:
                    portstr = portstr + ","
                file.write(portstr)
                file.write('\n')
            file.write(");\n")
            ###computer
            file.write(computer_name + "_process:" + computer_name + " port map(\n")

            for i in range(0, len(computer_port)):

                portstr = DataHandling.abbrportname(computer_port[i]) + "=> " + DataHandling.abbrportname("m_" + DataHandling.splitportname(computer_port[i]))
                if i != len(computer_port) - 1:
                    portstr = portstr + ","
                file.write(portstr)
                file.write('\n')
            file.write(");\nend Behavioral;")
# Generate_atomsystem_vhdl("../Extractionjson/insysdict_atomsys.json")