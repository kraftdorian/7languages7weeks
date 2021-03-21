def grep(haystack, needle)
  haystack
    .map.with_index { |e, i| {:row => e, :index => i} }
    .filter { |h| h[:row].include?(needle) }
    .map { |h| "%d: %s" % [h[:index], h[:row]] }
end

def grep_file(filename, needle)
  file = File.open(filename)
  haystack = file.readlines()
  file.close()
  grep(haystack, needle)
end

puts grep_file('grep.txt', 'interdum')