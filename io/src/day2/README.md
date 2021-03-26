# Io - day 2

## Exercises
1. [Calculate nth word of the Fibonacci sequence](./fibonacci.io), where ```fib(1) = 1``` and ```fib(4) = 3```.\
   As an additional exercise provide iterative and recursive solution.
2. [Modify division operator](./operator.io) so it returns *0* if denominator equals *0*.
3. [Sum all numbers](./sum.io) present in two-dimensional list.
4. [Create slot](./average.io) named *myAverage* in *List* object which calculates the average of contained numbers.\
   What will happen when there are no numbers in the list?\
   As an additional exercise raise an exception if any of list elements is not a number.
5. [Write a prototype](./list.io) for two-dimensional list.\
   Method ```dim(x, y)``` should allocate a list of *y* lists which contain *x* elements each.\
   Method ```set(x, y, value)``` should set a value.\
   Method ```get(x, y)``` should return the value.
6. [Save two-dimensional list to file](./), then read it from a file.
7. [Write a program that randomly selects a number](./), and asks user to guess it.\
   User should have 10 attempts.\
   The drawn number should be in range starting from 1 to 100.

## Additional exercise
[Write two-dimensional list *transpose* method](./list.io), so ```newList get(y, x) == oldList get(x, y)```.