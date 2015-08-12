% prolog

create_board :-
    member(Col, ['A', 'B', 'C']),
    member(Row, ['1', '2', '3']),
    asserta(board(Col, Row, empty)),
    fail.
create_board.

% Winning rules:
% Horizontal and Vertical
won(Player) :- board(X, '1', Player), board(X, '2', Player), board(X, '3', Player).
won(Player) :- board('A', Y, Player), board('B', Y, Player), board('C', Y, Player).
% Diagonal
won(Player) :- board('A', '1', Player), board('B', '2', Player), board('C', '3', Player).
won(Player) :- board('C', '1', Player), board('B', '2', Player), board('A', '3', Player).

next_player('X', 'O').
next_player('O', 'X').

read_input(Player) :-
    get_single_char(Col), atom_codes(C, [Col]), write(C), member(Col, "ABC"),
    get_single_char(Row), atom_codes(R, [Row]), write(R), nl, member(Row, "123"),
    retract(board(C, R, empty)),
    asserta(board(C, R, Player)).

read_input(_) :- nl, write('Erro na jogada: jogada deve ser A1, A2, B2, etc,'),
    write(' e não pode ocupar um quadrado já preenchido.'), nl, fail.

prompt(Player) :- write('Jogador '), write(Player), write(', sua escolha? ').
prompt(_) :- fail.

print_board :-
    tab(8), write('   A   B   C'), nl,
    print_row(['1', '2', '3']), !, nl.

print_row([Row]) :-
    tab(8), write(Row), tab(1), 
    board('A', Row, C1), print_cell(C1), write('|'),
    board('B', Row, C2), print_cell(C2), write('|'),
    board('C', Row, C3), print_cell(C3), nl.

print_row([Head | Tail]) :-
    print_row([Head]), tab(10), write('---+---+---'), nl, print_row(Tail).

print_cell(empty) :- tab(3).
print_cell(Player) :- Player \= empty, tab(1), write(Player), tab(1).

play(Player) :- print_board, prompt(Player), read_input(Player), next_step(Player).
play(Player) :- nl, play(Player).

next_step(Player) :- won(Player), print_board, write(Player), write(' venceu!'), nl.

next_step(Player) :- board(_, _, empty), next_player(Player, Next), play(Next).

next_step(_) :- print_board, write('Deu velha!'), nl.

main :- create_board, play('X'), halt.

% Comment this line if you don't want to automatically run the program.
:- main.
