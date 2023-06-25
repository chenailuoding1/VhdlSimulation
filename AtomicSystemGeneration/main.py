# 陈琪
# @Time : 2023/4/11 17:12
# @Author : chenqi
# @File : main
# @Project : VhdlSimulation
import os
import re
from collections import defaultdict
import json
# import AtomicSystemGeneration
# import DataExtraction
# import GenerateAtomsystemVhdl
# import GenerateDomainVhdl
# import GenerateProject
# import SystemTree
# import DataHandling
# import AbbrName
# import GenerateRootDependency
# import GenerateNonLeafDependency
# import Assemble
# import Cleanupdirectory
from zipfile import ZipFile

folder_path = './AtomSpecification/AtomSystemVhdl/AD18'  # 传递的文件夹路径
zip_name = 'AD18.zip'  # 压缩文件名

# 生成压缩包
with ZipFile(zip_name, 'w') as zip:
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            # 检查文件名是否以 .vhd 或者 .vhdl 结尾
            if file.endswith('.vhd') or file.endswith('.vhdl'):
                # 将文件添加到压缩包
                zip.write(os.path.join(root, file), arcname=file)
# DataExtraction.extractatomspecification("../Domain/domain.txt","../AtomSpecification")
# GenerateAtomsystemVhdl.Generate_atomsystem_vhdl("../Extractionjson/insysdict_atomsys.json")
# GenerateDomainVhdl.Generate_C_Domain_vhdl("../Extractionjson/causal_domain_dict.json","DomainVhdl/causal_domain")
# GenerateDomainVhdl.Generate_B_Domain_vhdl("../Extractionjson/biddable_domain_dict.json","DomainVhdl/biddable_domain")
# GenerateDomainVhdl.Generate_PL_Domain_vhdl("../Extractionjson/physical_lexical_domain_dict.json","DomainVhdl/physical_lexical_domain")
# GenerateProject.Generate_atomsystem_project()
# # GenerateProject.Generate_domain_project()
# DataHandling.clean_txt('../DependencySpecification/RootDependency.txt', '../DependencySpecification/RootDependency_temp.txt')
# DataHandling.clean_txt('../DependencySpecification/NonLeafDependency.txt','../DependencySpecification/NonLeafDependency_temp.txt')
# SystemTree.creattree("../DependencySpecification/RootDependency_temp.txt","../DependencySpecification/NonLeafDependency_temp.txt")
# # Cleanupdirectory.Cleandir()
# AbbrName.abbrsystemname()
# # GenerateRootDependency.Generaterootvhdl()
# # GenerateNonLeafDependency.GenerateNonLeafvhdl()
# # GenerateProject.Generate_dependency_project()
# Assemble.GenerateAssembleTcl()
#
