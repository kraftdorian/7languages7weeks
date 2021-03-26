TwoDimensionalList := Object clone

# If prototype has init method then it gets called during clone message.
TwoDimensionalList init := method(
  self data := list()
  self isAllocated := false
)

TwoDimensionalList dim := method(x, y,
  if (x < 0 or y < 0, Exception raise("List dimensions must me a positive numbers"))
  if (isAllocated, Exception raise("List is already allocated"))
  for (i, 0, y - 1, data append(list() preallocateToSize(x)))
  self isAllocated = true
  self
)

TwoDimensionalList set := method(x, y, value,
  existingValue := self data at(y) at(x)
  if (existingValue == nil,
    self data at(y) atInsert(x, value),
    self data at(y) atPut(x, value)
  )
  value
)

TwoDimensionalList get := method(x, y,
  self data at(y) at(x)
)

TwoDimensionalList transpose := method(
  transposedList := TwoDimensionalList clone
  transposedList dim(self data size, self data at(0) size)
  self data foreach(y, row,
    row foreach(x, col,
      transposedList set(y, x, col)
    )
  )
  transposedList
)

# We provide asString method so output methods like "print" or "println" will use it instead of default one.
TwoDimensionalList asString := method(
  result := ""
  self data foreach(y, row,
    row foreach(x, col,
      if (col != nil, result = result .. col asString)
    )
    if (row isEmpty, nil, result = result .. "\n")
  )
  result
)

list2d := TwoDimensionalList clone
list2d dim(1, 3)
list2d set(0, 0, 1)
list2d set(0, 1, 2)
list2d set(0, 2, 3)

transposedList2d := list2d transpose

list2d println
transposedList2d println