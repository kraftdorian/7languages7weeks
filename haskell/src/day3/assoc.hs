module Assoc where
  -- (findAssocValue "bar" [("foo","bar"), ("bar", "baz")]) >>= return
  findAssocValue :: (Eq t0, Eq t1) => t0 -> [(t1, t0)] -> Maybe (t1, t0)
  findAssocValue _ [] = Nothing
  findAssocValue needle (head:tail)
    | (snd head) == needle = Just head
    | otherwise = findAssocValue needle tail