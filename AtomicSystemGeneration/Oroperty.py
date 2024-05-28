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
import sys
from io import StringIO
def portdetect():
    with open('./Extractionjson/abbrnamedict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典
    abbrnamesdict = json.loads(data)
    with open('./Extractionjson/biddable_domain_dict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典
    biddable_domain_dict = json.loads(data)
    with open('./Extractionjson/causal_domain_dict.json', 'r') as f:
        data = f.read()
    # 将JSON字符串转换为Python字典
    causal_domain_dict = json.loads(data)

    # 该系统包含的所有IP
    print(abbrnamesdict.values())
    rootname = list(abbrnamesdict.values())[0]
    # 物理设备
    cadomainname = []
    cadomainpath = []
    # 地面中心
    bidomainname = []
    bidomainpath = []
    # 外设存放路径
    carootdomainpath = "./AtomicSystemGeneration/DomainProject/causal_domain/"
    # 地面计算机存放路径
    birootdomainpath = "./AtomicSystemGeneration/DomainProject/biddable_domain/"
    # 转换为简写
    # 分系统
    subsystemname = []
    subsystempath = []
    # 分系统存放路径
    subpath = "./AtomicSystemGeneration/SubSystemProject/"
    ##确定整个系统IP compoent文件地址
    for filename in os.listdir(subpath):

        if filename == rootname:
            print("成功filename " + filename)
            subsystemname.append(rootname)
            subsystempath.append(subpath + filename + "/component.xml")
        else:
            print("失败filename " + filename + rootname)
    ##确定因果域IP compoent文件地址
    for filename in os.listdir(carootdomainpath):
        if filename in causal_domain_dict.keys():
            cadomainname.append(filename)
            cadomainpath.append(carootdomainpath + filename + "/component.xml")
    ##确定自主域IP compoent文件地址
    for filename in os.listdir(birootdomainpath):
        if filename in biddable_domain_dict.keys():
            bidomainname.append(filename)
            bidomainpath.append(birootdomainpath + filename + "/component.xml")
    print(bidomainpath)
    ips = []
    pldomainips = []
    ips_portlist = {}
    port_rst_name = []
    port_clk_name = []
    ###确定系统名称
    sysname = ''
    if os.path.exists(subsystempath[0]):
        doc = minidom.parse(subsystempath[0])
        sysname = doc.getElementsByTagName("spirit:name")[0].firstChild.data


    ##确定哪些设备需要连接ret和clk
    domain_ips = []
    for path in list((set(bidomainpath).union(set(cadomainpath)))):
        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            # print("ip_name:%s" % (ip_name.firstChild.data))
            domain_ips.append(ip_name.firstChild.data)
    ips_portlist = {}
    for path in list((set(subsystempath).union(set(bidomainpath))).union(set(cadomainpath))):

        if os.path.exists(path):
            doc = minidom.parse(path)
            ip_name = doc.getElementsByTagName("spirit:name")[0]
            # print("ip_name:%s" % (ip_name.firstChild.data))

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


    sys_port_out = ips_portlist.get(sysname).get('port_out')  # 获得IP核的输出端口数组
    sys_port_in = ips_portlist.get(sysname).get('port_in')
    # print(domain_ips)
    error_name = []
    for sys_port_out_name in sys_port_out:  # 遍历输出端口列表找该分系统中同名的输入端口
        flag = False
        for j in range(0, len(domain_ips)):
            port_in = ips_portlist.get(domain_ips[j]).get('port_in')
            for port_in_name in port_in:
                # connectport函数能够清理掉端口带有的前缀和后缀
                if (DataHandling.connectport(sys_port_out_name) == DataHandling.connectport(port_in_name)):

                    flag = True
                    # print("输出：" + DataHandling.connectport(port_out_name) + "输入" + DataHandling.connectport(
                    #     port_in_name))
                # else:
                #     # print("输出："+DataHandling.connectport(port_out_name)+"输入"+DataHandling.connectport(port_in_name))

                # print(ips[i]+'_0/'+port_name+ips[j]+'_0/'+port_name)
        if not flag:
            error_name.append(sys_port_out_name)
    for sys_port_in_name in sys_port_in:  # 遍历输出端口列表找该分系统中同名的输出端口
        flag = False
        for j in range(0, len(domain_ips)):
            port_out = ips_portlist.get(domain_ips[j]).get('port_out')
            for port_out_name in port_out:
                # connectport函数能够清理掉端口带有的前缀和后缀
                if (DataHandling.connectport(sys_port_in_name) == DataHandling.connectport(port_out_name)):

                    flag = True
                    # print("输出：" + DataHandling.connectport(port_out_name) + "输入" + DataHandling.connectport(
                    #     port_in_name))
                # else:
                #     # print("输出："+DataHandling.connectport(port_out_name)+"输入"+DataHandling.connectport(port_in_name))

                # print(ips[i]+'_0/'+port_name+ips[j]+'_0/'+port_name)
        if not flag and DataHandling.systemportclean(str(sys_port_in_name)) != "rst" and DataHandling.systemportclean(
                str(sys_port_in_name)) != "clk":
            error_name.append(sys_port_in_name)

    if len(error_name)>0:
        message="接口一致性验证失败！需求规约中多余的需求交互如下："
        portstr=""
        for portname in error_name:
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
def runsim():

    # Vivado安装目录和TCL脚本文件路径
    vivado_path = "E:/Xilinx/Vivado/2021.1/bin/vivado.bat"
    # 获取当前工作目录

    # 要处理的文件夹名称
    inputpath = "./AtomicSystemGeneration/AtomSystemTest/"
    outpath="./AtomicSystemGeneration/AtomSystemProject"
    # 先清理輸出目录

    # folderpath = os.path.join(inputpath, foldername.split(".")[0])
    # 先清理该目录
    # 打开tcl脚本文件以写入模式
    tcl_script_path = "./AtomicSystemGeneration/AtomSystemGenerateTcl/allsys.tcl"
    tcl_file = open(tcl_script_path, "w")
    # 写入tcl命令以创建新项目和设计文件

    tcl_file.write("start_gui\n")

    tcl_file.write("open_project F:/vhdl/atom/all/sunsys/sunsys.xpr\n")

    tcl_file.write("update_compile_order -fileset sources_1\n")

    tcl_file.write("launch_simulation\n")
    # tcl_file.write("open_wave_config F:/vhdl/suntest/tb_test_behav.wcfg\n")
    # tcl_file.write("source tb_test.tcl\n")
    tcl_file.write("open_vcd\n")
    tcl_file.write("log_vcd /\n")
    tcl_file.write("run 5s\n")
    # tcl_file.write("current_wave_config {tb_test_behav.wcfg}\n")
    # tcl_file.write("add_wave {{/tb_test/testsun/DA14_0}} \n")
    # tcl_file.write("relaunch_sim\n")
    #
    # tcl_file.write(
    #     "ipx::package_project -root_dir " + projectpath + " xilinx.com -library user -taxonomy /UserIP \n")
    # # 关闭tcl脚本文件
    tcl_file.close()
    # 使用os模块调用Vivado并运行创建的tcl脚本
    # os.system(vivado_path + " -mode batch -source " + tcl_script_path)
    # result = subprocess.run(
    #     [vivado_path, "-mode", "batch", "-source", tcl_script_path],
    #     stdout=subprocess.PIPE,
    #     stderr=subprocess.PIPE,
    #     text=True
    # )
    subprocess.run([vivado_path, "-nolog","-mode", "batch", "-source", tcl_script_path])

portdetect()