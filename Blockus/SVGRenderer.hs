module Blockus.SVGRenderer
where

import Blockus.Piece

render :: Int -> Int -> Piece -> String
render _ _ _ = "<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"stroke-width:2;fill:#0000ff;stroke:#0000f0\"/>"
  		