module LabyrinthImpl where
  -- (x, y)
  type NodeCoords = (Integer, Integer)

  -- list of possible path coordinates
  type Node = [NodeCoords]

  -- list of all nodes
  type Labyrinth = [Node]

  value :: NodeCoords -> Node
  value (0, 0) = []
  value (0, 1) = [(1, 1)]
  value (1, 1) = [(2, 2)]

  lab :: Labyrinth
  lab = [(value (0, 0)), (value (0, 1)), (value (1, 1))]