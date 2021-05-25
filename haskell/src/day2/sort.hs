-- https://wiki.haskell.org/Introduction#Quicksort_in_Haskell

module Sort where
  quicksort :: (Ord inputType) => [inputType] -> [inputType]
  quicksort [] = []
  quicksort (head:tail) = quicksort [x | x <- tail, x < head] ++ [head] ++ quicksort [x | x <- tail, x >= head]