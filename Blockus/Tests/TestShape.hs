module Blockus.Tests.TestShape 
where  
import Test.HUnit
import Data.List
import Blockus.Shape

simple :: String -> Shape
simple s = shape [(x,0) | x <- elemIndices '#' s]

tests = TestList 
  ["overlaps another one of same coords" ~: 
    simple "#" `overlap` simple "#" ~?= True

  ,"doesn't overlap a shape of different coords" ~:
    simple "#" `overlap` simple " #" ~?= False

  ,"overlaps another one with some coords in common" ~:
    simple "##" `overlap` simple " ##" ~?= True

  ]  