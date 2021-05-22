-- This solution is based on Prolog implementation: /prolog/src/day2/reverse.pl

module Reverse where
  myReverseTuple :: (Eq inputType) => ([inputType], [inputType]) -> [inputType]
  myReverseTuple ([], list) = list
  myReverseTuple ((head:tail), acc) = myReverseTuple (tail, head:acc)

  myReverse :: (Eq inputType) => [inputType] -> [inputType]
  myReverse list = myReverseTuple(list, [])