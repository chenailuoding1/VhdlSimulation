# 陈琪
# @Time : 2024/3/15 20:43
# @Author : chenqi
# @File : AtomicCommponetBean
# @Project : VhdlSimulation
class AtomicCommponet:
    def __init__(self):
        self.Name =""#简写
        self.requirement=""
        self.AtomicName=""#原称
        self.Computing={
            "ComputingName": None,
            "Fx":None
        }
        self.Controller = {
            "ControllerName": None,
            "State": [],
            "Event": [],
            "Tran": [],
        }
        self.Connector_components = []
        self.Connector_devices = []
        self.Connector_datas= []
        self.Connector_controllers = []
    def PrintAtomic(self):
        print("self.Name", self.Name)
        print("self.AtomicName",self.AtomicName)
        print("self.Computing", self.Computing)
        print("self.Controller", self.Controller)
        print("self.Connector_components",self.Connector_components)
        print("self.Connector_datas", self.Connector_datas)
        print("self.Connector_devices", self.Connector_devices)
        print("self.Connector_controllers", self.Connector_controllers)
    def SetName(self,name):
        self.Name=name
    def GetName(self):
        return  self.Name
    def SetRequirement(self,requirement):
        self.requirement=requirement
    def GetRequirement(self):
        return  self.requirement
    def SetAtomicName(self,name):
        self.AtomicName=name
    def GetAtomicName(self):
        return  self.AtomicName

    def SetComputing(self,name,fx):
        self.Computing["ComputingName"]= name
        self.Computing["Fx"] = fx
    def GetComputing(self):
        return  self.Computing

    def GetController(self):
        return  self.Controller
    def SetControllerName(self,name):
        self.Controller["ControllerName"] = name

    def SetControllerState(self,state):
        self.Controller["State"].append(state)

    def SetControllerStates(self,states):
        self.Controller["State"]=self.Controller["State"]+states
    def SetControllerEvent(self,event):
        self.Controller["Event"].append(event)

    def SetControllerTran(self,tran):
        self.Controller["Tran"].append(tran)


    def GetConnector_components(self):
        return  self.Connector_components
    def SetConnector_components(self,connector):
        self.Connector_components.append(connector)

    def GetConnector_devices(self):
        return  self.Connector_devices
    def SetConnector_devices(self,connector):
        self.Connector_devices.append(connector)

    def GetConnector_datas(self):
        return  self.Connector_datas
    def SetConnector_datas(self,connector):
        self.Connector_datas.append(connector)

    def GetConnector_controllers(self):
        return  self.Connector_controllers
    def SetConnector_controllers(self,connector):
        self.Connector_controllers.append(connector)