=begin
Some contents were used from websites:
https://www.rubyguides.com/2018/10/puts-vs-print
https://www.codecademy.com/articles/glossary-ruby
=end

hello = 'hello'
world = 'world'

=begin
Puts automatically adds a new line at the end of your message every time you use it.
It converts nil to empty string.
It returns nil.
=end
puts "#{hello.capitalize}, #{world.capitalize}."
puts [hello, nil, world]

=begin
If you don’t want a newline, then use print.
It converts nil to empty string.
It returns nil.
=end
print "#{hello.capitalize}, #{world.capitalize}"
print "\n"
print [hello, nil, world]

# Just print a new line.
puts

=begin
Shows a more “raw” version of an object.
It is useful for debugging.
It returns the object you pass to it.
=end
p "#{hello.capitalize}, #{world.capitalize}"
p nil and puts 'it won\'t be printed'

=begin
Pretty printing.
It returns the object you pass to it.
=end
pp "#{hello.capitalize}, #{world.capitalize}"
pp nil and puts 'it won\'t be printed'