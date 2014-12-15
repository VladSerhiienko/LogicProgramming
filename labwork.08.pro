Domains
	p_name,k_name, pos, college = string 
	p_number, height, weight, nfl_exp = integer
Database
	dplayer(p_name, k_name,p_number,pos, height,weight,nfl_exp, college)
Predicates
	repeat
	do_mbase
	assert_database
	menu
	process(integer)
	clear_database
	player(p_name, k_name,p_number,pos, height,weight,nfl_exp, college)
	error
	allnames
	sample(string)
Goal
	do_mbase.
Clauses
	repeat.
	repeat:-repeat.
	/*База даних футбол*/
	player("Иванов Иван","Спартак",13,"з", 205,90,3, "ГГПИ").
	player("Петров Петро","Динамо",96,"пз", 185,78,4, "ГТК").
	player("Сидоров Денис","Локомотив",69,"в", 190,88,2, "ГТУ").
	player("Васечкин Илля","Торпеда",5,"в", 195,80,5, "ГГПИ").
	player("Алексеев Дима","ЦСКА",1,"н", 165,67,2, "ГТК").
	player("Коропив Павел","Зенит",12,"н",170,74,1, "ГКК").
			/*кинець початкових даних*/
			assert_database:-
	player(P_name,K_name,P_number,Pos,Height,Weight,Nfl_exp,College),	
	assertz(dplayer(P_name,K_name,P_number,Pos,Height,Weight,Nfl_exp,College)),
	fail.
	assert_database:-!.
	clear_database:-
		retract(dplayer(_,_,_,_,_,_,_,_)),
		fail.
	clear_database:-!.
	do_mbase :-
		assert_database,
		makewindow(1,7,7," FOOTBALL DATABASE ",0,0,25,80),
		menu,
		clear_database.
	menu :-repeat, clearwindow,
		nl,
		write(" ****************************************"),nl,
		write(" * 1. Додавання гравця     		*"),nl,
		write(" * 2. Видалення гравця		        *"),nl,
		write(" * 3. Перегляд даних гравця      	*"),nl,
		write(" * 4. Перегляд всiх даних про гравцiв	*"),nl,
		write(" * 5. Зберегти БД у файл		*"),nl,
		write(" * 6. Select Назва клубу		*"),nl,
		write(" * 7. Вихiд				*"),nl,
		write(" ****************************************"),nl,
		write(" Пункт меню 1,...,7 : "),
		readint(Vibor),nl,process(Vibor),Vibor =7,!.		
/* Add new player */
	process(1) :-makewindow(2,7,7,"Додавання даних",2,20,18,58),shiftwindow(2),
		write("Введiть данi:"),nl,
		write("Iм'я гравця : "), readln(P_name), 
		write("Назва клубу : "), readln(K_name),
		write("Номер гравця : "), readint(P_num),
		write("Позиц1я: "), readln(Pos),
		write("Зр1ст: "), readint(Ht),
		write("Маса: "), readint(Wt),
		write("Стаж : "), readint(Exp),
		write("Назва учбового закладу : "), readln(College),
		assertz(dplayer(P_name, K_name, P_num,Pos,Ht,Wt,Exp, College)),
		write(P_name," доданий в БД"), nl,!,
		write("Press space bar. "), readchar(_), 
		removewindow, shiftwindow(1).
			/* Delete */
	process(2) :-makewindow(3,7,7,"Видалення даних",10,30,7,40),shiftwindow(3),
		write("Введiть iм'я гравця,що видаляеться : "), readln(P_name),
		retract(dplayer(P_name,_,_,_,_,_,_,_)), 
		write(P_name," видалений з БД "), nl, !,
		write("Press space bar."), readchar(_), removewindow,
		shiftwindow(1).
	/*Видалення */
	process(2) :-
		makewindow(3,7,7,"Видалення даних",10,30,7,40),shiftwindow(3),
		write("Введiть iм'я гравця,що видаляеться : "), readln(P_name),
		retract(dplayer(P_name,_,_,_,_,_,_,_)), 
		write(P_name," видалений з БД "), nl, !,
		write("Press space bar."), readchar(_), removewindow,
		shiftwindow(1).
			/*Перегляд даних про гравця*/ 
	process(3) :-
		makewindow(4,7,7," Перегляд ", 7,30,16,47),  shiftwindow(4),
		write("Введiть iм'я для перегляду: "), readln(P_name),
		dplayer(P_name,T_name,P_number,Pos,Ht,Wt,Exp,College),nl, 
		write(" Iм'я гравця   : ",P_name),nl,
		write(" Назва клубу   : ",T_name),nl,
		write(" Номер гравця  : ",P_number),nl,
		write(" Позицiя       : ",Pos),nl, 
		write(" Зрiст         : ",Ht), nl, 
		write(" Маса          : ",Wt),nl,
		write(" Стаж виступiв : ",Exp), nl,
		write(" Навчальний заклад  : ",College),nl, nl,!,
		write("Press space bar"), readchar(_),  
		removewindow, shiftwindow(1).
	process(3) :-
		makewindow(5,7,7," Невдача ",14,7,5,60), shiftwindow(5),
		write("На жаль, даних немае."),nl,
		write("Даруйте, бувайте!"),nl,!,
		write("Press space bar."),readchar(_),
		removewindow,shiftwindow(1).
	       /* Перегляд всiх даних */	
			/* Exit */
	/* Перегляд всiх даних */	
	process(4):-
                 makewindow(6,7,7,"Всi данi",7,30,16,47), shiftwindow(6),
	         write("Iмена усiх гравцiв: "), nl,
	         allnames,
	         readchar(_),
	         removewindow,
	         shiftwindow(1).
	         /* Збереження БД */
	process(5):-
                  makewindow(7,7,7,"Зберегти БД у файл",12,30,8,47),
	          write("БД успiшно збережена"),
	          save("players.ddb"),
	          readchar(_),
	          shiftwindow(1).
	process(6):-
                  makewindow(8,7,7,"Select Назва клубу:",1,30,24,47),
	          write("Вкажiть назву клубу:"),nl,
	          readln(K),
	          %write(K),
	          %readchar(_),
	          sample(K),!,
	          %write(Name),
	          %sample(K),
	          readchar(_).
	          %shiftwindow(1).	
	process(7) :-
	write("До нових зусирiчей! "),readchar(_),exit.	
			/* Вихiд */
	process(7) :-
		write("До нових зусирiчей! "),readchar(_),exit.
			/*Обробка помилки*/
	process(Vibor):-
		Vibor<1, error; Vibor>7, error.
	error:- 
		write("Будь ласка виберiть число вiд 1 до 7"),
		write("(Press the spase bar to continue)"),readchar(_).	
	allnames:-dplayer(X,_,_,_,_,_,_,_),
		write(X),nl,
		fail.
		allnames.
sample(K):-
	%	dplayer(Name,K,_,_,_,_,_,_),
	%dplayer(Name,K,Pl,Po,H,M,Nu,I) , nl,
	dplayer(Name,K,Pl,Po,_,_,Nu,I),
		write(" Iм'я гравця   : ",Name),nl,
		%write(" Назва клубу   : ",K),nl,
		write(" Номер гравця  : ",Pl),nl,
		write(" Позицiя       : ",Po),nl, 
		%write(" Зрiст         : ",H), nl, 
		%write(" Маса          : ",M),nl,
		write(" Стаж виступiв : ",Nu), nl,
		write(" Навчальний заклад  : ",I),nl, nl,
readchar(_),
fail.
sample(_).
