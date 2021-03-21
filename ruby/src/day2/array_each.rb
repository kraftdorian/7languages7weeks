haystack = (1..16).to_a
haystack2 = (16...32).to_a
chunk_size = 4

# Using Array each method, assuming that we have sorted array with sixteen elements.
haystack.each do |e|
  if e % chunk_size == 0
    puts haystack[e - chunk_size...e].to_s
  end
end
puts

=begin
Using Array each with index method, assuming that we don't know whether array is sorted.
We depend on given element index.
=end
haystack2.each.with_index do |_, i|
  if i + 1 > 0 && (i + 1) % chunk_size == 0
    puts haystack2[i + 1 - chunk_size..i].to_s
  end
end
puts

# Using Array each_slice method.
haystack.each_slice(chunk_size) do |e|
  puts e.to_s
end