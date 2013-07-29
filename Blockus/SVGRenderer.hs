module Blockus.SVGRenderer
where

import Blockus.Piece
import Data.Monoid
import Data.ByteString
import Text.XML.Generator
import Blockus.Shape

xIntAttr :: String -> Int -> Xml Attr
xIntAttr a v = xattr a $ show v

style :: Color -> String
style c = "stroke-width:2;" ++ "fill:" ++ fc ++ ";stroke:" ++ sc
            where (fc,sc) = colors c
                  colors Blue = ("#0000ff","#0000f0")
                  colors Red  = ("#ff0000","#f00000")
                  colors Green= ("#00ff00","#00f000")
                  colors Yellow=("#ffff00","#f0f000")

genSquare :: Int -> Int -> Color -> Xml Elem
genSquare x y c = xelem "rect" $  xIntAttr "x" (x*24) 
                                   <> xIntAttr "y" (y*24)
                                   <> xIntAttr "width"  24
                                   <> xIntAttr "height" 24
                                   <> xattr    "style" (style c)

genSquares :: [(Int, Int, Piece)] -> [Xml Elem]
genSquares ps = Prelude.concatMap genPiece ps
              where genPiece (i,j,p) = 
              	     Prelude.map (\(x,y) -> genSquare (i+x) (j+y) (colorOf p)) (toList (shapeOf p))

genSvg :: [(Int, Int, Piece)] -> Xml Doc
genSvg ps = doc defaultDocInfo $ xelem "svg" $ xattr "xmlns" "http://www.w3.org/2000/svg" 
                                   <#> xelems (genSquares ps)

renderSVG :: [(Int, Int, Piece)] -> ByteString
renderSVG ps = xrender $ genSvg ps

