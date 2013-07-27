module Blockus.Tests.TestBlockusPieces
where
import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.Piece
import Blockus.BlockusPieces

tests = "In the table of the pieces" ~: TestList
  ["the small shape has only 1 position" ~: TestList  
  	[check ((shapes!!0) !! 0 `equals` ["#"])
    ,length (shapes!!0) ~?= 1]
  ,"a bar shape has only 2 positions" ~: TestList  
   [check ((shapes!!1) !! 0 `equals` ["##"])
   ,check ((shapes!!1) !! 1 `equals` ["#",
  									  "#"])
   ,length (shapes!!1) ~?= 2
   ,check ((shapes!!6) !! 0 `equals` ["####"])
   ,check ((shapes!!6) !! 1 `equals` ["#",
  									  "#",
  									  "#",
  									  "#"])
   ,length (shapes!!6) ~?= 2]
  
  ,"a symmetric shape has only 4 positions" ~: TestList
   [check ((shapes!!2) !! 0 `equals` ["##",
    	                              " #"])

   ,check ((shapes!!2) !! 1 `equals` [" #",
  	                                  "##"])

   ,check ((shapes!!2) !! 2 `equals` ["# ",
  	                                  "##"])

   ,check ((shapes!!2) !! 3 `equals` ["##",
   	                                  "# "])
   ,length (shapes!!2) ~?= 4]

  ,"a non symmetric shape has 8 positions" ~: TestList
  [check ((shapes!!7) !! 0 `equals` ["  #",
  	                                  "###"])

   ,check ((shapes!!7) !! 1 `equals` ["#",
  									  "#",
  	                                  "##"])

   ,check ((shapes!!7) !! 2 `equals` ["###",
  	                                  "#  "])

   ,check ((shapes!!7) !! 3 `equals` ["##",
  									  " #",
  	                                  " #"])

   ,check ((shapes!!7) !! 4 `equals` ["#  ",
  	                                  "###"])

   ,check ((shapes!!7) !! 5 `equals` ["##",
  									  "# ",
  	                                  "# "])

   ,check ((shapes!!7) !! 6 `equals` ["###",
  	                                  "  #"])

   ,check ((shapes!!7) !! 7 `equals` [" #",
  									  " #",
  	                                  "##"])
   ,length (shapes!!7) ~?= 8]
  ,"the table of pieces contains" ~: TestList 
    ["blue pieces" ~: TestList 
      [colorOf (((pieces!!0)!!0)!!0) ~?= Blue
      ,colorOf (((pieces!!0)!!1)!!0) ~?= Blue
      ,colorOf (((pieces!!0)!!20)!!7) ~?= Blue]
    ,"red pieces" ~: TestList 
      [colorOf (((pieces!!1)!!20)!!7) ~?= Red]
    ,"green pieces" ~: TestList 
      [colorOf (((pieces!!2)!!0)!!0) ~?= Green
      ,colorOf (((pieces!!2)!!20)!!7) ~?= Green]
    ,"yellow pieces" ~: TestList 
      [colorOf (((pieces!!3)!!0)!!0) ~?= Yellow
      ,colorOf (((pieces!!3)!!20)!!7) ~?= Yellow]
    ]
   ,"coords of pieces in the template" ~: TestList
    ["depends on position number" ~: TestList 
      [templatePos 0 0 0 ~?= (0,0)
      ,templatePos 0 0 1 ~?= (6,0)
      ,templatePos 0 0 2 ~?= (12,0)]
    ,"depends on shape number" ~: TestList
      [templatePos 0 1 0 ~?= (0,6)
      ,templatePos 0 2 0 ~?= (0,12)]
    ,"depends on color number" ~: TestList
      [templatePos 1 0 0 ~?= (0, 6*21)
      ,templatePos 3 20 7 ~?= (6*7,3*6*21+6*20)]
    ]
  ]


equals :: Shape -> [String] -> Bool
equals p s = p == (sharp s)
