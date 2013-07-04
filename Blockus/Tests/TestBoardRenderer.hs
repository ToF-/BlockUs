module Blockus.Tests.TestBoardRenderer
where

import Test.HUnit
import Blockus.Board
import Blockus.BoardRenderer
import Blockus.Shape
import Blockus.Piece
import Blockus.Board

block = shape [(0,0)]

blueBlock = piece block Blue
redBlock = piece block Red
greenBlock = piece block Green
yellowBlock = piece block Yellow


tests = "A Text Board Renderer" ~: TestList
  ["renders a text empty board" ~: 
  	 renderText emptyBoard ~?= unlines (replicate 20 (replicate 20 '.'))
  ,"renders a board with a blue block in 1,1" ~:
     renderText (put emptyBoard (1,1) blueBlock) ~?= unlines ( ["B..................."] ++ (replicate 19 (replicate 20 '.'))) 
  ,"renders a board with a red block in 1,1" ~:
     renderText (put emptyBoard (1,1) redBlock) ~?= unlines ( ["R..................."] ++ (replicate 19 (replicate 20 '.'))) 
  ,"renders a board with blocks in the first line" ~:
     let board = put (put emptyBoard (1,1) redBlock) (3,1) blueBlock 
     in renderText board ~?= unlines ( ["R.B................."] ++ (replicate 19 (replicate 20 '.'))) 
  ,"renders a board with blocks in any  line" ~:
     let board = put (put emptyBoard (1,1) yellowBlock) (3,2) greenBlock 
     in renderText board ~?= unlines ( ["Y..................."]++["..G................."] ++ (replicate 18 (replicate 20 '.'))) 
  ]
