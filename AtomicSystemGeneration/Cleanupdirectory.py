# 陈琪
# @Time : 2023/4/12 9:17
# @Author : chenqi
# @File : Cleanupdirectory
# @Project : VhdlSimulation
import os
import re
import shutil
from collections import defaultdict
import json
from . import DataHandling

import os
import re
from collections import defaultdict
import json
def Cleandir(inputpath):
    for files in os.listdir(inputpath):
        path = os.path.join(inputpath, files)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)