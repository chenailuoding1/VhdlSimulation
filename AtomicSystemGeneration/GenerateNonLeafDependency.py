# 用于确定while循环所包含的内容，输入是一串字符
import os
import re
import shutil
from collections import defaultdict
import json
from . import DataHandling

import os
import re
from collections import defaultdict
import json
from . import SystemTree
def GenerateNonLeafvhdl():
    treedict = {}

    with open("./Extractionjson/systemtreedict.json", 'r') as f:
        data = f.read()
        # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    treedict = json.loads(data)
    tree = SystemTree.TreeNode.build_tree(treedict)
    # print("tree:")
    SystemTree.TreeNode.noleafnode(tree,treedict)

def NonLeafDependencyvhdl(subname, subsum):
    with open('./Extractionjson/abbrnamedict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典

    abbrnamesdict = json.loads(data)
    outputpath = './AtomicSystemGeneration/DependencyVhdl/' + abbrnamesdict.get(subname) + 'Dependency.vhdl'
    with open(outputpath, 'w', encoding='utf-8') as file:
        with open("./AtomicSystemGeneration/Template/systemroottemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            entitystr = "entity " + abbrnamesdict.get(subname) + "Dependency is"
            file.write(entitystr)
            file.write('\n')
            file.write("port(")
            file.write('\n')
            for i in range(0, subsum):
                portstart = "start" + str(i) + ":out std_logic;"
                portdone = "done" + str(i) + ":in std_logic;"
                file.write(portstart)
                file.write('\n')
                file.write(portdone)
                file.write('\n')
            file.write("start:in std_logic;")
            file.write('\n')
            file.write("done:out std_logic;")
            file.write('\n')

        with open("./AtomicSystemGeneration/Template/systemroottemplate/part2.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            endstr = "end " + abbrnamesdict.get(subname) + "Dependency;"
            file.write(endstr)
            file.write('\n')
            Behavioralstr = "architecture Behavioral of " + abbrnamesdict.get(subname) + "Dependency is"
            file.write(Behavioralstr)
            file.write('\n')

            statestr = "Type states is ("
            for i in range(0, subsum):
                if i == subsum - 1:
                    statestr = statestr + "st" + str(i)
                else:
                    statestr = statestr + "st" + str(i) + ","
            statestr = statestr + ") ;"
            file.write(statestr)
            file.write('\n')
        with open("./AtomicSystemGeneration/Template/systemroottemplate/part3.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            processstr = "sta_pro:process(current_sta,start,"
            for i in range(0, subsum):
                if i == subsum - 1:
                    processstr = processstr + "done" + str(i)
                else:
                    processstr = processstr + "done" + str(i) + ","
            processstr = processstr + ") is"
            file.write(processstr)
            file.write('\n')

        with open("./AtomicSystemGeneration/Template/systemroottemplate/part4.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            processstr = ""

            ##
            file.write("when st0=> ")
            file.write('\n')
            file.write("done<='0';")
            file.write('\n')
            file.write("if start='0' then")
            file.write('\n')
            for j in range(0, subsum):
                file.write("start" + str(j) + "<='0';")
                file.write('\n')
            file.write("elsif start='1' then")
            file.write('\n')
            file.write("start0<='1';")
            file.write('\n')
            for j in range(1, subsum):
                file.write("start" + str(j) + "<='0';")
                file.write('\n')
            file.write("if done0='1' then ")
            file.write('\n')
            file.write("\t" + "next_sta<=st1;")

            file.write('\n')
            file.write("else")
            file.write('\n')
            file.write("\t" + "next_sta<=st0;")
            file.write('\n')
            file.write("end if;")
            file.write('\n')
            file.write("end if;")
            file.write('\n')
            ##

            for i in range(1, subsum):
                file.write("when st" + str(i) + "=> ")
                file.write('\n')
                for j in range(0, subsum):
                    if j == i:
                        file.write("start" + str(j) + "<='1';")
                        file.write('\n')
                    else:
                        file.write("start" + str(j) + "<='0';")
                        file.write('\n')

                file.write("if done" + str(i) + "='1' then ")
                file.write('\n')
                if i == subsum - 1:
                    file.write("\t" + "next_sta<=st0;")
                    file.write("\t" + "done<='1';")
                else:
                    file.write("\t" + "next_sta<=st" + str(i + 1) + ";")

                file.write('\n')
                file.write("else")
                file.write('\n')
                file.write("\t" + "next_sta<=st" + str(i) + ";")
                file.write('\n')
                file.write("end if;")
                file.write('\n')
        with open("./AtomicSystemGeneration/Template/systemroottemplate/part5.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')