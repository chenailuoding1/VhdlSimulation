# 陈琪
# @Time : 2023/4/17 16:04
# @Author : chenqi
# @File : DealFunction
# @Project : VhdlSimulation
import os
import re
from collections import defaultdict
import json
import AtomicSystemGeneration as at
def separate_specification_file(inputpath):
    # at.Cleanupdirectory.Cleandir("./DependencySpecification/")
    # at.Cleanupdirectory.Cleandir("./Domain/")
    # at.Cleanupdirectory.Cleandir("./AtomSpecification/")
    with open(inputpath, "r") as infile:
        data = infile.read()
        parts = data.split("####")
        with open("./DependencySpecification/RootDependency.txt", "w") as outfile1:
            outfile1.write(parts[0].strip("\n"))
        with open("./DependencySpecification/NonLeafDependency.txt", "w") as outfile2:
            outfile2.write(parts[1].strip("\n"))
        with open("./Domain/Domain.txt", "w") as outfile3:
            outfile3.write(parts[2].strip("\n"))
        i=1
        for subpart in parts[3].split("}"):
            if(subpart.rstrip().lstrip()!=""):
                with open("./AtomSpecification/"+str(i)+".txt", "w") as outfile4:
                    outfile4.write(subpart.strip("\n"))
                    outfile4.write("\n}")
                i=i+1

