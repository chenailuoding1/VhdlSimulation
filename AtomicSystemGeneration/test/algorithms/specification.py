# 陈琪
# @Time : 2024/2/16 19:50
# @Author : chenqi
# @File : test.py
# @Project : VhdlSimulation
from AtomicSystemGeneration.test.algorithms.AtomicCommponetBean import AtomicCommponet
from AtomicSystemGeneration.test.algorithms.ComControllerBean import ComController
from AtomicSystemGeneration.test.algorithms.DeviceBean import Device
from AtomicSystemGeneration.test.algorithms.StorageBean import Storage

# rootdir="../Data/AtomicProblem/"
# Connects=[]
# NameHash=[]
# dependencyconnects=[]#依赖树
# comcontroller_path="../Data/Dependency/"
#
# declarationpath="../Data/Declaration/Declaration.txt"
# from AtomicSystemGeneration.test.algorithms.Mapping_construct import *3
# wtext=""
# with open("sp.txt",'a+') as writefile:
#     for filepath in os.listdir(rootdir):
#         path = os.path.join(rootdir, filepath)
#         with open(path,"r") as readfile1:
#             wtext+="###\n"+"".join(readfile1.readlines())+"\n###\n"
#     for filepath in os.listdir(comcontroller_path):
#         path = os.path.join(comcontroller_path, filepath)
#         with open(path,"r") as readfile2:
#             wtext+="@@@\n"+"".join(readfile2.readlines())+"\n@@@\n"
#     with open(declarationpath, "r") as readfile3:
#         wtext += "&&&\n" + "".join(readfile3.readlines()) + "\n&&&\n"
#     writefile.writelines(wtext)
import os
import os

def delete_files_in_directory(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
                print(f"Deleted file: {file_path}")
        except Exception as e:
            print(f'Failed to delete {file_path}. Reason: {e}')

# # 合并文件的路径
# combined_file_path = "c.txt"
# # 拆分文件存储的目录
# base_output_dir = "Specifiction_files"
def split_specifiction(combined_file_path,base_output_dir):
    # print(combined_file_path,base_output_dir)
    # 创建存储拆分文件的目录
    if not os.path.exists(base_output_dir):
        os.makedirs(base_output_dir)

    # 读取合并文件的内容
    with open(combined_file_path, "r", encoding="utf-8") as file:
        content = file.read()

    # 按不同的分隔符拆分内容
    # 按不同的分隔符拆分内容
    split_sections = {
        '###': content.split("###\n"),
        '@@@': content.split("@@@\n"),
        '&&&': content.split("&&&\n")
    }

    # 处理每个分隔符的内容
    for delimiter, parts in split_sections.items():
        # 创建对应的文件夹
        if delimiter =='###':
            output_dir = os.path.join(base_output_dir, "AtomicProblem")
        elif delimiter =='@@@':
            output_dir = os.path.join(base_output_dir, "Dependency")
        else:
            output_dir = os.path.join(base_output_dir, "Declaration")
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
        else:
            delete_files_in_directory(output_dir)
        # 删除空白部分并去除首尾换行符
        parts = [part.strip() for part in parts if part.strip()]

        # 保存每部分内容到单独的文件
        for i, part in enumerate(parts, 1):
            # 用第一行或编号生成文件名
            # print(part.find(list(split_sections.keys())[0]))
            if  part.find(list(split_sections.keys())[0])==-1 and  part.find(list(split_sections.keys())[1])==-1 and part.find(list(split_sections.keys())[2])==-1:

                file_path = os.path.join(output_dir, str(i)+".txt")
                # print(part)
                # 将内容写入新的文件
                with open(file_path, "w", encoding="utf-8") as output_file:
                    output_file.write(part)

    print("拆分完成，每个部分已保存到对应的文件夹。")





