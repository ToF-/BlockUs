module Blockus.Tests.TestSVG
where

import Test.HUnit
import Blockus.SVG as SVG
import Blockus.Shape as S

tests = "A SVG" ~: TestList
  ["defines attributes" ~: SVG.attribute "X" "12" ~?= " X=\"12\""
  
  ,"defines style" ~: SVG.style (SVG.Context (SVG.RGB 10 20 0) 4 (SVG.RGB 20 80 120)) ~?= "fill:rgb(10,20,0);stroke-width:4;stroke:rgb(20,80,120)"
  
  ,"creates a rect" ~: let context = SVG.Context (SVG.RGB 0 0 255) 1 (SVG.RGB 0 0 0)
  						in SVG.rect 10 15 23 50 context ~?= 
  							"<rect x=\"10\" y=\"15\" width=\"23\" height=\"50\" style=\"fill:rgb(0,0,255);stroke-width:1;stroke:rgb(0,0,0)\"/>"
  
  ,"creates a square" ~: SVG.square SVG.blue 1 2 ~?=
      "<rect x=\"24\" y=\"48\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>"
  
  ,"creates a shape" ~: SVG.shape SVG.blue 1 2 (S.shape [(0,0),(1,0),(0,1)]) ~?=
      "<rect x=\"24\" y=\"48\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>\n" ++
      "<rect x=\"24\" y=\"72\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>\n" ++
      "<rect x=\"48\" y=\"48\" width=\"24\" height=\"24\" style=\"fill:rgb(0,0,255);stroke-width:2;stroke:rgb(0,0,240)\"/>"

  ]