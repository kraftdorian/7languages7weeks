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

## Resources

### ActsAsCsv class

```ruby
class ActsAsCsv
  def self.acts_as_csv
    define_method 'initialize' do
      @result = []
      read
    end

    define_method 'headers' do
      @headers
    end

    define_method 'csv_contents' do
      @result
    end

    define_method 'read' do
      file = File.new("%s.txt" % self.class.to_s.downcase)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
  end
end
```