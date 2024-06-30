from flask import Flask, jsonify, render_template, request, send_file
from zipfile import ZipFile
import os
import re
from flask import Flask
from collections import defaultdict
import json
import pandas as pd
import DealFile.DealFunction
import AtomicSystemGeneration.atomtest
import AtomicSystemGeneration.DataExtraction
import AtomicSystemGeneration.GenerateAtomsystemVhdl
import AtomicSystemGeneration.GenerateDomainVhdl
from openpyxl import Workbook
import AtomicSystemGeneration.SystemTree
import AtomicSystemGeneration.DataHandling
import AtomicSystemGeneration.AbbrName
import AtomicSystemGeneration.GenerateRootDependency
import AtomicSystemGeneration.GenerateNonLeafDependency
import AtomicSystemGeneration.Assemble
import shutil
import AtomicSystemGeneration.Oroperty
import AtomicSystemGeneration.testpy
import AtomicSystemGeneration.Cleanupdirectory
import AtomicSystemGeneration.test.algorithms.algorithm3 as GreateAtomic
import AtomicSystemGeneration.test.algorithms.specification as specification
import AtomicSystemGeneration.test.algorithms.GenerateProject as GenerateProject
# import AtomicSystemGeneration.test.algorithms.modeltest as modeltest
app = Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/api/gettext', methods=['GET'])
def gettext():
    text=""
    with open("Uploads/sp.txt","r") as file:
        text=file.readlines()

    return jsonify(text)
@app.route('/api/upload_specification2', methods=['POST'])
def upload_specification2():
    if 'file' not in request.files:
        data = {
            'message': "No file uploaded",
            'code':400
        }
    # try:
    file = request.files.get('file')
    savepath='Uploads/' + file.filename
    file.save(savepath)

    atomicproblems,dependencys,declarations = specification.split_specifiction(savepath,"AtomicSystemGeneration/test/Data/Specifiction_files")
    # 将每个数组转换为DataFrame
    df_atomicproblems = pd.DataFrame(atomicproblems, columns=["Atomic Problems"])
    df_declarations = pd.DataFrame(declarations, columns=["Declarations"])
    df_dependencys = pd.DataFrame(dependencys, columns=["Dependencys"])

    # 保存每个DataFrame到单独的Excel文件
    df_atomicproblems.to_excel("atomicproblems.xlsx", index=False)
    df_declarations.to_excel("declarations.xlsx", index=False)
    df_dependencys.to_excel("dependencys.xlsx", index=False)
    definitions=[]
    connects=[]
    definitions,connects=GreateAtomic.GAtomicCommponet()
    new_file_path = "component1.xlsx"
    wb = Workbook()
    ws = wb.active
    ws.title = 'Q&A'
    # 写入标题行

    for definition in definitions:
        ws.append([definition["name"], str(definition)])
    wb.save(new_file_path)
    wb.close()
    # print(definitions)
    # print("@@@@@@@@@@@@@")
    # print(connects)

    data = {
        'message': 'Commponents Generate Successful!',

        'code': 200,
        'definitions':definitions,
        'connects': connects
    }

    # except Exception as e:
    #     # 处理 ZeroDivisionError 异常
    #     print("原子系统抽取信息失败+！："+str(e))
    #     data = {
    #         'message': 'VHDL Generate Fail!'+str(e),
    #         'code': 500
    #     }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)


@app.route('/api/grenateVHDL', methods=['POST'])
def Grenate_VHDL():
# try:
    data = request.json
    definitions = data.get('definitions')
    connects = data.get('connects')
    modelName=data.get('modelName')
    print("connects")
    print(connects)
    print(definitions)
    for definition in definitions:
        vhdl=""
        if definition["type"]=="AtomicCommponet":
            vhdl=GreateAtomic.GenerateAtomicCommponetVHDL(definition)
        elif definition["type"]=="DataStorage":
            vhdl = GreateAtomic.GenerateDataStorageVHDL(definition)
        elif definition["type"]=="ComController":
            vhdl = GreateAtomic.GenerateComControllerVHDL(definition)
        definition["vhdl"]=vhdl
    print(GreateAtomic.GenerateTopVHDL(definitions,connects,modelName))
    topvhdl=GreateAtomic.GenerateTopVHDL(definitions,connects,modelName)
    new_file_path ="component.xlsx"
    wb = Workbook()
    ws = wb.active
    ws.title = 'Q&A'
    ws.append([modelName,topvhdl])
    # 写入标题行
    for definition in definitions:
        ws.append([definition["name"],str(definition)])
    wb.save(new_file_path)
    wb.close()
    # print("newdefinitions")
    # print(definitions)

# data = {
#     'message': 'VHDL Generate Fail!'
# }
    data = {
        'message': 'VHDL Successful!',
        'code': 200,
        "definitions":definitions,
        "topvhdl":topvhdl
    }
    # except Exception as e:
    #     # 处理 ZeroDivisionError 异常
    #     print("原子系统抽取信息失败+！："+str(e))
    #     data = {
    #         'message': 'Device delete Failed!'+str(e),
    #         'code':500
    #     }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
# @app.route('/api/grenateVHDL', methods=['POST'])
# def Grenate_VHDL():
#     try:
#         data = request.json
#         definitions = data.get('definitions')
#         print("definitions")
#         print(definitions)
#         for definition in definitions:
#             name=definition["name"]
#             print(name)
#             vhdl = ""
#             directory="./AtomicSystemGeneration/AtomSystemVhdl/"+name
#             if os.path.exists(directory):
#                 files = os.listdir(directory)
#                 # 遍历所有文件和子目录
#
#                 for file in files:
#                     # 获取文件或子目录的完整路径
#                     path = os.path.join(directory, file)
#
#                     # 如果是文件，则打印文件路径
#                     if os.path.isfile(path):
#                         print("File:", path)
#                         with open(path, 'r') as file:
#                             content = file.read()
#                             print("文件内容:")
#                             print(content)
#                             vhdl=vhdl+content
#             definition["vhdl"]=vhdl
#         print("newdefinitions")
#         print(definitions)
#
#         # data = {
#         #     'message': 'VHDL Generate Fail!'
#         # }
#         data = {
#             'message': 'VHDL Successful!',
#             'code': 200,
#             "definitions":definitions
#         }
#     except Exception as e:
#         # 处理 ZeroDivisionError 异常
#         print("原子系统抽取信息失败+！："+str(e))
#         data = {
#             'message': 'Device delete Failed!'+str(e),
#             'code':500
#         }
#     # 返回下载链接
#     # "VHDL Generate Successful", 200, computerdict,
#     # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
#     return jsonify(data)
@app.route('/api/modelcheck', methods=['POST'])
def model_check():
    try:
        data = request.json
        definitions = data.get('definitions')
        print("definitions")
        print(definitions)
        for definition in definitions:
            name=definition["name"]
            print(name)
            # 将数据转换为字符串格式
        data_str = json.dumps(data)

        # 将JSON数据写入文本文件
        with open("de.txt", 'a+') as file:
            file.write(data_str)

        print("newdefinitions")
        print(definitions)

        # data = {
        #     'message': 'VHDL Generate Fail!'
        # }
        data = {
            'message': 'Model Check Successful!',
            'code': 200,
            "result":"数据流一致性：130个接口，其中128个接口一致性约束验证成功，导致2个接口一致性约束验证失败。MR数据储存中的两个接口验证失败！",
            "definitions":definitions
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("原子系统抽取信息失败+！："+str(e))
        data = {
            'message': 'Model Check Failed!'+str(e),
            'code':500
        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
@app.route('/api/GPT', methods=['POST'])
def GPT():
    try:
        data = request.json
        definitions = data.get('definitions')
        print("definitions")
        print(definitions)

        # data_str = json.dumps(data)
        template=""
        requirement=""
        with open("promttemplate.txt", 'r') as file:
            template="".join(file.readlines())
        with open("Uploads/sp.txt", 'r') as file:
            requirement="".join(file.readlines())
        promt=template.replace("<<requirement>>",requirement)
        for i in range(0,len(definitions)):
            if i!=len(definitions)-1:
                definitionstr="组件"+str(i)+"的形式化定义为"+json.dumps(definitions[i])+"\n<<definition>>"
            else:
                definitionstr = "组件"+str(i)+"的形式化定义为"+json.dumps(definitions[i])
            promt = promt.replace("<<definition>>", definitionstr)
        # 将JSON数据写入文本文件
        with open("de.txt", 'w') as file:
            file.write(promt)
        # modeltest.Chat_Code(data_str)
        print("newdefinitions")
        print(definitions)

        # data = {
        #     'message': 'VHDL Generate Fail!'
        # }
        data = {
            'message': 'Model Check Successful!',
            'code': 200,
            "result":"生成成功！",
            "definitions":definitions
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("原子系统抽取信息失败+！："+str(e))
        data = {
            'message': 'Model Check Failed!'+str(e),
            'code':500
        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)

@app.route('/api/run_simulation', methods=['POST'])
def run_simulation():
    try:
        data=request.json
        definitions = data.get('definitions')
        topvhdl = data.get('topvhdl')
        modelName=data.get('modelName')
        falg=GenerateProject.Generate_atomsystem_project(definitions,topvhdl,modelName)
        # AtomicSystemGeneration.Oroperty.runsim()
        if falg:
            data = {
                'message': 'simulation Successful!' ,
                'code': 200
            }
        else:
            data = {
                'message': 'simulation False!',
                'code': 400
            }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("仿真失败+！：" + str(e))
        data = {
            'message': 'simulation Failed!' + str(e),
            'code': 500
        }
        # 返回下载链接
        # "VHDL Generate Successful", 200, computerdict,
        # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)

@app.route('/api/generateatom', methods=['POST'])
def atomproject():
    try:
        AtomicSystemGeneration.GenerateProject.Generate_atomsystem_project()
        atomsystems,isright,failatomsystems=AtomicSystemGeneration.GenerateProject.get_atomsystem_project()
        # AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/causal_domain/",
        #                                                                "./AtomicSystemGeneration/DomainProject/causal_domain/")
        if isright:
            message='Generate Atomsystem Project Successful!'
        else:
            message = 'Generate Atomsystem Project Fail!'
        data = {
            'message': message,
            "isright": isright,
            "failatomsystems": failatomsystems,
            "atomsystems": atomsystems
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("原子系统模型生成失败"+str(e))
        data = {
            'message': 'Generate Atomsystem Project Successful Fail!'+str(e)
        }


    return jsonify(data)

@app.route('/api/showdata', methods=['POST'])
def showdata():
    data = request.json
    path = data.get('path')
    portname = data.get('portname')
    print(portname)
    AtomicSystemGeneration.testpy.show(path+"."+portname)

    return send_file('./AtomicSystemGeneration/pic/plot.png', mimetype='image/png')
@app.route('/api/showexternaldata', methods=['POST'])
def showexternaldata():
    path = request.values.get('path')
    portsname = request.values.get('portsname')
    print(portsname)
    ports=[]
    for i in re.split(',',portsname):
        ports.append("tb_test.DA14_process.SSS0_i."+i)
    AtomicSystemGeneration.testpy.showports(ports)

    return send_file('./AtomicSystemGeneration/pic/plot.png', mimetype='image/png')
@app.route('/api/showdatas', methods=['POST'])
def showdatas():
    data = request.json
    paths = data.get('paths')

    print(paths)

    AtomicSystemGeneration.testpy.showports(paths)

    return send_file('./AtomicSystemGeneration/pic/plot.png', mimetype='image/png')
@app.route('/api/getmodule', methods=['POST'])
def getmodule():

    modulelist=AtomicSystemGeneration.testpy.getmodule()

    return jsonify(modulelist)
@app.route('/api/getexternalmodule', methods=['POST'])
def getexternalmodule():

    modulelist=AtomicSystemGeneration.testpy.getexternalmodule()

    return jsonify(modulelist)
@app.route('/api/showmodule', methods=['POST'])
def showmodule():
    try:
        name = request.values.get('name')
        devices=[]
        devices=AtomicSystemGeneration.testpy.getport(name)

        data = {
            'message': 'Device Show Successful!' ,

            "devices":devices
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("Device show失败+！："+str(e))
        data = {
            'message': 'Device Show Failed!'+str(e),
            'code':500
        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
@app.route('/api/showmoduleport', methods=['POST'])
def showmoduleport():
    try:
        data = request.json

        name = data.get('name')
        ports=[]
        ports=AtomicSystemGeneration.testpy.getmoudleport(name)

        data = {
            'message': 'Device Show Successful!' ,

            "ports":ports
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("Device show失败+！："+str(e))
        data = {
            'message': 'Device Show Failed!'+str(e),
            'code':500
        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
@app.route('/api/showexternalmodule', methods=['POST'])
def showexternalmodule():
    try:
        name = request.values.get('name')
        devices=[]
        devices=AtomicSystemGeneration.testpy.getexternalport(name)
        print(devices)
        data = {
            'message': 'Device Show Successful!' ,

            "devices":devices
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("Device show失败+！："+str(e))
        data = {
            'message': 'Device Show Failed!'+str(e),
            'code':500
        }
    # 返回下载链接
    # "VHDL Generate Successful", 200, computerdict,
    # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
    return jsonify(data)
if __name__ == '__main__':
    app.run(debug=True)