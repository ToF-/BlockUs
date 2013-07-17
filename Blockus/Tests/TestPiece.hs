module Blockus.Tests.TestPiece
where

import Test.HUnit
import Blockus.Shape
import Blockus.Piece

blueBlock = piece (shape [(0,0)]) Blue
tests = "A Piece" ~: TestList 
  ["has a shape" ~: shapeOf blueBlock ~?= shape [(0,0)]
  ,"has a color" ~: colorOf blueBlock ~?= Blue
  ,"can be defined with a list of strings" ~: TestList
  	["such a simple sharp" ~:  
  		let p = pieceFrom ["#"] Blue
  		in shapeOf p ~?= shape [(0,0)]
  	,"such as line of sharps" ~:
  		let p = pieceFrom ["##"] Blue
  		in shapeOf p ~?= shape [(0,0),(1,0)]
  	,"such as sequences of sharps" ~: 
  		let p = pieceFrom ["# #"] Blue
  		in shapeOf p ~?= shape [(0,0),(2,0)]
  	,"such as vertical lines of sharps" ~:
  		let p = pieceFrom ["#","#"] Blue
  		in shapeOf p ~?= shape [(0,0),(0,1)]
  	]
  ]

