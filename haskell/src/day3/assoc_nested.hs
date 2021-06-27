module AssocNested where
  -- I was unable to find out how to handle a nested list in Haskell in a while.
  -- Tried flattening the list before processing and other stuff but no idea.
  -- So, for now I just changed the behavior from ./assoc.hs to search for keys.

  -- I've managed to complete the algorithm in JavaScript:
  -- https://gist.github.com/kraftdorian/61022b5a2568b87d1873899c548cfd08

  -- (findAssocKey "bar" [("foo","bar"), ("bar", "baz")]) >>= return
  findAssocKey :: (Eq t0, Eq t1) => t0 -> [(t0, t1)] -> Maybe (t0, t1)
  findAssocKey _ [] = Nothing
  findAssocKey needle (head:tail)
    | (fst head) == needle = Just head
    | otherwise = findAssocKey needle tail