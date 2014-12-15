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
	/*���� ����� ��⡮�*/
	player("������ ����","����⠪",13,"�", 205,90,3, "����").
	player("���஢ ����","������",96,"��", 185,78,4, "���").
	player("����஢ �����","������⨢",69,"�", 190,88,2, "���").
	player("���窨� ����","��௥��",5,"�", 195,80,5, "����").
	player("����ᥥ� ����","����",1,"�", 165,67,2, "���").
	player("��ய�� �����","�����",12,"�",170,74,1, "���").
			/*������ ���⪮��� �����*/
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
		write(" * 1. ��������� �ࠢ��     		*"),nl,
		write(" * 2. ��������� �ࠢ��		        *"),nl,
		write(" * 3. ��ॣ�� ����� �ࠢ��      	*"),nl,
		write(" * 4. ��ॣ�� ��i� ����� �� �ࠢ�i�	*"),nl,
		write(" * 5. ���ॣ� �� � 䠩�		*"),nl,
		write(" * 6. Select ����� ����		*"),nl,
		write(" * 7. ���i�				*"),nl,
		write(" ****************************************"),nl,
		write(" �㭪� ���� 1,...,7 : "),
		readint(Vibor),nl,process(Vibor),Vibor =7,!.		
/* Add new player */
	process(1) :-makewindow(2,7,7,"��������� �����",2,20,18,58),shiftwindow(2),
		write("����i�� ���i:"),nl,
		write("I�'� �ࠢ�� : "), readln(P_name), 
		write("����� ���� : "), readln(K_name),
		write("����� �ࠢ�� : "), readint(P_num),
		write("�����1�: "), readln(Pos),
		write("��1��: "), readint(Ht),
		write("���: "), readint(Wt),
		write("�⠦ : "), readint(Exp),
		write("����� �确���� ������� : "), readln(College),
		assertz(dplayer(P_name, K_name, P_num,Pos,Ht,Wt,Exp, College)),
		write(P_name," ������� � ��"), nl,!,
		write("Press space bar. "), readchar(_), 
		removewindow, shiftwindow(1).
			/* Delete */
	process(2) :-makewindow(3,7,7,"��������� �����",10,30,7,40),shiftwindow(3),
		write("����i�� i�'� �ࠢ��,� ���������� : "), readln(P_name),
		retract(dplayer(P_name,_,_,_,_,_,_,_)), 
		write(P_name," ��������� � �� "), nl, !,
		write("Press space bar."), readchar(_), removewindow,
		shiftwindow(1).
	/*��������� */
	process(2) :-
		makewindow(3,7,7,"��������� �����",10,30,7,40),shiftwindow(3),
		write("����i�� i�'� �ࠢ��,� ���������� : "), readln(P_name),
		retract(dplayer(P_name,_,_,_,_,_,_,_)), 
		write(P_name," ��������� � �� "), nl, !,
		write("Press space bar."), readchar(_), removewindow,
		shiftwindow(1).
			/*��ॣ�� ����� �� �ࠢ��*/ 
	process(3) :-
		makewindow(4,7,7," ��ॣ�� ", 7,30,16,47),  shiftwindow(4),
		write("����i�� i�'� ��� ��ॣ���: "), readln(P_name),
		dplayer(P_name,T_name,P_number,Pos,Ht,Wt,Exp,College),nl, 
		write(" I�'� �ࠢ��   : ",P_name),nl,
		write(" ����� ����   : ",T_name),nl,
		write(" ����� �ࠢ��  : ",P_number),nl,
		write(" �����i�       : ",Pos),nl, 
		write(" ��i��         : ",Ht), nl, 
		write(" ���          : ",Wt),nl,
		write(" �⠦ �����i� : ",Exp), nl,
		write(" ���砫쭨� ������  : ",College),nl, nl,!,
		write("Press space bar"), readchar(_),  
		removewindow, shiftwindow(1).
	process(3) :-
		makewindow(5,7,7," ������ ",14,7,5,60), shiftwindow(5),
		write("�� ����, ����� �����."),nl,
		write("�����, �㢠��!"),nl,!,
		write("Press space bar."),readchar(_),
		removewindow,shiftwindow(1).
	       /* ��ॣ�� ��i� ����� */	
			/* Exit */
	/* ��ॣ�� ��i� ����� */	
	process(4):-
                 makewindow(6,7,7,"��i ���i",7,30,16,47), shiftwindow(6),
	         write("I���� ��i� �ࠢ�i�: "), nl,
	         allnames,
	         readchar(_),
	         removewindow,
	         shiftwindow(1).
	         /* ���०���� �� */
	process(5):-
                  makewindow(7,7,7,"���ॣ� �� � 䠩�",12,30,8,47),
	          write("�� ��i譮 ���०���"),
	          save("players.ddb"),
	          readchar(_),
	          shiftwindow(1).
	process(6):-
                  makewindow(8,7,7,"Select ����� ����:",1,30,24,47),
	          write("����i�� ����� ����:"),nl,
	          readln(K),
	          %write(K),
	          %readchar(_),
	          sample(K),!,
	          %write(Name),
	          %sample(K),
	          readchar(_).
	          %shiftwindow(1).	
	process(7) :-
	write("�� ����� ����i祩! "),readchar(_),exit.	
			/* ���i� */
	process(7) :-
		write("�� ����� ����i祩! "),readchar(_),exit.
			/*��஡�� �������*/
	process(Vibor):-
		Vibor<1, error; Vibor>7, error.
	error:- 
		write("��� ��᪠ �����i�� �᫮ �i� 1 �� 7"),
		write("(Press the spase bar to continue)"),readchar(_).	
	allnames:-dplayer(X,_,_,_,_,_,_,_),
		write(X),nl,
		fail.
		allnames.
sample(K):-
	%	dplayer(Name,K,_,_,_,_,_,_),
	%dplayer(Name,K,Pl,Po,H,M,Nu,I) , nl,
	dplayer(Name,K,Pl,Po,_,_,Nu,I),
		write(" I�'� �ࠢ��   : ",Name),nl,
		%write(" ����� ����   : ",K),nl,
		write(" ����� �ࠢ��  : ",Pl),nl,
		write(" �����i�       : ",Po),nl, 
		%write(" ��i��         : ",H), nl, 
		%write(" ���          : ",M),nl,
		write(" �⠦ �����i� : ",Nu), nl,
		write(" ���砫쭨� ������  : ",I),nl, nl,
readchar(_),
fail.
sample(_).
