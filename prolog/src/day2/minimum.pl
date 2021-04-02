/**
 * Predicate definition:
 *  list_minimum_state/3
 *
 * Arguments:
 *  list_minimum_state(InputList, Minimum, CurrentListItem).
 *
 * Example:
 *  list_minimum_state([1, 2, 3], Minimum, _).
 *
 * It will proceed as following:
 *  list_minimum_state([1|[2, 3]], MinimumA, _).  % Minimum is min(1, CurrentListItemA)
 *  list_minimum_state([2|[3]], MinimumB, 1).     % Minimum is min(2, CurrentListItemB)
 *  list_minimum_state([3|[]], MinimumC, 2).      % Minimum is min(3, CurrentListItemC)
 *  list_minimum_state([], MinimumD, 3).          % Minimum is min(?, CurrentListItemD). Also, here we meet the first predicate definition.
 *
 * Now, as we know that CurrentListItemD is equal to 3:
 *  MinimumD = min(?, 3) = 3.
 *  MinimumC = min(3, 3) = 3.
 *  MinimumB = min(2, 3) = 2.
 *  MinimumA = min(1, 2) = 1 = Minimum.
 */
list_minimum_state([], List, List).
list_minimum_state([Head|Tail], Minimum, _) :-
  list_minimum_state(Tail, TailMinimum, Head),
  Minimum is min(Head, TailMinimum).

list_minimum(List, Minimum) :- list_minimum_state(List, Minimum, _).