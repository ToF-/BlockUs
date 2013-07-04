{-# LANGUAGE OverloadedStrings #-}
module Blockus.Tests.TestBoardRenderer
where

import Test.HUnit
import Blockus.Board
import Blockus.BoardRenderer
import Blockus.Shape
import Blockus.Piece
import Blockus.Board

import           Text.Blaze ((!))
import qualified Text.Blaze.Html4.Strict as H
import qualified Text.Blaze.Html4.Strict.Attributes as A
import qualified Text.Blaze.Html.Renderer.Utf8 as R

block = shape [(0,0)]

blueBlock = piece block Blue
redBlock = piece block Red
greenBlock = piece block Green
yellowBlock = piece block Yellow


tests = TestList 
  ["A Text Board Renderer" ~: TestList
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
  ,"A Html Board Renderer" ~: TestList
    ["renders a html empty 1 cell board" ~: 
       R.renderHtml (renderHtml 1 emptyBoard) ~?= "<table border=\"1\"><tr><td class=\"empty\"></td></tr></table>"
    ,"renders a html empty 2 cell board" ~:
       R.renderHtml (renderHtml 2 emptyBoard) ~?=
       "<table border=\"1\"><tr><td class=\"empty\"></td><td class=\"empty\"></td></tr><tr><td class=\"empty\"></td><td class=\"empty\"></td></tr></table>"
    ,"renders a html board with 1 blue cell" ~:
       R.renderHtml (renderHtml 1 (put emptyBoard (1,1) blueBlock)) ~?= "<table border=\"1\"><tr><td class=\"blue\"></td></tr></table>"
    ,"renders a html board with 4 different cells" ~:
       R.renderHtml (renderHtml 2 
          (put (put (put (put emptyBoard (1,1) blueBlock) (2,1) redBlock) (1,2) yellowBlock) (2,2) greenBlock)) ~?= 
          "<table border=\"1\"><tr><td class=\"blue\"></td><td class=\"red\"></td></tr><tr><td class=\"yellow\"></td><td class=\"green\"></td></tr></table>"

    ]

  ]
