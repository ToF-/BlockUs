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
    TestList ["on the right" ~: check $ shapes neighbor ["#*"]
             ,"on the left"  ~: check $ shapes neighbor ["*#"]
             ]

  ,"doesn't neighbor one with coord x distance > 1" ~:
    reject $ shapes neighbor ["# *"]

  ,"neighbors another one with coord y distance = 1" ~:
      TestList ["below" ~: check $ shapes neighbor ["#",
                                                    "*"]
               ,"above" ~: check $ shapes neighbor ["*",
                                                   "#"]
               ]
  ]

shapes :: (Shape -> Shape -> Bool) -> [String] -> Bool
shapes f ss = let
  s = shapeFromStrings '#' ss
  t = shapeFromStrings '*' ss
  in f s t


shapeFromStrings :: Char -> [String] -> Shape
shapeFromStrings c ss = shape $ concat (zipWith getRow [0..] ss)
  where getRow y s = [(x,y) | x <- elemIndices c s]

sharp = shapeFromStrings '#'

overlaps :: [String] -> [String] -> Bool
overlaps s t = sharp s `overlap` sharp t 

neighbors :: [String] -> [String] -> Bool
neighbors s t = sharp s  `neighbor` sharp t

check :: Bool -> Test
check b = b ~?= True

reject :: Bool -> Test
reject b = b ~?= False

