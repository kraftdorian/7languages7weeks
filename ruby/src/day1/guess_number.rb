random_number_min = 1
random_number_max = 10
drawn_number = rand(random_number_min..random_number_max)

number_user_answer = nil

until number_user_answer == drawn_number
  number_user_answer = gets.to_i
  puts 'The number you provided is too small' if number_user_answer < drawn_number
  puts 'The number you provided is too big' if number_user_answer > drawn_number
end

puts "Congratulations, you have provided the drawn number! It was #{drawn_number}."
