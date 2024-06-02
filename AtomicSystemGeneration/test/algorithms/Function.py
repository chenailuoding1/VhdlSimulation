# 陈琪
# @Time : 2024/3/15 21:10
# @Author : chenqi
# @File : Function
# @Project : VhdlSimulation
import re
vhdl_reserved_words = {
    "abs", "access", "after", "alias", "all", "and", "architecture", "array", "assert", "attribute",
    "begin", "block", "body", "buffer", "bus", "case", "component", "configuration", "constant",
    "context", "disconnect", "downto", "else", "elsif", "end", "entity", "exit", "file", "for",
    "function", "generate", "generic", "group", "guarded", "if", "impure", "in", "inertial", "inout",
    "is", "label", "library", "linkage", "literal", "loop", "map", "mod", "nand", "new", "next",
    "nor", "not", "null", "of", "on", "open", "or", "others", "out", "package", "port", "postponed",
    "procedure", "process", "pure", "range", "record", "register", "reject", "rem", "report", "return",
    "rol", "ror", "select", "severity", "shared", "signal", "sla", "sll", "sra", "srl", "subtype",
    "then", "to", "transport", "type", "unaffected", "units", "until", "use", "variable", "wait",
    "when", "while", "with", "xnor", "xor"
}

class AtomicProblemParser:
    def __init__(self):
        self.data = {
            "Name": None,
            "ProblemPattern": None,
            "Phenomena":[],
            "ProblemDomains": {
                "Device": [],
                "Storage": [],
                "Self-designedComponent": []
            },

            "Behaviors": ""
        }
        self.current_domain = None

    def parse_text_data(self, text_data):
        lines = text_data.split('\n')

        for line in lines:
            line = line.strip()
            if line.startswith("Name:"):
                self.current_domain = "Name"
            elif line.startswith("ProblemPattern:"):
                self.current_domain = "ProblemPattern"
            elif line.startswith("ProblemDomains:"):
                self.current_domain = None
            elif line.startswith("Device:"):
                self.current_domain = "Device"
            elif line.startswith("Storage:"):
                self.current_domain = "Storage"
            elif line.startswith("Parameter:"):
                self.current_domain = "Parameter"
            elif line.startswith("Self-designedComponent:"):
                self.current_domain = "Self-designedComponent"
            elif line.startswith("Behaviors:"):
                self.current_domain = "Behaviors"
            elif line.startswith("Phenomena:"):
                self.current_domain = "Phenomena"

            elif line.startswith("}"):
                self.data["Behaviors"] = self.data["Behaviors"]+"\n"+line
            elif self.current_domain is not None:
                if self.current_domain == "Name":
                    self.data["Name"] = line
                elif self.current_domain == "ProblemPattern":
                    self.data["ProblemPattern"] = line
                elif self.current_domain == "Parameter":
                    self.data["Parameter"] = line
                elif self.current_domain == "Phenomena":
                    phenomenas=line.strip(" ").split(",")
                    self.data["Phenomena"] = phenomenas
                elif self.current_domain == "Behaviors":
                    if line:
                        self.data["Behaviors"] = self.data["Behaviors"]+"\n"+line
                else:
                    self.data["ProblemDomains"][self.current_domain].append(line.strip())

        return self.data
def keyjudge(str):
    if str.startswith("while") or str.startswith("after") or str.startswith("at") or str.startswith("if") or str.startswith("else") or str.startswith("elif"):
        return True
    else:
        return False
def Signalcjudge(str):
    if "load instruction" in str or "acquisition instruction" in str or "perception instruction" in str :
        return 1
    elif "storage instruction" in str:
        return 2
    else:
        return 0
def states_insert_before(states,state1,state2):
    if state1 in states:
        index_a = states.index(state1)  # 获取元素 a 的索引
        states.insert(index_a, state2)  # 在索引 index_a 处插入元素 b
    return states
def states_insert_after(states,state1,state2):
    if state1 in states:
        index_a = states.index(state1)  # 获取元素 a 的索引
        states.insert(index_a+1, state2)  # 在索引 index_a+1 处插入元素 b
    return states
def jianxie(namestr):
    restr=[]
    for item in re.split(r'[ _]', namestr):
        if len(item)>3 and item!="start" and item!="done":
            # print(item[0:3])
            restr.append(item[0:3])
        else:
            # print(item)
            restr.append(item)
    return '_'.join(restr)
def vhdlname(namestr):
    namestr=re.sub(r'[^a-zA-Z0-9]', '', namestr)
    if not namestr:
        return "*"
    elif not namestr[0].isalpha():
        namestr="a"+namestr
    elif namestr in vhdl_reserved_words:
        return "*"
    return namestr[0:20]

# print(jianxie('Thruster combination logic load instruction'))