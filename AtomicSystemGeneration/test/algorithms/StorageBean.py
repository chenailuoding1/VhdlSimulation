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
class Storage:
    def __init__(self):
        self.Name = ""
        self.Type = ""
        self.StorageName=""
        self.Connector_datas=[]
    def SetName(self,name):
        self.Name=name
    def GetName(self):
        return self.Name
    def SetType(self,type):
        self.Type=type
    def GetType(self):
        return self.Type
    def SetStorageName(self,name):
        self.StorageName=name
    def GetStorageName(self):
        return self.StorageName
    def GetConnector_datas(self):
        return self.Connector_datas
    def SetConnector_datas(self, connector):
        self.Connector_datas.append(connector)

    def PrintAtomic(self):
        print("self.Name", self.Name)
        print("self.StorageName", self.StorageName)
        print("self.Type", self.Type)
        print("self.Connector_datas", self.Connector_datas)