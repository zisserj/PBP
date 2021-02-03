0.6 :: lands_head(_).

coin(c1).
coin(c2).
coin(c3).
coin(c4).


heads(C) :- coin(C), lands_head(C).
someHeads :- heads(_).

query(someHeads).
