# Haskell - day 2

## Exercises
1. [Write a sorting function](./sort.hs) that accepts an unsorted list and returns the sorted list.
2. [Write a sorting function](./sort_hof.hs) that accepts an unsorted list and comparison function.\
   It should return the sorted list.
3. [Write a function](./converter.hs) that converts a string to a number. It should accept leading zeros.\
   Example input: ```2 345 678,99```
4. [Write a function](./series.hs) that accepts *x* argument and returns lazy series that has every third number, starting from *x*.\
   Then write a function that accepts *y* argument and returns lazy series that has every fifth number, starting from *y*.\
   Merge these functions using the composition mechanism, so we obtain every eighth number, starting from *x + y*.
5. [Use a partial function](./partial.hs) to define a function that returns half of a number.\
   Also, create the function to add *\n* character at the end of the string.