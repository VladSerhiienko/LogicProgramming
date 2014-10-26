% Vlad Serhiienko

implement main
    open core

domains
    int = integer.
    int_list = integer_list.

class predicates

    %% Labwork related tests

    % calculates digit count in the number
    calculateDigitCount : (math::uReal X, int DigitCount) determ (i, o).
    % calculates log10
    log10 : (math::uReal X, real Log10) procedure (i, o).
    % prints X digits to console
    printDigits : (int X) nondeterm.

    %% Labwork

    collectDigits : (int X, int_list CurrDigits, int_list OutDigits) nondeterm (i, i, o).
    reverseAccumulateList : (int_list In, int_list Tmp, int_list Out) determ (i, i, o).

    %% Labwork task


    % collects all X digits to the list
    collectDigits : (int X, int_list Digits) nondeterm (i, o).
    % reverses element positions in the list
    reverseList : (int_list In, int_list Out) determ (i, o).

clauses

    %% Labwork related tests

    log10(X, Log10) :- Log10 = math::log(X) / math::log(10).
    calculateDigitCount(X, DigitCount) :- X > 0, log10(X, Log10), DigitCount = math::round(Log10) + 1.

    printDigits(X) :- X < 10, stdio::writef("%\n", X). % nothing to split to
    printDigits(X) :- X >= 10, stdio::writef("%\n", X mod 10), printDigits(X div 10).
    % ensure the negatives will be processed correctly
    printDigits(X) :- X < 0, printDigits(math::abs(X)).

    %% Labwork task clauses

    % finalize output list
    collectDigits(X, C, O) :- X < 10, O = [X | C].
    % append last digit to accumulator
    collectDigits(X, C, O) :- X >= 10, collectDigits(X div 10, [X mod 10 | C], O).
    % initialize tml list as an empty one, ensure negatives will be processed correctly
    collectDigits(X, O) :- collectDigits(math::abs(X), [], O).

    % append last digit to accumulator
    reverseAccumulateList([HIn|TIn], Tmp, Out) :- reverseAccumulateList(TIn, [HIn|Tmp], Out).
    % stop when all digits are passed to temp list and assign the tmp list to output one.
    reverseAccumulateList([], Out, Out).
    % initialize tml list as an empty one
    reverseList(In, Out) :- reverseAccumulateList(In, [], Out).

clauses
    run() :- % allocate console, read database
        console::init(),
        stdio::write("Vlad Serhiienko, Labwork 4, Task 23\n"),
        fail.
    run() :-
        N = 1234567890,
        collectDigits(N, Digits),
        reverseList(Digits, RevDigits),
        stdio::writef("X=% Digits=%\n", N, Digits),
        stdio::writef("X=% RevDigits=%\n", N, RevDigits),
        fail.

    run() :-
        succeed. % place your own code here

end implement main

goal
    console::runUtf8(main::run).