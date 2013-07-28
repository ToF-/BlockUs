module Blockus.Tests.TestBoard
where

import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.Piece
import Blockus.Board


block = fromList [(0,0)]

blueBlock = piece block Blue
redBlock = piece block Red

tests = "A Board" ~: TestList 
  ["doesn't accept the placing outside its limit" ~: 
    TestList ["of a simple piece " ~: 
                place emptyBoard (0,0) blueBlock ~?= Left IllegalCoord
            ]
  ,"accepts a placing in correct initial position" ~:
    TestList ["of a blue simple piece" ~:
                check $ isRight $ place emptyBoard (1,1) blueBlock
             ,"and it can be detected on the board" ~:
                let board = case place emptyBoard (1,1) blueBlock of
                	Right b -> b 
                	Left _  -> error "test error"
                in board `at` (1,1) ~?= Just Blue
              ]
  ,"knows what is its cells" ~:
  	TestList ["when it's empty" ~:
  				emptyBoard `at` (1,1) ~?= Nothing
  		     ,"when it's filled with one block" ~:
  		        let board = put emptyBoard (1,1) blueBlock
  		        in board `at` (1,1) ~?= Just Blue
  		     ,"when it's filled with one block at any place" ~:
  		        let board = put emptyBoard (3,4) blueBlock
  		        in board `at` (3,4) ~?= Just Blue
  		     ,"when it's filled with one block of any color" ~:
  		        let board = put emptyBoard (3,4) redBlock
  		        in board `at` (3,4) ~?= Just Red
  		     ,"when it's filled with a piece of several blocks" ~:
  		        let board = put emptyBoard (2,2) (piece (fromList [(0,0),(1,0),(0,1)]) Yellow)
  		        in TestList [board `at` (2,2) ~?= Just Yellow
  		        	 		,board `at` (2,3) ~?= Just Yellow
  		        	 		,board `at` (3,2) ~?= Just Yellow
  		        	]
  		     ,"when it's filled with several pieces" ~:
  		     	let board' = put emptyBoard (1,1) redBlock
  		     	    board = put board' (2,2) blueBlock
  		     	in TestList [board `at` (1,1) ~?= Just Red
  		     				,board `at` (2,2) ~?= Just Blue]
  		     ]            
  ]

isRight :: Either a b -> Bool
isRight (Right _) = True
isRight (Left  _) = False
