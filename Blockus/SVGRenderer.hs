module Blockus.SVGRenderer
where

import Blockus.Piece

render :: Int -> Int -> Piece -> String
render x y (_,c) = "<rect " ++ (coords x y) ++ size ++ style ++ "/>"
		where color Blue = "fill:#0000ff;stroke:#0000f0"
		      color Red  = "fill:#ff0000;stroke:#f00000"
		      color Green= "fill:#00ff00;stroke:#00f000"
		      color Yellow="fill:#ffff00;stroke:#f0f000"
		      coords x y = int "x" (x*24) `space` int "y" (y*24)
		      size       = int " width" 24 `space` int "height" 24 
		      style = param " style" ("stroke-width:2;" ++ color c)
		      int p v = param p (show v)
		      param p v = p ++ "=" ++ enquote v
		      enquote s = quote ++ s ++ quote
		      quote = "\""
		      space s t = s ++ " " ++ t
