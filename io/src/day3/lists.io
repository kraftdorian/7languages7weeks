squareBrackets := method(
  /* This is a tricky one.

  We can't just use Message arguments slot because it returns a list of Message objects.
  These would appear as a valid list items, but would be unusable by the resulting list slots.

  For example: calling "[1, 2, 3, 4] sum" would cause a "Message does not respond to 'performWithArgList'" Exception.

  The solution is to actually evaluate the arguments in a current context by calling Message argsEvaluatedIn slot.

  We can't use Message evaluatedArgs slot because it seems to be not present in this version of Io language (20140919).

  Please visit https://iolanguage.org/reference/index.html#Core.Message for a reference of method used below.
  */
  call message argsEvaluatedIn(self)
)

# This will work already!
haystack1 := [1, 2, 3, 4]
haystack2 := ["A", "B", "C", "D"]
haystack3 := [[1, 2], [3, 4]]

"#{haystack1} proto is #{haystack1 proto type}" interpolate println
"#{haystack1} sum is #{haystack1 sum}" interpolate println

"#{haystack2} proto is #{haystack2 proto type}" interpolate println
"#{haystack2} min is #{haystack2 min}" interpolate println

"#{haystack3} proto is #{haystack3 proto type}" interpolate println
"#{haystack3} flatten is #{haystack3 flatten}" interpolate println