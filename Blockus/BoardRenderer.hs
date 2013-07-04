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



grid :: Int -> Board -> [[Maybe Color]]
grid m board = [[lookup (x,y) board | x <- [1..m]]| y <- [1..m]]

renderText :: Board -> String
renderText = unlines . map (map cell) . (grid 20)
  where cell Nothing       = '.'
        cell (Just Blue)   = 'B'
        cell (Just Red)    = 'R'
        cell (Just Green)  = 'G'
        cell (Just Yellow) = 'Y'

cell :: Maybe Color -> H.Html 
cell c = H.td "" ! A.class_ (classOfColor c) 
  where classOfColor Nothing     = "empty"
        classOfColor (Just Blue) = "blue"
        classOfColor (Just Red)  = "red"
        classOfColor (Just Green) = "green"
        classOfColor (Just Yellow) = "yellow"


cells :: [Maybe Color] -> H.Html
cells [c] = cell c
cells (c:cs) = do cell c
                  cells cs

rows :: [[Maybe Color]] -> H.Html
rows [r] = H.tr $ cells r
rows (r:rs) = do H.tr $ cells r
                 rows rs

renderHtml :: Int -> Board -> H.Html
renderHtml n b =  (H.table ! A.border "1") $ rows (grid n b)

