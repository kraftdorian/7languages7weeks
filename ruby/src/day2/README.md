# Ruby - day 2

## Exercises
1. [Display contents of an array](./) which contains sixteen numbers,
   four numbers at once, using ```each``` method only.\
   Do the same thing with ```each_slice``` method.
2. [Make changes in *Tree* class init method](./), so it accepts nested structure.\
   We should be able to define the tree in this way:
   ```ruby
   {'grandfather' => {'father' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}}
   ```
3. [Write simple *grep* method](./) that displays file rows which contain a given phrase.\
   Include row numbers if you want.