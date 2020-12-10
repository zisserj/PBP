:- use_module(library(lists)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bt1(0,q0). 

bt1(T,Q) :- T>0, TT is T-1,(
                bt1(TT,q0), event(TT,h(_)) , Q=q1;
                bt1(TT,q1), Q=q2;
                bt1(TT,q2), Q=q3
            ).

requested(T,h(I)) :- bt1(T,q0), between(1,3,I).
requested(T,g(I)) :- bt1(T,q1), between(1,3,I).
requested(T,o(I)) :- bt1(T,q2), between(1,3,I).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bt2(0,q0).

bt2(T,Q) :- T>0, TT is T-1,(
                bt2(TT,q0),   not(event(TT,h(_))), Q=q0;
                bt2(TT,q0),   event(TT,h(I)), Q=q(I);
                bt2(TT,q(I)), Q=q(I)
            ).

blocked(T,o(I)) :- bt2(T,q(I)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bt3(0,q0).

bt3(T,Q) :- T>0, TT is T-1,(
                bt3(TT,q0),  not(event(TT,g(_))), Q=q0;
                bt3(TT,q0),   event(TT,g(I)), Q=q(I);
                bt3(TT,q(I)), Q=q(I)
            ).

blocked(T,o(I)) :- bt3(T,q(I)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

candidates(T,L) :- findall(X, (requested(T,X), \+(blocked(T,X))), L).

event(T,X) :- candidates(T,L),select_uniform(T,L,X,_).

evidence(event(1,g(1))).
evidence(event(2,o(2))).

query(event(0,_)).
