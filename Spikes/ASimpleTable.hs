{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (msum)
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html4.Strict as H
import qualified Text.Blaze.Html4.Strict.Attributes as A

appTemplate :: String -> [H.Html] -> H.Html -> H.Html
appTemplate title headers body =
    H.html $ do
      H.head $ do
        H.title (H.toHtml title)
        H.meta ! A.httpEquiv "Content-Type" ! A.content "text/html;charset=utf-8"
        sequence_ headers
      H.body $ do
        body

aSimpleTable :: H.Html
aSimpleTable = 
  (H.table ! A.border "1") $ do H.tr $ do H.td "B" 
                                          H.td "R"
                                H.tr $ do H.td "G" 
                                          H.td "Y"

mainResponse :: ServerPart Response
mainResponse = 
   ok $ toResponse $ 
    appTemplate "a simple table" 
                [H.meta ! A.name "keywords" ! A.content "happstack, blaze, html",
                 H.link ! A.rel "stylesheet" ! A.type_ "text/css" ! A.href "static/css/main.css"] 
                aSimpleTable
                

main :: IO ()
main = simpleHTTP nullConf $ msum 
  [dir "main" $ mainResponse,
   dir "static" $ serveDirectory DisableBrowsing [] "static"]
