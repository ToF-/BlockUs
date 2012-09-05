module Blockus.Tests.TestBoard
where

import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.Piece
import Blockus.Board


blueBlock = piece (shape [(0,0)]) Blue

tests = "A Board" ~: TestList 
  ["doesn't accept the placing outside its limit" ~: 
    TestList ["of a simple piece " ~: 
                place emptyBoard (0,0) blueBlock ~?= Left IllegalCoord
            ]
  ,"accepts a placing in correct initial position" ~:
    TestList ["of a blue simple piece" ~:
                check $ isRight $ place emptyBoard (1,1) blueBlock 
              ]            
  ]

isRight :: Either a b -> Bool
isRight (Right _) = True
isRight (Left  _) = False

block = shape [(0,0)]
