{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (msum)
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html4.Strict as H
import qualified Text.Blaze.Html4.Strict.Attributes as A
import Blockus.Shape
import Blockus.Piece
import Blockus.Board
import Blockus.Board
import Blockus.BoardRenderer

appTemplate :: String -> [H.Html] -> H.Html -> H.Html
appTemplate title headers body =
    H.html $ do
      H.head $ do
        H.title (H.toHtml title)
        H.meta ! A.httpEquiv "Content-Type" ! A.content "text/html;charset=utf-8"
        sequence_ headers
      H.body $ do
        body

block = shape [(0,0)]

blueBlock = piece block Blue
redBlock = piece block Red
greenBlock = piece block Green
yellowBlock = piece block Yellow

aBlockusGrid :: H.Html 
aBlockusGrid = 
  let board =  put (put (put (put (put emptyBoard (1,1) blueBlock) (3,2) redBlock) (5,4) greenBlock) (20,20) yellowBlock) (19,20) yellowBlock
      board'=  put (put (put (put (put board (2,1) blueBlock) (3,7) redBlock) (5,5) greenBlock) (2,2) yellowBlock) (3,2) yellowBlock
  in renderHtml 20 board'
  
aSimpleTable :: H.Html
aSimpleTable = 
  (H.table ! A.border "1") $ do H.tr $ do H.td "" ! A.class_ "blue" 
                                          H.td "" ! A.class_ "red"
                                          H.td "" ! A.class_ "red" 
                                H.tr $ do H.td "" ! A.class_ "green"
                                          H.td "" ! A.class_ "empty"
                                          H.td "" ! A.class_ "yellow"
                                H.tr $ do H.td "" ! A.class_ "empty"
                                          H.td "" ! A.class_ "empty"
                                          H.td "" ! A.class_ "yellow"


mainResponse :: ServerPart Response
mainResponse = 
   ok $ toResponse $ 
    appTemplate "a simple table" 
                [H.meta ! A.name "keywords" ! A.content "happstack, blaze, html",
                 H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "static/css/main.css"] 
                aBlockusGrid -- aSimpleTable
                

main :: IO ()
main = simpleHTTP nullConf $ msum 
  [dir "main" $ mainResponse,
   dir "static" $ serveDirectory DisableBrowsing [] "static"]
