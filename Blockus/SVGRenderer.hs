module Blockus.SVGRenderer
where

import Blockus.Piece

render :: Int -> Int -> Piece -> String
render _ _ _ = "<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>"
  		