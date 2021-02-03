%init
start(bt1,s0).
start(bt21,s0).
start(bt22,s0).
start(bt23,s0).
start(bt31,s0).
start(bt32,s0).
start(bt33,s0).

%bt1
trans(bt1,s0,h1,s1).
trans(bt1,s0,h2,s1).
trans(bt1,s0,h3,s1).

trans(bt1,s1,g1,s2).
trans(bt1,s1,g2,s2).
trans(bt1,s1,g3,s2).

trans(bt1,s2,o1,s31).
trans(bt1,s2,o2,s32).
trans(bt1,s2,o3,s33).

1/3::request(bt1,s0,h1);
1/3::request(bt1,s0,h2);
1/3::request(bt1,s0,h3).

1/3::request(bt1,s1,g1);
1/3::request(bt1,s1,g2);
1/3::request(bt1,s1,g3).

request(bt1,s2,o1).
request(bt1,s2,o2).
request(bt1,s2,o3).


trans(bt21,s0,h1,s1).
block(bt21,s1,o1).
trans(bt21,s0,H,s0):- not(H == h1).
trans(bt21,s1,_,s1).

trans(bt22,s0,h2,s1).
block(bt22,s1,o2).
trans(bt22,s0,H,s0):- not(H == h2).
trans(bt22,s1,_,s1).

trans(bt23,s0,h3,s1).
block(bt23,s1,o3).
trans(bt23,s0,H,s0):- not(H == h3).
trans(bt23,s1,_,s1).

trans(bt31,s0,g1,s1).
block(bt31,s1,o1).
trans(bt31,s0,H,s0):- not(H == g1).
trans(bt31,s1,_,s1).

trans(bt32,s0,g2,s1).
block(bt32,s1,o2).
trans(bt32,s0,H,s0):- not(H == g2).
trans(bt32,s1,_,s1).


trans(bt33,s0,g3,s1).
block(bt33,s1,o3).
trans(bt33,s0,H,s0):- not(H == g3).
trans(bt33,s1,_,s1).

%%%%%%%%%
% background: which state are we in at which time?
% state(modelID,time,state)
%%%%%%%%%
state(0,S1,S21,S22,S23,S31,S32,S33) :- start(bt1,S1),
                                       start(bt21,S21),
                                       start(bt22,S22),
                                       start(bt23,S23),
                                       start(bt31,S31),
                                       start(bt32,S32),
                                       start(bt33,S33).



state(T,S1,S21,S22,S23,S31,S32,S33) :- T > 0, TT is T-1,
                    state(TT,SS1,SS21,SS22,SS23,SS31,SS32,SS33),
                    trans(bt1,SS1,E,S1),
                    trans(bt21,SS21,E,S21),
                    trans(bt22,SS22,E,S22),
                    trans(bt23,SS23,E,S23),
                    trans(bt31,SS31,E,S31),
                    trans(bt32,SS32,E,S32),
                    trans(bt33,SS33,E,S33),
                    requested(SS1,SS21,SS22,SS23,SS31,SS32,SS33,E),
                    not(blocked(SS1,SS21,SS22,SS23,SS31,SS32,SS33,E)).


requested(S1,S21,S22,S23,S31,S32,S33,E) :-
                    request(bt1,S1,E);
                    request(bt21,S21,E);
                    request(bt22,S22,E);
                    request(bt23,S23,E);
                    request(bt31,S31,E);
                    request(bt32,S32,E);
                    request(bt33,S33,E).


blocked(S1,S21,S22,S23,S31,S32,S33,E) :-
                    block(bt1,S1,E);
                    block(bt21,S21,E);
                    block(bt22,S22,E);
                    block(bt23,S23,E);
                    block(bt31,S31,E);
                    block(bt32,S32,E);
                    block(bt33,S33,E).

obs_h1:- state(1,_,s1,_,_,_,_,_).
obs_h2:- state(1,_,_,s1,_,_,_,_).
obs_h3:- state(1,_,_,_,s1,_,_,_).
obs_g2:- state(2,_,_,_,_,_,s1,_).
obs_o1:- state(3,s31,_,_,_,_,_,_).
evidence(obs_o1).
evidence(obs_g2).

query(obs_h1).
query(obs_h2).
query(obs_h3).
