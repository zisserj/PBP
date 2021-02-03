:- use_module(library(lists)).


bt1(0,q0).

bt1(T,Q) :- T>0, TT is T-1,(
                bt1(TT,q0), event(TT,h(_)), Q=q1;
                bt1(TT,q1), event(TT,g(_)), Q=q2;
                bt1(TT,q2), event(TT,o(_)), Q=q3
            ).

requested(T,h(I)) :- bt1(T,q0), between(1,3,I).
requested(T,g(I)) :- bt1(T,q1), between(1,3,I).
requested(T,o(I)) :- bt1(T,q2), between(1,3,I).


blocked(2,o(I)) :- event(0, h(I)).
blocked(2,o(I)) :- event(1, g(I)).

candidates(T,L) :- findall(X, (requested(T,X), not(blocked(T,X))), L).
event(T,X) :- candidates(T,L),select_uniform(T,L,X,_).


evidence(event(1,g(1))).
evidence(event(2,o(2))).

query(event(0,_)).
query(candidates(0,_)).
query(candidates(1,_)).
query(candidates(2,_)).