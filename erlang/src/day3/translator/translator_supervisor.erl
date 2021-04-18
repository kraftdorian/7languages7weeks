-module(translator_supervisor).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() -> supervisor:start_link({local, translator_supervisor}, translator_supervisor, []).

init(_Args) ->
  SupervisorFlags = #{
    strategy => one_for_one,
    intensity => 1,
    period => 5
  },
  ChildSpecs = [#{
    id => translator,
    start => {translator, start_link, []},
    restart => permanent,
    shutdown => brutal_kill,
    type => worker,
    modules => [translator]
  }],
  {ok, {SupervisorFlags, ChildSpecs}}.