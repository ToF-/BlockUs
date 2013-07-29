module Blockus.Piece
where
import Blockus.Shape

data Color = Blue | Yellow | Red | Green
  deriving (Eq, Show)

data Piece = Piece { shapeOf :: Shape, colorOf :: Color }
	deriving (Eq,Show)

pieceFrom :: [String] -> Color -> Piece
pieceFrom ss c = Piece (shapeFromStrings '#' ss) c
