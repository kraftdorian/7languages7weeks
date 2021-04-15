-module(counter).
-export([main/0]).

count(Count, Count) -> io:fwrite("~w~n", [Count]);
count(Current, Count) ->
  io:fwrite("~w~n", [Current]),
  count(Current + 1, Count).

main() -> count(1, 10).