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

block = fromList [(0,0)]

blueBlock = Piece block Blue
redBlock = Piece block Red
greenBlock = Piece block Green
yellowBlock = Piece block Yellow



htmlEquals :: H.Html -> H.Html -> Test
htmlEquals result expected = R.renderHtml result ~?= R.renderHtml  expected

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
       (renderHtml 1 emptyBoard) `htmlEquals` (H.table ! A.border "1" $ H.tr $ H.td "" ! A.class_ "empty")

    ,"renders a html empty 2 cell board" ~:
       (renderHtml 2 emptyBoard) `htmlEquals` (H.table ! A.border "1" $ do H.tr $ do H.td "" ! A.class_ "empty"
                                                                                     H.td "" ! A.class_ "empty"
                                                                           H.tr $ do H.td "" ! A.class_ "empty"
                                                                                     H.td "" ! A.class_ "empty")
    ,"renders a html board with 1 blue cell" ~:
       (renderHtml 1 (put emptyBoard (1,1) blueBlock)) `htmlEquals` (H.table ! A.border "1" $ H.tr $ H.td "" ! A.class_ "blue")

    ,"renders a html board with 4 different cells" ~:
      let board = (put (put (put (put emptyBoard (1,1) blueBlock) (2,1) redBlock) (1,2) yellowBlock) (2,2) greenBlock)
      in (renderHtml 2 board)
        `htmlEquals` (H.table ! A.border "1" $ do H.tr $ do H.td "" ! A.class_ "blue"
                                                            H.td "" ! A.class_ "red"
                                                  H.tr $ do H.td "" ! A.class_ "yellow"
                                                            H.td "" ! A.class_ "green")
    ]
  ]
