module Blockus.Tests.TestShape 
where  
import Test.HUnit
import Data.List
import Blockus.Tests.TestUtils
import Blockus.Shape

tests = "A Shape" ~: TestList 

  ["overlaps another one of same coords" ~: 
    check  $ ["#"] `overlaps` ["#"] 

  ,"doesn't overlap a shape of different coords" ~:
    reject $ ["#"] `overlaps` [" #"] 

  ,"overlaps another one with some coords in common" ~:
    check  $ ["##"] `overlaps` [" ##"] 

  ,"neighbors another one with coord x or coord y distance = 1" ~:
    TestList ["on the right" ~: check $ shapes neighbor ["#*"]
             ,"on the left"  ~: check $ shapes neighbor ["*#"]
             ,"below" ~: check $ shapes neighbor ["#",
                                                  "*"]
             ,"above" ~: check $ shapes neighbor ["*",
                                                  "#"]
             ]             

  ,"doesn't neighbor one with coord x distance > 1" ~:
    reject $ shapes neighbor ["# *"]

  ,"connects another one with coord x and y distance = 1" ~:
    TestList ["right and down" ~: check $ shapes connect ["# ",
                                                          " *"]
             ,"left and up"    ~: check $ shapes connect ["* ",
                                                          " #"]
             ,"left and downs" ~: check $ shapes connect [" #",
                                                          "* "]
             ,"right and up"   ~: check $ shapes connect [" *",
                                                          "# "]
             ]
    ,"doesn't connect one with coord x and y distance > 1" ~:
      reject $ shapes connect ["# *"]

    ,"can be flipped " ~:
      TestList ["on the vertical axis" ~: check $ flipped ["###"
                                                          ,"#  "] ["###",
                                                                   "  #"]
               ,"for any size of shape " ~: check $ flipped ["# "
                                                            ,"##"] [" #",
                                                                    "##"]
                ]
    ,"can be rotated" ~:
      TestList ["by 90 degrees" ~: check $ rotated ["###",
                                                    "#  "] ["##",
                                                            " #",
                                                            " #"]
                ,"for any shape" ~: check $ rotated ["# #",
                                                     "###"] ["##",
                                                             "# ",
                                                             "##"]
                ]
    ,"can be translated" ~:
      TestList ["by any distance" ~: check $ translated (2,1) ["##"] ["    ",
                                                                      "  ##"]
                ]
    ,"can be merged" ~:
      TestList ["from distinct shapes" ~: check $ merged ["#"] [" #"] ["##"]
                ,"from non distinct shapes" ~: check $ merged ["##"] [" ##"] ["###"]]
    ]

merged :: [String] -> [String] -> [String] -> Bool
merged s t r = merge (sharp s) (sharp t) == (sharp r)

translated :: Coord -> [String] -> [String] -> Bool
translated (x,y) s t = translate (x,y) (sharp s) == (sharp t)

flipped :: [String] -> [String] -> Bool
flipped s t = (vFlip (sharp s)) == (sharp t)

rotated :: [String] -> [String] -> Bool
rotated s t = (rotate (sharp s)) == (sharp t)


shapes :: (Shape -> Shape -> Bool) -> [String] -> Bool
shapes f ss = let
  s = shapeFromStrings '#' ss
  t = shapeFromStrings '*' ss
  in f s t


overlaps :: [String] -> [String] -> Bool
overlaps s t = sharp s `overlap` sharp t 

neighbors :: [String] -> [String] -> Bool
neighbors s t = sharp s  `neighbor` sharp t


