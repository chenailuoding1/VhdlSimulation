# 陈琪
# @Time : 2024/3/15 21:00
# @Author : chenqi
# @File : DeviceBean
# @Project : VhdlSimulation
# 陈琪
# @Time : 2024/3/15 20:58
# @Author : chenqi
# @File : StorageBean
# @Project : VhdlSimulation
# 陈琪
# @Time : 2024/3/15 20:56
# @Author : chenqi
# @File : Storage
# @Project : VhdlSimulation
class Device:
    def __init__(self):
        self.Type = ""
        self.Name = ""
        self.DeviceName=""
        self.Connector_devices=[]
        self.StateMachine = {
            "Event": [],
            "State": [],
            "Tran": []
        }
    def SetName(self,name):
        self.Name=name
    def GetName(self):
        return self.Name
    def SetDeviceName(self,name):
        self.DeviceName=name
    def GetDeviceName(self):
        return self.DevicesName
    def SetType(self,type):
        self.Type=type
    def GetType(self):
        return self.Type

    def GetConnector_devices(self):
        return self.Connector_devices
    def SetConnector_devices(self, connector):
        self.Connector_devices.append(connector)
    def GetStateMachine(self):
        return self.StateMachine

    def SetStateMachine_Event(self, event):
        self.StateMachine["Event"].append(event)

    def SetStateMachine_State(self, state):
        self.StateMachine["State"].append(state)

    def SetStateMachine_Tran(self, tran):
        self.StateMachine["Tran"].append(tran)
    def PrintAtomic(self):
        print("self.Name",self.Name)
        print("self.DeviceName", self.DeviceName)
        print("self.Type", self.Type)
        print("self.Connector_devices", self.Connector_devices)