
% Noisy-or: Multiple rules for the same head
0.5 :: heads1.
0.6 :: heads2.

someHeads :- heads1.
someHeads :- heads2.
query(someHeads).
