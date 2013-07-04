module Blockus.BoardRenderer
where
import Blockus.Shape
import Blockus.Piece
import Blockus.Board

renderText :: Board -> String
renderText [] = unlines (replicate 20 (replicate 20 '.'))
renderText b = unlines ([renderTextLine b y| y <- [1..20]])

renderTextLine :: Board -> Int -> String
renderTextLine b y = [renderCell b (x, y) | x <- [1..20]]

renderCell :: Board -> Coord -> Char
renderCell b (x,y) = case lookup (x,y) b of
					   Nothing -> '.'
					   Just c  -> renderColor c

renderColor :: Color -> Char
renderColor Blue = 'B'
renderColor Red = 'R'
renderColor Green = 'G'
renderColor Yellow = 'Y'