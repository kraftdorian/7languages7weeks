# Erlang - day 2

## Exercises
1. We have a list of *keyword* - *description* tuples:
```erlang
[{erlang, "Functional language"}, {ruby, "Object-oriented language"}]
```
[Write a function](./keywords.erl) that accepts the list and returns the description of the given keyword.

2. We have a shopping list:
```plain
[{product, quantity, price}, ...].
```
[Write list comprehension](./shopping_list.erl) which will result in a new list, where *total_price* is *quantity* times *price*:
```plain
[{product, total_price}, ...]
```

## Additional exercise
Write a program that accepts tic-tac-toe board state and returns the winner, stalemate, or if the game is still pending.