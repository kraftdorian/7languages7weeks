-module(translator).
-behaviour(gen_server).
-export([start_link/0, init/1, handle_info/2]).

start_link() -> gen_server:start_link({local, translator}, translator, [], []).

init(_Args) ->
  io:format("~p has started: ~p.~n", [translator, self()]),
  {ok, 1}.

handle_info(Info, State) ->
  case Info of
    "white" -> io:fwrite("bialy~n");
    "house" -> io:fwrite("dom~n")
  end,
  {noreply, State}.