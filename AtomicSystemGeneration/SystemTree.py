#用于获取名称简写
import os
import re
from collections import defaultdict
import json

from AtomicSystemGeneration import GenerateRootDependency

from .import GenerateNonLeafDependency
from .import Assemble
# abbrnamedict={}
# count=0
def cleanwhite(inputstring):#输入是一串字符
    strstring=""
    for i in re.split(" ",inputstring):
        if i[0].isalpha():
            strstring=strstring+i[0]
    return strstring
class TreeNode(object):
    assemblemessage=""
    def __init__(self, val=None) -> None:
        self.val = val
        self.childs = []


    def add_childs(self, child: "TreeNode"):
        self.childs.append(child)

    def __repr__(self) -> str:
        return str(self.val)

    @classmethod
    def build_tree(cls, input_dict: dict):
        """根据需求规约字典构建系统结构树"""

        # 深度优先遍历构造多叉树结构
        def dfs(node, input_dict):
            if node.val in input_dict:  # 当前节点还有子节点时，继续对每个child向下构造
                for val in input_dict[node.val]:
                    cur_node = TreeNode(val)
                    print(cur_node.val)
                    dfs(cur_node, input_dict)

                    node.add_childs(cur_node)
            else:  # 当前节点没有子节点，直接返回
                return

        # 获取字典的第一个key，并以此为根节点构造多叉树
        root = TreeNode(list(input_dict.keys())[0])
        dfs(root, input_dict)

        return root

    @classmethod
    def print_tree(cls, root: "TreeNode"):
        """按照字典输入形式打印输出"""
        if root:
            if root.childs:
                print(root.val, ": ", end="")
                print('[%s]' % (' '.join([str(_.val) for _ in root.childs])))
                for node in root.childs:
                    cls.print_tree(node)
            else:
                print(root.val, ": []")

    # @classmethod
    # def abbrname_tree(cls, root: "TreeNode"):
    #
    #     """简写系统中各个结点的名称"""
    #     global count
    #     global abbrnamedict
    #     if root:
    #         if root.childs:
    #             dictstr = cleanwhite(root.val) + str(count)
    #             print(dictstr)
    #             abbrnamedict[root.val] = dictstr
    #             count = count + 1
    #             for node in root.childs:
    #                 cls.abbrname_tree(node)
    #         else:
    #             dictstr = cleanwhite(root.val) + str(count)
    #             print(dictstr)
    #             abbrnamedict[root.val] = dictstr
    #             count = count + 1

    @classmethod
    def abbrname_tree(cls, root: "TreeNode"):
        """简写系统中各个结点的名称"""
        abbrnamedict={}

        def abbr(root):
            if root:
                if root.childs:
                    dictstr = cleanwhite(root.val)
                    abbrnamedict[root.val] = dictstr

                    # print("abbrnamedict")
                    for node in root.childs:
                        abbr(node)
                else:
                    dictstr = cleanwhite(root.val)
                    # print(dictstr)
                    abbrnamedict[root.val] = dictstr
        # print(abbrnamedict)

        abbr(root)
        count=0
        for key,value in abbrnamedict.items():
            abbrnamedict[key]=value+str(count)
            count=count+1
        return abbrnamedict



    @classmethod
    def post_tree(cls, root: "TreeNode",treelist:list):
        """后根遍历，自底向上组装系统，编写tcl脚本"""
        if root:
            if root.childs:
                for node in root.childs:
                    cls.post_tree(node,treelist)
                # print("非叶子结点："+root.val)
                # print('它的孩子[%s]' % (' '.join([str(_.val) for _ in root.childs])))
                systeam = []
                systeam.append(root.val)
                for child in root.childs:
                    systeam.append(str(child.val))
                if root.val==treelist[0]:
                    # print(root.val)
                    #将系统内的分系统、原子系统、数据存储相互连接起来
                    message1=Assemble.ConnectSystem(systeam)
                    # 将系统与外部设备相互连接起来
                    message2=Assemble.Connectshebei(systeam)
                    cls.assemblemessage=message1+","+message2
                    print(cls.assemblemessage+"assemblemessage")
                else:
                    ##将有依赖的原子系统组装成分系统
                    Assemble.Assemble_tcl(systeam)


    @classmethod
    def noleafnode(cls, root: "TreeNode", input_dict: dict):
        """非根非叶子结点即为系统中的分系统，构建分控制器"""
        if root:

            if root.childs:
                childslist = [str(_.val) for _ in root.childs]
                # print(childslist)
                if root.val != list(input_dict.keys())[0]:
                    GenerateNonLeafDependency.NonLeafDependencyvhdl(root.val, len(childslist))
                else:
                    GenerateRootDependency.Generaterootvhdl(root.val, len(childslist))
                for node in root.childs:
                    cls.noleafnode(node, input_dict)

    @classmethod
    def print_tree_graph(cls, root: "TreeNode"):
        """按照树的层级打印输出"""
        node_with_level = defaultdict(list)
        node_with_level[0].append([root])
        cur_level = 0

        while node_with_level:
            # 打印当前层节点
            cur_nodes_lists = node_with_level.pop(cur_level)
            for nodes_list in cur_nodes_lists:
                print(nodes_list, end=" ")

                for node in nodes_list:  # 如果还有子节点，将其添加到下一层
                    if node.childs:
                        node_with_level[cur_level + 1].append(node.childs)
                    else:  # 没有子节点的话，使用[]占位
                        node_with_level[cur_level + 1].append([])
            cur_level += 1
            print()


def creattree(masterinputpath, subinputpath):
    ####主要思想读取需求规约
    systemtreedict = {}
    strmaster = ""
    ###将主控需求规约中所包含的原子系统或分系统的
    with open(masterinputpath, 'r', encoding='utf-8') as infile:

        for line in infile:
            strmaster = strmaster + str(line)
    str1 = r"{|;"
    whilesplit = re.split(str1, strmaster)
    print(whilesplit)
    name = []
    for i in range(0, len(whilesplit)):
        if '(' not in whilesplit[i] or ')' not in whilesplit[i]:
            name.append(whilesplit[i].replace("\n", "").lstrip().rstrip())
    print(name)
    nameclean = []
    for i in name:
        strmid = i.strip('}').strip('{').lstrip().rstrip()
        if strmid != " " and strmid != "\n" and len(strmid) != 0:
            nameclean.append(strmid)
    print(nameclean)

    systemtreedict[nameclean[0]] = nameclean[1:]

    strsub = ""
    with open(subinputpath, 'r', encoding='utf-8') as infile:
        for line in infile:
            subsplit = re.split(str1, str(line))
            # print(subsplit)
            nameclean = []
            for i in subsplit:
                # print(i.strip('}'))
                strmid = i.strip('}').strip('{').lstrip().rstrip()
                # strmid=strmid.strip()
                # print("sad:"+strmid.strip())
                # print(len(strmid))
                if strmid != " " and strmid != "\n" and strmid != "":
                    nameclean.append(strmid)
            print(nameclean)
            systemtreedict[nameclean[0]] = nameclean[1:]
    # print(systemtreedict)
    # 将原子系统简写名称字典转换为JSON格式的字符串
    json_str = json.dumps(systemtreedict)

    # 将JSON格式的字符串写入文件
    with open("./Extractionjson/systemtreedict.json", "w") as f:
        f.write(json_str)
    # tree = TreeNode.build_tree(treedict)
    # print("tree:")
    # TreeNode.abbrname_tree(tree)
    # #     TreeNode.print_tree(tree)
    # TreeNode.post_tree(tree)
    #
    # TreeNode.noleafnode(tree, treedict)
    # TreeNode.print_tree_graph(tree)
    # # 将原子系统简写名称字典转换为JSON格式的字符串
    # json_str = json.dumps(abbrnamedict)
    #
    # # 将JSON格式的字符串写入文件
    # with open("../Extractionjson/abbrnamedict.json", "w") as f:
    #     f.write(json_str)