did_better(A,B,[A,B,C]).
did_better(A,C,[A,B,C]).
did_better(B,C,[A,B,C]).

name_of(person(A,B,C),A).
nationality(person(A,B,C),B).
sport(person(A,B,C),C).

first([X|Xs],X).

member(X,[X|_]).
member(X,[_|L]) :- member(X,L).

friends(0,[]) :- !.
friends(N,[person(Name,Nat,Sport)|List]) :- M is N-1, friends(M, List).

answer(Aussie,Richards_Sport) :-
    friends(3,Friends),

    did_better(M1,M2,Friends),     % First Clue
    name_of(M1,michael),
    sport(M1,basketball),
    nationality(M2,american),

    did_better(M3,M4,Friends),     % Second Clue
    name_of(M3,simon),
    nationality(M3,israeli),
    sport(M4,tennis),

    first(Friends,M5),             % Third Clue
    sport(M5,cricket),

    member(Q1,Friends),            % First Question
    name_of(Q1,Aussie),
    nationality(Q1,australian),

    member(Q2,Friends),            % Second Question
    name_of(Q2,richard),
    sport(Q2,Richards_Sport).
