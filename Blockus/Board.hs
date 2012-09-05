module Blockus.Board
where
import Blockus.Shape
import Blockus.Piece

data BoardError = IllegalCoord
  deriving(Eq,Show)

data Board      = Nil
  deriving(Eq,Show)

emptyBoard :: Board
emptyBoard = Nil

place :: Board -> Coord -> Piece -> Either BoardError Board
place _ (0,0) _ = Left IllegalCoord
place b _ _     = Right b
