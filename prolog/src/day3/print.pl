:- use_module(sudoku6x6).
:- use_module(sudoku9x9).

% Amazing pretty print program which I found during my research: https://stackoverflow.com/a/48366338.
print_list_chunks(ChunkSize, List) :- print_list_chunks(ChunkSize, ChunkSize, List).
print_list_chunks(_, _, []).
print_list_chunks(ChunkSize, Index, [Head|Tail]) :-
  (Index >= 1 ->
    write(Head),
    TailIndex is Index - 1,
    print_list_chunks(ChunkSize, TailIndex, Tail)
  ; nl,
    print_list_chunks(ChunkSize, ChunkSize, [Head|Tail])
  ).

print_list_chunks_test :-
  sudoku6x6_test(Output1),
  sudoku9x9_test(Output2),
  print_list_chunks(6, Output1),
  nl,
  print_list_chunks(9, Output2).