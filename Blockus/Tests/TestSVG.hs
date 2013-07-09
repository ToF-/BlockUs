module Blockus.Tests.TestSVG
where

import Test.HUnit
import Blockus.SVG as S

tests = "A SVG" ~: TestList
  ["defines attributes" ~: S.attribute "X" "12" ~?= " X=\"12\""
  ,"defines style" ~: S.style (S.Context (S.RGB 10 20 0) 4 (S.RGB 20 80 120)) ~?= "fill:rgb(10,20,0);stroke-width:4;stroke:rgb(20,80,120)"
  ,"creates a rect" ~: let context = S.Context (S.RGB 0 0 255) 1 (S.RGB 0 0 0)
  						in S.rect 10 15 23 50 context ~?= 
  							"<rect x=\"10\" y=\"15\" width=\"23\" height=\"50\" style=\"fill:rgb(0,0,255);stroke-width:1;stroke:rgb(0,0,0)\"/>"
  ]