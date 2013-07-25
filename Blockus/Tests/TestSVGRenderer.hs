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

includes = flip isInfixOf

tests = "A SVG renderer" ~: TestList
  ["renders pieces of different colors" ~: TestList 
  	[check $ (render 0 0 g) `includes` (pack "#00ff00;stroke:#00f000") 
  	,check $ (render 0 0 b) `includes` (pack "#0000ff;stroke:#0000f0") 
  	,check $ (render 0 0 r) `includes` (pack "#ff0000;stroke:#f00000") 
  	,check $ (render 0 0 y) `includes` (pack "#ffff00;stroke:#f0f000")]
 
  ,"renders pieces at different positions" ~: TestList
    [check $ (render 1 0 g) `includes`  (pack "x=\"24\"")
    ,check $ (render 0 2 g) `includes`  (pack "y=\"48\"")
    ]

  ]
