0.6:: heads(C):- coin(C).

coin(c1).
coin(c2).
coin(c3).
coin(c4).


someHeads:- heads(_).
query(someHeads).
