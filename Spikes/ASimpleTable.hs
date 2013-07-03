{-# LANGUAGE OverloadedStrings #-}
module Main where

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
{-- 
(H.p "hello, blaze!")
<table border="1">
<tr>
<td>row 1, cell 1</td>
<td>row 1, cell 2</td>
</tr>
<tr>
<td>row 2, cell 1</td>
<td>row 2, cell 2</td>
</tr>
</table>
--}

helloBlaze :: ServerPart Response
helloBlaze = 
   ok $ toResponse $ 
    appTemplate "Hello, Blaze!" 
                [H.meta ! A.name "keywords" ! A.content "happstack, blaze, html"] 
                aSimpleTable
                

main :: IO ()
main = simpleHTTP nullConf $ helloBlaze