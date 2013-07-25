module Blockus.SVGRenderer
where

import Blockus.Piece
import Data.Monoid
import Data.ByteString
import Text.XML.Generator

genPiece :: Int -> Int -> Piece -> Xml Elem
genPiece x y (_,c) = xelem "rect" $ xattr "x" (show (x*24)) 
                                 <> xattr "y" (show (y*24))
                                 <> xattr "width"  (show 24)
                                 <> xattr "height" (show 24)
                                 <> xattr "style" (style c)
style :: Color -> String
style c = "stroke-width:2;" ++ "fill:" ++ fc ++ ";stroke:" ++ sc
		      	where (fc,sc) = colors c
		      	      colors Blue = ("#0000ff","#0000f0")
		              colors Red  = ("#ff0000","#f00000")
		              colors Green= ("#00ff00","#00f000")
		              colors Yellow=("#ffff00","#f0f000")

genSvg :: Int -> Int -> Piece -> Xml Doc
genSvg x y p = doc defaultDocInfo $ xelem "svg" $ xattr "xmlns" "http://www.w3.org/2000/svg" 
                                   <#> genPiece x y p

render :: Int -> Int -> Piece -> ByteString
render x y p = xrender $ genSvg x y p

