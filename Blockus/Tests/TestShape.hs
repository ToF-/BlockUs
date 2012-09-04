module Blockus.Tests.TestShape 
where  
import Test.HUnit
import Data.List
import Blockus.Shape

tests = TestList 

  ["overlaps another one of same coords" ~: 
    check  $ ["#"] `overlaps` ["#"] 

  ,"doesn't overlap a shape of different coords" ~:
    reject $ ["#"] `overlaps` [" #"] 

  ,"overlaps another one with some coords in common" ~:
    check  $ ["##"] `overlaps` [" ##"] 

  ,"neighbors another one with coord x distance = 1" ~:
    TestList ["on the right" ~: check $ ["# "] `neighbors` [" #"]
             ,"on the left"  ~: check $ [" #"] `neighbors` ["# "]]  

  ,"doesn't neighbor one with coord x distance > 1" ~:
    reject $ ["#"] `neighbors` ["  #"]

  ,"neighbors another one with coord y distance = 1" ~:
      TestList ["below" ~: check $ ["#"] `neighbors` [" ",
                                                      "#"]
               ,"above" ~: check $ [" ",
                                    "#"] `neighbors` ["#"]]

  ]

simple :: [String] -> Shape
simple ss = shape $ concat (zipWith getRow [0..] ss)
  where getRow y s = [(x,y) | x <- elemIndices '#' s]

overlaps :: [String] -> [String] -> Bool
overlaps s t = simple s `overlap` simple t 

neighbors :: [String] -> [String] -> Bool
neighbors s t = simple s `neighbor` simple t

check :: Bool -> Test
check b = b ~?= True

reject :: Bool -> Test
reject b = b ~?= False

