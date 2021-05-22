module Map where
  colors = ["red", "green", "blue"]

  -- Based on https://stackoverflow.com/a/31037028
  colorsAllDifferent :: [String] -> Bool
  colorsAllDifferent [] = True
  colorsAllDifferent (color:colors) = color `notElem` colors && colorsAllDifferent colors

  -- Concept of color tuples based on https://gist.github.com/BartG95/ebf9fcc9e813b125f8a1
  getMapColoring = [[
    ("Mississippi", m),
    ("Alabama", a),
    ("Tennessee", t),
    ("Georgia", g),
    ("Florida", f)]
    | m <- colors,
      a <- colors,
      t <- colors,
      g <- colors,
      f <- colors,
      all (==True)
        (map colorsAllDifferent [[m, t], [m, a], [a, t], [a, m], [a, g], [a, f], [g, f], [g, t]])]