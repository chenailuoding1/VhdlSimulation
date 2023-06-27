import os, shutil
import re
from collections import defaultdict
import json
import subprocess
#最终设计的共享现象（Angular velocity analog）映射到vhdl端口名称（out_GDAC_Angu_velo_anal），由三部分组成
###1.共享现象方向：输入(in)、输出(out)
###2.共享现象接收方或输出方：GDAC
###3.共享现象：Angu_velo_anal
def abbrportname(inputstring):#输入是一串字符,将out_GDACC Angular velocity analog转换成out_GDAC_Angu_velo_anal
    str1=r"_| " 
    strsplit=re.split(str1,inputstring)
    newlist=[]+strsplit[0:1]
    for i in strsplit[1:]:
        newlist.append("".join(i[0:4]))
    return "_".join(newlist)
def splitportname(inputstring):#输入是经过简写的端口名称（out_GDAC_Angu_velo_anal），除去前面的共享现象方向（in或者out）
    newlist=[]
    for i in re.split("_",inputstring):
        if i!="in" and i!="out":
            newlist.append(i) 
    return "_".join(newlist)
def renewname(inputstring):#输入是经过简写的端口名称（out_GDAC_Angu_velo_anal）除去前面的共享现象方向（in或者out）以及共享现象接收方或输出方（GDAC）
    strsplit=re.split("_",inputstring)
    newlist=strsplit[3:]
    if len(newlist)>1:
        return "_".join(newlist)
    else:
        return newlist
def connectport(inputstring):#输入是经过IP封装后的端口名称（out_GDAC_Angu_velo_anal）除去前面的共享现象方向（in或者out）以及共享现象接收方或输出方（GDAC）
    strsplit=re.split("_",inputstring)
    newlist =[]
    for stri in strsplit:
        if stri!="0" and stri!="in" and stri!="out":
            newlist.append(stri)
    return "_".join(newlist)
def systemportclean(inputstring):#主要是为了清理固定端口的后缀rst strat done clk
    strsplit=re.split("_",inputstring)
    newlist =[]
    for stri in strsplit:
        if stri!="0":
            newlist.append(stri)
    return "".join(newlist)
def cleanlist(oldlist:list):#除去列表中的空个字符串元素，以及清理每个元素中的\n
    newlist=[]
    pattern = r'[^\[\]a-zA-Z0-9]'
    for i in range(0,len(oldlist)):
        if oldlist[i]!='' and (re.search(pattern,oldlist[i]) is not None) :
            newlist.append(oldlist[i].replace("\n", "").lstrip().rstrip())
    return newlist
def cleanwhitelist(oldlist:list):#除去列表中的空个字符串元素，以及清理每个元素中的\n
    newlist=[]
    for i in range(0,len(oldlist)):
        if oldlist[i]!='':
            newlist.append(oldlist[i].replace("\n", "").lstrip().rstrip())
    return newlist


def check_vhdl_entity_name(entityname, max_length=1024):
    # 检查第一个字符是否是字母或下划线，如果不是，则添加下划线作为第一个字符
    name=""
    for i in range(0,len(entityname)):
        if entityname[i].isalpha():
            name=entityname[i:]
            break;

    # 检查每个字符是否是字母、数字或下划线，如果不是，则用下划线替换
    for i in range(len(name)):
        if not name[i].isalnum() and name[i] != '_':
            name = name[:i] + '_' + name[i + 1:]

    # 检查字符串长度是否超过最大长度，如果是，则截断为最大长度
    if len(name) > max_length:
        name = name[:max_length]

    # 返回修改后的字符串
    return name
def escape_quotes(string):
    # 检查字符串中是否有双引号
    if '"' in string:
        # 在双引号前加上反斜杠
        string = string.replace('"', '\\"')
    return string


def IsAccessIns(portname):
    if ("calculate instruction" in portname) or ("load instruction" in portname) or (
            "storage instruction" in portname) or ("acquisition instruction" in portname) or (
            "perception instruction" in portname)or("clk"==portname)or("rst"==portname)or("start"==portname)or("done"==portname):
        return True
    else:
        return False


def generate_codes(n):
    """
    生成长度为 n 的二进制数列，返回一个包含所有可能的 n 位编码的列表。
    """
    codes = []
    for i in range(2 ** n):
        binary = bin(i)[2:].zfill(n)
        codes.append(binary)
    return codes


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
# 用于检查需求规约文本是否符合规范，主要检查括号是否匹配完整，输入是一串字符
def matching(inputstring):  # 输入是一串字符
    bktStack = Stack()  # 创建类实例
    leftbkt = "{[("
    rightbkt = "}])"
    # 对于每个输入字符
    for i in inputstring:
        # 遇到左括号，就将其压栈
        if i in leftbkt:
            bktStack.push(i)
        # 遇到右括号
        elif i in rightbkt:
            # 若已没左括号与之匹配
            if bktStack.isEmpty():
                # 不匹配，结束
                return False
            # 左括号按什么顺序入，右括号应按相反顺序消掉。
            # 如果匹配，右括号消的始终是栈顶括号。
            # 弹栈bktStack.pop()，判断栈顶左括号与当前右括号是否匹配
            if rightbkt.index(i) != leftbkt.index(bktStack.pop()):
                # 不匹配，结束
                return False
    # 若一直没有return而是遍历了一遍，且没有多余左括号留在栈中，则说明匹配。反之不匹配。
    return bktStack.isEmpty()



# 用于清洗需求规约文档中的空白行
def clean_txt(inputpath, outputpath):
    with open(outputpath, 'w', encoding='utf-8') as file:
        with open(inputpath, 'r', encoding='utf-8') as infile:
            for line in infile:
                if line == '\n':
                    line = line.strip('\n')
                file.write(line)

#用于检查需求规约文本是否符合规范，主要检查括号是否匹配完整，输入是一串字符
def matching(inputstring):#输入是一串字符
    bktStack = Stack()#创建类实例
    leftbkt = "{[("
    rightbkt = "}])"
    #对于每个输入字符
    for i in inputstring:
        #遇到左括号，就将其压栈
        if i in leftbkt:
            bktStack.push(i)
        #遇到右括号
        elif i in rightbkt:
            #若已没左括号与之匹配
            if bktStack.isEmpty():
                #不匹配，结束
                return False
            #左括号按什么顺序入，右括号应按相反顺序消掉。
            #如果匹配，右括号消的始终是栈顶括号。
            #弹栈bktStack.pop()，判断栈顶左括号与当前右括号是否匹配
            if rightbkt.index(i) !=  leftbkt.index(bktStack.pop()):
                #不匹配，结束
                return False
    #若一直没有return而是遍历了一遍，且没有多余左括号留在栈中，则说明匹配。反之不匹配。
    return bktStack.isEmpty()
