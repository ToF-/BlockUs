{-# LANGUAGE OverloadedStrings #-}
module Blockus.BoardRenderer
where
import Blockus.Shape
import Blockus.Piece
import Blockus.Board
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html4.Strict as H
import qualified Text.Blaze.Html4.Strict.Attributes as A


type Grid = [[Maybe Color]]

grid :: Int -> Board -> Grid
grid m board = [[lookup (x,y) board | x <- [1..m]]| y <- [1..m]]

renderText :: Board -> String
renderText = unlines . map (map cell) . (grid 20)
  where cell Nothing       = '.'
        cell (Just Blue)   = 'B'
        cell (Just Red)    = 'R'
        cell (Just Green)  = 'G'
        cell (Just Yellow) = 'Y'

cellHtml :: Maybe Color -> H.Html 
cellHtml c = H.td "" ! A.class_ (classOfColor c) 
  where classOfColor Nothing     = "empty"
        classOfColor (Just Blue) = "blue"
        classOfColor (Just Red)  = "red"
        classOfColor (Just Green) = "green"
        classOfColor (Just Yellow) = "yellow"


rowHtml :: [Maybe Color] -> H.Html
rowHtml [c]    =    cellHtml c
rowHtml (c:cs) = do cellHtml c
                    rowHtml cs

gridHtml :: Grid -> H.Html
gridHtml [r]    =    H.tr $ rowHtml r
gridHtml (r:rs) = do H.tr $ rowHtml r
                     gridHtml rs

renderHtml :: Int -> Board -> H.Html
renderHtml n b =  (H.table ! A.border "1") $ gridHtml (grid n b)

