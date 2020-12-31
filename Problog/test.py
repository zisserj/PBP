from problog.program import PrologString
from problog.core import ProbLog
from problog import get_evaluatable

with open('modelT.pl') as model:
    content = model.read()

print(content)
p = PrologString(content)

get_evaluatable().create_from(p).evaluate()