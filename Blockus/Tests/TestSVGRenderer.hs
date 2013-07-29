module Blockus.Tests.TestSVGRenderer
where

import Test.HUnit
import Blockus.Tests.TestUtils
import Data.ByteString.Char8
import Blockus.Piece
import Blockus.Shape
import Blockus.SVGRenderer

b = pieceFrom ["#"] Blue
r = pieceFrom ["#"] Red 
y = pieceFrom ["#"] Yellow
g = pieceFrom ["#"] Green

bar = pieceFrom ["###"] Blue
includes = flip isInfixOf


render x y p = renderSVG [(x,y,p)]

tests = "A SVG renderer" ~: TestList
  ["renders pieces of different colors" ~: TestList 
  	[check $ (render 0 0 g) `includes` (pack "#00ff00;stroke:#00f000") 
  	,check $ (render 0 0 b) `includes` (pack "#0000ff;stroke:#0000f0") 
  	,check $ (render 0 0 r) `includes` (pack "#ff0000;stroke:#f00000") 
  	,check $ (render 0 0 y) `includes` (pack "#ffff00;stroke:#f0f000")]
 
  ,"renders pieces at different positions" ~: TestList
    [check $ (render 1 0 g) `includes`  (pack "x=\"24\"")
    ,check $ (render 0 2 g) `includes`  (pack "y=\"48\"")]

  ,"renders complex pieces" ~: TestList
    [check $ (render 0 0 bar) `includes` (pack "x=\"0\"")
    ,check $ (render 0 0 bar) `includes` (pack "x=\"24\"")
    ,check $ (render 0 0 bar) `includes` (pack "x=\"48\"")
    ]
  ,"renders pieces at distance from 0 0 " ~: TestList
    [check $ (render 5 10 bar) `includes` (pack "x=\"120\"")
    ,check $ (render 5 10 bar) `includes` (pack "x=\"144\"")
    ,check $ (render 5 10 bar) `includes` (pack "x=\"168\"")
    ,check $ (render 5 10 bar) `includes` (pack "y=\"240\"")
    ,check $ (render 5 11 bar) `includes` (pack "y=\"264\"")
    ]
  ,"renders many pieces" ~: TestList
    [check $ (renderSVG [(0,0,g),(1,1,g)]) `includes` (pack "#00ff00;stroke:#00f000")
    ,check $ (renderSVG [(0,0,g),(1,1,b)]) `includes` (pack "#0000ff;stroke:#0000f0")
    ,check $ (renderSVG [(0,0,g),(1,1,g)]) `includes` (pack "x=\"0\"")
    ,check $ (renderSVG [(0,0,g),(1,1,b)]) `includes` (pack "x=\"24\"")
    ]
  ]
