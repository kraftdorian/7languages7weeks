-module(parent).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() -> supervisor:start_link({local, parent}, parent, []).

init(_Args) ->
  io:fwrite("~p has started: ~p.~n", [parent, self()]),
  SupervisorFlags = #{
    strategy => one_for_one,
    intensity => 1,
    period => 5
  },
  ChildSpecs = [#{
    id => child,
    start => {child, start_link, []},
    restart => permanent,
    shutdown => brutal_kill,
    type => worker,
    modules => [child]
  }],
  {ok, {SupervisorFlags, ChildSpecs}}.