module Blockus.Tests.TestSVG
where

import Test.HUnit
import Blockus.SVG as S

tests = "A SVG" ~: TestList
  ["define attributes" ~: S.attribute "X" "12" ~?= " X = \"12\""
  ,"define style" ~: S.style (S.RGB 10 20 0) 4 (S.RGB 20 80 120) ~?= " style = \"fill:rgb(10,20,0);stroke-width:4;stroke:rgb(20,80,120)\""
  ]