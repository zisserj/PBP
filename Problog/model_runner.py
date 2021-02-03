from problog import get_evaluatable
from problog.program import PrologString
from problog.formula import LogicFormula, LogicDAG
from problog.ddnnf_formula import DDNNF
from problog.cnf_formula import CNF
with open('modelT.pl') as model:
    m = model.read()

p = PrologString(m)

# stars = '*' * 100 + '\n'
# lf = LogicFormula.create_from(p)  # ground the program
# print(f'{stars} ground the program, LogicFormula.create_from(p):\n\n{lf}')
#
# dag = LogicDAG.create_from(lf)  # break cycles in the ground program
# print(f'{stars} break cycles in the ground program, LogicDAG.create_from(lf):\n\n{dag}')
#
# cnf = CNF.create_from(dag)  # convert to CNF
# print(f'{stars} convert to CNF, CNF.create_from(dag):\n\n{cnf}')
#
# print(cnf.clauses)
# ddnnf = DDNNF.create_from(cnf)       # compile CNF to ddnnf

print('before')
formula = get_evaluatable().create_from(p)
print('after')
print(formula.evaluate())
