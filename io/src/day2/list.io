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
  if (self get(x, y) == nil,
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
  output := ""
  self data foreach(y, row, if (row isEmpty, nil, output = output .. row join(",") .. "\n"))
  output
)

TwoDimensionalList asFile := method(filename,
  file := File with("#{filename}.txt" interpolate)
)

TwoDimensionalList import := method(importFilename,
  file := self asFile(importFilename) openForReading
  rows := file readLines select(i, e, e size > 0)
  self dim(rows at(0) split(",") size, rows size)
  rows foreach(y, row,
    row split(",") foreach(x, col,
      self set(x, y, col)
    )
  )
  file close
)

TwoDimensionalList export := method(exportFilename,
  file := self asFile(exportFilename) openForUpdating
  file write(self asString)
  file close
)

list2d := TwoDimensionalList clone
list2d dim(2, 2)
list2d set(0, 0, "A")
list2d set(1, 0, "B")
list2d set(0, 1, "C")
list2d set(1, 1, "D")
list2d export("list2d")

importedList2d := TwoDimensionalList clone
importedList2d import("list2d")

transposedList2d := importedList2d transpose
transposedList2d println