module Blockus.Tests.TestSVGRenderer
where

import Test.HUnit
import Blockus.Tests.TestUtils
import Data.List
import Blockus.Piece
import Blockus.Shape
import Blockus.SVGRenderer

b = pieceFrom ["#"] Blue
r = pieceFrom ["#"] Red 
y = pieceFrom ["#"] Yellow
g = pieceFrom ["#"] Green

includes = flip isInfixOf

tests = "A SVG renderer" ~: TestList
  ["renders the SVG drawing of a piece" ~: 
   	(render 0 0 g) ~?= 
  	 "<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"stroke-width:2;fill:#00ff00;stroke:#00f000\"/>"
 
  ,"renders pieces of different colors" ~: TestList 
  	[check $ (render 0 0 g) `includes` "#00ff00;stroke:#00f000" 
  	,check $ (render 0 0 b) `includes` "#0000ff;stroke:#0000f0" 
  	,check $ (render 0 0 r) `includes` "#ff0000;stroke:#f00000" 
  	,check $ (render 0 0 y) `includes` "#ffff00;stroke:#f0f000"]
 
  ,"renders pieces at different positions" ~: TestList
    [check $ (render 1 0 g) `includes`  "x=\"24\""
    ,check $ (render 0 2 g) `includes`  "y=\"48\""
    ]

  ]
