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