/**
 * As I was lacking of ideas how to implement the sort, I used insert sort algorithm from this amazing sorting tutorial
 * to successfully learn how it should be done: http://kti.mff.cuni.cz/~bartak/prolog/sorting.html
 */

% If current Value is greater than the list first element then go further until the Value will be equal or less than the element.
insert(Value, [Head|Tail1], [Head|Tail2]) :- Value > Head, insert(Value, Tail1, Tail2).

% If current Value is equal or less than the list first element then insert Value before the element.
insert(Value, [Head|Tail], [Value, Head|Tail]) :- Value =< Head.

% Current Value cannot be compared to empty list, so insert the value.
insert(Value, [], [Value]).

% Here we use a list accumulator approach as in "minimum" and "reverse" programs.
list_insert_sort_state([], List, List).
list_insert_sort_state([Head|Tail], SortedList, SortedListStack) :-
  insert(Head, SortedListStack, InsertionResult),
  list_insert_sort_state(Tail, SortedList, InsertionResult).

% Shortcut predicate, as the third argument will be always an empty list.
list_insert_sort(InputList, OutputList) :- list_insert_sort_state(InputList, OutputList, []).