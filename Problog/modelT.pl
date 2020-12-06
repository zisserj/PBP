:- use_module(library(lists)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bt1(0,q0). bt1(1,q1). bt1(2,q2).

requested(T,h(I)) :- bt1(T,q0), between(1,3,I).
requested(T,g(I)) :- bt1(T,q1), between(1,3,I).
requested(T,o(I)) :- bt1(T,q2), between(1,3,I).  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bt2(0,q0).
bt2(T,q(I)) :- T>0, event(0,h(I)).
blocked(T,o(I)) :- bt2(T,q(I)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bt3(0,q0).
bt3(T,q(I)) :- T>1, event(1,g(I)).
blocked(T,o(I)) :- bt3(T,q(I)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

candidates(T,L) :- findall(X, (requested(T,X), not(blocked(T,X))), L).

event(T,X) :- candidates(T,L),select_uniform(T,L,X,_).

evidence(event(1,g(1))).
evidence(event(2,o(2))).

query(event(0,_)).
