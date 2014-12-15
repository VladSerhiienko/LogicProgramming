% Taras Teslyuk
% Labwork 2

:- use_module(library(lists)).

% task 1.9
task1(N):-
    write('got '), write(N), write(' -> '),
    atom_string(N,S),
    atom_chars(S,Cs),
    last(Cs,L),
    write('last is '), write(L), write('\n').

% task 2.4(=9-5)
task2(N,N):- N >= 0, !.
task2(N,M):- N < 0, M is -N.



