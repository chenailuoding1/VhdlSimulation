# 陈琪
# @Time : 2023/6/27 15:40
# @Author : chenqi
# @File : atomtest
# @Project : VhdlSimulation
from . import  DataHandling
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
def compelte_tb_vhdl(dirname, testdata):
    inputpath="./Extractionjson/insysdict_atomsys.json"
    with open(inputpath, 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    insysdict_atomsys = json.loads(data)
    stasprocess=[]
    stacount=0
    for file in insysdict_atomsys.get(dirname):
        if insysdict_atomsys.get(dirname)[file]["type"]=="controler":
            filedict=insysdict_atomsys.get(dirname)[file]
            stacount = filedict["stacount"]
            stasprocess = filedict["stasprocess"]
    print(stacount)
    print(stasprocess )
    filepath = "./AtomicSystemGeneration/AtomSystemTest/"+ dirname + "/" + "tb_test.vhdl"
    with open(filepath, 'a', encoding='utf-8') as file:
        ####1.生成实体部分entity   --测试平台文件的空实体（不需要端口定义)
        file.write("stimulus_process : process\nbegin\n")
        # print(testdata[0]["input"][0])
        for data in testdata:
            for port in data["input"]:
                portstr =""
                # print(port)
                if  DataHandling.IsAccessIns(port["name"]):
                    portstr = "t_" + port["name"] + "<=" + "'" + port["value"] + "'" + ";\n"

                else:
                    portstr="t_"+DataHandling.abbrportname(port["name"])+"<="+"std_logic_vector(to_signed("+str(port["value"])+", 32))"+";\n"
                # print(portstr)
                file.write(portstr)
            waittime=0
            for port in data["output"]:
                portstr = ""
                print(port)
                if port["name"] !="done":
                    posi=0
                    for i in range(0,len(stasprocess)):
                        if stasprocess[i]["port"][0]==port["name"]:
                            posi=i
                    waitstr= "wait for "+str(posi+1-waittime+1)+"* PERIOD;\n";
                    waittime=posi+1
                    if DataHandling.IsAccessIns(port["name"]):
                        portstr = "assert t_" + DataHandling.abbrportname(port["name"]) + "=" + "'" + port[
                            "value"] + "'" + " report \"Test case " + DataHandling.abbrportname(
                            port["name"]) + "  failed\" severity error;\n"

                    else:
                        portstr = "assert t_" + DataHandling.abbrportname(
                            port[
                                "name"]) + "=" + "std_logic_vector(to_signed(" + str(port["value"])+", 32))"+ " report \"Test case " + DataHandling.abbrportname(
                            port["name"]) + "  failed\" severity error;\n"
                print(portstr)
                file.write(waitstr)
                file.write(portstr)
            file.write( "wait for 10* PERIOD;\n")
            file.write("t_start<='0';\n")
            file.write("wait for 1* PERIOD;\n")
            file.write("t_start<='1';\n")

        file.write("wait;\nend process;\nend architecture;")
