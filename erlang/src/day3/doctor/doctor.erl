-module(doctor).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() -> supervisor:start_link({local, doctor}, doctor, []).

init(_Args) ->
  io:fwrite("~p has started: ~p.~n", [doctor, self()]),
  SupervisorFlags = #{
    strategy => one_for_one,
    intensity => 1,
    period => 5
  },
  ChildSpecs = [#{
    id => parent,
    start => {parent, start_link, []},
    restart => permanent,
    shutdown => brutal_kill,
    type => worker,
    modules => [parent]
  }],
  {ok, {SupervisorFlags, ChildSpecs}}.