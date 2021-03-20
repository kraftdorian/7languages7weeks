haystack = 'Hello, Ruby'
needle = 'Ruby'

# Return index of a string.
puts haystack.index(needle)

# Return index of a Regular Expression.
puts haystack.index(Regexp.new(needle))