=begin
Some contents were used from website:
https://www.rubyguides.com/2012/01/ruby-string-formatting
=end

message_template = "This is number %d."
number_of_reps = 10

# Using Range each with index method.
(1..number_of_reps).each.with_index { |i| puts message_template % i }
puts

# Using a loop.
while number_of_reps > 0 do
  puts message_template % (10 - number_of_reps + 1)
  number_of_reps = number_of_reps - 1
end