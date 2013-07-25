module Main where

import Data.Monoid
import qualified Data.ByteString.Lazy as BSL
import Text.XML.Generator -- the main xmlgen module

genPersonElem :: (String,String) -> Xml Elem
genPersonElem (name,age) = xelem "person" $ xattr "age" age <#> xtext name

genPersonElems :: [(String,String)] -> Xml Elem
genPersonElems = xelems . map genPersonElem

genXml :: Xml Doc
genXml = let people =  [("Stefan", "32"), ("Judith", "4")]
          in doc defaultDocInfo $ xelem "people" (genPersonElems people)

main :: IO ()
main = BSL.putStrLn (xrender genXml)