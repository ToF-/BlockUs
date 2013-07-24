module Blockus.SVGRenderer
where

import Blockus.Piece

render :: Int -> Int -> Piece -> String
render x y (_,c) = "<rect " ++ (coords x y) ++ size ++ style c ++ "/>"
		where coords x y = int "x" (x*24) `space` int "y" (y*24)
		      size       = int " width" 24 `space` int "height" 24 
		      style c = param " style" ("stroke-width:2;" ++ "fill:" ++ fc ++ ";stroke:" ++ sc)
		      	where (fc,sc) = colors c
		      	      colors Blue = ("#0000ff","#0000f0")
		              colors Red  = ("#ff0000","#f00000")
		              colors Green= ("#00ff00","#00f000")
		              colors Yellow=("#ffff00","#f0f000")
		      	
		      int p v = param p (show v)
		      param p v = p ++ "=" ++ enquote v
		      enquote s = quote ++ s ++ quote
		      quote = "\""
		      space s t = s ++ " " ++ t
