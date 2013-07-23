module Blockus.Piece
where
import Blockus.Shape

data Color = Blue | Yellow | Red | Green
  deriving (Eq, Show)

type Piece = (Shape, Color)  

shapeOf :: Piece -> Shape
shapeOf = fst

colorOf :: Piece -> Color
colorOf = snd

piece :: Shape -> Color -> Piece
piece = (,)

pieceFrom :: [String] -> Color -> Piece
pieceFrom ss c = piece (shapeFromStrings '#' ss) c
