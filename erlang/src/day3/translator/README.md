# How to run translator
1. Compile translator supervisor and translator.
```plain
1> c(translator_supervisor).
{ok,translator_supervisor}
2> c(translator).
{ok,translator}
```
2. Start the supervisor.
```plain
3> translator_supervisor:start_link().
translator has started: <0.96.0>.
{ok,<0.95.0>}
```
3. Translate something.\
   In case of missing translation, the translation supervisor will simply restart the service.
```plain
4> translator ! "house".
dom
"house"
```