# 陈琪
# @Time : 2024/3/15 20:44
# @Author : chenqi
# @File : ComControllerBean
# @Project : VhdlSimulation
class ComController:
    def __init__(self):
        self.ComControllerName = ""
        self.Connector_controllers = []
        self.SubController = {
            "Event": [],
            "State": [],
            "Tran": []
        }

    def SetName(self, name):
        self.ComControllerName = name

    def GetName(self):
        return self.ComControllerName

    def GetConnector_controllers(self):
        return self.Connector_controllers

    def SetConnector_controllers(self, connector):
        self.Connector_controllers.append(connector)

    def GetSubController(self):
        return self.SubController

    def SetSubController_Event(self, event):
        self.SubController["Event"].append(event)

    def SetSubController_State(self, state):
        self.SubController["State"].append(state)

    def SetSubController_Tran(self, tran):
        self.SubController["Tran"].append(tran)

    def PrintAtomic(self):
        print("self.Name", self.ComControllerName)
        print("self.SubController", self.SubController)
        print("self.Connector_controllers", self.Connector_controllers)