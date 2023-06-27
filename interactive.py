from flask import Flask, jsonify, render_template, request, send_file
from zipfile import ZipFile
import os
import re
from collections import defaultdict
import json
import DealFile.DealFunction
import AtomicSystemGeneration.atomtest
import AtomicSystemGeneration.DataExtraction
import AtomicSystemGeneration.GenerateAtomsystemVhdl
import AtomicSystemGeneration.GenerateDomainVhdl
import AtomicSystemGeneration.GenerateProject
import AtomicSystemGeneration.SystemTree
import AtomicSystemGeneration.DataHandling
import AtomicSystemGeneration.AbbrName
import AtomicSystemGeneration.GenerateRootDependency
import AtomicSystemGeneration.GenerateNonLeafDependency
import AtomicSystemGeneration.Assemble
import AtomicSystemGeneration.Cleanupdirectory
app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/api/upload_specification', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return "No file uploaded", 400
    try:
        file = request.files.get('file')
        savepath='Uploads/' + file.filename
        file.save(savepath)
        AtomicSystemGeneration.Cleanupdirectory.Cleandir("./DependencySpecification/")
        AtomicSystemGeneration.Cleanupdirectory.Cleandir("./Domain/")
        AtomicSystemGeneration.Cleanupdirectory.Cleandir("./AtomSpecification/")
        AtomicSystemGeneration.Cleanupdirectory.Cleandir("./Extractionjson/")
        DealFile.DealFunction.separate_specification_file(savepath)
        ##清洗文件,除去末尾的换行和空白行等
        AtomicSystemGeneration.DataHandling.clean_txt('./DependencySpecification/RootDependency.txt',
                               './DependencySpecification/RootDependency_temp.txt')
        AtomicSystemGeneration.DataHandling.clean_txt('./DependencySpecification/NonLeafDependency.txt',
                               './DependencySpecification/NonLeafDependency_temp.txt')
        ###如果系统比较大，原子系统间有依赖关系，需要构建系统树
        AtomicSystemGeneration.SystemTree.creattree("./DependencySpecification/RootDependency_temp.txt",
                             "./DependencySpecification/NonLeafDependency_temp.txt")
        ###为了符合Vhdl的命名规则以及防止有名称冲突，对名称进行简写以及防重处理
        AtomicSystemGeneration.AbbrName.abbrsystemname()
        AtomicSystemGeneration.DataExtraction.extractatomspecification("./Domain/domain.txt", "./AtomSpecification")
        AtomicSystemGeneration.GenerateAtomsystemVhdl.Generate_atomsystem_vhdl("./Extractionjson/insysdict_atomsys.json")
        # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./DependencySpecification/")
        # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./Domain/")
        # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./AtomSpecification/")
        # folder_path = '"./AtomSpecification/ComputerVhdl'  # 传递的文件夹路径
        # zip_name = 'ComputerComponent.zip'  # 压缩文件名
        # # 生成压缩包
        # with ZipFile(zip_name, 'w') as zip:
        #     for root, dirs, files in os.walk(folder_path):
        #         for file in files:
        #             zip.write(os.path.join(root, file))
        # tbtestdict = {}
        with open("./Extractionjson/tbtestdict.json", 'r') as f:
            data = f.read()
            # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
        tbtestdict = json.loads(data)
        computervhdl=[]
        computerpath="./AtomicSystemGeneration/ComputerVhdl"
        for filename in os.listdir(computerpath):
            computervhdldict={}
            inputpath = computerpath+"/"+filename
            with open(inputpath, "r") as infile:
                txt = infile.read()

            computervhdldict["filename"]=filename
            computervhdldict["txt"] = txt
            computervhdl.append(computervhdldict)
        data = {
            'message': 'VHDL Generate Successful!',
            'computervhdl': computervhdl,
            'tbtestdict':tbtestdict
        }
    except Exception:
        # 处理 ZeroDivisionError 异常
        print("原子系统抽取信息失败+！")
        data = {
            'message': 'VHDL Generate Fail!'

        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
@app.route('/api/downloadatomvhdl', methods=['POST'])
def download_dir():
    folder_path = './AtomicSystemGeneration/AtomSystemVhdl/'  # 传递的文件夹路径
    zip_name = 'AtomSystemVhdl.zip'  # 压缩文件名
    # 生成压缩包
    with ZipFile(zip_name, 'w') as zip:
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                zip.write(os.path.join(root, file))
    return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)

@app.route('/api/complete_computer', methods=['POST'])
def complete_computer():
    if 'file' not in request.files:
        return "No file uploaded", 400
    try:
        files = request.files.getlist('file')  # 获取名为 'file' 的文件字段的所有文件
        with open("./Extractionjson/computerdict.json", 'r') as f:
            data = f.read()
            # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
        computerdict = json.loads(data)

        for file in files:
            # 保存文件
            savepath = "./AtomicSystemGeneration/AtomSystemVhdl/" + computerdict.get(file.filename.split(".")[0]) + "/" + file.filename
            file.save(savepath)
        data = {
            'message': 'Computer Component Vhdl Complete Successful!'
        }
    except Exception:
        # 处理 ZeroDivisionError 异常
        print("计算机补全失败")
        data = {
            'message': 'Computer Component Vhdl Complete Fail!'
        }


    return jsonify(data)

@app.route('/api/complete_tb', methods=['POST'])
def complete_tb():
    data = request.get_json()
    filename=data.get('filename', '')
    txt = data.get('txt', '')
    # print(txt)
    with open("./Extractionjson/computerdict.json", 'r') as f:
        data = f.read()
        # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
    computerdict = json.loads(data)
    path="./AtomicSystemGeneration/AtomSystemVhdl/"+computerdict.get(filename.split(".")[0])+"/"+filename
    # print(path)
    with open(path, "w") as file:
        file.write(txt)

    return "Computer Component Vhdl Complete Successful!"
@app.route('/api/atomtest', methods=['POST'])
def atomtest():
    data = request.get_json()
    filename=data.get('filename', '')
    testdata = data.get('testdata', '')
    AtomicSystemGeneration.atomtest.compelte_tb_vhdl(filename,testdata)
    print(testdata)
    return "Computer Component Vhdl Complete Successful!"
@app.route('/api/complete_PL', methods=['POST'])
def complete_PL():
    data = request.get_json()
    filename = data.get('filename', '')
    txt = data.get('txt', '')


    path = "./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/" + filename
    # print(path)
    with open(path, "w") as file:
        file.write(txt)
    return "Physical Lexical Domain Vhdl Complete Successful!"
@app.route('/api/complete_B', methods=['POST'])
def complete_B():
    data = request.get_json()
    filename = data.get('filename', '')
    txt = data.get('txt', '')


    path = "./AtomicSystemGeneration/DomainVhdl/biddable_domain/" + filename
    # print(path)
    with open(path, "w") as file:
        file.write(txt)
    return "biddable_domain Vhdl Complete Successful!"
@app.route('/api/complete_C', methods=['POST'])
def complete_C():
    if 'file' not in request.files:
        return "No file uploaded", 400
    try:
        files = request.files.getlist('file')  # 获取名为 'file' 的文件字段的所有文件
        for file in files:
            # 保存文件
            savepath = './AtomicSystemGeneration/DomainVhdl/causal_domain/' + file.filename
            file.save(savepath)
        data = {
            'message': 'causal_domain Domain Vhdl upload Successful!'
        }
    except Exception:
        # 处理 ZeroDivisionError 异常
        print("设备模型上传失败")
        data = {
            'message': 'causal_domain Domain Vhdl upload Fail!'
        }


    return jsonify(data)
@app.route('/api/judge_PL', methods=['POST'])
def judge_PL():
    PLDomaincomplete=AtomicSystemGeneration.GenerateDomainVhdl.Generate_PL_Domain_vhdl("./Extractionjson/physical_lexical_domain_dict.json",
                                               "./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain")
    print(PLDomaincomplete)
    needcomplete={}
    if len(PLDomaincomplete)>=1:
        for filename in PLDomaincomplete:
            path="./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/"+filename+".vhdl"
            with open(path, 'r') as f:
                txt = f.read()
            needcomplete[filename+".vhdl"]=txt
        message="need to complete"
    else:
        message = "No need to complete"
    data = {
        'message': message,
        'needcomplete': needcomplete
    }
    return jsonify(data)
@app.route('/api/judge_B', methods=['POST'])
def judge_B():
    AtomicSystemGeneration.GenerateDomainVhdl.Generate_B_Domain_vhdl("./Extractionjson/biddable_domain_dict.json",
                                               "./AtomicSystemGeneration/DomainVhdl/biddable_domain")
    BDomaincomplete=[]
    for filename in os.listdir("./AtomicSystemGeneration/DomainVhdl/biddable_domain/"):
        BDomaincomplete.append(filename)
    print(BDomaincomplete)
    needcomplete={}
    if len(BDomaincomplete)>=1:
        for filename in BDomaincomplete:
            path="./AtomicSystemGeneration/DomainVhdl/biddable_domain/"+filename
            with open(path, 'r') as f:
                txt = f.read()
            needcomplete[filename]=txt
        message="need to complete"
    else:
        message = "No need to complete"
    data = {
        'message': message,
        'needcomplete': needcomplete
    }
    return jsonify(data)
@app.route('/api/judge_C', methods=['POST'])
def judge_C():
    AtomicSystemGeneration.GenerateDomainVhdl.Generate_B_Domain_vhdl("./Extractionjson/causal_domain_dict.json",
                                               "./AtomicSystemGeneration/DomainVhdl/causal_domain")
    CDomaincomplete=[]
    for filename in os.listdir("./AtomicSystemGeneration/DomainVhdl/causal_domain/"):
        CDomaincomplete.append(filename)
    print(CDomaincomplete)
    needcomplete={}
    if len(CDomaincomplete)>=1:
        for filename in CDomaincomplete:
            path="./AtomicSystemGeneration/DomainVhdl/causal_domain/"+filename
            with open(path, 'r') as f:
                txt = f.read()
            needcomplete[filename]=txt
        message="need to complete"
    else:
        message = "No need to complete"
    data = {
        'message': message,
        'needcomplete': needcomplete
    }
    return jsonify(data)

@app.route('/api/generateatom', methods=['POST'])
def atomproject():

    AtomicSystemGeneration.GenerateProject.Generate_atomsystem_project()

    AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/causal_domain/",
                                                                   "./AtomicSystemGeneration/DomainProject/causal_domain/")
    return "Generate Atomsystem Project Successful!"
@app.route('/api/generatePLdomain', methods=['POST'])
def PLdomainproject():

    AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/","./AtomicSystemGeneration/DomainProject/physical_lexical_domain/")

    return "Generate PLdomain Project Successful!"
@app.route('/api/generateBdomain', methods=['POST'])
def Bdomainproject():

    AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/biddable_domain/","./AtomicSystemGeneration/DomainProject/biddable_domain/")

    return "Generate Bdomain Project Successful!"
@app.route('/api/generateCdomain', methods=['POST'])
def Cdomainproject():

    AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/causal_domain/","./AtomicSystemGeneration/DomainProject/causal_domain/")

    return "Generate Cdomain Project Successful!"
@app.route('/api/downloadatomproject', methods=['POST'])
def downloadatomproject():
    folder_path = './AtomicSystemGeneration/AtomSystemProject/'  # 传递的文件夹路径
    zip_name = 'AtomSystemProject.zip'  # 压缩文件名
    # 生成压缩包
    with ZipFile(zip_name, 'w') as zip:
        for root, dirs, files in os.walk(folder_path):
            for file in files:
                zip.write(os.path.join(root, file))
    return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
@app.route("/api/generaterootvhdl", methods=['POST'])
def Generaterootvhdl():
    # GenerateRootDependency.Generaterootvhdl()
    # # GenerateNonLeafDependency.GenerateNonLeafvhdl()
    # # GenerateProject.Generate_dependency_project()
    # Assemble.GenerateAssembleTcl()
    AtomicSystemGeneration.GenerateNonLeafDependency.GenerateNonLeafvhdl()
    path = "./AtomicSystemGeneration/DependencyVhdl/"

    needcomplete = {}

    for filename in os.listdir(path):
        # print(filename)
        with open(path + filename, 'r') as f:
            txt = f.read()
        needcomplete[filename] = txt
    return jsonify(needcomplete)
@app.route('/api/complete_dependency', methods=['POST'])
def complete_dependency():
    data = request.get_json()
    filename = data.get('filename', '')
    txt = data.get('txt', '')
    path = "./AtomicSystemGeneration/DependencyVhdl/"+ filename
    # print(path)
    with open(path, "w") as file:
        file.write(txt)
    return "Dependency Complete Successful!"
@app.route('/api/generatedependency', methods=['POST'])
def dependencyproject():

    AtomicSystemGeneration.GenerateProject.Generate_dependency_project()

    return "Generate Dependency Project Successful!"
@app.route('/api/assmblesystem', methods=['POST'])
def assmblesystem():

    AtomicSystemGeneration.Assemble.GenerateAssembleTcl()
    message="集成错误，接口不一致！接口out_GD_GD_Gyro_powe_stat、out_SSD_SSD_Sun_sens_powe_sta未有对应接口与之连接"
    data = {
        'message': message,
    }
    return jsonify(data)
@app.route('/api/oroperty', methods=['POST'])
def oroperty():
    with open("./AtomicSystemGeneration/vcd/dump.vcd", 'r') as f:
        txt = f.read()
    needcomplete = {}
    needcomplete["vcd"] = txt
    return jsonify(needcomplete)
if __name__ == '__main__':
    app.run(debug=True)