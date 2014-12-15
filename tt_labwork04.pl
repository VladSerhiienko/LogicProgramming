% Taras Teslyuk
% Labwork 4

set_tail_helper([],_,_,[]).
set_tail_helper([_],T,TL,NL) :- reverse([T|TL],NL),!.
set_tail_helper([Lh|Lt],T,TL,NL) :- set_tail_helper(Lt,T,[Lh|TL],NL).
set_tail([Lh|Lt],T,NL) :- set_tail_helper(Lt,T,[Lh],NL).

go :-
   TestList=[1,2,3],
   LastElem=4,
   set_tail(TestList,LastElem,OutList),
   write(OutList).
