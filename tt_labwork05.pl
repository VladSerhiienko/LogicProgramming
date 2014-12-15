% Taras Teslyuk
% Labwork 5

person_name(person(N,_),N).
person_place(person(_,P),P).
first_friend(X,[X,_,_]).
second_friend(X,[_,X,_]).
third_friend(X,[_,_,X]).
some_friend(X,[X,_,_]).
some_friend(X,[_,X,_]).
some_friend(X,[_,_,X]).
friends(0,[]) :- !.
friends(N,[person(_,_)|List]) :- M is N-1, friends(M, List).

labwork5_go :-
    friends(3,Friends),
    first_friend(Kolya,Friends), person_name(Kolya,'kolya'),
    second_friend(Sveta,Friends), person_name(Sveta,'sveta'),
    third_friend(Olya,Friends), person_name(Olya,'olya'),
    some_friend(Friend1,Friends), person_place(Friend1,'bed'),
    some_friend(Friend2,Friends), person_place(Friend2,'chair'),
    some_friend(Friend3,Friends), person_place(Friend3,'sofa'),
    (\+ person_place(Kolya,'bed')),
    (\+ person_place(Kolya,'chair')),
    (\+ person_place(Sveta,'chair')),
    write('Kolya sits on '), person_place(Kolya,KS), write(KS), write('\n'),
    write('Sveta sits on '), person_place(Sveta,SS), write(SS), write('\n'),
    write('Olya sits on '), person_place(Olya,OS), write(OS), write('\n')
    .

