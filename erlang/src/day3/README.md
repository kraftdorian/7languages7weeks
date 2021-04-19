# Erlang - day 3

## Exercises
1. [Write a program](./translator/translator_supervisor.erl) that monitors the *translation* process and restarts it
   when it dies.
2. [Write a program](./doctor/parent.erl) that restarts *Doctor* process when it dies.
3. [Write a program](./doctor/doctor.erl) that monitors the monitor of the *Doctor* process and restarts it when it dies.

## Additional exercises
1. Create simple OTP server that registers messages in file.
2. Adapt *translation* module, so it can work in a network.

## Resources

### Translator
```erlang
-module(translator).
-export([loop/0]).

loop() ->
   receive
      "house ->
         io:format("dom~n"),
         loop();
      "white" ->
         io:format("bialy~n"),
         loop();
      _ ->
         io:format("translation not found"),
         loop()
   end.
```

### Doctor
```erlang
-module(doctor).
-export([loop/0]).

loop() ->
   process_flag(trap_exit, true),
   receive
      new ->
         io:format("Creating and monitoring process.~n"),
         register(child_process, spawn_link(fun child:method/0)),
         loop();
      {'EXIT', Process, Message} ->
         io:format("Process ~p has invoked exit method with following message: ~p.~n", [Process, Message]),
         self() ! new,
         loop()
   end.
```