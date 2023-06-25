# 陈琪
# @Time : 2023/6/5 20:35
# @Author : chenqi
# @File : Dependency
# @Project : VhdlSimulation
def infix_to_postfix(expression):
    # 定义运算符的优先级
    precedence = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}
    # 初始化空栈和空后缀表达式
    stack = []
    postfix = []
    for char in expression:
        # 如果是操作数，直接添加到后缀表达式中
        if char.isalnum():
            postfix.append(char)
        # 如果是开括号，入栈
        elif char == '(':
            stack.append(char)
        # 如果是闭括号，将栈中的运算符弹出并添加到后缀表达式中，直到遇到开括号
        elif char == ')':
            while stack and stack[-1] != '(':
                postfix.append(stack.pop())
            stack.pop()  # 弹出开括号
        # 如果是运算符，将栈中优先级大于等于当前运算符的运算符弹出，并添加到后缀表达式中
        else:
            while stack and stack[-1] != '(' and precedence[char] <= precedence.get(stack[-1], 0):
                postfix.append(stack.pop())
            stack.append(char)  # 当前运算符入栈

    # 将栈中剩余的运算符弹出并添加到后缀表达式中
    while stack:
        postfix.append(stack.pop())

    # 将后缀表达式转换为字符串并返回
    return ''.join(postfix)


# 测试代码
expression = "3+4*2/(1-5)^2"
postfix = infix_to_postfix(expression)
print(f"Infix expression: {expression}")
print(f"Postfix expression: {postfix}")
