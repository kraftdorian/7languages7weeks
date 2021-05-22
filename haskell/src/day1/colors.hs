module Colors where
  -- getColors ["black", "white", "blue", "yellow", "red"]
  getColors :: [String] -> [(String, String)]
  getColors colors = [(color1, color2) | color1 <- colors, color2 <- colors, color1 < color2]