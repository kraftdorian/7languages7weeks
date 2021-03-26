fibRecursive := method(n,
  if (n <= 2,
    1,
    fibRecursive(n - 1) + fibRecursive(n - 2)
  )
)

fibIterative := method(n,
  a := 1
  b := 0
  c := 0
  for (i, 1, n,
    c = a + b
    a = b
    b = c
  )
  c
)

"fibRecursive(1) = #{fibRecursive(1)}" interpolate println
"fibRecursive(4) = #{fibRecursive(4)}" interpolate println

"fibIterative(1) = #{fibIterative(1)}" interpolate println
"fibIterative(4) = #{fibIterative(4)}" interpolate println