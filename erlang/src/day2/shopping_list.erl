-module(shopping_list).
-export([main/0]).

main() ->
  ShoppingList = [{bread, 1, 3.0}, {milk, 2, 2.5}, {butter, 1, 3.5}],
  ShoppingListSummary = [{Product, Quantity * Price} || {Product, Quantity, Price} <- ShoppingList],
  io:fwrite("~w~n", [ShoppingListSummary]).