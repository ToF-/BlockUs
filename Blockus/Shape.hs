module Blockus.Shape
where
import Data.Set as S

type Coord = (Int,Int)
type Shape = Set Coord

shape :: [(Int,Int)] -> Shape 
shape cs = fromList cs

overlap :: Shape -> Shape -> Bool
overlap s t = not $ S.null $ intersection s t  

