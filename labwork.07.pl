% Vlad Serhiienko

:- use_module(library(lists)).
:- use_module(library(pio)).

go :-
   open('numbersInput.txt',read,In),
   read_file(In,Lines),
   write('Read >> '),
   write(Lines),
   write('\n'),
   msort(Lines,LinesSA),
   reverse(LinesSA,LinesSD),
   open('numbersOutputSA.txt',write,OutSA),
   write_file(OutSA,LinesSA),
   open('numbersOutputSD.txt',write,OutSD),
   write_file(OutSD,LinesSD),
   sumlist(Lines,LinesSum),
   open('numbersOutputSS.txt',write,OutSS),
   write_file(OutSS,LinesSum),
   open('numbersOutputSQ.txt',write,OutSQ),
   write_with_squares_file(OutSQ,LinesSA),
   fail.

read_file(Stream,[]) :-
    at_end_of_stream(Stream).
read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).

write_with_squares_file(Stream,[]) :-
  close(Stream),
  write('Done writingSQ!\n'),
  !.
write_with_squares_file(Stream,[H|T]) :-
  write('WritingSQ >> '),
  integer(H),
  HSq is H * H,
  write(Stream,H), write(Stream,' '),
  write(Stream,HSq), write(Stream,'\n'),
  write(H), write(' '),
  write(HSq), write('\n'),
  write_with_squares_file(Stream,T).

write_file(Stream,X) :-
   write('Writing >> '),
   write(Stream,X),
   write(X),
   write('\n'),
   write('Done writing!\n'),
   close(Stream),
   !.
