% Name: Navjeet Hundal
% ID: 30004202
% Tutorial: T05
% To run code you can do :
% peg('crossbow').
% peg('longbow').
% peg(not quite dead).
% peg('half dead').
% peg('almost dead').
% peg('full').
% to run each name should be in a '' since some of the names have spaces in them
% everything runs in less than 10 seconds, tested it using cpsc lab computers
% i did both independence and pagoda 

% creating game states 
board('crossbow',[31,32,34,35,41,42,43,44,45,53],3).
board('longbow',[20,26,30,31,33,35,36,41,43,45,52,53,54,63],3).
board('not quite dead',[2,3,4,12,14,20,21,22,23,24,25,26,30,32,35,36,40,41,42,43,44,45,46,52,54,62,64],33).
board('half dead',[20,22,23,24,30,34,35,40,41,42,43,44,45,52,54,62,64],33).
board('almost dead',[22,23,24,34,35,42,43,44],33).
board('full',[2,3,4,12,13,14,20,21,22,23,24,25,26,30,31,32,34,35,36,40,41,42,43,44,45,46,52,53,54,62,63,64],33).

% creating pagoda functions
% pagoda for simple
pagoda(simpleCenter,13,1).
pagoda(simpleCenter,31,1).
pagoda(simpleCenter,33,1).
pagoda(simpleCenter,35,1).
pagoda(simpleCenter,53,1).

% pagoda for complex
pagoda(complexCenter,13,1).
pagoda(complexCenter,20,-1).
pagoda(complexCenter,21,1).
pagoda(complexCenter,23,1).
pagoda(complexCenter,25,1).
pagoda(complexCenter,26,-1).
pagoda(complexCenter,31,2).
pagoda(complexCenter,33,2).
pagoda(complexCenter,35,2).
pagoda(complexCenter,40,-1).
pagoda(complexCenter,41,1).
pagoda(complexCenter,43,1).
pagoda(complexCenter,45,1).
pagoda(complexCenter,46,-1).
pagoda(complexCenter,53,1).

% pagoda for complex but rotated 90 degrees
pagoda(rotate90ComplexCenter,2,-1).
pagoda(rotate90ComplexCenter,4,-1).
pagoda(rotate90ComplexCenter,12,1).
pagoda(rotate90ComplexCenter,13,2).
pagoda(rotate90ComplexCenter,14,1).
pagoda(rotate90ComplexCenter,31,1).
pagoda(rotate90ComplexCenter,32,1).
pagoda(rotate90ComplexCenter,33,2).
pagoda(rotate90ComplexCenter,34,1).
pagoda(rotate90ComplexCenter,35,1).
pagoda(rotate90ComplexCenter,52,1).
pagoda(rotate90ComplexCenter,53,2).
pagoda(rotate90ComplexCenter,54,1).
pagoda(rotate90ComplexCenter,62,-1).
pagoda(rotate90ComplexCenter,64,-1).

% pagoda for lastCouple
pagoda(lastCouple,2,-1).
pagoda(lastCouple,4,-1).
pagoda(lastCouple,12,1).
pagoda(lastCouple,14,1).
pagoda(lastCouple,31,1).
pagoda(lastCouple,32,1).
pagoda(lastCouple,34,1).
pagoda(lastCouple,36,1).
pagoda(lastCouple,52,1).
pagoda(lastCouple,54,1).
pagoda(lastCouple,62,-1).
pagoda(lastCouple,64,-1).

% pagoda for top heavy
pagoda(top,3,21).
pagoda(top,13,13).
pagoda(top,20,-8).
pagoda(top,21,8).
pagoda(top,23,8).
pagoda(top,25,8).
pagoda(top,26,-8).
pagoda(top,30,5).
pagoda(top,31,5).
pagoda(top,33,5).
pagoda(top,35,5).
pagoda(top,36,5).
pagoda(top,40,-3).
pagoda(top,41,3).
pagoda(top,43,3).
pagoda(top,45,3).
pagoda(top,46,-3).
pagoda(top,53,2).
pagoda(top,54,3).
pagoda(top,63,1).

% creating the goal weight depending on which game 
goal_wgt('full',simpleCenter,1).
goal_wgt('full',complexCenter,2).
goal_wgt('full',rotate90ComplexCenter,2).
goal_wgt('full',lastCouple,0).
goal_wgt('full',top,5).

goal_wgt('crossbow',simpleCenter,0).
goal_wgt('crossbow',complexCenter,0).
goal_wgt('crossbow',rotate90ComplexCenter,0).
goal_wgt('crossbow',lastCouple,0).
goal_wgt('crossbow',top,21).

goal_wgt('longbow',simpleCenter,0).
goal_wgt('longbow',complexCenter,0).
goal_wgt('longbow',rotate90ComplexCenter,0).
goal_wgt('longbow',lastCouple,0).
goal_wgt('longbow',top,21).

goal_wgt('half dead',simpleCenter,1).
goal_wgt('half dead',complexCenter,2).
goal_wgt('half dead',rotate90ComplexCenter,2).
goal_wgt('half dead',lastCouple,0).
goal_wgt('half dead',top,5).

goal_wgt('almost dead',simpleCenter,1).
goal_wgt('almost dead',complexCenter,2).
goal_wgt('almost dead',rotate90ComplexCenter,2).
goal_wgt('almost dead',lastCouple,0).
goal_wgt('almost dead',top,5).

goal_wgt('not quite dead',simpleCenter,1).
goal_wgt('not quite dead',complexCenter,2).
goal_wgt('not quite dead',rotate90ComplexCenter,2).
goal_wgt('not quite dead',lastCouple,0).
goal_wgt('not quite dead',top,5).

% printing the board
print_board(Counter,_,_) :- 
	Counter > 68,write('................\n'),!.
print_board(Counter,GB,G) :-	%checking if counter is out of bounds so we go to a new line
	((Counter = 7;
	 Counter = 17;
	 Counter = 27;
	 Counter = 37;
	 Counter = 47;
	 Counter = 57;
	 Counter = 67) -> write('\n'), NewCounter is Counter +3),
	print_board(NewCounter,GB,G).
print_board(Counter,GB,G) :-  % putting spaces to give the board its shape
	((Counter = 0;
	 Counter = 1;
	 Counter = 5; 
	 Counter = 6;
	 Counter = 10;
	 Counter = 11;
	 Counter = 15;
	 Counter = 16;
	 Counter = 50;
	 Counter = 51;
	 Counter = 55;
	 Counter = 56;
	 Counter = 60;
	 Counter = 61;
	 Counter = 65;
	 Counter = 66) -> write('  ')), NewCounter is Counter + 1, print_board(NewCounter,GB,G).

print_board(Counter,GB,G) :-
	member(Counter,[G]),not(member(G,GB)),write('o '),  % puting o at the goal
	NewCounter is Counter + 1,
	print_board(NewCounter,GB,G).

print_board(Counter,GB,G) :- 
	member(Counter,GB) -> write('x '),  % putting x for the pegs
	NewCounter is Counter + 1, 
	print_board(NewCounter,GB,G).

print_board(Counter,GB,G) :-  % puting _ for empty spaces
	write('_ '), 
	NewCounter is Counter + 1, 
	print_board(NewCounter,GB,G).


% check if on board
onboard(Position) :- 2 =< Position, Position =< 4.
onboard(Position) :- 12 =< Position, Position =< 14.
onboard(Position) :- 20 =< Position, Position =< 26.
onboard(Position) :- 30 =< Position, Position =< 36.
onboard(Position) :- 40 =< Position, Position =< 46.
onboard(Position) :- 52 =< Position, Position =< 54.
onboard(Position) :- 62 =< Position, Position =< 64.


% jump to the right
jump(Start,Jumped,End) :-
	Jumped is Start + 1,
	End is Start + 2,
	onboard(Start),
	onboard(Jumped),
	onboard(End).

% jump to the left
jump(Start,Jumped,End) :-
	Jumped is Start - 1,
	End is Start - 2,
	onboard(Start),
	onboard(Jumped),
	onboard(End).

% jump to the down
jump(Start,Jumped,End) :-
	Jumped is Start + 10,
	End is Start + 20,
	onboard(Start),
	onboard(Jumped),
	onboard(End).

% jump to the up
jump(Start,Jumped,End) :-
	Jumped is Start - 10,
	End is Start - 20,
	onboard(Start),
	onboard(Jumped),
	onboard(End).

remove(X,[X|T],T).
remove(X,[H|T],[H|R]) :- remove(X,T,R).


solitaire_move(SB,(Start,End),[End|SB2]) :- 
	remove(Start,SB,SB1),
	jump(Start,Jumped,End),
	remove(Jumped,SB1,SB2),
	not(member(End,SB2)).

solitaire_steps(_,GB,_,[],GB).
solitaire_steps(Game,SB,Hist,[Mv|Moves],GB) :-
	solitaire_move(SB,Mv,SB1),
	independent(Mv,Hist),
	findall((P,W),(member(P,[simpleCenter,complexCenter,rotate90ComplexCenter,lastCouple,top]),wgt(P,SB1,W)),Wgts),
	check_wgts(Game,Wgts),
	solitaire_steps(Game,SB1,[Mv|Hist],Moves,GB).

peg(Game) :-
	board(Game,SB,GB),
	write('Start board:\n'),
	print_board(0,SB,GB),
	write('End board:\n'),
	print_board(0,[GB],[]),
	write('Steps:\n'),
	solitaire_steps(Game,SB,[],Moves,[GB]),
	print_board(0,SB,GB),
	
	write('Continue (y.) for yes or (n.) for no:  '), read(Answer), (Answer = 'y' -> print_steps(SB,Moves,GB); end_game(1)). 
	
end_game(1).
print_steps(SB,[(Start,End)|Moves],GB) :-
	remove(Start,SB,NB),
	jump(Start,Jumped,End),
	remove(Jumped,NB,NB2),
	append([End],NB2,NB3),
	print_board(0,NB3,GB),
	write('Continue (y.) for yes or (n.) for no:  '), read(Answer), (Answer = 'y' -> print_steps(NB3,Moves,GB); end_game(1)).
print_steps(_,[],_).

independent(_,[]).
independent(Mv,[H|_]) :-
	overlap(Mv,H),!.
independent(Mv,[H|T]) :-
	lexorder(Mv,H),
	independent(Mv,T).

overlap((Start1,End1),(Start2,End2)) :-
	jump(Start1,Jumped1,End1),
	jump(Start2,Jumped2,End2),
	(Start1 = Start2;
	 Start1 = Jumped2;
	 Start1 = End2;
	 Jumped1 = Start2;
	 Jumped1 = Jumped2;
	 Jumped1 = End2;
	 End1 = Start2;
	 End1 = Jumped2;
	 End1 = End2).

lexorder((Start1,_),(Start2,_)) :-
	Start1 =< Start2.

check_wgts(_,[]).
check_wgts(Game,[(P,WgtP)|Rest]) :-
	goal_wgt(Game,P,WgtGoal),
	WgtP >= WgtGoal,
	check_wgts(Game,Rest).

wgt(_,[],0).
wgt(P,[Pos|Rest],Wgt) :- 
	(pagoda(P,Pos,PWgt);
	 PWgt = 0),!,
	wgt(P,Rest,WgtRest),
	Wgt is WgtRest + PWgt.
	



	