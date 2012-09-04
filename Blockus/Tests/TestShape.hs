module Blockus.Tests.TestShape 
where  
import Test.HUnit
import Data.List
import Blockus.Shape

tests = TestList 

  ["overlaps another one of same coords" ~: 
    check  $ "#" `overlaps` "#" 

  ,"doesn't overlap a shape of different coords" ~:
    reject $ "#" `overlaps` " #" 

  ,"overlaps another one with some coords in common" ~:
    check  $ "##" `overlaps` " ##" 

  ]

simple :: String -> Shape
simple s = shape [(x,0) | x <- elemIndices '#' s]

overlaps :: String -> String -> Bool
overlaps s t = simple s `overlap` simple t 

check :: Bool -> Test
check b = b ~?= True

reject :: Bool -> Test
reject b = b ~?= False

