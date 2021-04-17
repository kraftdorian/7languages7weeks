-module(keywords).
-export([main/0]).

description(Keywords, {keyword, Keyword}) ->
  case lists:filter(fun({K, _}) -> K == Keyword end, Keywords) of
    [{_, D}] -> D;
    _ -> no_description
  end.

write_description(Keywords, {keyword, Keyword}) ->
  Description = description(Keywords, {keyword, Keyword}),
  case Description of
    no_description -> io:fwrite("Keyword \"~s\" was not found.~n", [Keyword]);
    _ -> io:fwrite("~s - ~s~n", [Keyword, Description])
  end.

main() ->
  Keywords = [{erlang, "Functional language"}, {ruby, "Object-oriented language"}],
  write_description(Keywords, {keyword, erlang}),
  write_description(Keywords, {keyword, ruby}),
  write_description(Keywords, {keyword, javascript}).