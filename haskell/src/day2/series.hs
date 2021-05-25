module Series where
  take3s :: (Num inputType) => inputType -> [inputType]
  take3s x = x:(take3s (x + 3))

  take5s :: (Num inputType) => inputType -> [inputType]
  take5s y = y:(take5s (y + 5))

  -- take8s 0 0
  take8s :: (Num inputType) => inputType -> inputType -> [inputType]
  take8s x y = (zipWith (+) (take3s x) (take5s y))