-module(words).
-export([main/0]).

count([], Count) -> Count;
count([_|Words], Count) -> count(Words, Count + 1).
count(String) -> count(string:lexemes(String, " "), 0).

main() ->
  String = "Erlang is fun!",
  WordsCount = count(String),
  io:fwrite("\"~s\" has ~w words~n", [String, WordsCount]).