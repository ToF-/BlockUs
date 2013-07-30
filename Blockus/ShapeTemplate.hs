module Blockus.ShapeTemplate
where

import Blockus.Shape
import Data.List 

template :: [Shape] -> Shape
template [] = empty
template (s:ss) = (positions rotations) `merge` (translate (0,area s + 1) $ template ss)
	where rotations = nub [s, rotate s]

positions :: [Shape] -> Shape
positions [] = empty
positions (s:ss) = s `merge` (translate (area s + 1,0) $ positions ss) 


