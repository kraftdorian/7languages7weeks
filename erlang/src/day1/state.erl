-module(state).
-export([main/0]).

message(success) -> io:fwrite("Success~n");
message({error, ErrorMessage}) -> io:fwrite("Error: ~s~n", [ErrorMessage]).

main() ->
  message(success),
  message({error, "You shall not pass!"}).