-module(words).
-export([split/4, main/0]).

count([], Count) -> Count;
count([_|Words], Count) -> count(Words, Count + 1).
count(String) -> count(string:lexemes(String, " "), 0).

% TODO: Figure out how to actually reverse the result.
% words:split("Erlang is fun!", 32, [], []).
split([], _, Words, Acc) -> lists:merge(Words, [Acc]);
split([Head|Tail], Separator, Words, Acc) ->
  case Head of
    Separator -> split(Tail, Separator, [Acc|Words], []);
    _ -> split(Tail, Separator, Words, [Head|Acc])
  end.

main() ->
  String = "Erlang is fun!",
  WordsCount = count(String),
  io:fwrite("\"~s\" has ~w words~n", [String, WordsCount]).