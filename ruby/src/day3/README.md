# Ruby - day 3

## Exercise
[Modify CSV application](./acts_as_csv.rb) to handle *each* method which returns *CsvRow* object.\
Use method *method_missing* for *CsvRow* to return the value for given column name.

For example:
```plain
one, two
lions, tigers
```

make API which works this way:
```ruby
csv = RubyCsv.new
csv.each { |row| puts row.one }
```

it should display text ```lions```.