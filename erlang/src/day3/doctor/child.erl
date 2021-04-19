-module(child).
-behaviour(gen_server).
-export([start_link/0, init/1, handle_info/2]).

start_link() -> gen_server:start_link({local, child}, child, [], []).

init(_Args) ->
  io:fwrite("~p has started: ~p.~n", [child, self()]),
  {ok, 1}.

handle_info(Info, State) ->
  case Info of
    {action, Action} -> io:fwrite("Action: ~p.~n", [Action])
  end,
  {noreply, State}.