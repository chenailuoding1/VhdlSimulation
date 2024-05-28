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
from AtomicSystemGeneration import  DataHandling
def Generate_atomsystem_vhdl(inputpath):
    insysdict_atomsys = {}
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    insysdict_atomsys = json.loads(data)
    print(insysdict_atomsys)
    # 先清理该目录
    rootdir = "Data/AtomSystemVhdl/"
    # testdir = "./AtomicSystemGeneration/AtomSystemTest/"
    for files in os.listdir(rootdir):
        path = os.path.join(rootdir, files)
        # path2 = os.path.join(testdir, files)
        try:
            shutil.rmtree(path)
            # shutil.rmtree(path2)
        except OSError:
            os.remove(path)     
            # os.remove(path2)
    computerdict={}
    tbtestdict = []
    ###每个item为一个原子系统，key为原子系统名称简写，value为原子系统目录结构及端口信息的字典
    # 'GDA15': {'GDA': {'type': 'controler', 'in_port': ['in_G_Pulse count', 'in_G_Gyro power state', 'in_GDACC_Angular velocity analog'], 'out_port': ['out_G_Pulse count acquisition instruction', 'out_G_Gyro power state perception instruction', 'out_GDACC_Pulse count', 'out_GD_Angular velocity analog', 'out_GD_Gyro power state', 'out_calculate instruction'], 'stacount': 5, 'stasprocess': [{'port': ['out_G_Pulse count acquisition instruction'], 'type': 0}, {'port': ['out_G_Gyro power state perception instruction'], 'type': 0}, {'port': ['out_GDACC_Pulse count', 'out_calculate instruction'], 'type': 1}, {'port': ['out_GD_Angular velocity analog'], 'type': 0}, {'port': ['out_GD_Gyro power state'], 'type': 0}]}
    for key, value in insysdict_atomsys.items():
        # 处理键
        dirname = key

        # 创建目录
        os.mkdir(rootdir + dirname)
        # os.mkdir(testdir + dirname)
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
            elif filetype == "topfile":
                Generate_topfile_vhdl(dirname, dirname, subvalue)





    # json_str = json.dumps(computerdict)
    # # 将JSON格式的字符串写入文件
    # with open("./Extractionjson/computerdict.json", "w") as f:
    #     f.write(json_str)
    # json_tb = json.dumps(tbtestdict)
    # 将JSON格式的字符串写入文件
    # with open("./Extractionjson/tbtestdict.json", "w") as f:
    #     f.write(json_tb)


def Generate_tb_vhdl(dirname, componetname, topfile_port):
    filepath = "./AtomicSystemGeneration/AtomSystemTest/"+ dirname + "/" + "tb_test.vhdl"
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
            file.write("signal t_clk:std_logic:='1';\nsignal t_start: std_logic:='1';\nsignal t_done: std_logic;\nsignal t_rst: std_logic:='0';\n")
            midsignal_port = ["t_"+DataHandling.abbrportname(i) for i in topfile_port]
            for i in range(0,len(midsignal_port)):
                if DataHandling.IsAccessIns(topfile_port[i]):
                    file.write("signal "+midsignal_port[i]+ ":STD_LOGIC"+";\n")
                else:
                    file.write("signal " + midsignal_port[i] + ":STD_LOGIC_VECTOR ( 31 downto 0 )" + ";\n")
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

            file.write(");\n")



def Generate_controler_vhdl(dirname, filename, filedict):
    in_port = filedict["in_port"]
    ramprocess=filedict["ramprocesses"]
    out_port = filedict["out_port"]
    states= filedict["states"]
    signals = filedict["signals"]
    initramlist= filedict["initramlist"]
    ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
    filepath = "Data/AtomSystemVhdl/" + dirname + "/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("Template/atomcontrolertemplate/part1.txt", 'r', encoding='utf-8') as infile:
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

                portstr = portstr + "STD_LOGIC_VECTOR ( 31 downto 0 );"
                # if i != len(keys) - 1:
                #     portstr = portstr + ";"
                portstr = portstr + "--" + keys[i]
                file.write(portstr)
                file.write('\n')

        ####2.生成结构体部分architecture
        with open("Template/atomcontrolertemplate/part2.txt", 'r', encoding='utf-8') as infile:
            #生成中间信号变量，包括状态机、寄存器等
            for line in infile:
                file.writelines(line)
                file.write('\n')
            endstr = "end " + DataHandling.check_vhdl_entity_name(filename) + ";\n"
            file.write(endstr)
            Behavioralstr = "architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(Behavioralstr)
            file.write("shared variable Count: integer:=0;\n")
            #统计寄存器名称数组
            for signal in signals:

                str3 = "signal " + signal.get("name") + ": "+signal.get("type")+":=std_logic_vector(to_signed("+signal.get("value")+", 32));\n"
                file.write(str3)
            for ramsignal in initramlist:

                str3 = "signal " + ramsignal.get("name") + ":STD_LOGIC_VECTOR ( 31 downto 0 ) "+":=std_logic_vector(to_signed("+ramsignal.get("value")+", 32));\n"
                file.write(str3)
            stastr = "Type states is ("
            for i in range(0, len(states) + 1):
                stastr = stastr + "sta" + str(i)
                if i != len(states):
                    stastr = stastr + ","
                else:
                    stastr = stastr + ");\n"
            file.writelines(stastr)
            file.writelines("signal sta:states;\n")

        with open("Template/atomcontrolertemplate/part3.txt", 'r', encoding='utf-8') as infile:
            #生成状态机切换进程
            for line in infile:
                file.writelines(line)
                file.write('\n')
            for i in range(1, len(states) + 1):
                file.write("\t\t\t\twhen sta" + str(i) + "=> \n")
                if i != len(states):
                    file.write("\t\t\t\t\tsta<=sta" + str(i + 1) + ";\n")
                else:
                    file.write("\t\t\t\t\tsta<=sta" + str(0) + ";\n")


        with open("Template/atomcontrolertemplate/part4.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')


            ###生成状态机的vhdl代码
            for i in range(0, len(states) + 1):
                file.write("\t\t\t\twhen sta" + str(i) + "=> \n")

                if i == 0:
                #第一个状态要特殊处理，需要实现原子系统运行情况重置，done='0'
                    file.write("\t\t\t\t\tdone<='0';\n")
                    #第一个状态需要重置最后一个状态的输出的控制类指令
                    proport = states[-1]["ports"]
                    for port in proport:
                        if port.get("value")=='1': #判断端口是否是控制类指令
                            file.write("\t\t\t\t\t" + DataHandling.abbrportname(port.get("name")) + "<=std_logic_vector(to_signed(0, 32));\n")
                else:
                #其余状态
                    curport = states[i-1]["ports"]#得到当前状态要输出的端口信息
                    #将每个状态需要输出的端口信息添加上
                    for port in curport:
                        str4="\t\t\t\t\t" + DataHandling.abbrportname(port.get("name")) + "<=std_logic_vector(to_signed("+port.get("value")+", 32));\n"
                        file.write(str4)

                    if i == len(states):
                        #最后一个状态需要返回该原子系统的完成情况
                        file.write("\t\t\t\t\tCount:=0;\n")
                        file.write("\t\t\t\t\tdone<='1';\n")
                    if i != 1:
                        #每个状态需要将前一个状态的控制类指令清除，由于第一个状态是用于状态机重置的，故第二个状态无需清除前一个状态的控制类指令
                        proport = states[i - 2]["ports"]#得到前一个状态要输出的端口信息
                        for port in proport:
                            if port.get("value") == '1':  # 判断端口是否是控制类指令
                                file.write("\t\t\t\t\t" + DataHandling.abbrportname(port.get("name")) + "<=std_logic_vector(to_signed(0, 32));\n")
        file.write("\t\t\t\tend case;\n")
        file.write("\tend process;\n")

        for port in  in_port:
            inportstr = "\tprocess(" + DataHandling.abbrportname(port) + ")\n"
            file.write(inportstr)
            file.write("\tbegin\n")
            ramname = DataHandling.renewname(port)
            file.write("\t\t" + ramname +"_ram"+  "<=" + DataHandling.abbrportname(port) + ";\n")
            file.write("\tend process;\n")

        file.write("\nend Behavioral;")


def Generate_computer_vhdl(dirname, filename, filedict):
    in_port = filedict["in_port"]
    out_port = filedict["out_port"]
    ComputingFormula=filedict["ComputingFormula"]
    ###subvalue["in_port"]为文件输入端口名称数组，subvalue["out_port"]为文件输出端口名称数组
    filepath = "Data/ComputerVhdl/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("Template/atomcomputertemplate/part1.txt", 'r', encoding='utf-8') as infile:
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

        with open("Template/atomcomputertemplate/part2.txt", 'r', encoding='utf-8') as infile:
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
        with open("Template/atomcomputertemplate/part3.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')


def Generate_topfile_vhdl(dirname, filename, topdict):

    in_port = topdict["in_port"]
    out_port = topdict["out_port"]
    signals = topdict["signals"]
    controler= topdict["controler"]
    computing = topdict["computing"]
    filepath = "Data/AtomSystemVhdl/" + dirname + "/" + filename + ".vhdl"
    with open(filepath, 'w', encoding='utf-8') as file:
        ####1.生成实体部分entity
        with open("Template/atomtopfiletemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            entitystr = "entity " + DataHandling.check_vhdl_entity_name(filename) + " is\n"
            file.write(entitystr)
            file.write("port(\n")

            ##生成实体端口部分，并带有注释
            for i in range(0, len(in_port)):
                portstr = "\t" + DataHandling.abbrportname(in_port[i])+ ":in "+ "STD_LOGIC_VECTOR ( 31 downto 0 );"
                portstr = portstr + "--" + in_port[i]
                file.write(portstr)
                file.write('\n')
            for i in range(0, len(out_port)):
                portstr = "\t" + DataHandling.abbrportname(out_port[i])+ ":in "+ "STD_LOGIC_VECTOR ( 31 downto 0 );"
                portstr = portstr + "--" + out_port[i]
                file.write(portstr)
                file.write('\n')
            file.write("clk:in STD_LOGIC;\n")
            file.write("rst:in STD_LOGIC;\n")
            file.write("done:out STD_LOGIC;\n")
            file.write("start:in STD_LOGIC\n")
            file.write(");\nend " + DataHandling.check_vhdl_entity_name(filename) + ";\n")
            file.write("architecture Behavioral of " + DataHandling.check_vhdl_entity_name(filename) + " is\n")
            ####2.生成结构体部分architecture
            ####controler
            file.write("component " + controler["name"]+ " is\nport(\n")

            for i in range(0, len(controler["in_port"])):
                portstr = "\t" + DataHandling.abbrportname(controler["in_port"][i])+":in "+ "STD_LOGIC_VECTOR ( 31 downto 0 );"
                file.write(portstr)
                file.write('\n')
            for i in range(0, len(controler["out_port"])):
                portstr = "\t" + DataHandling.abbrportname(controler["out_port"][i])+":out "+ "STD_LOGIC_VECTOR ( 31 downto 0 );"
                file.write(portstr)
                file.write('\n')
            file.write("clk:in std_logic;\nstart:in std_logic;\ndone:out std_logic;\nrst:in std_logic\n")
            file.write(");\nend component;\n")
            ####computer
            file.write("component " + computing["name"] + " is\nport(\n")
            for i in range(0, len(computing["in_port"])):
                portstr = "\t" + DataHandling.abbrportname(
                    computing["in_port"][i]) + ":in " + "STD_LOGIC_VECTOR ( 31 downto 0 );"
                file.write(portstr)
                file.write('\n')
            for i in range(0, len(computing["out_port"])):
                portstr = "\t" + DataHandling.abbrportname(
                    computing["out_port"][i]) + ":out " + "STD_LOGIC_VECTOR ( 31 downto 0 );"
                file.write(portstr)
                file.write('\n')

            file.write(");\nend component;\n")
            ####signal
            for i in signals:
                portstr = "\tsignal " + DataHandling.abbrportname(i["name"])+i["type"]+";"

                file.write(portstr)
                file.write('\n')
            file.write("begin\n")
            ###端口连接
            ###controler
            ccabbr_port = [DataHandling.splitportname(i) for i in list(set(computing["in_port"]) | set(computing["out_port"]))]
            file.write(controler["name"] + "_process:" + controler["name"] + " port map(\n")
            file.write("clk=>clk,\nstart=>start,\ndone=>done,\nrst=>rst,\n")
            controlerlist=list(set(controler["in_port"]) | set(controler["out_port"]))
            for i in range(0, len(controlerlist)):
                if DataHandling.splitportname(controlerlist[i]) in ccabbr_port:
                    portstr = DataHandling.abbrportname(controlerlist[i]) + "=> " + DataHandling.abbrportname(
                        "m_" + DataHandling.splitportname(controlerlist[i]))
                else:
                    portstr = DataHandling.abbrportname(controlerlist[i]) + "=> " + DataHandling.abbrportname(controlerlist[i])
                if i != len(controlerlist) - 1:
                    portstr = portstr + ","
                file.write(portstr)
                file.write('\n')
            file.write(");\n")
            ###computer
            file.write(computing["name"]+ "_process:" + computing["name"] + " port map(\n")
            computinglist=list(set(computing["in_port"]) | set(computing["out_port"]))
            for i in range(0, len(computinglist)):
                portstr = DataHandling.abbrportname(computinglist[i]) + "=> " + DataHandling.abbrportname("m_" + DataHandling.splitportname(computinglist[i]))
                if i != len(computinglist) - 1:
                    portstr = portstr + ","
                file.write(portstr)
                file.write('\n')
            file.write(");\nend Behavioral;")
Generate_atomsystem_vhdl("Data/Extractionjson/insysdict_atomsys.json")
