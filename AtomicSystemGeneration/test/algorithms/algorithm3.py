import os
import re

from AtomicSystemGeneration.test.algorithms.AtomicCommponetBean import AtomicCommponet
from AtomicSystemGeneration.test.algorithms.ComControllerBean import ComController
from AtomicSystemGeneration.test.algorithms.DeviceBean import Device
from AtomicSystemGeneration.test.algorithms.StorageBean import Storage
from AtomicSystemGeneration.test.algorithms.Function import *
from AtomicSystemGeneration.test.algorithms.Mapping_construct import *
# from . import Mapping_constructim






# 创建解析器实例
Commponets={}#组件字典（组合控制组件，原子组件,设备，数据储存）,用作当索引
Devices=[]
DataStorages=[]
ComControllers=[]
atomicCommponets= {}#原子组件原称和简写对应字典
# Storages=[]#数据储存组件
# Device=[]#设备组件
rootdir="AtomicSystemGeneration/test/Data/Specifiction_files/AtomicProblem/"
Connects=[]
NameHash=[]
dependencyconnects=[]#依赖树
comcontroller_path="AtomicSystemGeneration/test/Data/Specifiction_files/Dependency/"

declarationpath="AtomicSystemGeneration/test/data/Specifiction_files/Declaration"
def Device_StorageCreate():
    for filepath in os.listdir(declarationpath):
        path=os.path.join(declarationpath,filepath)

        currentkey=""
        with open(path,'r') as file:
            lines=file.readlines()
            for line in lines:
                line=line.strip(" ").strip("\n")
                if line.startswith("PassiveDevices"):
                    currentkey ="PassiveDevices"
                elif line.startswith("ActiveDevices"):
                    currentkey = "ActiveDevices"
                elif line.startswith("Physical DataStorages"):
                    currentkey = "Physical DataStorages"
                elif line.startswith("Logical DataStorages"):
                    currentkey = "Logical DataStorages"
                elif line.startswith("Timer"):
                    currentkey = "Timer"
                elif line.startswith("DataStorages") or line.startswith("Devices") or line.startswith("Declaration"):
                    currentkey = ""
                else:
                    if currentkey!="":
                        spiltstring=r"\(|\)"
                        if len(re.split(spiltstring,line))>2:
                            componetname, name = re.split(spiltstring, line)[:2]
                            if currentkey.endswith("Devices") or currentkey.endswith("Timer"):
                                Devices.append(name)
                                device=Device()
                                device.SetName(name)
                                device.SetDeviceName(componetname)
                                device.SetType(currentkey)
                                Commponets[name]=device
                            elif currentkey.endswith("DataStorages"):
                                DataStorages.append(name)
                                storage=Storage()
                                storage.SetName(name)
                                storage.SetStorageName(componetname)
                                storage.SetType(currentkey)
                                Commponets[name] = storage

                        else:
                            print(f'错误{re.split(spiltstring, line)}')



                    # domains["PassiveDevices"].append(line.)


def AtomicCommponetCreate():
    Connects = []
    for file in os.listdir(rootdir):
        path = os.path.join(rootdir, file)
        with open(path, 'r') as f:
            data = f.read()
            # print(data)
            # 调用解析函数并得到转换后的数据，将需求规约转换为结构化的字典
            parser = AtomicProblemParser()
            converted_data = parser.parse_text_data(data)
            # 原子组件

            atomicCommponet=AtomicCommponet()
            # 打印转换后的数据
            # print(converted_data)
            #应用转换规则
            Name,AtomicName,ControllerName=rule1(converted_data["Name"])#规则1 将原子问题名称映射为原子组件和原子控制器子组件名称


            atomicCommponets[AtomicName]=Name
            atomicCommponet.SetName(Name)
            atomicCommponet.SetAtomicName(AtomicName)
            atomicCommponet.SetControllerName(ControllerName)
            # print(atomicCommponet.AtomicName)
            # print(converted_data["Behaviors"])
            # print("Gyro(G)" in converted_data["ProblemDomains"]["Device"])
            devices=[re.split(r"\(|\)",device)[1] for device in converted_data["ProblemDomains"]["Device"]]
            storages = [re.split(r"\(|\)", storage)[1] for storage in converted_data["ProblemDomains"]["Storage"]]
            self_designedComponents = [re.split(r"\(|\)", self_designedComponent)[1] for self_designedComponent  in converted_data["ProblemDomains"]["Self-designedComponent"]]
            if len(self_designedComponents) : atomicCommponet.SetComputing(self_designedComponents[0],"")
            # print("devices",devices)
            # print("storages",storages)
            # print("self_designedComponents",self_designedComponents)
            # print(len(converted_data["Behaviors"]))
            #
            # print(converted_data["Behaviors"])
            # print(rule(converted_data["Behaviors"]))
            #解析共享现象Behaviors，得到原子共享现象状态数组，时间约束数组，共享现象数组
            atomicstates, timeconstraints, behaviors,events=rule(converted_data["Behaviors"],Name)
            for behavior in behaviors:
                otherbehav = {}
                if behavior["Sender"] in devices :
                    #将连接保存在总连接库里
                    Connects.append(behavior)
                    atomicCommponet.SetConnector_devices(behavior)#往原子组件中添加连接
                    Commponets[behavior["Sender"]].SetConnector_devices(behavior)  # 规则4 映射为设备连接，并向相应的设备组件中加入连接
                elif behavior["Receiver"] in devices:
                    # print("devices")
                    # 将连接保存在总连接库里
                    Connects.append(behavior)
                    atomicCommponet.SetConnector_devices(behavior)
                    Commponets[behavior["Receiver"]].SetConnector_devices(behavior)  # 规则4 映射为设备连接
                    if Signalcjudge(behavior["Signal"])==1:#为读取、采集指令

                        otherbehav["Sender"]=behavior["Receiver"]
                        otherbehav["Receiver"] = behavior["Sender"]
                        otherbehav["Signal"] = behavior["Signal"].replace(" load instruction","").replace(" acquisition instruction","").replace(" perception instruction","")
                        # 将额外连接保存在总连接库里
                        Connects.append(otherbehav)
                    elif Signalcjudge(behavior["Signal"])==2 :#为存储指令

                        otherbehav["Sender"] = behavior["Sender"]
                        otherbehav["Receiver"] = behavior["Receiver"]
                        otherbehav["Signal"] = behavior["Signal"].replace(" storage instruction", "")
                        Connects.append(otherbehav)
                    Commponets[behavior["Receiver"]].SetConnector_devices(otherbehav)
                    atomicCommponet.SetConnector_devices(otherbehav)
                elif behavior["Sender"] in storages :
                    Connects.append(behavior)
                    atomicCommponet.SetConnector_datas(behavior)
                    Commponets[behavior["Sender"]].SetConnector_datas(behavior)  # 规则4 映射为设备连接


                elif behavior["Receiver"] in storages:
                    # print("storages")
                    #将连接记录下来
                    Connects.append(behavior)
                    atomicCommponet.SetConnector_datas(behavior)
                    Commponets[behavior["Receiver"]].SetConnector_datas(behavior)  # 规则4 映射为设备连接
                    if Signalcjudge(behavior["Signal"])==1:#为读取、采集指令

                        otherbehav["Sender"]=behavior["Receiver"]
                        otherbehav["Receiver"] = behavior["Sender"]
                        otherbehav["Signal"] = behavior["Signal"].replace(" load instruction","").replace(" acquisition instruction","").replace(" perception instruction","")
                        # 将额外连接记录下来
                        Connects.append(otherbehav)
                    elif Signalcjudge(behavior["Signal"])==2 :

                        otherbehav["Sender"] = behavior["Sender"]
                        otherbehav["Receiver"] = behavior["Receiver"]
                        otherbehav["Signal"] = behavior["Signal"].replace(" storage instruction", "")
                        # 将额外连接记录下来
                        Connects.append(otherbehav)
                    Commponets[behavior["Receiver"]].SetConnector_datas(otherbehav)
                    atomicCommponet.SetConnector_datas(otherbehav)
                elif behavior["Sender"] in self_designedComponents or behavior["Receiver"] in self_designedComponents:
                    # print("self_designedComponents")
                    atomicCommponet.SetConnector_components(behavior)#规则2 映射为组件连接
            #将时间约束化为状态，并与原子共享现象状态数组结合，形成原子问题的状态数组，以及状态间的迁移条件
            if_stack=[] #利用栈实现if elif  else 匹配，应对if else 嵌套问题
            for item in timeconstraints:
                if item["key"]=="while":
                    #while循环要在起始和末尾各设置一个空白状态，并根据循环约束条件设置迁移条件
                    startstate=int(item["startstate"])
                    endstate= int(item["endstate"])
                    #将起始和末尾状态添加到原子问题的状态数组
                    atomicstates=states_insert_before(atomicstates,item["startstate"],"while_"+str(startstate))
                    atomicstates=states_insert_after(atomicstates, item["endstate"], "while_" + str(endstate))
                    #将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("while_"+str(startstate),"nothing"))
                    events.append(rule6("while_" + str(endstate), "nothing"))
                    tran={}
                    tran["state"]="while_"+str(startstate)#while 起始空白状态
                    tran["tranconditions"]=[]
                    trancondition = {}#while 起始空白状态对应的迁移集
                    trancondition["source"]="while_"+str(startstate)
                    trancondition["destination"] = str(startstate) #迁移的目的状态，目前未知
                    trancondition["migrateeevent"] = "nothing"
                    tran["tranconditions"].append(trancondition)
                    atomicCommponet.SetControllerTran(tran)
                    tran = {}#while 末尾空白状态对应的迁移集
                    tran["state"] = "while_" + str(endstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "while_" + str(endstate)
                    trancondition["destination"] = "while_" + str(startstate)#迁移的目的状态 为起始状态
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    atomicCommponet.SetControllerTran(tran)
                elif item["key"]=="at":
                    startstate = int(item["startstate"])

                    # 将起始状态添加到原子问题的状态数组
                    atomicstates=states_insert_before(atomicstates, item["startstate"], "at_" + str(startstate))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("at_" + str(startstate), "nothing"))
                    tran = {}
                    tran["state"] = "at_" + str(startstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "at_" + str(startstate)
                    trancondition["destination"] = str(startstate)
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    atomicCommponet.SetControllerTran(tran)
                elif item["key"]=="after":
                    startstate = int(item["startstate"])
                    # 将起始状态添加到原子问题的状态数组
                    atomicstates=states_insert_before(atomicstates, item["startstate"], "after_" + str(startstate))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("after_" + str(startstate), "nothing"))
                    tran = {}
                    tran["state"] = "after_" + str(startstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "after_" + str(startstate)
                    trancondition["destination"] = str(startstate)
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    atomicCommponet.SetControllerTran(tran)
                elif item["key"]=="if" or item["key"]=="elif":#将if elif 压入栈内
                    if_stack.append(item)
                elif item["key"]=="else":#遇到else时，将栈内的与之匹配的if elif 弹出
                    #一个if-elif-else中需要两个空状态分别为总起始和总末尾，1.总起始状态可以迁移到各个分支的起始状态，故起始状态有一个迁移集
                    #2.各个分支的末尾状态，可以迁移到总末尾状态
                    #总起始状态即为if分支的起始状态的前一个
                    #总末尾状态即为else分支的末尾状态的前一个
                    maxstate=int(item["endstate"])   #if-elif-else中总末尾状态 即为else中的endstate
                    # 将if-else末尾状态添加到原子问题的状态数组
                    atomicstates=states_insert_after(atomicstates, item["endstate"], "if_else_end" + str(item["endstate"]))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("if_else_end" + str(item["endstate"]), "nothing"))
                    ifitem=if_stack.pop()
                    #总起始状态的迁移集
                    iftran = {}
                    iftran["state"] = "NULL"#因为if分支的起始状态还在栈中，先置为空
                    iftran["tranconditions"] = []#if起始状态的迁移集
                    #统计所有约束条件，以判断else的约束条件
                    elseconstraint=[]
                    #1.处理elif分支
                    while(ifitem["key"]!="if"):#弹出elif 直到遇到if
                        # 加入所有elif约束条件
                        elseconstraint.append(ifitem["constraint"])# 1.（elif）从总起始状态迁移到else分支的迁移条件，可以看作其它分支的迁移条件都不满足时
                        #if-elif-else 总起始状态需要迁移到各个elif分支的起始状态
                        eliftrancondition = {}
                        eliftrancondition["source"] = "NULL"#因为if分支的起始状态还在栈中，先置为空
                        eliftrancondition["destination"] = str(ifitem["startstate"])
                        eliftrancondition["migrateeevent"] =ifitem["constraint"]#迁移条件为elif中的约束条件
                        iftran["tranconditions"].append(eliftrancondition)#将迁移添加到起始状态的迁移集中

                        #每个elif末尾状态迁移到总末尾状态
                        elif_endtran = {}
                        elif_endtran["state"] = str(ifitem["startstate"])
                        elif_endtran["tranconditions"] = []
                        elif_endtrancondition = {}
                        elif_endtrancondition["source"] =str(ifitem["endstate"])
                        elif_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                        elif_endtrancondition["migrateeevent"] = "nothing"
                        elif_endtran["tranconditions"].append(elif_endtrancondition)
                        atomicCommponet.SetControllerTran(elif_endtran)
                        ifitem = if_stack.pop()
                    elseconstraint.append(ifitem["constraint"])  # 2.(if)从总起始状态迁移到else分支的迁移条件，可以看作其它分支的迁移条件都不满足时
                    #经过while循环后，现在的ifitem代表的就是if关键字
                    # 加入if约束条件
                    #2.处理if分支

                    iftran["state"] = "if_else_start"+str(ifitem["startstate"])#之前先置为空，现在补全总起始状态迁移的状态名称
                    for trancondition in iftran["tranconditions"]:
                        trancondition["source"] = "if_else_start" + str(ifitem["startstate"])#之前先置为空，现在补全迁移的总起始状态
                    # if-elif-else总起始状态的迁移到if分支的起始状态
                    iftrancondition = {}
                    iftrancondition["source"] = "if_else_start"+str(ifitem["startstate"]) # 因为if分支的起始状态还在栈中，先置为空
                    iftrancondition["destination"] =  str(ifitem["startstate"])#if分支的起始状态
                    iftrancondition["migrateeevent"] = ifitem["constraint"]  # 迁移条件为if中的约束条件
                    iftran["tranconditions"].append(iftrancondition)
                    #if分支的末尾状态迁移到总末尾状态
                    if_endtran = {}
                    if_endtran["state"] = str(ifitem["endstate"])
                    if_endtran["tranconditions"] = []
                    if_endtrancondition = {}
                    if_endtrancondition["source"] = str(ifitem["endstate"])
                    if_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                    if_endtrancondition["migrateeevent"] = "nothing"
                    if_endtran["tranconditions"].append(if_endtrancondition)
                    #3.处理else分支
                    # if-elif-else 总起始状态的迁移到else分支的起始状态
                    elsetrancondition = {}
                    elsetrancondition["source"] = "if_else_start"+str(ifitem["startstate"])  # 因为if分支的起始状态还在栈中，先置为空
                    elsetrancondition["destination"] = str(item["startstate"])#else分支的起始状态
                    elsetrancondition["migrateeevent"] = "not (" + " and ".join(elseconstraint) + ")"  # else的约束条件
                    iftran["tranconditions"].append(elsetrancondition)
                    # else分支的末尾状态迁移到总末尾状态
                    else_endtran = {}
                    else_endtran["state"] = str(item["endstate"])
                    else_endtran["tranconditions"] = []
                    else_endtrancondition = {}
                    else_endtrancondition["source"] = str(item["endstate"])
                    else_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                    else_endtrancondition["migrateeevent"] = "nothing"
                    else_endtran["tranconditions"].append(else_endtrancondition)
                    atomicCommponet.SetControllerTran(iftran)
                    atomicCommponet.SetControllerTran(if_endtran)
                    atomicCommponet.SetControllerTran(else_endtran)
                    # 将if-else起始状态添加到原子问题的状态数组
                    atomicstates = states_insert_before(atomicstates, ifitem["startstate"], "if_else_start" + str(ifitem["startstate"]))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("if_else_start" + str(ifitem["startstate"]), "nothing"))
            #添加一个初始状态
            atomicstates.insert(0,'0')
            # 将起始和末尾状态的执行事件添加到执行事件集中
            events.append(rule6('0', "nothing"))
            #循环遍历状态列表，为每个状态确定其迁移集
            for state in atomicstates:
                index=atomicstates.index(state)
                flag=True
                #判断迁移列表中，是否已经为该状态设置了迁移集
                for tran in atomicCommponet.Controller["Tran"]:
                    if tran["state"]==state:
                        flag=False
                if flag:
                    tran = {}
                    tran["state"] = state
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = state
                    #默认一个状态自动迁移到下一个状态，除非该状态已经是最后一个
                    if index!=len(atomicstates)-1:
                        trancondition["destination"] = atomicstates[index+1]
                    else:
                        trancondition["destination"] = atomicstates[0]
                    if index==0:#
                        trancondition["migrateeevent"] = AtomicName+"_start"
                    else:
                        trancondition["migrateeevent"] = "nothing"
                    tran["tranconditions"].append(trancondition)
                    atomicCommponet.SetControllerTran(tran)
            atomicCommponet.SetControllerStates(atomicstates)
            for event in events:
                atomicCommponet.SetControllerEvent(event)

            # for element in converted_data["Behaviors"]:
            #     if element["elementtype"]=="behavior":
            #         connector = {}
            #         connector["Sender"] = element["source"]
            #         connector["Signal"] = element["Phenomena"]
            #         connector["Receiver"] = element["target"]
            #         if element["source"] in devices or element["target"] in devices:
            #             print("devices")
            #             atomicCommponet.SetConnector_devices(connector)#规则4 映射为设备连接
            #         if element["source"] in storages or element["target"] in storages:
            #             print("storages")
            #             atomicCommponet.SetConnector_datas(connector)#规则3 映射为数据连接
            #         if element["source"] in self_designedComponents or element["target"] in self_designedComponents:
            #             print("self_designedComponents")
            #             atomicCommponet.SetConnector_components(connector)#规则2 映射为组件连接
            #         atomicCommponet.SetControllerState("state"+str(i))
            #         i=i+1
            #     elif element["elementtype"]=="after":
            #         atomicCommponet.SetControllerState("state" + str(i))


            # print("atomicCommponet")
            # atomicCommponet.PrintAtomic()
            Commponets[Name]=atomicCommponet
            # atomicCommponets.append(atomicCommponet)
            # print("events")
            # print(events)
    return Connects
def ComCommponetCreate():
    dependencyconnects=[]
    for filename in os.listdir(comcontroller_path):
        filepath=os.path.join(comcontroller_path,filename)
        # print(filepath)
        comController=ComController()#声明一个组合控制器组件对象
        with open(filepath,"r") as file:

            ComControllerName=file.readline().strip(" ").strip("\n")#文件里第一行即为该组合控制器组件的名字
            # print(ComControllerName)
            comController.SetName(ComControllerName)

            keyconstrains=[]#关键词和位置
            comcontrollerstates=[]
            events=[]#控制依赖中的组件名称
            StateStack=[]#用于匹配关键词位置的栈
            i=1
            for line in file.readlines()[1:-1]:
                line=line.strip("\n").strip(" ")
                if line.startswith("}"):
                    poplist=[]
                    state=StateStack.pop()
                    while not keyjudge(state):#直到找到时间约束关键字
                        poplist.append(state)
                        state = StateStack.pop()
                    start=poplist[-1]
                    end=poplist[0]
                    keyconstrain={}
                    keyconstrain["startstate"]=start
                    keyconstrain["endstate"]=end
                    if not state.startswith("else"):
                        keyconstrain["key"] = re.split(r'[\(\)]', state)[0]
                        keyconstrain["constraint"] = re.split(r'[\(\)]', state)[1]
                    else:
                        keyconstrain["key"] = "else"
                        keyconstrain["constraint"] = ""
                    keyconstrains.append(keyconstrain)
                    StateStack = StateStack + poplist[::-1]
                else:
                    if keyjudge(line):#时间约束关键字，压入状态栈中
                        StateStack.append(line)
                    else :#为组件名称
                        event={}
                        event["state"]=str(i)
                        event["event"] = line.strip(";")+"_start"
                        #依赖联系，启动信号
                        dependencyconnect={}
                        dependencyconnect2 = {}
                        dependencyconnect["Sender"] = ComControllerName
                        dependencyconnect2["Receiver"]= ComControllerName
                        dependencyconnect["Signal"] = line.strip(";")+"_start"
                        dependencyconnect2["Signal"] = line.strip(";") + "_done"
                        if line.strip(";") in atomicCommponets.keys():#如果组件是原子组件，即能在原子组件字典中找到对应名称
                            dependencyconnect["Receiver"] = atomicCommponets[line.strip(";")]#记录为原子组件的简写
                            dependencyconnect2["Sender"] = atomicCommponets[line.strip(";")]  # 记录为原子组件的简写
                        else:#组件为组合组件
                            dependencyconnect["Receiver"] =line.strip(";")
                            dependencyconnect2["Sender"] = line.strip(";")  # 记录为原子组件的简写
                        #完成信号

                        dependencyconnects.append(dependencyconnect)
                        dependencyconnects.append(dependencyconnect2)
                        events.append(event)#循环的同时统计该依赖中出现的所有组件名称，都放入element中
                        comcontrollerstates.append(str(i))
                        StateStack.append(str(i))#压入状态栈中,组件名称用下标代替
                        i=i+1
            print("comcontrollerelement", events)
            print("comcontrollerstates", comcontrollerstates)
            print("key",keyconstrains)

            # 将时间约束化为状态，并与原子共享现象状态数组结合，形成原子问题的状态数组，以及状态间的迁移条件
            if_stack = []  # 利用栈实现if elif  else 匹配，应对if else 嵌套问题
            for item in keyconstrains:
                if item["key"].startswith("while"):
                    # while循环要在起始和末尾各设置一个空白状态，并根据循环约束条件设置迁移条件
                    startstate = int(item["startstate"])
                    endstate = int(item["endstate"])
                    # 将起始和末尾状态添加到原子问题的状态数组
                    comcontrollerstates = states_insert_before(comcontrollerstates, item["startstate"], "while_" + str(startstate))
                    comcontrollerstates = states_insert_after(comcontrollerstates, item["endstate"], "while_" + str(endstate))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("while_" + str(startstate), "nothing"))
                    events.append(rule6("while_" + str(endstate), "nothing"))
                    tran={}
                    tran["state"]="while_"+str(startstate)#while 起始空白状态
                    tran["tranconditions"]=[]
                    trancondition = {}#while 起始空白状态对应的迁移集
                    trancondition["source"]="while_"+str(startstate)
                    trancondition["destination"] = str(startstate) #迁移的目的状态，目前未知
                    trancondition["migrateeevent"] = "nothing"
                    tran["tranconditions"].append(trancondition)
                    comController.SetSubController_Tran(tran)
                    tran = {}  # while 末尾空白状态对应的迁移集
                    tran["state"] = "while_" + str(endstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "while_" + str(endstate)
                    trancondition["destination"] = "while_" + str(startstate)  # 迁移的目的状态 为起始状态
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    comController.SetSubController_Tran(tran)
                elif item["key"] .startswith("at"):
                    startstate = int(item["startstate"])
                    # 将起始状态添加到原子问题的状态数组
                    comcontrollerstates = states_insert_before(comcontrollerstates, item["startstate"], "at_" + str(startstate))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("at_" + str(startstate), "nothing"))
                    tran = {}
                    tran["state"] = "at_" + str(startstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "at_" + str(startstate)
                    trancondition["destination"] = str(startstate)
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    comController.SetSubController_Tran(tran)
                elif item["key"].startswith("after"):
                    startstate = int(item["startstate"])
                    # 将起始状态添加到原子问题的状态数组
                    comcontrollerstates = states_insert_before(comcontrollerstates, item["startstate"], "after_" + str(startstate))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("after_" + str(startstate), "nothing"))
                    tran = {}
                    tran["state"] = "after_" + str(startstate)
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = "after_" + str(startstate)
                    trancondition["destination"] = str(startstate)
                    trancondition["migrateeevent"] = item["constraint"]
                    tran["tranconditions"].append(trancondition)
                    comController.SetSubController_Tran(tran)

                elif item["key"].startswith( "if") or item["key"].startswith("elif"):  # 将if elif 压入栈内
                    if_stack.append(item)
                elif item["key"] .startswith( "else"):  # 遇到else时，将栈内的与之匹配的if elif 弹出
                    # 一个if-elif-else中需要两个空状态分别为总起始和总末尾，1.总起始状态可以迁移到各个分支的起始状态，故起始状态有一个迁移集
                    # 2.各个分支的末尾状态，可以迁移到总末尾状态
                    # 总起始状态即为if分支的起始状态的前一个
                    # 总末尾状态即为else分支的末尾状态的前一个
                    maxstate = int(item["endstate"])  # if-elif-else中总末尾状态 即为else中的endstate
                    # 将if-else末尾状态添加到原子问题的状态数组
                    comcontrollerstates = states_insert_after(comcontrollerstates, item["endstate"],
                                                       "if_else_end" + str(item["endstate"]))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("if_else_end" + str(item["endstate"]), "nothing"))
                    ifitem = if_stack.pop()
                    # 总起始状态的迁移集
                    iftran = {}
                    iftran["state"] = "NULL"  # 因为if分支的起始状态还在栈中，先置为空
                    iftran["tranconditions"] = []  # if起始状态的迁移集
                    # 统计所有约束条件，以判断else的约束条件
                    elseconstraint = []
                    # 1.处理elif分支
                    while (ifitem["key"] != "if"):  # 弹出elif 直到遇到if
                        # 加入所有elif约束条件
                        elseconstraint.append(ifitem["constraint"])  # 1.（elif）从总起始状态迁移到else分支的迁移条件，可以看作其它分支的迁移条件都不满足时
                        # if-elif-else 总起始状态需要迁移到各个elif分支的起始状态
                        eliftrancondition = {}
                        eliftrancondition["source"] = "NULL"  # 因为if分支的起始状态还在栈中，先置为空
                        eliftrancondition["destination"] = str(ifitem["startstate"])
                        eliftrancondition["migrateeevent"] = ifitem["constraint"]  # 迁移条件为elif中的约束条件
                        iftran["tranconditions"].append(eliftrancondition)  # 将迁移添加到起始状态的迁移集中

                        # 每个elif末尾状态迁移到总末尾状态
                        elif_endtran = {}
                        elif_endtran["state"] = str(ifitem["startstate"])
                        elif_endtran["tranconditions"] = []
                        elif_endtrancondition = {}
                        elif_endtrancondition["source"] = str(ifitem["endstate"])
                        elif_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                        elif_endtrancondition["migrateeevent"] = "nothing"
                        elif_endtran["tranconditions"].append(elif_endtrancondition)
                        comController.SetSubController_Tran(elif_endtran)
                        ifitem = if_stack.pop()
                    elseconstraint.append(ifitem["constraint"])  # 2.(if)从总起始状态迁移到else分支的迁移条件，可以看作其它分支的迁移条件都不满足时
                    # 经过while循环后，现在的ifitem代表的就是if关键字
                    # 加入if约束条件
                    # 2.处理if分支

                    iftran["state"] = "if_else_start" + str(ifitem["startstate"])  # 之前先置为空，现在补全总起始状态迁移的状态名称
                    for trancondition in iftran["tranconditions"]:
                        trancondition["source"] = "if_else_start" + str(ifitem["startstate"])  # 之前先置为空，现在补全迁移的总起始状态
                    # if-elif-else总起始状态的迁移到if分支的起始状态
                    iftrancondition = {}
                    iftrancondition["source"] = "if_else_start" + str(ifitem["startstate"])  # 因为if分支的起始状态还在栈中，先置为空
                    iftrancondition["destination"] = str(ifitem["startstate"])  # if分支的起始状态
                    iftrancondition["migrateeevent"] = ifitem["constraint"]  # 迁移条件为if中的约束条件
                    iftran["tranconditions"].append(iftrancondition)
                    # if分支的末尾状态迁移到总末尾状态
                    if_endtran = {}
                    if_endtran["state"] = str(ifitem["endstate"])
                    if_endtran["tranconditions"] = []
                    if_endtrancondition = {}
                    if_endtrancondition["source"] = str(ifitem["endstate"])
                    if_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                    if_endtrancondition["migrateeevent"] = "nothing"
                    if_endtran["tranconditions"].append(if_endtrancondition)
                    # 3.处理else分支
                    # if-elif-else 总起始状态的迁移到else分支的起始状态
                    elsetrancondition = {}
                    elsetrancondition["source"] = "if_else_start" + str(ifitem["startstate"])  # 因为if分支的起始状态还在栈中，先置为空
                    elsetrancondition["destination"] = str(item["startstate"])  # else分支的起始状态
                    elsetrancondition["migrateeevent"] = "not (" + " and ".join(elseconstraint) + ")"  # else的约束条件
                    iftran["tranconditions"].append(elsetrancondition)
                    # else分支的末尾状态迁移到总末尾状态
                    else_endtran = {}
                    else_endtran["state"] = str(item["endstate"])
                    else_endtran["tranconditions"] = []
                    else_endtrancondition = {}
                    else_endtrancondition["source"] = str(item["endstate"])
                    else_endtrancondition["destination"] = "if_else_end" + str(maxstate)
                    else_endtrancondition["migrateeevent"] = "nothing"
                    else_endtran["tranconditions"].append(else_endtrancondition)
                    comController.SetSubController_Tran(iftran)
                    comController.SetSubController_Tran(if_endtran)
                    comController.SetSubController_Tran(else_endtran)
                    # 将if-else起始状态添加到原子问题的状态数组
                    comcontrollerstates = states_insert_before(comcontrollerstates, ifitem["startstate"],
                                                        "if_else_start" + str(ifitem["startstate"]))
                    # 将起始和末尾状态的执行事件添加到执行事件集中
                    events.append(rule6("if_else_start" + str(ifitem["startstate"]), "nothing"))
            # 添加一个初始状态
            comcontrollerstates.insert(0, '0')
            # 将起始和末尾状态的执行事件添加到执行事件集中
            events.append(rule6('0', "nothing"))
            # 循环遍历状态列表，为每个状态确定其迁移集
            for state in comcontrollerstates:
                index = comcontrollerstates.index(state)
                flag = True
                curentevent=""
                # 判断迁移列表中，是否已经为该状态设置了迁移集
                for tran in comController.SubController["Tran"]:
                    if tran["state"] == state:
                        flag = False
                #得到该状态的事件集
                for event in events:
                    if event["state"] == state:
                        curentevent=event["event"]
                if flag:
                    tran = {}
                    tran["state"] = state
                    tran["tranconditions"] = []
                    trancondition = {}
                    trancondition["source"] = state
                    # 默认一个状态自动迁移到下一个状态，除非该状态已经是最后一个
                    if index != len(comcontrollerstates) - 1:
                        trancondition["destination"] = comcontrollerstates[index + 1]
                    else:
                        trancondition["destination"] = comcontrollerstates[0]
                    if index == 0:
                        trancondition["migrateeevent"] = ComControllerName+"_start"
                    else:
                        trancondition["migrateeevent"] = curentevent.split("_")[0]+"_done"
                    tran["tranconditions"].append(trancondition)
                    comController.SetSubController_Tran(tran)
            for state in comcontrollerstates:
                comController.SetSubController_State(state)
            for event in events:
                comController.SetSubController_Event(event)
            Commponets[ComControllerName] = comController
            ComControllers.append(ComControllerName)
            # comController.PrintAtomic()
    return dependencyconnects
# for name,commponet in Commponets.items():
# #     commponet.PrintAtomic()
def GAtomicCommponet():


    Device_StorageCreate()
    # print("device")
    # print(Commponets.keys())
    # for item in Commponets.values():
    #     item.PrintAtomic()
    Connects=AtomicCommponetCreate()
    dependencyconnects=ComCommponetCreate()
    # print(f"tree{dependencyconnects}")

    for item in dependencyconnects:
        Connects.append(item)
        Sender = item["Sender"]
        Receiver = item["Receiver"]
        Commponets[Sender].SetConnector_controllers(item)
        Commponets[Receiver].SetConnector_controllers(item)
    definitions=[]
    for name,commponet in Commponets.items():
        if name in atomicCommponets.values():
            definition = {}
            definition["type"] = "AtomicCommponet"
            definition["name"] = "*" + commponet.GetName()
            definition["fx"] = commponet.GetComputing()["Fx"]
            definition["subport"] = []
            definition["inputs"] = []
            definition["outputs"] = []
            print("test")
            print(commponet.GetController()['State'])
            definition["states"] = commponet.GetController()['State']
            definition["events"] =commponet.GetController()['Event']
            definition["trans"] = commponet.GetController()['Tran']
            definition["vhdl"] =""
            # print("commponet.GetConnector_datas()")
            # print(commponet.GetConnector_datas())
            # commponet.PrintAtomic()
            #外部接口
            ports=commponet.GetConnector_datas()+commponet.GetConnector_devices()+commponet.GetConnector_controllers()
            i=0
            j=0
            for port in ports:
                if port!={}:
                    print(port)
                    print(port['Receiver'])
                    if port["Sender"]==commponet.GetName():
                        output = {}
                        output["id"] = "Number"
                        output["index"] = i
                        output["value"] = port["Signal"]
                        definition["outputs"].append(output)
                        i=i+1
                    elif port["Receiver"]==commponet.GetName():
                        input = {}
                        input["id"] = "Number"
                        input["index"] = j
                        input["value"] = port["Signal"]
                        definition["inputs"].append(input)
                        j = j + 1
            #内部接口
            m=0
            for port in commponet.GetConnector_components():
                if port != {}:
                    # print(port)
                    # print(port['Receiver'])
                    output = {}
                    output["id"] = "Number"
                    output["index"] = m
                    output["value"] = port["Signal"]
                    if port["Sender"] == commponet.GetName():
                        output["inout"]="out"
                    elif port["Receiver"] == commponet.GetName():
                        output["inout"]="in"
                    definition["subport"].append(output)
                    m=m+1
            definitions.append(definition)
        elif name in Devices:
            definition = {}
            definition["type"] = "Device"
            definition["name"] = "*" + commponet.GetName()
            definition["fx"] =""
            definition["subport"] = []
            definition["states"] = []
            definition["events"] = []
            definition["trans"] = []
            definition["inputs"] = []
            definition["outputs"] = []
            ports = commponet.GetConnector_devices()
            i = 0
            j = 0
            for port in ports:
                if port != {}:
                    print(port)
                    print(port['Receiver'])
                    if port["Sender"] == commponet.GetName():
                        output = {}
                        output["id"] = "Number"
                        output["index"] = i
                        output["value"] = port["Signal"]
                        definition["outputs"].append(output)
                        i = i + 1
                    elif port["Receiver"] == commponet.GetName():
                        input = {}
                        input["id"] = "Number"
                        input["index"] = j
                        input["value"] = port["Signal"]
                        definition["inputs"].append(input)
                        j = j + 1
            definitions.append(definition)
        elif name in DataStorages:
            definition = {}
            definition["type"] = "DataStorage"
            definition["name"] = "*" + commponet.GetName()
            definition["fx"] = ""
            definition["subport"] = []
            definition["states"] =[]
            definition["events"] =[]
            definition["trans"] = []
            definition["inputs"] = []
            definition["outputs"] = []
            ports = commponet.GetConnector_datas()
            i = 0
            j = 0
            for port in ports:
                if port != {}:
                    print(port)
                    print(port['Receiver'])
                    if port["Sender"] == commponet.GetName():
                        output = {}
                        output["id"] = "Number"
                        output["index"] = i
                        output["value"] = port["Signal"]
                        definition["outputs"].append(output)
                        i = i + 1
                    elif port["Receiver"] == commponet.GetName():
                        input = {}
                        input["id"] = "Number"
                        input["index"] = j
                        input["value"] = port["Signal"]
                        definition["inputs"].append(input)
                        j = j + 1
            definitions.append(definition)
        elif name in ComControllers:
            definition = {}
            definition["type"] = "ComController"
            definition["name"] = "*" + commponet.GetName()
            definition["fx"] = ""
            definition["subport"] = []
            definition["states"] = commponet.GetSubController()['State']
            definition["events"] = commponet.GetSubController()['Event']
            definition["trans"] = commponet.GetSubController()['Tran']
            definition["inputs"] = []
            definition["outputs"] = []
            ports =  commponet.GetConnector_controllers()
            i = 0
            j = 0
            for port in ports:
                if port != {}:
                    print(port)
                    print(port['Receiver'])
                    if port["Sender"] == commponet.GetName():
                        output = {}
                        output["id"] = "Number"
                        output["index"] = i
                        output["value"] = port["Signal"]
                        definition["outputs"].append(output)
                        i = i + 1
                    elif port["Receiver"] == commponet.GetName():
                        input = {}
                        input["id"] = "Number"
                        input["index"] = j
                        input["value"] = port["Signal"]
                        definition["inputs"].append(input)
                        j = j + 1
            definitions.append(definition)
    return definitions,Connects
def GenerateDataStorageVHDL(definition):
    # 生成vhdl代码

    Name = definition["name"]
    vhdl = ""
    inputs = definition["inputs"]
    outputs = definition["outputs"]
    subports = definition["subport"]
    states = definition["states"]
    events = definition["events"]
    trans = definition["trans"]
    fx = definition["fx"]
    vhdl = ""
    entitystr = ""
    signalstr = ""
    storeprocessstr = ""
    loadprocessstr = ""
    entitytemplate_file = 'AtomicSystemGeneration/test/Template/Entity_Template'

    with open(entitytemplate_file, 'r', encoding='utf-8') as file:
        entitytemplate = file.read()

    loadtemplate_file = 'AtomicSystemGeneration/test/Template/Load_Template'
    with open(loadtemplate_file, 'r', encoding='utf-8') as file:
        loadtemplate = file.read()
    storetemplate_file = 'AtomicSystemGeneration/test/Template/Data_Store_Template'
    with open(storetemplate_file, 'r', encoding='utf-8') as file:
        storetemplate = file.read()
    # 原子组件的输入输出端口
    portstr = ""
    loadports=[]
    storeports=[]
    print("testloadports")
    ports = []
    for input in inputs:
        print(input)
        # 原子组件输入端口转换成top的端口声明以及信号声明
        portstr = "in_" + jianxie(input["value"]) + ":in STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
        if Signalcjudge(input["value"])==1:
            loadports.append(input["value"])
        elif Signalcjudge(input["value"])==2:
            storeports.append(input["value"])

    for output in outputs:
        # 原子组件输出端口转换成top的端口声明
        portstr = "out_" + jianxie(output["value"]) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
        if Signalcjudge(output["value"])==1:
            loadports.append(output["value"])
        elif Signalcjudge(output["value"])==2:
            storeports.append(output["value"])
    portsstr = "\n    ".join(ports)
    # 生成顶层组件，原子控制子组件，计算子组件vhdl实体部分
    entitystr = entitytemplate.replace('<<entityname>>', jianxie(Name)).replace('<<port_section>>', portsstr)

    for storeport in storeports:
        inport = storeport.replace(' storage instruction', "")
        signalstr +=  "\nsignal RAM_" + jianxie(inport)+": STD_LOGIC_VECTOR ( 31 downto 0 );\n"


    print(loadports)
    print("testloadports")
    print(storeports)
    vhdl = entitystr +f"\narchitecture Behavioral of {jianxie(Name)} is\n"+ signalstr+GenrateDataStoreVHDl(storeports,storetemplate)+GenrateLoadVHDl(loadports,loadtemplate)+"\nend Behavioral;"
    return vhdl

def GenrateDataStoreVHDl(storeports,storetemplate):
    vhdl=""
    for storeport in storeports:
        inport=storeport.replace(' storage instruction', "")
        vhdl+=storetemplate.replace('<<storeport>>', "in_" + jianxie(storeport)).replace('<<inport>>', "in_" + jianxie(inport)).replace('<<ram>>', "RAM_" + jianxie(inport))
    return vhdl

def GenrateLoadVHDl(loadports,loadtemplate):
    vhdl=""
    for loadport in loadports:
        outport=loadport.replace(' load instruction', "")
        vhdl+=loadtemplate.replace('<<loadport>>', "in_" + jianxie(loadport)).replace('<<outport>>', "out_" + jianxie(outport)).replace('<<ram>>', "RAM_" + jianxie(outport))
    return vhdl
def GenerateComControllerVHDL(definition):
    # 生成vhdl代码

    Name = definition["name"]
    vhdl = ""
    inputs = definition["inputs"]
    outputs = definition["outputs"]
    subports = definition["subport"]
    states = definition["states"]
    events = definition["events"]
    trans = definition["trans"]
    fx = definition["fx"]
    vhdl=""
    entitystr = ""
    signalstr=""
    stateprocessstr=""
    entitytemplate_file = 'AtomicSystemGeneration/test/Template/Entity_Template'
    entity = ""
    with open(entitytemplate_file, 'r', encoding='utf-8') as file:
        entitytemplate = file.read()
    signaltemplate_file = 'AtomicSystemGeneration/test/Template/Signal_Template'
    with open(signaltemplate_file, 'r', encoding='utf-8') as file:
        signaltemplate = file.read()
    statetemplate_file = 'AtomicSystemGeneration/test/Template/State_Template'
    with open(statetemplate_file, 'r', encoding='utf-8') as file:
        statetemplate = file.read()
        # 原子组件的输入输出端口
    portstr=""
    ports=[]
    for input in inputs:
        # 原子组件输入端口转换成top的端口声明以及信号声明
        portstr = "in_" + jianxie(input["value"]) + ":in STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
    for output in outputs:
        # 原子组件输出端口转换成top的端口声明
        portstr = "out_" + jianxie(output["value"]) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
    portsstr = "\n    ".join(ports)+"\nclk:in std_logic;\nrst:in std_logic\n"
    # 生成顶层组件，原子控制子组件，计算子组件vhdl实体部分
    entitystr = entitytemplate.replace('<<entityname>>', jianxie(Name)).replace('<<port_section>>',portsstr)
    statesignalstr = ""
    for i in range(0, len(states)):
        if i != len(states) - 1:
            statesignalstr += "sta_" + states[i] + ","
        else:
            statesignalstr += "sta_" + states[i]
    signalstr = signaltemplate.replace('<<states_str>>',statesignalstr).replace('<<signals>>', "")
    stateprocess = statetemplate.replace("<<statevhdl>>", generatestatevhdl_concomponent(trans)).replace("<<eventvhdl>>",generateeventvhdl_concomponent(events))
    vhdl=entitystr+signalstr+stateprocess+"\nend Behavioral;"
    return vhdl
def GenerateAtomicCommponetVHDL(definition):
    # 生成vhdl代码

    atomicName=definition["name"]
    vhdl=""
    inputs=definition["inputs"]
    outputs = definition["outputs"]
    subports = definition["subport"]
    states=definition["states"]
    events=definition["events"]
    trans=definition["trans"]
    fx = definition["fx"]
    entitytemplate_file = 'AtomicSystemGeneration/test/Template/Entity_Template'
    entity=""
    with open(entitytemplate_file, 'r', encoding='utf-8') as file:
        entitytemplate = file.read()
    signaltemplate_file = 'AtomicSystemGeneration/test/Template/Signal_Template'
    signal=""
    with open(signaltemplate_file, 'r', encoding='utf-8') as file:
        signaltemplate = file.read()
    statetemplate_file = 'AtomicSystemGeneration/test/Template/State_Template'
    with open(statetemplate_file, 'r', encoding='utf-8') as file:
        statetemplate = file.read()
    storetemplate_file = 'AtomicSystemGeneration/test/Template/Store_Template'
    with open(storetemplate_file, 'r', encoding='utf-8') as file:
        storetemplate = file.read()
    computingmplate_file = 'AtomicSystemGeneration/test/Template/Computing_Template'
    with open(computingmplate_file, 'r', encoding='utf-8') as file:
        computingtemplate = file.read()
    componenttemplate_file = 'AtomicSystemGeneration/test/Template/Componentdefine_Template'
    with open(componenttemplate_file, 'r', encoding='utf-8') as file:
        componenttemplate = file.read()
    #原子组件里包含顶层组件、控制子组件、计算子组件
    topvhdl=""
    controllervhdl=""
    computingvhdl=""
    #组件由实体、信号声明、进程声明等组成
    controlleentity=""
    computingentity=""
    topentity=""
    signals=[]
    signalstr=""
    ports=[]#vhdl top端口声明
    portstr=""
    topcomponent = []
    #系统完成信号
    portdone=""
    #原子组件的输入输出端口
    for input in inputs:
        #原子组件输入端口转换成top的端口声明以及信号声明
        portstr="in_"+jianxie(input["value"])+":in STD_LOGIC_VECTOR ( 31 downto 0 );"
        #输入的需要信号声明来存储
        signalstr="signal "+"RAM_"+jianxie(input["value"])+": STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
        signals.append(signalstr)
        topcomponent.append("in_"+jianxie(input["value"])+" => in_"+jianxie(input["value"])+",")

    for output in outputs:
        # 原子组件输出端口转换成top的端口声明
        portstr="out_"+jianxie(output["value"])+":out STD_LOGIC_VECTOR ( 31 downto 0 );"
        ports.append(portstr)
        topcomponent.append("out_" + jianxie(output["value"]) + " => out_" + jianxie(output["value"]) + ",")
        if output["value"].find("_done"):
            portdone=output["value"]

    controllerports=[]#vhdl controller端口声明 原子控制子组件
    computingports = []#vhdl computing端口声明 计算子组件
    port1str=""
    port2str=""
    computinginports=[]#计算子组件输入端口集
    componentsignals=[]

    #原子组合组件的子组件定义
    controllercomponent = []
    computingcomponent=[]
    # 将组件连接端口\
    subinports=[]
    suboutports = []
    for subport in subports:
        if subport["inout"]=="in":
            subinports.append(subport["value"])

        else:
            suboutports.append(subport["value"])
    for port in subinports:
        # 将组件连接端口转换为vhdl端口形式
        port1str = "in_" + jianxie(port) + ":in STD_LOGIC_VECTOR ( 31 downto 0 );"
        port2str = "out_" + jianxie(port) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
        controllerports.append(port1str)
        computingports.append(port2str)
        # 输入的需要信号声明来存储，控制器子组件
        signalstr = "signal " + "RAM_" + jianxie(port) + ": STD_LOGIC_VECTOR ( 31 downto 0 );"
        signals.append(signalstr)
        #原子组合组件的信号声明
        componentsignals.append("signal m_" + jianxie(port) + ":STD_LOGIC_VECTOR ( 31 downto 0 );")
        #原子组合组件的子组件件定义，关于控制子组件和计算子组件的接口对应
        portmap1str = "in_" + jianxie(port) + " => m_" + jianxie(port) + ","
        portmap2str = "out_" + jianxie(port) + " => m_" + jianxie(port) + ","
        controllercomponent.append(portmap1str)
        computingcomponent.append(portmap2str)
    for port in suboutports:
        # 将组件连接端口转换为vhdl端口形式
        port1str = "out_" + jianxie(port) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
        port2str = "in_" + jianxie(port) + ":in STD_LOGIC_VECTOR ( 31 downto 0 );"
        controllerports.append(port1str)
        computingports.append(port2str)
        # 输入的需要信号声明来存储，控制器子组件

        computinginports.append(port)
        #原子组合组件的信号声明
        componentsignals.append("signal m_" + jianxie(port) + ":STD_LOGIC_VECTOR ( 31 downto 0 );")
        #原子组合组件的子组件件定义，关于控制子组件和计算子组件的接口对应
        portmap1str = "out_" + jianxie(port) + " => m_" + jianxie(port) + ","
        portmap2str = "in_" + jianxie(port) + " => m_" + jianxie(port) + ","
        controllercomponent.append(portmap1str)
        computingcomponent.append(portmap2str)
    # for subport in subports:
    #     #子端口转换成控制器和计算子组件端口声明
    #     if subport["inout"]=="in":
    #         port1str="in_"+jianxie(subport["value"])+":in STD_LOGIC_VECTOR ( 31 downto 0 );"
    #         port2str = "out_" + jianxie(subport["value"]) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
    #         # 输入的需要信号声明来存储
    #         signalstr = "signal " + "RAM_" + jianxie(subport["value"]) + ": STD_LOGIC_VECTOR ( 31 downto 0 );"
    #         signals.append(signalstr)
    #
    #     else:
    #         port1str = "out_" + jianxie(subport["value"]) + ":out STD_LOGIC_VECTOR ( 31 downto 0 );"
    #         port2str = "in_" + jianxie(subport["value"]) + ":in STD_LOGIC_VECTOR ( 31 downto 0 );"
    #         computinginports.append(subport["value"])
    #     componentsignals.append("signal m_" + jianxie(subport["value"]) + ":STD_LOGIC_VECTOR ( 31 downto 0 );")
    #     controllerports.append(port1str)
    #     computingports.append(port2str)
    # controllercomponent=[]
    # computingcomponent=[]
    # for subport in subports:
    #     #子端口转换成控制器和计算子组件端口声明
    #     if subport["inout"]=="in":
    #         port1str="in_"+jianxie(subport["value"])+ " => m_" + jianxie(subport["value"]) + ","
    #         port2str = "out_" + jianxie(subport["value"]) + " => m_" + jianxie(subport["value"]) + ","
    #     else:
    #         port1str = "out_" + jianxie(subport["value"]) + " => m_" + jianxie(subport["value"]) + ","
    #         port2str = "in_" + jianxie(subport["value"]) + " => m_" + jianxie(subport["value"]) + ","
    #     controllercomponent.append(port1str)
    #     computingcomponent.append(port2str)

    #组件连接端口数量大于0，即存在原子控制器子组件和计算子组件
    if len(subports)>0:
        controllerports.append("out_calc_inst:out STD_LOGIC_VECTOR ( 31 downto 0 );")#在顶层组件和控制子组件中计算端口不是最后一个不用；
        computingports.append("in_calc_inst:in STD_LOGIC_VECTOR ( 31 downto 0 )")#在计算子组件中计算端口是最后一个用；
        #将顶层组件、控制子组件、计算子组件的端口数组连接起来
        topstr = "\n    ".join(ports)+"\nclk:in std_logic;\nrst:in std_logic\n"
        controllerstr = "\n    ".join(ports+controllerports)+"\nclk:in std_logic;\nrst:in std_logic\n"
        computingstr = "\n    ".join(computingports)
        #生成信号声明部分
        componentsignalsstr= "\n    ".join(componentsignals)
        computingcomponentstr = "\n    ".join(computingcomponent)
        controllercomponentstr = "\n    ".join(topcomponent+controllercomponent)
        #将上面部分插入到模板相应位置，生成顶层组件，原子控制子组件，计算子组件vhdl实体部分
        topentity = entitytemplate.replace('<<entityname>>', atomicName).replace('<<port_section>>', topstr)
        controlleentity = entitytemplate.replace('<<entityname>>', atomicName+"_con").replace('<<port_section>>', controllerstr)
        computingentity = entitytemplate.replace('<<entityname>>', atomicName+"_com").replace('<<port_section>>', computingstr)
        #生成计算组件结构体部分
        computingarchitecture = generatecomputingvhdl(computinginports,computingtemplate,fx, atomicName+"_com")
        # 生成顶层组件结构体部分
        toparchitecture = componenttemplate.replace('<<atoicmname>>', atomicName).replace('<<controllername>>', atomicName+"_con").replace('<<computingname>>', atomicName+"_com")\
            .replace('<<controllerports>>', controllerstr).replace('<<computingports>>', computingstr).replace('<<componentsignals>>', componentsignalsstr)\
            .replace('<<controllercomponent>>', controllercomponentstr).replace('<<computingcomponent>>', computingcomponentstr)
        #得到计算子组件完整vhdl代码
        computingvhdl=computingentity+computingarchitecture
        topvhdl=topentity+toparchitecture

    else:
        controllerstr = "\n    ".join(controllerports + ports)+"\nclk:in std_logic;\nrst:in std_logic\n"
        controlleentity = entitytemplate.replace('<<entityname>>', atomicName).replace('<<port_section>>',controllerstr)
    #信号声明部分，声明状态机相关信号
    statesignalstr=""
    for i in range(0,len(states)):
        if i!=len(states)-1:
            statesignalstr+="sta_"+states[i]+","
        else:
            statesignalstr+="sta_" + states[i]
    controllersignal=signaltemplate.replace('<<states_str>>', statesignalstr).replace('<<signals>>', "\n    ".join(signals))
    controllerstateprocess=statetemplate.replace("<<statevhdl>>",generatestatevhdl_atomic(trans,portdone)).replace("<<eventvhdl>>",generateeventvhdl_atomic(events,trans))
    controllerstoreprocess = generatestorevhdl(inputs,subinports,storetemplate)
    controllervhdl=controlleentity+controllersignal+controllerstateprocess+controllerstoreprocess+"\nend Behavioral;"

    return topvhdl+"\n"+controllervhdl+"\n"+computingvhdl

def generatestatevhdl_atomic(trans,portdone):
    #终止状态，状态为状态机中的终点，其下一个状态是起始状态

    statevhdl=""
    for i in range(0,len(trans)):
        #判断状态是否是终状态标志

        #获取状态
        state=trans[i]["state"]
        statevhdl=statevhdl+"\nwhen "+"sta_"+state+"=>"
        #获取迁移事件
        subtrans=trans[i]["tranconditions"]
        #状态切换

        # 根据迁移事件的数量生成if-elif-else结构
        condition = subtrans[0]["migrateeevent"]
        # 判断是否是回到起始状态,即判断该条迁移的目的状态是哪
        if subtrans[0]["destination"] == "0":
            str1 = "\nsta <=" + "sta_" + subtrans[0]["destination"]+";\n"+"\nout_"+jianxie(portdone)+" <= std_logic_vector(to_unsigned(1, 32));"
        else:
            str1 = "\nsta <=" + "sta_" + subtrans[0]["destination"] + ";\n"
        #该状态下只有一个迁移条件
        if len(subtrans) == 1:

            #判断是否有迁移是否有迁移约束
            if condition =="nothing":
                statevhdl = statevhdl +str1
            else:
                statevhdl =statevhdl+ f"""
                        if {"in_"+jianxie(condition)+" = std_logic_vector(to_unsigned(1, 32))"} then
                            {str1}
                        end if;"""
        #该状态有两个迁移条件 可以用if elif
        elif len(subtrans) == 2:

            condition2 = subtrans[1]["migrateeevent"]
            if subtrans[1]["destination"] =="0":
                str2 = "\nsta <=" + "sta_" + subtrans[1]["destination"] + ";\n" + "\nout_" + jianxie(portdone) + " <= std_logic_vector(to_unsigned(1, 32));"
            else:
                str2 = "\nsta <=" + "sta_" + subtrans[1]["destination"] + ";\n"

            statevhdl =statevhdl+f"""
                    if {"in_"+jianxie(condition)+" = std_logic_vector(to_unsigned(1, 32))"} then
                        {str1}
                    elif {"in_"+jianxie(condition2)+" = std_logic_vector(to_unsigned(1, 32))"} then
                         {str2}
                    end if;
                    """
        #超过两个以上
        else:

            statevhdl =statevhdl+f"""if {"in_"+jianxie(condition)+" = std_logic_vector(to_unsigned(1, 32))"} then \n    {str1}\n"""
            for subtran in subtrans:
                subcondition = subtran["migrateeevent"]
                if subtran["destination"] == "0":
                    str= "\nsta <=" + "sta_" + subtran["destination"] + ";\n" + "\nout_" + jianxie(portdone) + " <= std_logic_vector(to_unsigned(1, 32));"
                else:
                    str= "\nsta <=" + "sta_" + subtran["destination"] + ";\n"

                statevhdl += f"""elif {"in_"+jianxie(subcondition)+" = std_logic_vector(to_unsigned(1, 32))"} then \n    {str}\n"""
            statevhdl += f"\n   end if;\n"
    return statevhdl

def generateeventvhdl_atomic(events,trans):
    eventvhdl=""
    for i in range(0,len(events)):
        #获取状态
        state=events[i]["state"]
        eventvhdl+="\nwhen "+"sta_"+state+"=>"
        #获取执行事件
        if events[i]["event"]!="nothing":#如果状态执行事件为nothing 即该状态不需要操作
            if Signalcjudge(events[i]["event"])==2:#如果为存储指令，则该状态还需要输出该存储指令要输出的数据
                eventvhdl += "\nout_" + jianxie(events[i]["event"]) + "<= std_logic_vector(to_unsigned(1, 32));\n"
                eventvhdl += "\nout_" + jianxie(events[i]["event"].replace(" storage instruction","")) + "<=" + "RAM_" + jianxie(events[i]["event"].replace(" storage instruction","")) + " ;\n"
            elif Signalcjudge(events[i]["event"])==1:#如果为读取 采集指令
                eventvhdl += "\nout_" + jianxie(events[i]["event"]) + "<= std_logic_vector(to_unsigned(1, 32));\n"
            else:
                eventvhdl+="\nout_" + jianxie(events[i]["event"])+"<="+"RAM_" + jianxie(events[i]["event"])+" ;\n"

    return eventvhdl
def generateeventvhdl_concomponent(events):
    eventvhdl = ""
    arr=[]
    for i in range(0, len(events)):
        # 获取状态
        state = events[i]["state"]
        eventvhdl += "\nwhen " + "sta_" + state + "=>"
        # 获取执行事件
        if events[i]["event"] != "nothing":
            eventvhdl += "\nout_" + jianxie(events[i]["event"]) + "<= std_logic_vector(to_unsigned(1, 32)) ;\n"
            arr.append("\nout_" + jianxie(events[i]["event"]) + "<= std_logic_vector(to_unsigned(0, 32)) ;\n")
        if events[i]["state"]=="0":
            eventvhdl+="".join(arr)
    return eventvhdl
def generatestatevhdl_concomponent(trans):
    statevhdl=""
    for i in range(0,len(trans)):
        #获取状态
        state=trans[i]["state"]
        statevhdl=statevhdl+"\nwhen "+"sta_"+state+"=>"
        #获取迁移事件
        subtrans=trans[i]["tranconditions"]
        #状态切换

        # 根据迁移事件的数量生成if-elif-else结构
        condition = "in_" + jianxie(subtrans[0]["migrateeevent"])
        str1 = "\nsta <=" + "sta_" + subtrans[0]["destination"]+";"
        if len(subtrans) == 1:
            #获取迁移事件

            if condition =="nothing":
                statevhdl = statevhdl +str1
            else:
                statevhdl =statevhdl+ f"""
                        if {condition}=std_logic_vector(to_unsigned(1, 32)) then
                            {str1}
                        end if; """
        elif len(subtrans) == 2:

            condition2 = "in_" + jianxie(subtrans[1]["migrateeevent"])

            str2 = "\nsta <=" + "sta_" + subtrans[1]["destination"]+";"
            statevhdl =statevhdl+f"""
                    if {condition}=std_logic_vector(to_unsigned(1, 32)) then
                        {str1}
                    elif {condition2}=std_logic_vector(to_unsigned(1, 32)) then
                         {str2}
                    end if;
                    """
        else:

            statevhdl =statevhdl+f"if {condition}=std_logic_vector(to_unsigned(1, 32)) then \n    {str1}\n"
            for subtran in subtrans:
                subcondition = "in_" + jianxie(subtran["migrateeevent"])
                str="\nsta <=" + "sta_" + subtran["destination"]+";"
                statevhdl += f"elif {subcondition}=std_logic_vector(to_unsigned(1, 32)) then \n    {str}\n"
            statevhdl += f"\n   end if;\n"
    return statevhdl
def generatestorevhdl(inputs,subinports,storetemplate):
    storevhdl=""
    for input in inputs:

        #输入信号
        inport = "in_" + jianxie(input["value"])
        # 输入的需要信号声明来存储
        ram = "RAM_" + jianxie(input["value"])
        #获取迁移事件
        storevhdl +="\n"+storetemplate.replace("<<inport>>",inport).replace("<<ram>>",ram)+"\n"
    for subinport in subinports:

        #输入信号
        inport = "in_" + jianxie( subinport)
        # 输入的需要信号声明来存储
        ram = "RAM_" + jianxie( subinport)
        #获取迁移事件
        storevhdl +="\n"+storetemplate.replace("<<inport>>",inport).replace("<<ram>>",ram)+"\n"


    return storevhdl
def generatecomputingvhdl(inputs,computingmplate,fx,name):
    computingarchitecture=""
    inports=""
    for i in range(0,len(inputs)):
        if i!=len(inputs)-1:
            #输入信号
            inports+= "in_" + jianxie(inputs[i])+","
        else:
            inports += "in_" + jianxie(inputs[i])
        #获取迁移事件
    computingarchitecture +="\n"+computingmplate.replace("<<inports>>",inports).replace("<<fx>>",fx).replace("<<name>>",name)+"\n"


    return computingarchitecture
def generatetoparchitecture(inputs,name):
    computingarchitecture=""
    inports=""
    for i in range(0,len(inputs)):
        if i!=len(inputs)-1:
            #输入信号
            inports+= "in_" + jianxie(inputs[i])+","
        else:
            inports += "in_" + jianxie(inputs[i])
        #获取迁移事件
    computingarchitecture +="\n"+computingmplate.replace("<<inports>>",inports).replace("<<fx>>",fx).replace("<<name>>",name)+"\n"


    return computingarchitecture

# print("数据流一致性：263个接口，其中261个接口一致性约束验证成功，导致2个接口一致性约束验证失败。MR数据储存中的两个接口验证失败！")
# print("控制流正确性：针对19个原子问题和7个组合问题，19个原子问题控制流均验证成功！6个组合问题控制流验证成功，1个组合问题控制流验证失败")
# print("时间约束性：160ms的周期循环约束验证成功！128ms输出喷气控制信号的定时触发时间约束验证成功！")
#
# print(data)

