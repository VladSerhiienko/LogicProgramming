% Vlad Serhiienko, 10/25/14

implement main
    open core

class predicates

    %% Task 1

    % calculate X^3
    cubeX : (integer X, integer CubeX) procedure (i, o).
    % calculate X^2
    squareX : (integer X, integer SquareX) procedure (i, o).
    % calculate Y=AX+B
    linearFunc : (integer A, integer B, integer X, integer Y) procedure (i, i, i, o).
    % calculate P=A+B+C
    trianglePerimeter : (integer A, integer B, integer C, integer P) procedure (i, i, i, o).

    %% Task 2

    minXY : (integer X, integer Y, integer Min) nondeterm (i, i, o) (i, i, i).
    % minXYZ : (integer X, integer Y, integer Z, integer Min) nondeterm (i, i, i, o).
    minList : (integer_list L, integer Min) nondeterm (i, o).
    absX : (integer X, integer AbsX) nondeterm (i, o).
    customFunc : (integer X, integer Fx) nondeterm (i, o).

clauses
    %% Task 1
    cubeX(X, CubeX) :- CubeX = X * X * X.
    squareX(X, SquareX) :- SquareX = X * X.
    linearFunc(A, B, X, Y) :- Y = A * X + B.
    trianglePerimeter(A, B, C, P) :- P = A + B + C.

    %% Task 2
    minXY(X,Y,X) :- X <= Y. % X
    minXY(X,Y,Y) :- X > Y. % Y
    % minXYZ(X,Y,Z,X) :- minXY(X,Y,X), minXY(X,Z,X). % X
    % minXYZ(X,Y,Z,Y) :- minXY(Y,X,Y), minXY(Y,Z,Y). % Y
    % minXYZ(X,Y,Z,Z) :- minXY(Z,X,Z), minXY(Z,Y,Z). % Z
    minList([X,Y|T], Min) :- minXY(X,Y,H), minList([H|T], Min). % list still has elements to check
    minList([X,Y|[]], X) :- minXY(X,Y,X). %, stdio::write("min is X\n"). % only two elements left to check for minimum
    minList([X,Y|[]], Y) :- minXY(X,Y,Y). %, stdio::write("min is Y\n"). % only two elements left to check
    % minList([H|[]], H) :- stdio::write("implicite min\n"). % one element implicitely becames the minimum

    absX(X, X) :- X > 0.
    absX(X, -X) :- X < 0.
    absX(0, 0).

    customFunc(X, Y) :- (X < -1), squareX(X, Y).
    customFunc(X, Y) :- (X > 1), squareX(X, Y).
    customFunc(X, Y) :- (X < 1) and (X > -1), Y = X + 1.

clauses
    run() :-
        console::init(),
        stdio::write("Vlad Serhiienko, Labwork 2\n"),
        fail.
    run() :-
        X = 5,
        cubeX(X, Y),
        stdio::writef("cube(%)=%\n", X, Y),
        fail.
    run() :-
        X = 5,
        squareX(X, Y),
        stdio::writef("square(%)=%\n", X, Y),
        fail.
    run() :-
        A = 2, B = 3, X = 5,
        linearFunc(A, B, X, Y),
        stdio::writef("linearFunc(%*%+%)=%\n", A, X, B, Y),
        fail.
    run() :-
        A = 1, B = 2, C = 3,
        trianglePerimeter(A, B, C, P),
        stdio::writef("P(%,%,%)=%\n", A, B, C, P),
        fail.
    run() :-
        A = 1,
        B = 0,
        minXY(A, B, Min),
        stdio::writef("min(%,%)=%\n", A, B, Min),
        fail.
    run() :-
        A = 3, B = 2,
        minXY(A, B, Min),
        stdio::writef("min(%,%)=%\n", A, B, Min),
        fail.
%    run() :-
%        A = 1, B = 2, C = 3,
%        minXYZ(A, B, C, Min),
%        stdio::writef("min(%,%,%)=%\n", A, B, C, Min),
%        fail.
%    run() :-
%        A = 2, B = 3, C = 1,
%        minXYZ(A, B, C, Min),
%        stdio::writef("min(%,%,%)=%\n", A, B, C, Min),
%        fail.
%    run() :-
%        A = 1, B = 10, C = 1,
%        minXYZ(A, B, C, Min),
%        stdio::writef("min(%,%,%)=%\n", A, B, C, Min),
%        fail.
    run() :-
        List = [10, 8, 0, 6, 5, 0, 4 ,3, 2, 1, 10],
        minList(List, MinInList),
        stdio::writef("min(%)=%\n", List, MinInList),
        fail.
    run() :-
        X = 1,
        absX(X, Y),
        stdio::writef("abs(%)=%\n", X, Y),
        fail.
    run() :-
        X = -2,
        absX(X, Y),
        stdio::writef("abs(%)=%\n", X, Y),
        fail.
    run() :-
        X = -2,
        customFunc(X, Y),
        stdio::writef("customFunc(%)=%\n", X, Y),
        fail.
    run() :-
        X = 2,
        customFunc(X, Y),
        stdio::writef("customFunc(%)=%\n", X, Y),
        fail.
    run() :-
        X = 0,
        customFunc(X, Y),
        stdio::writef("customFunc(%)=%\n", X, Y),
        fail.
    run() :-
        stdio::nl().

end implement main

goal
    console::runUtf8(main::run).