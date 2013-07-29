module Blockus.Board
where
import Blockus.Shape
import Blockus.Piece
import qualified Data.Set as S

data BoardError = IllegalCoord
  deriving(Eq,Show)

type Board      = [(Coord,Color)] 

emptyBoard :: Board
emptyBoard = []

place :: Board -> Coord -> Piece -> Either BoardError Board
place _ (0,0) _ = Left IllegalCoord
place b c p     = Right (put b c p)

put :: Board -> Coord -> Piece -> Board
put b (x,y) p = b ++ zip (toList (translate (x,y) $ shapeOf p)) (repeat $ colorOf p)

at :: Board -> Coord -> Maybe Color
at = flip lookup

		 