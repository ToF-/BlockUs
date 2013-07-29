module Blockus.ShapeTemplate
where

import Blockus.Shape

template :: [Shape] -> Shape
template [] = sharp []
template (s:ss) = s `merge` (translate (0,area s + 1) $ template ss)