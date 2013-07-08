module Blockus.Tests.TestDrawShapes
where
import Test.HUnit
import Blockus.DrawShapes

tests = "A Shape Drawer" ~: TestList 

  ["generates a JS function" ~: TestList 
  	[drawShapes !! 0 ~?= "var drawShapes = function() {"
  	,drawShapes !! ((length drawShapes) - 1) ~?= "}"
  	]
  ]
