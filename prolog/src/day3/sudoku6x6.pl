:- module(sudoku6x6, [sudoku6x6/2, sudoku6x6_test/1]).
:- use_module(library(clpfd)).

% Check if list values are in given range.
list_range(List, Minimum, Maximum) :- List ins Minimum..Maximum.

% Recursive check if all nested lists are different.
list_different([]).
list_different([Head|Tail]) :-
  all_different(Head),
  list_different(Tail).

% Extended original 4x4 Sudoku program found in the book.
sudoku6x6(Input, Output) :-
  Input = Output,
  Output = [
    Field11, Field12, Field13, Field14, Field15, Field16,
    Field21, Field22, Field23, Field24, Field25, Field26,
    Field31, Field32, Field33, Field34, Field35, Field36,
    Field41, Field42, Field43, Field44, Field45, Field46,
    Field51, Field52, Field53, Field54, Field55, Field56,
    Field61, Field62, Field63, Field64, Field65, Field66
  ],

  list_range(Output, 1, 6),

  Row1 = [Field11, Field12, Field13, Field14, Field15, Field16],
  Row2 = [Field21, Field22, Field23, Field24, Field25, Field26],
  Row3 = [Field31, Field32, Field33, Field34, Field35, Field36],
  Row4 = [Field41, Field42, Field43, Field44, Field45, Field46],
  Row5 = [Field51, Field52, Field53, Field54, Field55, Field56],
  Row6 = [Field61, Field62, Field63, Field64, Field65, Field66],

  Col1 = [Field11, Field21, Field31, Field41, Field51, Field61],
  Col2 = [Field12, Field22, Field32, Field42, Field52, Field62],
  Col3 = [Field13, Field23, Field33, Field43, Field53, Field63],
  Col4 = [Field14, Field24, Field34, Field44, Field54, Field64],
  Col5 = [Field15, Field25, Field35, Field45, Field55, Field65],
  Col6 = [Field16, Field26, Field36, Field46, Field56, Field66],

  Square1 = [Field11, Field12, Field13, Field21, Field22, Field23],
  Square2 = [Field14, Field15, Field16, Field24, Field25, Field26],
  Square3 = [Field31, Field32, Field33, Field41, Field42, Field43],
  Square4 = [Field34, Field35, Field36, Field44, Field45, Field46],
  Square5 = [Field51, Field52, Field53, Field61, Field62, Field63],
  Square6 = [Field54, Field55, Field56, Field64, Field65, Field66],

  list_different([
    Row1, Row2, Row3, Row4, Row5, Row6,
    Col1, Col2, Col3, Col4, Col5, Col6,
    Square1, Square2, Square3, Square4, Square5, Square6
  ]).

sudoku6x6_test(Output) :-
  sudoku6x6(
    [
      _, 4, _, 1, 6, 5,
      _, _, _, _, _, 3,
      _, 5, 4, _, 3, 1,
      _, _, 2, _, 4, _,
      5, 2, _, _, 1, 4,
      _, 3, 1, _, _, _
    ],
    Output
  ).