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


renderText :: Board -> String
renderText board = unlines ([[cell (lookup (x,y) board) | x <- [1..20]]| y <- [1..20]])
  where cell Nothing       = '.'
        cell (Just Blue)   = 'B'
        cell (Just Red)    = 'R'
        cell (Just Green)  = 'G'
        cell (Just Yellow) = 'Y'

cell :: H.Html 
cell = H.td "" ! A.class_ "empty"

cells :: Int -> H.Html
cells 1 = cell
cells n = do cell
             cells (n-1)

rows :: Int -> Int -> H.Html
rows 1 n = H.tr $ cells n
rows m n = do H.tr $ cells n
              rows (m-1) n

renderHtml :: Int -> Board -> H.Html
renderHtml n _ =   (H.table ! A.border "1") $ rows n n

