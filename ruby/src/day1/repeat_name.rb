name = 'Damian'
number_of_reps = 10

# Using Integer times method.
number_of_reps.times { puts name }
puts

# Using Range each method.
(1..number_of_reps).each { puts name }
puts

# Using a loop.
until number_of_reps == 0 do
  puts name
  number_of_reps = number_of_reps - 1
end