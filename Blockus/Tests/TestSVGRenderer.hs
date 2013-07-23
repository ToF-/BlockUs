module Blockus.Tests.TestSVGRenderer
where

import Test.HUnit
import Blockus.Piece
import Blockus.Shape
import Blockus.SVGRenderer

tests = "A SVG renderer" ~: TestList
  ["renders the SVG drawing of a piece" ~:
  	let p = pieceFrom ["#"] Blue
  	in (render 0 0 p) ~?= 
  		"<rect x=\"0\" y=\"0\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>"
  		]
