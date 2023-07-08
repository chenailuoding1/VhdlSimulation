# 陈琪
# @Time : 2023/7/2 22:11
# @Author : chenqi
# @File : Oroperty
# @Project : VhdlSimulation
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
from . import  DataHandling
import io
from xml.dom import minidom
import sys
def portdetect():
    systemname=""
    with open('./Extractionjson/namedict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典
    namesdict = json.loads(data)
    # 原子系统存放路径
    systempath = "./AtomicSystemGeneration/SystemProject/"
    systemname=namesdict["name"]
    print(systemname)
    #获取原子系统存放路径下所有原子系统名称
    path=systempath+systemname+"/"+"component.xml"
    excessive_port_name=[]
    print(path)
    if os.path.exists(path):
        doc = minidom.parse(path)
        # print("ip_name:%s" % (ip_name.firstChild.data))
        ports = doc.getElementsByTagName("spirit:port")
        # print(ports)
        # 记录系统固定端口名称
        print(ports)
        for port in ports:
            name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
            # print(" name:%s, direction:%s" %
            #       (name.firstChild.data, direction.firstChild.data))
            print(DataHandling.systemportclean(str(name.firstChild.data)))
            if DataHandling.systemportclean(str(name.firstChild.data)) !="rst" and DataHandling.systemportclean(str(name.firstChild.data))!="clk" :
                excessive_port_name.append(str(name.firstChild.data))


    if len(excessive_port_name)>0:
        message="接口一致性验证失败！需求规约中多余的需求交互如下："
        portstr=""
        for portname in excessive_port_name:
            portstr+=portname
        message+=portstr
        data={
            "message":message
        }

    else:
        data = {
            "message": "接口一致性验证成功！"
        }
    return data
