module Blockus.Board
where
import Blockus.Shape

data BoardError = IllegalCoord
  deriving(Eq,Show)

data Board      = Nil
  deriving(Eq,Show)

emptyBoard :: Board
emptyBoard = Nil

accept :: Board -> Coord -> Shape -> Either BoardError Board
accept _ _ _ = Left IllegalCoord
