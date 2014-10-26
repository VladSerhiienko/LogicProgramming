% Vlad Serhiienko

implement main
    open core


class predicates
    printNumbersTill : (integer MaxValue) nondeterm (i).
    printNumbersTillHelper : (integer MaxValue, integer CurrentValue) nondeterm (i, i).

clauses
    printNumbersTillHelper(Max, Max + 1) :-
        stdio::write("> done\n").
    printNumbersTillHelper(Max, Curr) :-
        Curr <= Max,
        stdio::writef(">> %\n", Curr),
        printNumbersTillHelper(Max, Curr + 1).

clauses
    printNumbersTill(Max) :-
        stdio::write("> print all numbers from 1 to N\n"),
        stdio::writef("> let N = %, then:\n", Max),
        printNumbersTillHelper(Max, 1).



clauses
    run() :- % initialize console
        console::init(),
        stdio::write("Vlad Serhiienko, Labwork 3, Task 4\n"),
        fail.

    run() :- % launch sample
        N = 15, %let N = 15
        printNumbersTill(N),
        fail.

    run() :- %% should be a procedure
        succeed.

end implement main

goal
    console::runUtf8(main::run).