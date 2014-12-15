/* animal.pro
  animal identification game.

    start with ?- go.     */

go :- hypothesize(Device),
      write('I guess that the most suitable device is: '),
      write(Device),
      nl, undo.

/* hypotheses to be tested */
hypothesize(device1) :- device1, !.
hypothesize(device2) :- device2, !.
hypothesize(device3) :- device3, !.
hypothesize(device4) :- device4, !.
hypothesize(device5) :- device5, !.
hypothesize(device6) :- device6, !.
hypothesize(device7) :- device7, !.
hypothesize(device8) :- device8, !.
hypothesize(device9) :- device9, !.
hypothesize(unknown).             /* no diagnosis */

/* animal identification rules */
device1 :- category1,
           category2,
           verify(has_feature7),
           verify(has_feature8).
device2 :- category1,
           category2,
           verify(has_feature9),
           verify(has_feature10).
device3 :- category3,
           verify(has_feature11),
           verify(has_feature12).
device4 :- category3,
           verify(has_feature13).

device5 :- category4,
           verify(has_feature14),
           verify(has_feature15).
device6 :- category4,
           verify(has_feature16),
           verify(has_featyre17),
           verify(has_feature18).
device7 :- category4,
	   verify(has_feature19),
	   verify(has_feature20).
device8 :- category5,
	   verify(has_feature16),
	   verify(has_feature17),
	   verify(has_feature19),
	   verify(has_feature13),
	   verify(has_feature25).
device9 :- category6,
	   verify(has_feature19),
	   verify(has_feature22),
	   verify(has_feature23),
	   verify(has_feature24).

/* classification rules */
category1 :- verify(has_feature1), !.
category1 :- verify(has_feature2).
category2 :- verify(has_feature3), !.
category3 :- verify(has_feature4),
             verify(has_feature5).
category4 :- verify(has_feature6), !.
category5 :- verify(has_feature21), !.
category6 :- verify(has_feature22), !.

/* how to ask questions */
ask(Question) :-
    write('Does the device have the following feature: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)->true; (no(S)->fail;ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo. %*/
