# 陈琪
# @Time : 2023/11/27 7:45
# @Author : chenqi
# @File : vhdl
# @Project : VhdlSimulation
from ply import yacc, lex

# VHDL Lexer and Parser Definitions (simplified for illustration)
tokens = (
    'ENTITY', 'IS', 'PORT', 'END', 'SEMICOLON', 'COLON', 'IN', 'OUT', 'STD_LOGIC_VECTOR', 'DOWNTO',
    'OTHER_TOKENS'
)

# VHDL grammar rules (simplified)
# VHDL grammar rules (simplified)
def p_entity_declaration(p):
    '''entity_declaration : ENTITY ID IS PORT '(' port_list ')' SEMICOLON'''

def p_port_list(p):
    '''port_list : port_list port_item
                 | port_item'''

def p_port_item(p):
    '''port_item : ID COLON IN STD_LOGIC_VECTOR '(' INTEGER DOWNTO INTEGER ')' SEMICOLON
                 | ID COLON OUT STD_LOGIC_VECTOR '(' INTEGER DOWNTO INTEGER ')' SEMICOLON
                 | OTHER_TOKENS'''

# VHDL lexer rules (simplified)
def t_ID(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    return t

def t_INTEGER(t):
    r'\d+'
    t.value = int(t.value)
    return t

# Error handling
def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Other tokens
def t_OTHER_TOKENS(t):
    r'.'
    return t


# Build the lexer and parser
lexer = lex.lex()
parser = yacc.yacc()

# Example VHDL code
vhdl_code1 = """
entity Example1 is
  port (
    input1: in STD_LOGIC_VECTOR(7 downto 0);
    output1: out STD_LOGIC_VECTOR(7 downto 0)
  );
end Example1;
"""

vhdl_code2 = """
entity Example2 is
  port (
    input2: in STD_LOGIC_VECTOR(7 downto 0);
    output2: out STD_LOGIC_VECTOR(7 downto 0)
  );
end Example2;
"""

# Parse the VHDL code
tree1 = parser.parse(vhdl_code1)
tree2 = parser.parse(vhdl_code2)

# Calculate tree edit distance (simplified algorithm)
def tree_edit_distance(tree1, tree2):
    # Simplified algorithm, actual algorithm would need to traverse the trees and compute edit distance
    return 0.5  # Placeholder value
def p_error(p):
    print("Syntax error in input!")
# Calculate similarity
parser.error = 0
similarity = 1 - tree_edit_distance(tree1, tree2)
print("Similarity:", similarity)
