/**
 * Predicate definition:
 *  list_reverse_state/3
 *
 * Arguments:
 *  list_reverse_state(InputList, OutputList, ListStack).
 *
 * Example:
 *  list_reverse_state([1, 2, 3], OutputList, []).
 *
 * It will proceed as following:
 *  list_reverse_state([1|[2, 3]], OutputListA, [1|ListStackA]).
 *  list_reverse_state([2|[3]], OutputListB, [2|ListStackB]).
 *  list_reverse_state([3|[]], OutputListC, [3|ListStackC]).
 *  list_reverse_state([], OutputListD, ListStackD).  % <== Here we meet the first predicate definition.
 *
 * Now, as we know that ListStackD is equal to empty list:
 *  OutputListD = ListStackD = [].
 *  OutputListC = [3|ListStackB].
 *  OutputListB = [3|[2|ListStackA]].
 *  OutputListA = [3|[2|[1|[]]]].
 *  OutputList = [3, 2, 1].
 */
list_reverse_state([], List, List).
list_reverse_state([Head|Tail], OutputList, ListStack) :-
  list_reverse_state(Tail, OutputList, [Head|ListStack]).

% Shortcut for reverse predicate to allow passing two arguments instead of three.
list_reverse(InputList, OutputList) :- list_reverse_state(InputList, OutputList, []).