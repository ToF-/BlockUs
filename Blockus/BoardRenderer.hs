module Blockus.BoardRenderer
where
import Blockus.Shape
import Blockus.Piece
import Blockus.Board

renderText :: Board -> String
renderText board = unlines ([[cell (lookup (x,y) board) | x <- [1..20]]| y <- [1..20]])
  where cell Nothing       = '.'
        cell (Just Blue)   = 'B'
        cell (Just Red)    = 'R'
        cell (Just Green)  = 'G'
        cell (Just Yellow) = 'Y'
