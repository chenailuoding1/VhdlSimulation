# 陈琪
# @Time : 2024/1/10 23:32
# @Author : chenqi
# @File : Mapping_construct
# @Project : VhdlSimulation
import os
import re
from AtomicSystemGeneration.test.algorithms.Function import *
def rule1(input):
    name = input.split("(")[1].strip(")")#名称简写
    atomicname=input.split("(")[0].strip(")")#名称原称
    atomiccontrollername=name+"controller"
    return name,atomicname,atomiccontrollername
def rule7(name,connectors):#生成状态执行事件
    inports=[]
    outports = []

    for connector in connectors:
        if connector!={}:
            # print(f"connector{connector}")
            port={}
            # 目前类型是固定的
            porttype = "STD_LOGIC_VECTOR ( 31 downto 0 )"
            port["type"] = porttype
            #以发送者，接受者名称，共享现象简写结合得到portname
            portname=connector['Sender']+"_"+connector['Receiver']+"_"+jianxie(connector['Signal'])
            #vhdl中名称长度有一定限制
            if len(portname)>15:
                portname=portname[0:15]
            port["name"] = portname
            #判断是输入还是输出
            if connector['Sender']==name:
                portdirection="out"
                port["direction"] =portdirection
                outports.append(port)
            else:
                portdirection = "in"
                port["direction"] = portdirection
                inports.append(port)


    return inports,outports
def rule5(atomicCommponet,sum):
    atomicCommponetlen=len(atomicCommponet.Controller["State"])+1
    State="state"+str(atomicCommponetlen)
    atomicCommponet.SetControllerState(State)
def rule6(state,behavior):#生成状态执行事件
    event = {}
    event["state"] = state
    event["event"] = behavior
    return event
#从需求规约的Behaviors段落中解析出各个时间约束，以及时间约束包括的范围
def rule(input,Name):
    lines=re.split(r'\n',input)
    atomicstates = []#状态栈
    timeconstraints = []#约束列表
    behaviors = []#交互行为列表
    events=[]#状态执行事件列表
    i = 1
    # print("lines[1:-1]")
    # print(lines[1:-1])
    # print(lines)
    #遍历Behaviors中的每行，分割出每个behavior和时间约束
    for line in lines[1:-1]:
        line = line.strip()
        # print(line.strip())
        #元素为behavior
        if line.startswith("<"):
            components = line.strip("<>;").split(",")
            if components[0].strip()==Name:#只有发送放为原子问题的行为behavior为一个基础状态，这里我们仅用数字标识状态，【1，2，3，4，5】
                # print("@@@@@@@@@@@@@@@@@@@@")
                # print(components[0].strip())
                # print(Name)
                atomicstates.append(str(i))
                #生成状态执行事件并添加到事件集中
                events.append(rule6(str(i),components[1].strip()))
                i = i + 1
            #记录所有行为，并重新以新的新式存储
            behavior = {
                "Sender": components[0].strip(),
                "Signal": components[1].strip(),
                "Receiver": components[2].strip()
            }
            behaviors.append(behavior)
        #元素为时间约束，将时间约束关键字压入状态栈内（atomicstates）
        elif keyjudge(line):
            atomicstates.append(line)
        #时间约束通常以{}标识其作用范围，我们需要找出每个约束的起始和结束位置，通过结束符}去匹配，比如目前栈内的元素为【1，2，时间约束关键字，3，4】
        elif line.startswith("}"):
            #1.元素出栈，直到元素为时间约束关键字
            poplist = []
            state = atomicstates.pop()
            while (state.isdigit()):
                poplist.append(state)
                state = atomicstates.pop()
            #2.由已出栈的元素可以确认改时间约束包含的范围
            startstate = poplist[-1]
            endstate = poplist[0]
            #3.用字典记录
            timeconstraint = {}
            #由于else是没有时间约束相关的描述需要特殊处理
            if not state.startswith("else"):
                timeconstraint["key"] = re.split(r'[\(\)]', state)[0]
                timeconstraint["constraint"] = re.split(r'[\(\)]', state)[1]
            else:
                timeconstraint["key"] = "else"
                timeconstraint["constraint"] = ""
            timeconstraint["endstate"] = endstate
            timeconstraint["startstate"] = startstate
            timeconstraints.append(timeconstraint)
            atomicstates = atomicstates + poplist[::-1]#把弹出栈的重新放回去
    return atomicstates,timeconstraints,behaviors,events