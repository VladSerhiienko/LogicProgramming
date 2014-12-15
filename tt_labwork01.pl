% Taras Teslyuk
% Labwork 1

student('bobrov',5,3,2).
student('vyatkin',5,5,5).
student('krotov',2,3,3).
student('sosnin',4,4,4).
student('vavilov',4,2,1).

astud(X) :-
    student(X,A,G,H),
    A =:= 5,
    G =:= 5,
    H =:= 5.
dstud(X) :-
    student(X,A,G,H),
    (A is 2 ;
     G is 2 ;
     H is 2).
mathstud(X) :-
    student(X,A,G,_),
    (A >= 4,
     G >= 4).
nothiststud(X) :-
    student(X,_,_,H),
    H < 3.
stud_alg(S,D) :-
    student(S,D,_,_).
stud_geom(S,D) :-
    student(S,_,D,_).
stud_hist(S,D) :-
    student(S,_,_,D).

go :-
     astud(X),
     write('a-student '),
     write(X),
     write('\n'),
     true.
go :-
     dstud(X),
     write('d-student '),
     write(X),
     write('\n'),
     true.
go :-
     mathstud(X),
     write('math-student '),
     write(X),
     write('\n'),
     true.
go :-
     nothiststud(X),
     write('not-hist-student '),
     write(X),
     write('\n'),
     true.
go :-
     false.
