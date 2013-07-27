module Blockus.Tests.TestBlockusPieces
where
import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.BlockusPieces

tests = TestList
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

  ]


equals :: Shape -> [String] -> Bool
equals p s = p == (sharp s)
