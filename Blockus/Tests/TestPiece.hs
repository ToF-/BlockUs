module Blockus.Tests.TestPiece
where

import Test.HUnit
import Blockus.Shape
import Blockus.Piece

blueBlock = piece (shape [(0,0)]) Blue
tests = "A Piece" ~: TestList 
  ["has a shape" ~: shapeOf blueBlock ~?= shape [(0,0)]
  ,"has a color" ~: colorOf blueBlock ~?= Blue
  ]

