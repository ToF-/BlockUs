module Blockus.SVGRenderer
where

import Blockus.Piece

render :: Int -> Int -> Piece -> String
render _ _ (_,c) = "<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"stroke-width:2;"++ (color c) ++ "\"/>"
		where color Blue = "fill:#0000ff;stroke:#0000f0"
		      color Red  = "fill:#ff0000;stroke:#f00000"
		      color Green= "fill:#00ff00;stroke:#00f000"
		      color Yellow="fill:#ffff00;stroke:#f0f000" 