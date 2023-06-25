# 陈琪
# @Time : 2023/4/11 21:31
# @Author : chenqi
# @File : AbbrName
# @Project : VhdlSimulation
import os
import re
from collections import defaultdict
import json
from . import SystemTree
def abbrsystemname():
    treedict = {}
    with open("./Extractionjson/systemtreedict.json", 'r') as f:
        data = f.read()
        # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    treedict = json.loads(data)
    tree = SystemTree.TreeNode.build_tree(treedict)
    # print("tree:")
    abbrnamedict=SystemTree.TreeNode.abbrname_tree(tree)
    print(abbrnamedict)
    json_str = json.dumps(abbrnamedict)

    # 将JSON格式的字符串写入文件
    with open("./Extractionjson/abbrnamedict.json", "w") as f:
        f.write(json_str)