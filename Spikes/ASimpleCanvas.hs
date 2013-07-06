{-# LANGUAGE OverloadedStrings #-}
module Main
where

import Control.Monad (msum)
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html5 as H
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

aSimpleCanvas :: H.Html
aSimpleCanvas = do 
	H.canvas ! A.id "myCanvas" ! A.width "200" ! A.height "100" ! A.style "border:1px solid #00DE23;" $ "your browser does not support the HTML5 canvas tag";
	H.script 	"draw()"

mainResponse :: ServerPart Response
mainResponse = 
   ok $ toResponse $ 
    appTemplate "a simple table" 
                [H.meta ! A.name "keywords" ! A.content "happstack, blaze, html",
                 H.script ! A.src "static/script/ASimpleScript.js" $ ""] 
                aSimpleCanvas


main :: IO ()
main = simpleHTTP nullConf $ msum 
  [dir "main" $ mainResponse,
   dir "static" $ serveDirectory DisableBrowsing [] "static"]

