module Blockus.Shape
where
import qualified Data.Set as S
import Data.List

type Coord = (Int,Int)
data Shape = Shape (S.Set Coord)
	deriving (Eq, Show)

fromList :: [Coord] -> Shape
fromList = Shape . S.fromList

area :: Shape -> Int
area s = max w h 
      where w = 1 + maximum xs - minimum xs
            h = 1 + maximum ys - minimum ys
            xs = map fst (toList s)
            ys = map snd (toList s)

toList :: Shape -> [Coord]
toList (Shape s) = S.toList s

overlap :: Shape -> Shape -> Bool
overlap (Shape s) (Shape t) = not $ S.null $ S.intersection s t  

neighbor :: Shape -> Shape -> Bool
neighbor s t = any (s `overlap`) $ map (\c-> translate c t) [(-1,0),(1,0),(0,-1),(0,1)] 

connect :: Shape -> Shape -> Bool
connect s t = any (s `overlap`) $ map (\c -> translate c t) [(-1,-1),(1,1),(1,-1),(-1,1)]

translate :: Coord -> Shape -> Shape
translate (i,j) (Shape s) = Shape $ S.map (\(x,y) -> (x+i,y+j)) s

vFlip :: Shape -> Shape 
vFlip (Shape s) = Shape $ S.map (\(x,y) -> (m-x,y)) s
	where m = maximum (map fst (S.toList s))

rotate :: Shape -> Shape
rotate = vFlip . reverse
	where reverse (Shape s) = Shape $ S.map (\(x,y) -> (y,x)) s

merge :: Shape -> Shape -> Shape
merge (Shape s) (Shape t) = Shape $ S.union s t

shapeFromStrings :: Char -> [String] -> Shape
shapeFromStrings c ss = fromList $ concat (zipWith getRow [0..] ss)
  where getRow y s = [(x,y) | x <- elemIndices c s]

sharp = shapeFromStrings '#'

