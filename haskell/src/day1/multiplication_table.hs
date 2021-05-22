module MultiplicationTable where
  -- getMultiplicationTable [1..12]
  getMultiplicationTable :: [Integer] -> [(Integer, Integer, Integer)]
  getMultiplicationTable numbers = [(num1, num2, num1 * num2) | num1 <- numbers, num2 <- numbers]