module Blockus.ShapeTemplate
where

import Blockus.Shape
import Data.List 

template :: [Shape] -> Shape
template [] = sharp []
template (s:ss) = (positions rotations) `merge` (translate (0,area s + 1) $ template ss)
	where rotations = nub [s, rotate s]

positions :: [Shape] -> Shape
positions [] = sharp []
positions (s:ss) = s `merge` (translate (area s + 1,0) $ positions ss) 


