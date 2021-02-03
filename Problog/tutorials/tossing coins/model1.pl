

0.5::heads1.
0.6::heads2.

twoHeads :- heads1, heads2.

evidence(twoHeads, false).

query(heads1).
query(heads2).
query(twoHeads).

