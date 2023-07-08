# 陈琪
# @Time : 2023/4/10 23:59
# @Author : chenqi
# @File : DataExtraction
# @Project : VhdlSimulation
import os, shutil
import re
from collections import defaultdict
import json
import subprocess
from . import  DataHandling
def extractdomains(inputpath):
    filestr = ""
    with open(inputpath, 'r', encoding='utf-8') as infile:
        for line in infile:
            filestr = filestr + str(line).replace("\n", "").lstrip().rstrip()
    # Split the text into individual domain strings
    domains = filestr.split(";")

    # Create empty arrays for each domain
    causal_domain = []
    biddable_domain = []
    physical_lexical_domain = []
    logical_lexical_domain = []
    computer_components_domain = []
    # Loop through each domain and add the terms to the appropriate array
    for domain in domains:
        if "Causal Domain" in domain:
            causal_domain = domain.split("Causal Domain ")[1].split(",")
            causal_domain = DataHandling.cleanwhitelist(causal_domain)
        elif "Biddable Domain" in domain:
            biddable_domain = domain.split("Biddable Domain ")[1].split(",")
            biddable_domain = DataHandling.cleanwhitelist(biddable_domain)
        elif "Physical Lexical Domain" in domain:
            physical_lexical_domain = domain.split("Physical Lexical Domain ")[1].split(",")
            physical_lexical_domain = DataHandling.cleanwhitelist(physical_lexical_domain)
        elif "Logical Lexical Domain" in domain:
            logical_lexical_domain = domain.split("Logical Lexical Domain ")[1].split(",")
            logical_lexical_domain = DataHandling.cleanwhitelist(logical_lexical_domain)
        elif "Computer Components Domain" in domain:
            computer_components_domain = domain.split("Computer Components Domain ")[1].split(",")
            computer_components_domain = DataHandling.cleanwhitelist(computer_components_domain)

    # Print the results
    #     print("Causal Domain:", causal_domain)
    #     print("Biddable Domain:", biddable_domain)
    #     print("Physical Lexical Domain:", physical_lexical_domain)
    #     print("Logical Lexical Domain:", logical_lexical_domain)
    #     print("Computer Components Domain:", computer_components_domain)
    # print(computer_components_domain)
    resultdict = {}
    resultdict["Causal Domain"] = causal_domain
    resultdict["Biddable Domain"] = biddable_domain
    resultdict["Physical Lexical Domain"] = physical_lexical_domain
    resultdict["Logical Lexical Domain"] = logical_lexical_domain
    resultdict["Computer Components Domain"] = computer_components_domain
    return resultdict


def extractatomspecification(inputpath1, inputpath2):
    ##从总需求规约中提取出整个系统的Domain
    causal_domain = extractdomains(inputpath1).get("Causal Domain")
    biddable_domain = extractdomains(inputpath1).get("Biddable Domain")
    physical_lexical_domain = extractdomains(inputpath1).get("Physical Lexical Domain")
    logical_lexical_domain = extractdomains(inputpath1).get("Logical Lexical Domain")
    computer_components_domain = extractdomains(inputpath1).get("Computer Components Domain")
    print(computer_components_domain)
    print("Causal Domain:", causal_domain)
    print("Biddable Domain:", biddable_domain)
    print("Physical Lexical Domain:", physical_lexical_domain)
    print("Logical Lexical Domain:", logical_lexical_domain)
    print("Computer Components Domain:", computer_components_domain)
    abbrnamesdict = {}
    with open('./Extractionjson/abbrnamedict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典
    abbrnamesdict = json.loads(data)
    ##1.所有原子系统信息字典，包括记录原子系统目录结构，端口信息等
    insysdict_atomsys = {}
    insysdict_domain = {}
    outsysdict = {}
    ##物理设备端口字典
    biddable_domain_dict = {}
    for item in biddable_domain:
        biddable_domain_dict[item] = {"in_port": [], "out_port": []}
    ##物理设备端口字典
    causal_domain_dict = {}
    for item in causal_domain:
        causal_domain_dict[item] = {"in_port": [], "out_port": []}
    #     print(causal_domain_dict)
    ##物理数据存储端口字典
    physical_lexical_domain_dict = {}
    for item in physical_lexical_domain:
        physical_lexical_domain_dict[item] = {"in_port": [], "out_port": []}
    #     print(logical_lexical_domain_dict)
    ###
    for filename in os.listdir(inputpath2):
        filepath = os.path.join(inputpath2, filename)
        if os.path.isfile(filepath):
            ##单个原子系统信息字典，包括记录原子系统目录结构，端口信息等
            atomsysdict = {}
            ##原子系统需求规约文档，主要包含：1.原子系统名称，2.共享现象描述。从中提取信息。
            filestr = ""
            with open(filepath, 'r', encoding='utf-8') as infile:
                for line in infile:
                    filestr = filestr + str(line).replace("\n", "").lstrip().rstrip()
                    # 分割出原子系统名称以及每个共享现象描述放在列表中
            str1 = r"{|;|}"
            filestrsplit = re.split(str1, filestr)
            # 清理掉列表中的空元素以及每个元素中包含的\n
            filestrsplit = DataHandling.cleanlist(filestrsplit)
            print(filestrsplit)
            ##得到原子系统名称并根据简写字典，获得其简写
            abbrname = abbrnamesdict[filestrsplit[0]]
            #             print(abbrname)
            ##原子系统项目文件一般由1.控制器2.计算机组件3.顶层文件组成（2、3不是必须）
            # 控制器文件名称
            atomsc = ""
            # 计算机组件文件名称
            atomcc = ""
            # 是否有计算机组件
            hasccfalg = False
            initramlist=[]
            #             print(computer_components_domain)
            ###举例filestrsplit[0]为"GDA sends Pulse count acquisition instruction to G[instruction]",这即为一个共享现象的描述
            # 遍历该原子系统的共享现象描述，得到控制器文件名称以及确定是否有计算机组件
            for i in range(1, len(filestrsplit)):
                if filestrsplit[i][0]!='*':
                    phenomenonsplit = filestrsplit[i].split()
                    #                 print(phenomenonsplit)
                    ##得到controler文件名称GDA
                    atomsc = phenomenonsplit[0]
                    ##拆分出共享现象中的外设、计算机组件、数据存储名称
                    lastname = phenomenonsplit[-1].split("[")[0]
                    #                 print(lastname)
                    ##判断该原子系统中是否存在计算机组件
                    if lastname in computer_components_domain:
                        atomcc = lastname
                        hasccfalg = True
                        break
                else:
                    strsplit = filestrsplit[i].split(',')
                    dict={}
                    dict["ramname"]=strsplit[1]
                    dict["value"] =strsplit[2]
                    initramlist.append(dict)
            atomsysdict[atomsc] = {"type": "controler", "in_port": [], "out_port": []}
            if hasccfalg == True:
                atomsysdict[atomcc] = {"type": "computer", "in_port": [], "out_port": []}
                atomsysdict[abbrname] = {"type": "topfile", "in_port": [], "out_port": []}
            #原子系统控制器中的初始寄存器
            atomsysdict[atomsc]["initramlist"] = initramlist
            #             print(atomsysdict)
            # 统计状态机的状态数量stacount
            ###规则为：1.共享现象只有sends时才会定义一个状态；
            ###2.共享现象为采集指令stacount加一；
            ###3.共享现象为存储指令且接收者stacount加一；
            ###4.共享现象为读取指令且接收者为物理存储stacount加一；
            ###5.共享现象为输出数据且接收者为物理存储或外设stacount加一；
            ###6.若该原子系统有计算机组件stacount加一；
            stacount = 0
            ###状态机数组，记录每个状态要进行输出的端口信息
            stasprocess = []
            for i in range(1, len(filestrsplit)):
                if filestrsplit[i][0]!='*':
                ###举例filestrsplit[0]为"GDA sends Pulse count acquisition instruction to G[instruction]"
                ##要除去前后两端不需要的信息
                    phenomenonsplit = filestrsplit[i].split()
                    ##得到共享现象名称："Pulse count acquisition instruction"
                    phenomenonstr = " ".join(phenomenonsplit[2:-2])

                    if phenomenonsplit[1] == "sends":
                        ##得到共享现象发送者名称
                        sendername = phenomenonsplit[0]
                        ##得到共享现象接收者名称
                        receivername = phenomenonsplit[-1].split("[")[0]
                        if ("acquisition instruction" in phenomenonstr) or ("perception instruction" in phenomenonstr):
                            ##1.共享现象为采集指令
                            ##得到"Pulse count"
                            phenomenonstr2 = " ".join(phenomenonsplit[2:-4])

                            #                         print(phenomenonstr)
                            #                         print(phenomenonstr2)
                            #                         print(DataHandling.abbrportname(phenomenonstr))
                            atomsysdict[atomsc]["out_port"].append(
                                "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                            atomsysdict[atomsc]["in_port"].append(
                                "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)

                            causal_domain_dict[receivername]["in_port"].append(
                                "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                            causal_domain_dict[receivername]["out_port"].append(
                                "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)
                            ###情况2
                            stacount = stacount + 1
                            ###记录每个状态要进行输出的端口信息
                            stainform = {}
                            staport = []
                            staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                            stainform["port"] = staport
                            stainform["type"] = 0
                            stasprocess.append(stainform)
                        elif "storage instruction" in phenomenonstr:
                            ##2.共享现象为存储指令
                            stacount = stacount + 1
                            phenomenonstr2 = " ".join(phenomenonsplit[2:-4])
                            # 接收者为物理数据存储
                            if receivername in physical_lexical_domain:

                                atomsysdict[atomsc]["out_port"].append(
                                    "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                atomsysdict[atomsc]["out_port"].append(
                                    "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)
                                physical_lexical_domain_dict[receivername]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                physical_lexical_domain_dict[receivername]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)

                                ###记录每个状态要进行输出的端口信息
                                stainform = {}
                                staport = []
                                staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)
                                stainform["port"] = staport
                                stainform["type"] = 0
                                stasprocess.append(stainform)
                            else:  # 接收者为逻辑数据存储

                                atomsysdict[atomsc]["out_port"].append(
                                    "out" + "_" + receivername + "_" + receivername + "_" + phenomenonstr2)
                                ###记录每个状态要进行输出的端口信息
                                stainform = {}
                                staport = []
                                staport.append("out" + "_" + receivername + "_" + receivername + "_" + phenomenonstr2)
                                stainform["port"] = staport
                                stainform["type"] = 0
                                stasprocess.append(stainform)
                        elif "load instruction" in phenomenonstr:
                            ##3.共享现象为读取指令
                            phenomenonstr2 = " ".join(phenomenonsplit[2:-4])
                            # 接收者为物理数据存储
                            if receivername in physical_lexical_domain:
                                atomsysdict[atomsc]["out_port"].append(
                                    "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                atomsysdict[atomsc]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)
                                physical_lexical_domain_dict[receivername]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                physical_lexical_domain_dict[receivername]["out_port"].append(
                                    "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr2)
                                ###情况4
                                stacount = stacount + 1
                                ###记录每个状态要进行输出的端口信息
                                stainform = {}
                                staport = []
                                staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                stainform["port"] = staport
                                stainform["type"] = 0
                                stasprocess.append(stainform)
                            # 接收者为逻辑数据存储
                            else:
                                atomsysdict[atomsc]["in_port"].append(
                                    "in" + "_" + receivername + "_" + receivername + "_" + phenomenonstr2)
                        else:
                            ##4.共享现象为数据输出
                            atomsysdict[atomsc]["out_port"].append(
                                "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                            if receivername in causal_domain:

                                causal_domain_dict[receivername]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                ###情况5
                                stacount = stacount + 1
                                ###记录每个状态要进行输出的端口信息
                                stainform = {}
                                staport = []
                                staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                stainform["port"] = staport
                                stainform["type"] = 0
                                stasprocess.append(stainform)
                            elif receivername in biddable_domain:

                                biddable_domain_dict[receivername]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                ###情况5
                                stacount = stacount + 1
                                ###记录每个状态要进行输出的端口信息
                                stainform = {}
                                staport = []
                                staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                stainform["port"] = staport
                                stainform["type"] = 0
                                stasprocess.append(stainform)
                            elif receivername in computer_components_domain:
                                atomsysdict[atomcc]["in_port"].append(
                                    "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                falg = False
                                for i in range(0, len(stasprocess)):
                                    if stasprocess[i].get("type") == 1:
                                        falg = True
                                        stasprocess[i]["port"].append(
                                            "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                if falg == False:
                                    ###记录每个状态要进行输出的端口信息
                                    stainform = {}
                                    staport = []
                                    staport.append("out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                                    staport.append("out_calculate instruction")
                                    stainform["port"] = staport
                                    stainform["type"] = 1
                                    stasprocess.append(stainform)

                    else:
                        ##得到共享现象接收者名称
                        receivername = phenomenonsplit[0]
                        ##得到共享现象发送者名称
                        sendername = phenomenonsplit[-1].split("[")[0]
                        #                     print(atomcc)
                        atomsysdict[atomsc]["in_port"].append(
                            "in" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                        if sendername in biddable_domain:
                            biddable_domain_dict[sendername]["out_port"].append(
                                "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)
                        else:
                            atomsysdict[atomcc]["out_port"].append(
                                "out" + "_" + sendername + "_" + receivername + "_" + phenomenonstr)

            if hasccfalg == True:
                atomsysdict[atomsc]["out_port"].append("out_calculate instruction")
                atomsysdict[atomcc]["in_port"].append("in_calculate instruction")
                sc_out = [DataHandling.splitportname(i) for i in atomsysdict[atomsc]["out_port"]]
                cc_out = [DataHandling.splitportname(i) for i in atomsysdict[atomcc]["out_port"]]
                sc_in = [DataHandling.splitportname(i) for i in atomsysdict[atomsc]["in_port"]]
                cc_in = [DataHandling.splitportname(i) for i in atomsysdict[atomcc]["in_port"]]
                #                 print(sc_out)
                #                 print(cc_out)

                outdiff = [("out_" + i) for i in list(set(sc_out) - set(cc_in))]

                indiff = [("in_" + i) for i in list(set(sc_in) - set(cc_out))]
                atomsysdict[abbrname]["out_port"] = outdiff.copy()
                atomsysdict[abbrname]["in_port"] = indiff.copy()
                ###情况6
                stacount = stacount + 1
            #             print("atomsysdict")
            #             print(atomsysdict)
            atomsysdict[atomsc]["stacount"] = stacount
            atomsysdict[atomsc]["stasprocess"] = stasprocess
            insysdict_atomsys[abbrname] = atomsysdict
    #     print(insysdict_atomsys)
    #     print(causal_domain_dict)
    #     print(biddable_domain_dict)
    #     print(physical_lexical_domain_dict)
    # 将原子系统简写名称字典转换为JSON格式的字符串
    json_insysdict_atomsys = json.dumps(insysdict_atomsys)
    json_causal_domain_dict = json.dumps(causal_domain_dict)
    json_biddable_domain_dict = json.dumps(biddable_domain_dict)
    json_physical_lexical_domain_dict = json.dumps(physical_lexical_domain_dict)
    # 将JSON格式的字符串写入文件
    with open("./Extractionjson/insysdict_atomsys.json", "w") as f:
        f.write(json_insysdict_atomsys)
    with open("./Extractionjson/causal_domain_dict.json", "w") as f:
        f.write(json_causal_domain_dict)
    with open("./Extractionjson/biddable_domain_dict.json", "w") as f:
        f.write(json_biddable_domain_dict)
    with open("./Extractionjson/physical_lexical_domain_dict.json", "w") as f:
        f.write(json_physical_lexical_domain_dict)
# print(DataHandling.splitportname("out_GDAC_Angu_velo_anal"))
# print(extractdomains("../Domain/domain.txt"))
# print(extractatomspecification("../Domain/domain.txt","../AtomSpecification"))