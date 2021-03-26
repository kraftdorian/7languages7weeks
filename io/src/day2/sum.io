haystack := list(list(1, 2), list(3, 4))

# Here we check if Lists in Io language can be flattened and sum, so in fact we will be able to sum any nested lists.
haystack proto slotNames contains("flatten") ifTrue ("haystack proto has \"flatten\" slot." println)
haystack proto slotNames contains("sum") ifTrue ("haystack proto has \"sum\" slot." println)

# That's it!
"sum of #{haystack} is #{haystack flatten sum}" interpolate println