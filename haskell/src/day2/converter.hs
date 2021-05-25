module Converter where
  replaceCommaToDot :: String -> String
  replaceCommaToDot string = map (\c -> if c == ',' then '.' else c) string

  removeStringSpaces :: String -> String
  removeStringSpaces string = filter (\c -> if c /= ' ' then True else False) string

  stringToNumber :: String -> Double
  stringToNumber string = read (replaceCommaToDot (removeStringSpaces string)) :: Double