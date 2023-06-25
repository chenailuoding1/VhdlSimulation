# 用于确定while循环所包含的内容，输入是一串字符
import os
import re
from collections import defaultdict
import json
from . import DataHandling
class Stack:
    def __init__(self):
        self.lista = []  # 创建空栈

    def isEmpty(self):
        return len(self.lista) == 0

    def push(self, item):
        self.lista.append(item)

    def pop(self):
        if self.isEmpty():
            return "Error：The stack is empty"
        else:
            return self.lista.pop()
def located(inputstring):  # 输入是一串字符
    bktStack = Stack()  # 创建类实例
    leftbkt = "{"
    rightbkt = "}"
    kuostr = {0: '{'}

    bktStack.push(kuostr)
    # 对于每个输入字符
    for i in range(1, len(inputstring)):
        # 遇到左括号，就将其压栈
        if inputstring[i] == leftbkt:
            bktStack.push({i: '{'})
        # 遇到右括号
        elif inputstring[i] == rightbkt:
            # 弹栈bktStack.pop()，判断弹出的是第一个左括号则确定该字符串中与之匹配的右括号的位置
            test = list(bktStack.pop().keys())

            print(test[0])
            if test[0] == 0:
                return inputstring[1:i]


# 用于清洗需求规约文档中的空白行
def clean_txt(inputpath, outputpath):
    with open(outputpath, 'w', encoding='utf-8') as file:
        with open(inputpath, 'r', encoding='utf-8') as infile:
            for line in infile:
                if line == '\n':
                    line = line.strip('\n')
                file.write(line)


# 读取原子系统需求规约获得所有原子系统名称
def read_atom_txt(inputpath, Atom_system_name):
    with open(inputpath, 'r', encoding='utf-8') as infile:
        for line in infile:
            data_line = line.strip("\n").split('{')  # 去除首尾换行符，并按'{'划分
            # print(data_line)
            Atom_system_name.append(data_line[0])


# 确定该字符串中有多少个分号;
def searchfen(inputstr):
    Master_system_sum = 0
    for i in range(0, len(inputstr)):
        if ';' == inputstr[i]:
            Master_system_sum = Master_system_sum + 1
    return Master_system_sum


# 确定主控制器所连接的分系统和原子系统总数
def rootdependency_sum(inputpath):
    system_sum = 0
    strmaster = ""
    with open(inputpath, 'r', encoding='utf-8') as infile:
        for line in infile:
            strmaster = strmaster + str(line)
        system_sum = searchfen(strmaster)

        # print(Master_system_sum)
    return system_sum

# def Identify_structure(inputpath):
#     linelist=[]
#     with open(inputpath, 'r', encoding='utf-8') as infile:
#         for line in infile:
#             linelist.append(str(line))
#     for i in range(0,len(linelist)):
#         if re.search(r"while[(]\w*[)]", strmaster):

def read_master_time(inputpath):
    with open(inputpath, 'r', encoding='utf-8') as infile:
        strmaster = ""
        for line in infile:
            strmaster = strmaster + str(line)
    if DataHandling.matching(strmaster) == False:
        print("需求规约文档括号不规范请修改后再尝试")
        return
    str1 = r"while[(]\w*[)]"
    str2 = r"always@[(]\w*[)]"
    wbeforesum = -1
    wsyssum = 0
    abeforesum = []

    # 确定while循环的起始点
    if re.search(str1, strmaster) is not None:  # 需求规约中存在while定义的时间约束
        wbeforesum = 0
        whilesplit = re.split(str1, strmaster)
        print(whilesplit)
        wbeforesum = searchfen(whilesplit[0]) + 1  # 表明while循环的初始位置
        print("wbeforesum" + str(wbeforesum))
        wsyssum = searchfen(located(whilesplit[1])) + wbeforesum - 1  # 表明while循环的末端位置
        print("wsyssum" + str(wsyssum))
    # 确定always的起始点
    if re.search(str2, strmaster) is not None:  # 需求规约中存在always定义的时间约束
        alwayssplit = re.split(str2, strmaster)
        # print(alwayssplit)
        # print("alwayssplitlen")
        # print(len(alwayssplit))
        alwaysstr = ""
        for i in range(0, len(alwayssplit) - 1):
            alwaysstr = alwaysstr + alwayssplit[i]
            abeforesum.append(searchfen(alwaysstr) + 1)
            # 因为always关键字可能有多个，所以abeforesum是一个数组
        print(abeforesum)
    redict = {}
    redict["wbeforesum"] = wbeforesum
    redict["wsyssum"] = wsyssum
    redict["abeforesum"] = abeforesum
    return redict
    # print(strmaster)

# def read_dependency(inputpath):
#     linelist = []
#     with open(inputpath, 'r', encoding='utf-8') as infile:
#         for line in infile:
#             linelist.append(str(line))
#     whilestr = r"while[(]\w*[)]"
#     ifstr = r"if[(]\w*[)]"
#     afterstr = r"after[(]\w*[)]"
#     atstr = r"at[(]\w*[)]"
#     for i in range(0, len(linelist)):
#         if re.search(whilestr, linelist[i]):


def Generaterootvhdl(subname,subsum):
    with open('./Extractionjson/abbrnamedict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典

    abbrnamesdict = json.loads(data)
    outputpath = './AtomicSystemGeneration/DependencyVhdl/' + abbrnamesdict.get(subname) + 'Dependency.vhdl'

    input_path = './DependencySpecification/RootDependency_temp.txt'
    # Master_system_sum = rootdependency_sum(input_path)
    Master_system_sum = subsum
    with open(outputpath, 'a', encoding='utf-8') as file:
        with open("./AtomicSystemGeneration/Template/systemroottemplate/part1.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file.writelines(line)
                file.write('\n')
            entitystr = "entity " + abbrnamesdict.get(subname) + "Dependency is"
            file.write(entitystr)
            file.write('\n')
            file.write("port(")
            file.write('\n')
            for i in range(0, Master_system_sum):
                portstart = "start" + str(i) + ":out std_logic;"
                portdone = "done" + str(i) + ":in std_logic;"
                file.write(portstart)
                file.write(portdone)
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
            for i in range(0, Master_system_sum):
                if i == Master_system_sum - 1:
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
            processstr = "sta_pro:process(current_sta,"
            for i in range(0, Master_system_sum):
                if i == Master_system_sum - 1:
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
            redict = {}
            redict = read_master_time(input_path)
            wbeforesum = redict["wbeforesum"]
            wsyssum = redict["wsyssum"]
            abeforesum = redict["abeforesum"]
            print(wbeforesum)
            print(wsyssum)
            for i in range(0, Master_system_sum):
                file.write("when st" + str(i) + "=> ")
                file.write('\n')
                for j in range(0, Master_system_sum):
                    if j == i:
                        file.write("start" + str(j) + "<='1';")
                        file.write('\n')
                    else:
                        file.write("start" + str(j) + "<='0';")
                        file.write('\n')
                # 判断该点是不是always标识的点
                falg = False
                for m in abeforesum:
                    if m - 2 == i:
                        falg = True

                if i == wsyssum - 1 or falg == True:
                    file.write("if (填入具体实现) then ")
                else:
                    file.write("if done" + str(i) + "='1' then ")
                file.write('\n')
                if i == wsyssum - 1:
                    file.write("\t" + "next_sta<=st" + str(wbeforesum - 1) + ";")
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