# 用于确定while循环所包含的内容，输入是一串字符
import os
import re
from collections import defaultdict
import json
from . import DataHandling
import os, shutil
import re
from collections import defaultdict
import json

from xml.dom import minidom
from . import SystemTree
vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
with open('./Extractionjson/abbrnamedict.json', 'r') as f:
    data = f.read()
# 将JSON字符串转换为Python字典
abbrnamesdict = json.loads(data)
def GenerateAssembleTcl():


    treedict = {}
    with open("./Extractionjson/systemtreedict.json", 'r') as f:
        data = f.read()
        # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    treedict = json.loads(data)
    tree = SystemTree.TreeNode.build_tree(treedict)
    print("tree:")
    SystemTree.TreeNode.post_tree(tree,list(treedict.keys()))

def Assemble_tcl(systemname: list):
    fensystemname=""

    # 原子系统存放路径
    atompath = "./AtomicSystemGeneration/AtomSystemProject/"
    # 分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"
    print(systemname)
    #获取原子系统存放路径下所有原子系统名称
    atomname=[]
    for filename in os.listdir(atompath):
        atomname.append(filename)
    #该分系统所包含的原子系统或分系统项目IP核路径
    ippath=[]

    for i in range(1, len(systemname)):
        #为原子系统
        if abbrnamesdict.get(systemname[i] ) in atomname:
            ippath.append(atompath+abbrnamesdict.get(systemname[i])+"/component.xml")
        #为分系统
        else:
            ippath.append(subpath + abbrnamesdict.get(systemname[i]) + "/component.xml")
    print("ippath" + str(ippath))
    ipsname = []
    port_rst_name = []
    port_clk_name = []
    port_done_name = []
    port_start_name = []
    for path in ippath:
        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            ipsname.append(ip_name.firstChild.data)  # 记录每个分系统所包含的所有IP核的名称
            # print("ip_name:%s" % (ip_name.firstChild.data))
            ports = doc.getElementsByTagName("spirit:port")
            # print(ports)
            # 记录系统固定端口名称
            for port in ports:
                name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
                # print(" name:%s, direction:%s" %
                #       (name.firstChild.data, direction.firstChild.data))
                print(DataHandling.systemportclean(str(name.firstChild.data)))
                if DataHandling.systemportclean(str(name.firstChild.data)) =="rst":  # 根据端口的方向 判断是输入还是输出
                    port_rst_name.append(ip_name.firstChild.data+"_0/"+str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) =="clk":
                    port_clk_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) == "done":
                    port_done_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) == "start":
                    port_start_name.append(ip_name.firstChild.data+ "_0/" + str(name.firstChild.data))


    print("ipname"+str(ipsname))
    #对应缩写的名称
    fensystemname=abbrnamesdict.get(systemname[0])
    #0.分系统存放路径
    rootippath="./AtomicSystemGeneration/SubSystemProject/"

    #1.生成分系统控制器名称列表的tcl命令
    controlnametcl="set f_sys_controlers"+" \""+fensystemname+"Dependency\""+"\n"
    #2.生成分系统bd文件名称列表的tcl命令
    bdnametcl="set f_sys_bdname"+" \""+fensystemname+"\""+"\n"
    #3.生成分系统bd文件打包路径列表的tcl命令
    wrapper=rootippath+fensystemname+"/"+fensystemname+".srcs/sources_1/bd/"+fensystemname+"/"+fensystemname+".bd"
    norecurse=rootippath+fensystemname+"/"+fensystemname+".gen/sources_1/bd/"+fensystemname+"/hdl/"+fensystemname+"_wrapper.vhd"
    ippackage=rootippath+fensystemname
    wrappertcl="set wrappers"+" \""+wrapper+"\""+"\n"
    norecursetcl="set norecurses"+" \""+norecurse+"\""+"\n"
    ippackagetcl="set ippackages"+" \""+ippackage+"\""+"\n"
    #4.生成最终分系统存放路径tcl命令
    subsystempath="set ip_parent_path \""+rootippath+"\"\n"
    #5.生成系统端口tcl命令

    portclktcl="set f_clk_portname [split"+" \""
    for i in range(0,len(port_clk_name)):
        if i!=len(port_clk_name)-1:
            portclktcl=portclktcl+port_clk_name[i]+","
        else:
            portclktcl=portclktcl+port_clk_name[i]
    portclktcl=portclktcl+"\" \",\"]"+"\n"

    portrsttcl = "set f_rst_portname [split" + " \""
    for i in range(0, len(port_rst_name)):
        if i != len(port_rst_name) - 1:
            portrsttcl = portrsttcl + port_rst_name[i] + ","
        else:
            portrsttcl = portrsttcl + port_rst_name[i]
    portrsttcl = portrsttcl + "\" \",\"]" + "\n"

    portstarttcl = "set f_start_portname [split" + " \""
    for i in range(0, len(port_start_name)):
        if i != len(port_start_name) - 1:
            portstarttcl = portstarttcl + port_start_name[i] + ","
        else:
            portstarttcl = portstarttcl + port_start_name[i]
    portstarttcl = portstarttcl + "\" \",\"]" + "\n"

    portdonetcl = "set f_done_portname [split" + " \""
    for i in range(0, len(port_done_name)):
        if i != len(port_done_name) - 1:
            portdonetcl = portdonetcl + port_done_name[i] + ","
        else:
            portdonetcl = portdonetcl + port_done_name[i]
    portdonetcl = portdonetcl + "\" \",\"]" + "\n"
    # 6.获取该分系统内的IP核名称并生成tcl命令
    allsystempath = "set allsystempath \"" + "./AtomicSystemGeneration" + "\"\n"
    ipnametcl = "set f_sys_ipname [split" + " \""
    for i in range(0, len(ipsname)):
        if i != len(ipsname) - 1:
            ipnametcl = ipnametcl + ipsname[i] + ","
        else:
            ipnametcl = ipnametcl + ipsname[i]
    ipnametcl = ipnametcl + "\" \",\"]" + "\n"
    #将上述tcl命令写入到test.tcl文件中
    tclname="./AtomicSystemGeneration/AssmbleTcl/"+fensystemname+".tcl"
    with open(tclname, 'w') as file_object:
        file_object.write(ipnametcl)
        file_object.write(portclktcl)
        file_object.write(portrsttcl)
        file_object.write(portdonetcl)
        file_object.write(portstarttcl)
        file_object.write(wrappertcl)
        file_object.write(norecursetcl)
        file_object.write(ippackagetcl)
        file_object.write(bdnametcl)
        file_object.write(controlnametcl)
        file_object.write(subsystempath)
        file_object.write(allsystempath)
        with open("./AtomicSystemGeneration/Template/systemassembletemplate/assemble.txt", 'r', encoding='utf-8') as infile:
            for line in infile:
                file_object.writelines(line)
                file_object.write('\n')
    os.system(vivado_path + " -mode batch -source " + tclname)
    #         subprocess.run([vivado_path, "-mode", "batch", "-source", tcl_script_path])
    #         tcl_start_path="tcl/atomtcl/"+foldername+"start.tcl"
    #         tcl_start_file = open(tcl_start_path, "w")
    #         tcl_start_file.write("start_gui\n")
    #         tcl_start_file.write("open_project "+projectpath+"/"+foldername+".xpr\n")
    #         tcl_start_file.write("ipx::package_project -root_dir "+projectpath+" xilinx.com -library user -taxonomy /UserIP \n")
    #         tcl_start_file.write("catch {close_waves}\n")
    #         tcl_start_file.write("catch {close_sim}\n")
    #         tcl_start_file.write("catch {close_project}\n")
    #         tcl_start_file.write("exit\n")
    #         tcl_start_file.close()

    #         os.system(vivado_path + " -mode batch -source "+tcl_start_path)
    # 打印成功消息
    print("Subsystem Assemble created successfully.")

def ConnectSystem(systemname: list):
    print(systemname)
    #该系统包含的所有IP
    ipname=[]
    #分系统
    subsystemname = []
    subsystempath = []
    #原子系统
    atomsystemname = []
    atomsystempath = []
    # 数据存储
    pldomainname = []
    pldomainpath = []
    #分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"
    #原子系统存放路径
    atompath = "./AtomicSystemGeneration/AtomSystemProject/"
    # 数据存储存放路径
    domainpath = "./AtomicSystemGeneration/DomainProject/physical_lexical_domain/"
    #转换为简写
    for i in range(1,len(systemname)):
        ipname.append(abbrnamesdict.get(systemname[i]))
    for filename in os.listdir(domainpath):
        pldomainname.append(filename)
        pldomainpath.append(domainpath+filename+"/component.xml")
    for filename in os.listdir(subpath):
        if filename in ipname:
            subsystemname.append(filename)
            subsystempath.append(subpath+filename+"/component.xml")
    for name in (list(set(ipname)-set(subsystemname))):
        atomsystempath.append(atompath + name+"/component.xml")
    print(subsystempath)
    print(atomsystempath)
    print(pldomainpath)
    ips=[]
    pldomainips=[]
    ips_portlist={}
    for path in list((set(subsystempath).union(set(atomsystempath))).union(set(pldomainpath))):

        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            # print("ip_name:%s" % (ip_name.firstChild.data))
            ips.append(ip_name.firstChild.data)  # 记录每个分系统所包含的所有IP核的名称
            if path in pldomainpath:
                pldomainips.append(ip_name.firstChild.data)
            ports = doc.getElementsByTagName("spirit:port")
            # print(ports)
            port_in = []  # 记录IP核所有的输入端口名称
            port_out = []  # 记录IP核所有的输出端口名称
            for port in ports:
                name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
                direction = port.getElementsByTagName("spirit:direction")[0]  # 端口方向
                # print(" name:%s, direction:%s" %
                #       (name.firstChild.data, direction.firstChild.data))
                if direction.firstChild.data == "in":  # 根据端口的方向 判断是输入还是输出
                    port_in.append(name.firstChild.data)
                else:
                    port_out.append(name.firstChild.data)
            portlist = {}
            portlist["port_in"] = port_in
            portlist["port_out"] = port_out
            # print(portlist)
            ips_portlist[ip_name.firstChild.data] = portlist
    # print(ips_portlist)
    print(ips)
    net_connect = {}  # 记录分系统内哪些端口需要相连，key代表输入端口，value代表输出端口
    for i in range(0, len(ips)):  # 遍历分系统内所有的IP核
        port_out = ips_portlist.get(ips[i]).get('port_out')  # 获得IP核的输出端口数组
        # print(port_out)
        # print(ips_portlist.get(ips[i]))
        for port_out_name in port_out:  # 遍历输出端口列表找该分系统中同名的输入端口

            for j in range(0, len(ips)):  # 遍历分系统IP得到输入端口列表
                if ips[i] in pldomainips:#如果时数据存储的IP,其不能进行自连
                    if j!=i:
                        port_in = ips_portlist.get(ips[j]).get('port_in')
                        for port_in_name in port_in:
                            #connectport函数能够清理掉端口带有的前缀和后缀
                            if ( DataHandling.connectport(port_out_name)== DataHandling.connectport(port_in_name)):
                                net_connect[ips[j] + '_0/' + port_in_name] = ips[i] + '_0/' + port_out_name
                            else:
                                print("输出："+DataHandling.connectport(port_out_name)+"输入"+DataHandling.connectport(port_in_name))
                else:
                    port_in = ips_portlist.get(ips[j]).get('port_in')
                    for port_in_name in port_in:
                        # connectport函数能够清理掉端口带有的前缀和后缀
                        if (DataHandling.connectport(port_out_name) == DataHandling.connectport(port_in_name)):
                            net_connect[ips[j] + '_0/' + port_in_name] = ips[i] + '_0/' + port_out_name
                        else:
                            print("输出：" + DataHandling.connectport(port_out_name) + "输入" + DataHandling.connectport(
                                port_in_name))
                        # print(ips[i]+'_0/'+port_name+ips[j]+'_0/'+port_name)
    print(net_connect)

    # 原子系统存放路径
    atompath = "./AtomicSystemGeneration/AtomSystemProject/"
    # 分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"
    print(systemname)
    # 获取原子系统存放路径下所有原子系统名称
    atomname = []
    for filename in os.listdir(atompath):
        atomname.append(filename)
    # 该分系统所包含的原子系统或分系统项目IP核路径
    ippath = []

    for i in range(1, len(systemname)):
        # 为原子系统
        if abbrnamesdict.get(systemname[i]) in atomname:
            ippath.append(atompath + abbrnamesdict.get(systemname[i]) + "/component.xml")
        # 为分系统
        else:
            ippath.append(subpath + abbrnamesdict.get(systemname[i]) + "/component.xml")
    print("ippath" + str(ippath))
    ipsname = []
    port_rst_name = []
    port_clk_name = []
    port_done_name = []
    port_start_name = []
    for path in ippath:
        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            ipsname.append(ip_name.firstChild.data)  # 记录每个分系统所包含的所有IP核的名称
            # print("ip_name:%s" % (ip_name.firstChild.data))
            ports = doc.getElementsByTagName("spirit:port")
            # print(ports)
            # 记录系统固定端口名称
            for port in ports:
                name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
                # print(" name:%s, direction:%s" %
                #       (name.firstChild.data, direction.firstChild.data))
                print(DataHandling.systemportclean(str(name.firstChild.data)))
                if DataHandling.systemportclean(str(name.firstChild.data)) == "rst":  # 根据端口的方向 判断是输入还是输出
                    port_rst_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) == "clk":
                    port_clk_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) == "done":
                    port_done_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))
                elif DataHandling.systemportclean(str(name.firstChild.data)) == "start":
                    port_start_name.append(ip_name.firstChild.data + "_0/" + str(name.firstChild.data))

    print("ipname" + str(ipsname))
    # 对应缩写的名称
    fensystemname = abbrnamesdict.get(systemname[0])
    # 0.分系统存放路径
    rootippath = "./AtomicSystemGeneration/SubSystemProject/"

    # 1.生成分系统控制器名称列表的tcl命令
    controlnametcl = "set f_sys_controlers" + " \"" + fensystemname + "Dependency\"" + "\n"
    # 2.生成分系统bd文件名称列表的tcl命令
    bdnametcl = "set f_sys_bdname" + " \"" + fensystemname + "\"" + "\n"
    # 3.生成分系统bd文件打包路径列表的tcl命令
    wrapper = rootippath + fensystemname + "/" + fensystemname + ".srcs/sources_1/bd/" + fensystemname + "/" + fensystemname + ".bd"
    norecurse = rootippath + fensystemname + "/" + fensystemname + ".gen/sources_1/bd/" + fensystemname + "/hdl/" + fensystemname + "_wrapper.vhd"
    ippackage = rootippath + fensystemname
    wrappertcl = "set wrappers" + " \"" + wrapper + "\"" + "\n"
    norecursetcl = "set norecurses" + " \"" + norecurse + "\"" + "\n"
    ippackagetcl = "set ippackages" + " \"" + ippackage + "\"" + "\n"
    # 4.生成最终分系统存放路径tcl命令
    subsystempath = "set ip_parent_path \"" + rootippath + "\"\n"
    # 5.生成系统端口tcl命令

    portclktcl = "set f_clk_portname [split" + " \""
    for i in range(0, len(port_clk_name)):
        if i != len(port_clk_name) - 1:
            portclktcl = portclktcl + port_clk_name[i] + ","
        else:
            portclktcl = portclktcl + port_clk_name[i]
    portclktcl = portclktcl + "\" \",\"]" + "\n"

    portrsttcl = "set f_rst_portname [split" + " \""
    for i in range(0, len(port_rst_name)):
        if i != len(port_rst_name) - 1:
            portrsttcl = portrsttcl + port_rst_name[i] + ","
        else:
            portrsttcl = portrsttcl + port_rst_name[i]
    portrsttcl = portrsttcl + "\" \",\"]" + "\n"

    portstarttcl = "set f_start_portname [split" + " \""
    for i in range(0, len(port_start_name)):
        if i != len(port_start_name) - 1:
            portstarttcl = portstarttcl + port_start_name[i] + ","
        else:
            portstarttcl = portstarttcl + port_start_name[i]
    portstarttcl = portstarttcl + "\" \",\"]" + "\n"

    portdonetcl = "set f_done_portname [split" + " \""
    for i in range(0, len(port_done_name)):
        if i != len(port_done_name) - 1:
            portdonetcl = portdonetcl + port_done_name[i] + ","
        else:
            portdonetcl = portdonetcl + port_done_name[i]
    portdonetcl = portdonetcl + "\" \",\"]" + "\n"
    # 6.获取该分系统内的系统IP核名称并生成tcl命令
    allsystempath = "set allsystempath \"" + "./AtomicSystemGeneration" + "\"\n"
    ipnametcl = "set f_sys_ipname [split" + " \""
    for i in range(0, len(ipsname)):
        if i != len(ipsname) - 1:
            ipnametcl = ipnametcl + ipsname[i] + ","
        else:
            ipnametcl = ipnametcl + ipsname[i]
    ipnametcl = ipnametcl + "\" \",\"]" + "\n"
    # 7.获取该分系统内的所有IP核（包括数据存储）名称并生成tcl命令
    allipnametcl = "set f_all_ipname [split" + " \""
    for i in range(0, len(ips)):
        if i != len(ips) - 1:
            allipnametcl = allipnametcl + ips[i] + ","
        else:
            allipnametcl = allipnametcl + ips[i]
    allipnametcl = allipnametcl + "\" \",\"]" + "\n"
    #8.需要连接的端口
    net_connect_tcl = "set netconnect \""
    for item in net_connect.items():
        net_connect_tcl = net_connect_tcl + item[0] + " " + item[1] + " "
    net_connect_tcl = net_connect_tcl + "\"" + "\n"
    # 将上述tcl命令写入到test.tcl文件中
    tclname = "./AtomicSystemGeneration/AssmbleTcl/" + fensystemname + ".tcl"
    with open(tclname, 'w') as file_object:
        file_object.write(net_connect_tcl)
        file_object.write(ipnametcl)
        file_object.write(allipnametcl)
        file_object.write(portclktcl)
        file_object.write(portrsttcl)
        file_object.write(portdonetcl)
        file_object.write(portstarttcl)
        file_object.write(wrappertcl)
        file_object.write(norecursetcl)
        file_object.write(ippackagetcl)
        file_object.write(bdnametcl)
        file_object.write(controlnametcl)
        file_object.write(subsystempath)
        file_object.write(allsystempath)
        with open("./AtomicSystemGeneration/Template/systemassembletemplate/connect.txt", 'r',
                  encoding='utf-8') as infile:
            for line in infile:
                file_object.writelines(line)
                file_object.write('\n')
    os.system(vivado_path + " -mode batch -source " + tclname)

def Connectshebei(systemname: list):
    print(systemname)
    #该系统包含的所有IP

    rootname=abbrnamesdict.get(systemname[0])
    #物理设备
    cadomainname = []
    cadomainpath = []
    # 地面中心
    bidomainname = []
    bidomainpath = []
    #分系统存放路径
    carootdomainpath = "./AtomicSystemGeneration/DomainProject/causal_domain/"
    # 数据存储存放路径
    birootdomainpath = "./AtomicSystemGeneration/DomainProject/biddable_domain/"
    #转换为简写
    # 分系统
    subsystemname = []
    subsystempath = []
    # 分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"

    for filename in os.listdir(subpath):

        if filename == rootname:
            print("成功filename "+filename )
            subsystemname.append(rootname)
            subsystempath.append(subpath+filename+"/component.xml")
        else:
            print("失败filename " + filename+rootname)
    for filename in os.listdir(carootdomainpath):
        cadomainname.append(filename)
        cadomainpath.append(carootdomainpath+filename+"/component.xml")
    for filename in os.listdir(birootdomainpath):
        bidomainname.append(filename)
        bidomainpath.append(birootdomainpath+filename+"/component.xml")
    print(bidomainpath)
    ips=[]
    pldomainips=[]
    ips_portlist={}
    for path in list((set(bidomainpath).union(set(cadomainpath).union(set(subsystempath))))):

        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            # print("ip_name:%s" % (ip_name.firstChild.data))
            ips.append(ip_name.firstChild.data)  # 记录每个分系统所包含的所有IP核的名称

            ports = doc.getElementsByTagName("spirit:port")
            # print(ports)
            port_in = []  # 记录IP核所有的输入端口名称
            port_out = []  # 记录IP核所有的输出端口名称
            for port in ports:
                name = port.getElementsByTagName("spirit:name")[0]  # 端口名称
                direction = port.getElementsByTagName("spirit:direction")[0]  # 端口方向
                # print(" name:%s, direction:%s" %
                #       (name.firstChild.data, direction.firstChild.data))
                if direction.firstChild.data == "in":  # 根据端口的方向 判断是输入还是输出
                    port_in.append(name.firstChild.data)
                else:
                    port_out.append(name.firstChild.data)
            portlist = {}
            portlist["port_in"] = port_in
            portlist["port_out"] = port_out
            # print(portlist)
            ips_portlist[ip_name.firstChild.data] = portlist
    # print(ips_portlist)
    print(ips)
    net_connect = {}  # 记录分系统内哪些端口需要相连，key代表输入端口，value代表输出端口
    for i in range(0, len(ips)):  # 遍历分系统内所有的IP核
        port_out = ips_portlist.get(ips[i]).get('port_out')  # 获得IP核的输出端口数组
        # print(port_out)
        # print(ips_portlist.get(ips[i]))
        for port_out_name in port_out:  # 遍历输出端口列表找该分系统中同名的输入端口

            for j in range(0, len(ips)):  # 遍历分系统IP得到输入端口列表

                if j!=i:
                    port_in = ips_portlist.get(ips[j]).get('port_in')
                    for port_in_name in port_in:
                        #connectport函数能够清理掉端口带有的前缀和后缀
                        if ( DataHandling.connectport(port_out_name)== DataHandling.connectport(port_in_name)):
                            net_connect[ips[j] + '_0/' + port_in_name] = ips[i] + '_0/' + port_out_name
                        else:
                            print("输出："+DataHandling.connectport(port_out_name)+"输入"+DataHandling.connectport(port_in_name))

                        # print(ips[i]+'_0/'+port_name+ips[j]+'_0/'+port_name)
    print(net_connect)
    # 原子系统存放路径
    atompath = "./AtomicSystemGeneration/AtomSystemProject/"
    # 分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"


    # 该分系统所包含的原子系统或分系统项目IP核路径

    # 对应缩写的名称
    fensystemname = abbrnamesdict.get(systemname[0])+"all"
    # 0.分系统存放路径
    rootippath = "./AtomicSystemGeneration/SystemProject/"

    # 2.生成分系统bd文件名称列表的tcl命令
    bdnametcl = "set f_sys_bdname" + " \"" + fensystemname + "\"" + "\n"
    # 3.生成分系统bd文件打包路径列表的tcl命令
    wrapper = rootippath + fensystemname + "/" + fensystemname + ".srcs/sources_1/bd/" + fensystemname + "/" + fensystemname + ".bd"
    norecurse = rootippath + fensystemname + "/" + fensystemname + ".gen/sources_1/bd/" + fensystemname + "/hdl/" + fensystemname + "_wrapper.vhd"
    ippackage = rootippath + fensystemname
    wrappertcl = "set wrappers" + " \"" + wrapper + "\"" + "\n"
    norecursetcl = "set norecurses" + " \"" + norecurse + "\"" + "\n"
    ippackagetcl = "set ippackages" + " \"" + ippackage + "\"" + "\n"
    # 4.生成最终分系统存放路径tcl命令
    subsystempath = "set ip_parent_path \"" + rootippath + "\"\n"
    # 5.生成系统端口tcl命令
    # 6.获取该分系统内的系统IP核名称并生成tcl命令
    allsystempath = "set allsystempath \"" + "./AtomicSystemGeneration" + "\"\n"

    # 7.获取该分系统内的所有IP核（包括数据存储）名称并生成tcl命令
    allipnametcl = "set f_all_ipname [split" + " \""
    for i in range(0, len(ips)):
        if i != len(ips) - 1:
            allipnametcl = allipnametcl + ips[i] + ","
        else:
            allipnametcl = allipnametcl + ips[i]
    allipnametcl = allipnametcl + "\" \",\"]" + "\n"
    #8.需要连接的端口
    net_connect_tcl = "set netconnect \""
    for item in net_connect.items():
        net_connect_tcl = net_connect_tcl + item[0] + " " + item[1] + " "
    net_connect_tcl = net_connect_tcl + "\"" + "\n"
    # 将上述tcl命令写入到test.tcl文件中
    tclname = "./AtomicSystemGeneration/AssmbleTcl/" + fensystemname + ".tcl"
    with open(tclname, 'w') as file_object:
        file_object.write(net_connect_tcl)

        file_object.write(allipnametcl)

        file_object.write(wrappertcl)
        file_object.write(norecursetcl)
        file_object.write(ippackagetcl)
        file_object.write(bdnametcl)

        file_object.write(subsystempath)
        file_object.write(allsystempath)
        with open("./AtomicSystemGeneration/Template/systemassembletemplate/shebei.txt", 'r',
                  encoding='utf-8') as infile:
            for line in infile:
                file_object.writelines(line)
                file_object.write('\n')
    os.system(vivado_path + " -mode batch -source " + tclname)
