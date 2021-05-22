-- This solution is based on Prolog implementation: /prolog/src/day2/reverse.pl

module Reverse where
  myReverseTuple :: ([Integer], [Integer]) -> [Integer]
  myReverseTuple ([], list) = list
  myReverseTuple ((head:tail), acc) = myReverseTuple (tail, head:acc)

  myReverse :: [Integer] -> [Integer]
  myReverse list = myReverseTuple(list, [])