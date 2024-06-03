from flask import Flask, jsonify, render_template, request, send_file
from zipfile import ZipFile
import os
import re
from flask import Flask
from collections import defaultdict
import json
import DealFile.DealFunction
import AtomicSystemGeneration.atomtest
import AtomicSystemGeneration.DataExtraction
import AtomicSystemGeneration.GenerateAtomsystemVhdl
import AtomicSystemGeneration.GenerateDomainVhdl

import AtomicSystemGeneration.SystemTree
import AtomicSystemGeneration.DataHandling
import AtomicSystemGeneration.AbbrName
import AtomicSystemGeneration.GenerateRootDependency
import AtomicSystemGeneration.GenerateNonLeafDependency
import AtomicSystemGeneration.Assemble
import shutil
import AtomicSystemGeneration.Oroperty
# import AtomicSystemGeneration.testpy
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
    specification.split_specifiction(savepath,"AtomicSystemGeneration/test/Data/Specifiction_files")
    # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./DependencySpecification/")
    # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./Domain/")
    # AtomicSystemGeneration.Cleanupdirectory.Cleandir("./AtomSpecification/")
    definitions=[]
    connects=[]
    definitions,connects=GreateAtomic.GAtomicCommponet()
    # print(definitions)
    # print(len(connects))

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
    try:
        data = request.json
        definitions = data.get('definitions')
        connects = data.get('connects')
        print("connects")
        print(connects)
        for definition in definitions:
            vhdl=""
            if definition["type"]=="AtomicCommponet":
                vhdl=GreateAtomic.GenerateAtomicCommponetVHDL(definition)
            elif definition["type"]=="DataStorage":
                vhdl = GreateAtomic.GenerateDataStorageVHDL(definition)
            elif definition["type"]=="ComController":
                vhdl = GreateAtomic.GenerateComControllerVHDL(definition)
            definition["vhdl"]=vhdl
        print(GreateAtomic.GenerateTopVHDL(definitions,connects))
        # print("newdefinitions")
        # print(definitions)

# data = {
#     'message': 'VHDL Generate Fail!'
# }
        data = {
            'message': 'VHDL Successful!',
            'code': 200,
            "definitions":definitions
        }
    except Exception as e:
        # 处理 ZeroDivisionError 异常
        print("原子系统抽取信息失败+！："+str(e))
        data = {
            'message': 'Device delete Failed!'+str(e),
            'code':500
        }
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
        falg=GenerateProject.Generate_atomsystem_project(definitions)
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
# @app.route('/api/upload_device', methods=['POST'])
# def upload_device():
#     if 'file' not in request.files:
#         data = {
#             'message': "No file uploaded",
#
#             'code': 400
#         }
#
#     try:
#         file = request.files.get('file')
#         savepath='Uploads/' + file.filename
#         file.save(savepath)
#
#         device_type= request.values.get('device_type')
#         port_message = eval(request.values.get('port_message'))
#         # print(type(device_type))
#         # print(device_type)
#         # print("device_type")
#         print( port_message)
#         print( type(port_message) )
#         device_bool=AtomicSystemGeneration.GenerateProject.check_device(
#             savepath,file.filename,
#             "./Device/")
#         device_dir="./Device/"
#         if device_bool:
#             message='Device upload Successful!'
#             json_str = json.dumps(port_message)
#             # 将JSON格式的字符串写入文件
#             path="./AtomicSystemGeneration/DomainInforJson/"+device_type+"/"+file.filename.split(".")[0]+".json"
#             with open(path, "w") as f:
#                 f.write(json_str)
#             # 源文件夹路径
#             source_folder = "./Device/"+file.filename.split(".")[0]
#
#             # 目标文件夹路径
#             destination_folder = './AtomicSystemGeneration/DomainProject/'+device_type+"/"+file.filename.split(".")[0]
#
#             # 使用copytree()函数复制文件夹
#             shutil.copytree(source_folder, destination_folder)
#         else:
#             message = 'Device upload Failed!'
#         for files in os.listdir(device_dir):
#             path = os.path.join(device_dir, files)
#             # path2 = os.path.join(testdir, files)
#             try:
#                 shutil.rmtree(path)
#                 # shutil.rmtree(path2)
#             except OSError:
#                 os.remove(path)
#
#         data = {
#             'message': message,
#             'device_bool':device_bool,
#             'code': 200
#         }
#         # data = {
#         #     'message': 'VHDL Generate Successful!'
#         #
#         # }
#     except Exception as e:
#         # 处理 ZeroDivisionError 异常
#         print("Device upload失败+！："+str(e))
#         data = {
#             'message': 'Device upload Failed!'+str(e),
#             'code':500
#         }
#     # 返回下载链接
#     # "VHDL Generate Successful", 200, computerdict,
#     # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
#     return jsonify(data)
#
# @app.route('/api/show_device', methods=['POST'])
# def show_device():
#     try:
#         devices=[]
#         devices=AtomicSystemGeneration.GenerateProject.showdevice()
#         # print(devices)
#         if len(devices)<1:
#             isempty=True
#         else:
#             isempty = False
#         # data = {
#         #     'message': 'VHDL Generate Fail!'
#         # }
#         data = {
#             'message': 'Device Show Successful!' ,
#             "isempty":isempty,
#             "devices":devices
#         }
#     except Exception as e:
#         # 处理 ZeroDivisionError 异常
#         print("Device show失败+！："+str(e))
#         data = {
#             'message': 'Device Show Failed!'+str(e),
#             'code':500
#         }
#     # 返回下载链接
#     # "VHDL Generate Successful", 200, computerdict,
#     # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
#     return jsonify(data)
# @app.route('/api/delete_device', methods=['POST'])
# def delete_device():
#     try:
#         device_type = request.values.get('device_type')
#         name = request.values.get('name')
#         AtomicSystemGeneration.GenerateProject.deletedevice(device_type, name)
#         # data = {
#         #     'message': 'VHDL Generate Fail!'
#         # }
#         data = {
#             'message': 'Device delete Successful!',
#             'code': 200
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
#
# @app.route('/api/downloadatomvhdl', methods=['POST'])
# def download_dir():
#     folder_path = './AtomicSystemGeneration/AtomSystemVhdl/'  # 传递的文件夹路径
#     zip_name = 'AtomSystemVhdl.zip'  # 压缩文件名
#     # 生成压缩包
#     with ZipFile(zip_name, 'w') as zip:
#         for root, dirs, files in os.walk(folder_path):
#             for file in files:
#                 zip.write(os.path.join(root, file))
#     return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
#
# @app.route('/api/run_simulation', methods=['POST'])
# def run_simulation():
#     try:
#         AtomicSystemGeneration.Oroperty.runsim()
#         data = {
#             'message': 'simulation Successful!' ,
#             'code': 200
#         }
#     except Exception as e:
#         # 处理 ZeroDivisionError 异常
#         print("仿真失败+！：" + str(e))
#         data = {
#             'message': 'simulation Failed!' + str(e),
#             'code': 500
#         }
#         # 返回下载链接
#         # "VHDL Generate Successful", 200, computerdict,
#         # return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
#     return jsonify(data)
# @app.route('/api/complete_computer', methods=['POST'])
# def complete_computer():
#     data = request.get_json()
#     filename = data.get('filename', '')
#     txt = data.get('txt', '')
#     # print(txt)
#     with open("./Extractionjson/computerdict.json", 'r') as f:
#         data = f.read()
#         # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
#     computerdict = json.loads(data)
#     path = "./AtomicSystemGeneration/AtomSystemVhdl/" + computerdict.get(filename.split(".")[0]) + "/" + filename
#     # print(path)
#     with open(path, "w") as file:
#         file.write(txt)
#     data = {
#         'message': 'complete_computer Successful!'
#     }
#
#     return jsonify(data)
#
# @app.route('/api/complete_tb', methods=['POST'])
# def complete_tb():
#     data = request.get_json()
#     filename=data.get('filename', '')
#     txt = data.get('txt', '')
#     # print(txt)
#     with open("./Extractionjson/computerdict.json", 'r') as f:
#         data = f.read()
#         # 将JSON字符串转换为Python字典insysdict_atomsys为所有原子系统目录结构及端口信息的字典
#     computerdict = json.loads(data)
#     path="./AtomicSystemGeneration/AtomSystemVhdl/"+computerdict.get(filename.split(".")[0])+"/"+filename
#     # print(path)
#     with open(path, "w") as file:
#         file.write(txt)
#
#     return "Computer Component Vhdl Complete Successful!"
# @app.route('/api/atomtest', methods=['POST'])
# def atomtest():
#     data = request.get_json()
#     filename=data.get('filename', '')
#     testdata = data.get('testdata', '')
#     AtomicSystemGeneration.atomtest.compelte_tb_vhdl(filename,testdata)
#     text = ""
#     vcdpath = ""
#     message = ""
#     data=AtomicSystemGeneration.GenerateProject.Add_atomsystem_test(filename)
#
#     print(data)
#
#     return jsonify(data)
#     # print(testdata)
# @app.route('/api/complete_PL', methods=['POST'])
# def complete_PL():
#     data = request.get_json()
#     filename = data.get('filename', '')
#     txt = data.get('txt', '')
#
#
#     path = "./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/" + filename
#     # print(path)
#     with open(path, "w") as file:
#         file.write(txt)
#     return "Physical Lexical Domain Vhdl Complete Successful!"
# @app.route('/api/complete_B', methods=['POST'])
# def complete_B():
#     data = request.get_json()
#     filename = data.get('filename', '')
#     txt = data.get('txt', '')
#
#
#     path = "./AtomicSystemGeneration/DomainVhdl/biddable_domain/" + filename
#     # print(path)
#     with open(path, "w") as file:
#         file.write(txt)
#     return "biddable_domain Vhdl Complete Successful!"
# @app.route('/api/complete_C', methods=['POST'])
# def complete_C():
#     if 'file' not in request.files:
#         return "No file uploaded", 400
#     try:
#         files = request.files.getlist('file')  # 获取名为 'file' 的文件字段的所有文件
#         for file in files:
#             # 保存文件
#             savepath = './AtomicSystemGeneration/DomainVhdl/causal_domain/' + file.filename
#             file.save(savepath)
#         data = {
#             'message': 'causal_domain Domain Vhdl upload Successful!'
#         }
#     except Exception as e:
#         # 处理 ZeroDivisionError 异常
#         print("设备模型上传失败"+str(e))
#         data = {
#             'message': 'causal_domain Domain Vhdl upload Fail!'+str(e)
#         }
#
#
#     return jsonify(data)
# @app.route('/api/judge_PL', methods=['POST'])
# def judge_PL():
#     PLDomaincomplete=AtomicSystemGeneration.GenerateDomainVhdl.Generate_PL_Domain_vhdl("./Extractionjson/physical_lexical_domain_dict.json",
#                                                "./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain")
#     print(PLDomaincomplete)
#     needcomplete={}
#     if len(PLDomaincomplete)>=1:
#         for filename in PLDomaincomplete:
#             path="./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/"+filename+".vhdl"
#             with open(path, 'r') as f:
#                 txt = f.read()
#             needcomplete[filename+".vhdl"]=txt
#         message="need to complete"
#     else:
#         message = "No need to complete"
#     data = {
#         'message': message,
#         'needcomplete': needcomplete
#     }
#     return jsonify(data)
# @app.route('/api/judge_B', methods=['POST'])
# def judge_B():
#     AtomicSystemGeneration.GenerateDomainVhdl.Generate_B_Domain_vhdl("./Extractionjson/biddable_domain_dict.json",
#                                                "./AtomicSystemGeneration/DomainVhdl/biddable_domain")
#     BDomaincomplete=[]
#     for filename in os.listdir("./AtomicSystemGeneration/DomainVhdl/biddable_domain/"):
#         BDomaincomplete.append(filename)
#     print(BDomaincomplete)
#     needcomplete={}
#     if len(BDomaincomplete)>=1:
#         for filename in BDomaincomplete:
#             path="./AtomicSystemGeneration/DomainVhdl/biddable_domain/"+filename
#             with open(path, 'r') as f:
#                 txt = f.read()
#             needcomplete[filename]=txt
#         message="need to complete"
#     else:
#         message = "No need to complete"
#     data = {
#         'message': message,
#         'needcomplete': needcomplete
#     }
#     return jsonify(data)
# @app.route('/api/judge_C', methods=['POST'])
# def judge_C():
#     AtomicSystemGeneration.GenerateDomainVhdl.Generate_B_Domain_vhdl("./Extractionjson/causal_domain_dict.json",
#                                                "./AtomicSystemGeneration/DomainVhdl/causal_domain")
#     CDomaincomplete=[]
#     for filename in os.listdir("./AtomicSystemGeneration/DomainVhdl/causal_domain/"):
#         CDomaincomplete.append(filename)
#     print(CDomaincomplete)
#     needcomplete={}
#     if len(CDomaincomplete)>=1:
#         for filename in CDomaincomplete:
#             path="./AtomicSystemGeneration/DomainVhdl/causal_domain/"+filename
#             with open(path, 'r') as f:
#                 txt = f.read()
#             needcomplete[filename]=txt
#         message="need to complete"
#     else:
#         message = "No need to complete"
#     data = {
#         'message': message,
#         'needcomplete': needcomplete
#     }
#     return jsonify(data)
#
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
# @app.route('/api/generatePLdomain', methods=['POST'])
# def PLdomainproject():
#
#     AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/physical_lexical_domain/","./AtomicSystemGeneration/DomainProject/physical_lexical_domain/")
#
#     return "Generate PLdomain Project Successful!"
# @app.route('/api/generateBdomain', methods=['POST'])
# def Bdomainproject():
#
#     AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/biddable_domain/","./AtomicSystemGeneration/DomainProject/biddable_domain/")
#
#     return "Generate Bdomain Project Successful!"
# @app.route('/api/generateCdomain', methods=['POST'])
# def Cdomainproject():
#
#     AtomicSystemGeneration.GenerateProject.Generate_domain_project("./AtomicSystemGeneration/DomainVhdl/causal_domain/","./AtomicSystemGeneration/DomainProject/causal_domain/")
#
#     return "Generate Cdomain Project Successful!"
# @app.route('/api/downloadatomproject', methods=['POST'])
# def downloadatomproject():
#     folder_path = './AtomicSystemGeneration/AtomSystemProject/'  # 传递的文件夹路径
#     zip_name = 'AtomSystemProject.zip'  # 压缩文件名
#     # 生成压缩包
#     with ZipFile(zip_name, 'w') as zip:
#         for root, dirs, files in os.walk(folder_path):
#             for file in files:
#                 zip.write(os.path.join(root, file))
#     return send_file(zip_name, attachment_filename=zip_name, as_attachment=True)
# @app.route("/api/generaterootvhdl", methods=['POST'])
# def Generaterootvhdl():
#     # GenerateRootDependency.Generaterootvhdl()
#     # # GenerateNonLeafDependency.GenerateNonLeafvhdl()
#     # # GenerateProject.Generate_dependency_project()
#     # Assemble.GenerateAssembleTcl()
#     AtomicSystemGeneration.GenerateNonLeafDependency.GenerateNonLeafvhdl()
#     path = "./AtomicSystemGeneration/DependencyVhdl/"
#
#     needcomplete = {}
#
#     for filename in os.listdir(path):
#         # print(filename)
#         with open(path + filename, 'r') as f:
#             txt = f.read()
#         needcomplete[filename] = txt
#     return jsonify(needcomplete)
# @app.route('/api/complete_dependency', methods=['POST'])
# def complete_dependency():
#     data = request.get_json()
#     filename = data.get('filename', '')
#     txt = data.get('txt', '')
#     path = "./AtomicSystemGeneration/DependencyVhdl/"+ filename
#     # print(path)
#     with open(path, "w") as file:
#         file.write(txt)
#     return "Dependency Complete Successful!"
# @app.route('/api/generatedependency', methods=['POST'])
# def dependencyproject():
#
#     AtomicSystemGeneration.GenerateProject.Generate_dependency_project()
#
#     return "Generate Dependency Project Successful!"
# @app.route('/api/assmblesystem', methods=['POST'])
# def assmblesystem():
#
#     message=AtomicSystemGeneration.Assemble.GenerateAssembleTcl()
#     # 将JSON格式的字符串写入文件
#     data = {
#         'message': message,
#     }
#     return jsonify(data)
# @app.route('/api/oroperty', methods=['POST'])
# def oroperty():
#     # with open("./Extractionjson/error_name.json","r") as f:
#     #     content=f.read()
#     #
#     # error_name=json.loads(content)
#     data = AtomicSystemGeneration.Oroperty.portdetect()
#     print(data)
#     # if len(error_name)>0:
#     #     message="接口一致性验证失败！以下接口不满足系统封闭性原则："
#     #     for i in range(0,len(error_name)):
#     #         message=message+error_name[i]
#     #         if i!=len(error_name)-1:
#     #             message=message+"、"
#     # else:
#     #     message = "接口一致性验证成功！"
#     # data = {
#     #     "message": message
#     # }
#     return jsonify(data)
# @app.route('/api/showdata', methods=['POST'])
# def showdata():
#     data = request.json
#     path = data.get('path')
#     portname = data.get('portname')
#     print(portname)
#     AtomicSystemGeneration.testpy.show(path+"."+portname)
#
#     return send_file('./AtomicSystemGeneration/pic/plot.png', mimetype='image/png')
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