module Blockus.Tests.TestSVGRenderer
where

import Test.HUnit
import Blockus.Piece
import Blockus.Shape
import Blockus.SVGRenderer

b = pieceFrom ["#"] Blue
r = pieceFrom ["#"] Red 

tests = "A SVG renderer" ~: TestList
  ["renders the SVG drawing of a piece" ~:
	 (render 0 0 b) ~?= 
  		"<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"stroke-width:2;fill:#0000ff;stroke:#0000f0\"/>"
  ,"renders pieces of different colors" ~:
	 (render 0 0 r) ~?= 
  		"<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"stroke-width:2;fill:#00ff00;stroke:#00f000\"/>"
  ]
