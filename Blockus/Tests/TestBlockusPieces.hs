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
    ,colorOf (((pieces!!0)!!2)!!2) ~?= Blue]
  ,"red pieces" ~: TestList 
    [colorOf (((pieces!!1)!!0)!!0) ~?= Red
    ,colorOf (((pieces!!1)!!1)!!0) ~?= Red
    ,colorOf (((pieces!!1)!!2)!!2) ~?= Red]
  ,"green pieces" ~: TestList 
    [colorOf (((pieces!!2)!!0)!!0) ~?= Green
    ,colorOf (((pieces!!2)!!1)!!0) ~?= Green
    ,colorOf (((pieces!!2)!!2)!!2) ~?= Green]
  ,"yellow pieces" ~: TestList 
    [colorOf (((pieces!!3)!!0)!!0) ~?= Yellow
    ,colorOf (((pieces!!3)!!1)!!0) ~?= Yellow
    ,colorOf (((pieces!!3)!!2)!!2) ~?= Yellow]
  ]
  ]


equals :: Shape -> [String] -> Bool
equals p s = p == (sharp s)
