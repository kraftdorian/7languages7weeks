module SortHigherOrderFunction where
  import Data.List (sortBy)

  -- It's just a Proxy for a builtin sorting mechanism.
  -- I tried to research how comparator & sorting algorithms work together but ended up with no information at all.
  --
  -- customComparatorSort (\a b -> if a < b then LT else GT) [1,2,3,-1]
  customComparatorSort :: (Ord inputType) => (inputType -> inputType -> Ordering) -> [inputType] -> [inputType]
  customComparatorSort comparator list = sortBy comparator list