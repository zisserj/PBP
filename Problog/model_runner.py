from problog import get_evaluatable
from problog.program import PrologString
from problog.formula import LogicFormula, LogicDAG
from problog.ddnnf_formula import DDNNF
from problog.cnf_formula import CNF
import timeit

with open('modelT.pl') as model:
    m = model.read()
times = []
door_num = range(3, 10)
for i in door_num:
    start = timeit.default_timer()
    model = m.format(door_num=i)
    p = PrologString(model)
    formula = get_evaluatable().create_from(p)
    print(formula.evaluate())
    stop = timeit.default_timer()
    times.append(stop - start)

for i in door_num:
    model = m.format(door_num=i)
    p = PrologString(model)
    lf = LogicFormula.create_from(p)
    lfs.append(lf)
    dag = LogicDAG.create_from(lf)
    dags.append(dag)
    cnf = CNF.create_from(dag)
    cnfs.append(cnf)

for i in door_num:
    model = m.format(door_num=i)
    p = PrologString(model)
    lf = LogicFormula.create_from(p)
    lfs.append(lf)
    dag = LogicDAG.create_from(lf)
    dags.append(dag)
    cnf = CNF.create_from(dag)
    cnfs.append(cnf)
    ddnnf = DDNNF.create_from(cnf)
    print(ddnnf.evaluate())


print(times)
# p = PrologString(m)
#
# stars = '*' * 100 + '\n'
# lf = LogicFormula.create_from(p)  # ground the program
# print(f'{stars} ground the program, LogicFormula.create_from(p):\n\n{lf}')
#
# dag = LogicDAG.create_from(lf)  # break cycles in the ground program
# print(f'{stars} break cycles in the ground program, LogicDAG.create_from(lf):\n\n{dag}')
#
# cnf = CNF.create_from(dag)  # convert to CNF
# print(f'{stars} convert to CNF, CNF.create_from(dag):\n\n{cnf}')
# print(cnf.clauses)
# ddnnf = DDNNF.create_from(cnf)       # compile CNF to ddnnf
#
# print('before')
# formula = get_evaluatable().create_from(p)
# print('after')
# print(formula.evaluate())
