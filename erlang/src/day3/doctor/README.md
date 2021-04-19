# How to run Doctor
1. Compile doctor, parent and child.
```plain
1> c(doctor).
{ok,doctor}
2> c(parent).
{ok,parent}
3> c(child).
{ok,child}
```
2. Start the doctor.
```plain
4> doctor:start_link().
doctor has started: <0.98.0>.
parent has started: <0.99.0>.
child has started: <0.100.0>.
{ok,<0.98.0>}
```
3. Send a message to child.
```plain
5> child ! {action, "Do something"}.
Action: "Do something".
{action,"Do something"}
```