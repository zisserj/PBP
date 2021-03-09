1.0:: likes(X,Y):- friendof(X,Y).
0.8:: likes(X,Y):- friendof(X,Z), likes(Z,Y).
0.5:: friendof(john,mary).
0.5:: friendof(mary,pedro).
0.5:: friendof(mary,tom).
0.5:: friendof(pedro,tom).

query(likes(john,tom)).