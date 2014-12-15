% Taras Teslyuk
% Labwork 3

% sum1toN(10,X).
sum1toN(N,S) :-
    write('sum 1:'),
    write(N), write(' = '),
    S is N * (N + 1) / 2.
