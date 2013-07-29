module Blockus.ShapeTemplate
where

import Blockus.Shape

template :: [Shape] -> Shape
template [] = sharp []
template (s:ss) = s