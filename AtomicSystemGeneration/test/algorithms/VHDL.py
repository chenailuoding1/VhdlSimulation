import os

import xlwt

def generate_entity(template_file, entityname, ports):
    with open(template_file, 'r') as file:
        template = file.read()

    # 替换模板中的变量
    entity_template = template.replace('«entityname»', entityname)

    # 替换端口部分
    port_section = ''
    for port in ports:
        port_str = f"{port['name']}:{port['direction']} {port['type']};\n"
        port_section += port_str
    entity_template = entity_template.replace('«port_section»', port_section)

    return entity_template

def generate_component(template_file, componentname, ports):
    with open(template_file, 'r') as file:
        template = file.read()

    # 替换模板中的变量
    component_template = template.replace('«componentname»', componentname)

    # 替换端口部分
    port_section = ''
    for port in ports:
        port_str = f"{port['name']}:{port['direction']} {port['type']};\n"
        port_section += port_str
    component_template = component_template.replace('«port_section»', port_section)
    return component_template
def generate_signal(template_file,signals):
    with open(template_file, 'r') as file:
        signal_template = file.read()

    # 替换信号部分
    for signal in signals:
        signal_template = signal_template.replace('«signal.name»',signal.name)
        signal_template = signal_template.replace('«signal.type»', signal.type)
        signal_template = signal_template.replace('«signal.value»', signal.value)
    return signal_template

# 示例用法
template_file = '../Template/Entity_Template'
entity_name = "Example_Entity"
ports = [
    {"name": "input_port", "direction": "in", "type": "std_logic"},
    {"name": "output_port", "direction": "out", "type": "std_logic"}
]

generated_entity = generate_entity(template_file, entity_name, ports)
print(generated_entity)

