isNotNumericList := method(list,
  nonNumericElements := list select(i, e, e proto != Number)
  (nonNumericElements size > 0) ifTrue (Exception raise("There are non numeric elements in the provided list"))
)

List myAverage := method(
  isNotNumericList(self)
  self sum / self size
)

# This will cause an Exception, because sum of empty list equals to nil.
# list() myAverage println

# This is OK.
list(1, 2, 3, 4) myAverage println

# This will cause a custom Exception.
list(1, 2, 3, "a") myAverage println