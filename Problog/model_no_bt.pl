:- use_module(library(lists)).

requested(0,h(I)) :-  between(1,3,I).
blocked(0,z(1)).

requested(1,g(I)) :-  between(1,3,I).


requested(2,o(I)) :- between(1,3,I).
blocked(2,o(I)) :- event(0, h(I)).
blocked(2,o(I)) :- event(1, g(I)).

candidates(T,L) :- findall(X, (requested(T,X), not(blocked(T,X))), L).
event(T,X) :- candidates(T,L),select_uniform(T,L,X,_).

%event(T,X) :- findall(X, (requested(T,X), not(blocked(T,X))), L),select_uniform(T,L,X,_).

evidence(event(1,g(1))).
evidence(event(2,o(2))).

query(event(0,_)).