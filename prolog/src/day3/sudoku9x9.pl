:- module(sudoku9x9, [sudoku9x9/2, sudoku9x9_test/1]).
:- use_module(library(clpfd)).

% Check if list values are in given range.
list_range(List, Minimum, Maximum) :- List ins Minimum..Maximum.

% Recursive check if all nested lists are different.
list_different([]).
list_different([Head|Tail]) :-
  all_different(Head),
  list_different(Tail).

% Extended original 4x4 Sudoku program found in the book.
sudoku9x9(Input, Output) :-
  Input = Output,
  Output = [
    Field11, Field12, Field13, Field14, Field15, Field16, Field17, Field18, Field19,
    Field21, Field22, Field23, Field24, Field25, Field26, Field27, Field28, Field29,
    Field31, Field32, Field33, Field34, Field35, Field36, Field37, Field38, Field39,
    Field41, Field42, Field43, Field44, Field45, Field46, Field47, Field48, Field49,
    Field51, Field52, Field53, Field54, Field55, Field56, Field57, Field58, Field59,
    Field61, Field62, Field63, Field64, Field65, Field66, Field67, Field68, Field69,
    Field71, Field72, Field73, Field74, Field75, Field76, Field77, Field78, Field79,
    Field81, Field82, Field83, Field84, Field85, Field86, Field87, Field88, Field89,
    Field91, Field92, Field93, Field94, Field95, Field96, Field97, Field98, Field99
  ],

  list_range(Output, 1, 9),

  Row1 = [Field11, Field12, Field13, Field14, Field15, Field16, Field17, Field18, Field19],
  Row2 = [Field21, Field22, Field23, Field24, Field25, Field26, Field27, Field28, Field29],
  Row3 = [Field31, Field32, Field33, Field34, Field35, Field36, Field37, Field38, Field39],
  Row4 = [Field41, Field42, Field43, Field44, Field45, Field46, Field47, Field48, Field49],
  Row5 = [Field51, Field52, Field53, Field54, Field55, Field56, Field57, Field58, Field59],
  Row6 = [Field61, Field62, Field63, Field64, Field65, Field66, Field67, Field68, Field69],
  Row7 = [Field71, Field72, Field73, Field74, Field75, Field76, Field77, Field78, Field79],
  Row8 = [Field81, Field82, Field83, Field84, Field85, Field86, Field87, Field88, Field89],
  Row9 = [Field91, Field92, Field93, Field94, Field95, Field96, Field97, Field98, Field99],

  Col1 = [Field11, Field21, Field31, Field41, Field51, Field61, Field71, Field81, Field91],
  Col2 = [Field12, Field22, Field32, Field42, Field52, Field62, Field72, Field82, Field92],
  Col3 = [Field13, Field23, Field33, Field43, Field53, Field63, Field73, Field83, Field93],
  Col4 = [Field14, Field24, Field34, Field44, Field54, Field64, Field74, Field84, Field94],
  Col5 = [Field15, Field25, Field35, Field45, Field55, Field65, Field75, Field85, Field95],
  Col6 = [Field16, Field26, Field36, Field46, Field56, Field66, Field76, Field86, Field96],
  Col7 = [Field17, Field27, Field37, Field47, Field57, Field67, Field77, Field87, Field97],
  Col8 = [Field18, Field28, Field38, Field48, Field58, Field68, Field78, Field88, Field98],
  Col9 = [Field19, Field29, Field39, Field49, Field59, Field69, Field79, Field89, Field99],

  Square1 = [Field11, Field12, Field13, Field21, Field22, Field23, Field31, Field32, Field33],
  Square2 = [Field14, Field15, Field16, Field24, Field25, Field26, Field34, Field35, Field36],
  Square3 = [Field17, Field18, Field19, Field27, Field28, Field29, Field37, Field38, Field39],
  Square4 = [Field41, Field42, Field43, Field51, Field52, Field53, Field61, Field62, Field63],
  Square5 = [Field44, Field45, Field46, Field54, Field55, Field56, Field64, Field65, Field66],
  Square6 = [Field47, Field48, Field49, Field57, Field58, Field59, Field67, Field68, Field69],
  Square7 = [Field71, Field72, Field73, Field81, Field82, Field83, Field91, Field92, Field93],
  Square8 = [Field74, Field75, Field76, Field84, Field85, Field86, Field94, Field95, Field96],
  Square9 = [Field77, Field78, Field79, Field87, Field88, Field89, Field97, Field98, Field99],

  list_different([
    Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9,
    Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9,
    Square1, Square2, Square3, Square4, Square5, Square6, Square7, Square8, Square9
  ]).

sudoku9x9_test(Output) :-
  sudoku9x9(
    [
      _, _, 6, _, 2, _, _, 1, _,
      3, _, 1, _, _, 5, _, _, 4,
      _, 8, _, _, 3, _, 6, 5, 9,
      1, _, _, _, _, 8, 9, 3, _,
      _, _, 2, _, _, _, 1, _, 7,
      6, 7, 8, 1, 9, _, _, 4, _,
      8, _, 5, 3, _, _, _, _, 2,
      _, _, _, 9, 5, _, _, 7, _,
      7, 1, 9, 8, _, _, 5, _, _
    ],
    Output
  ).