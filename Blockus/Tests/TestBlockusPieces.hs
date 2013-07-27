module Blockus.Tests.TestBlockusPieces
where
import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.BlockusPieces

tests = TestList 
  [check ((shapes!!0) !! 0 `equals` ["#"])
  ,length (shapes!!0) ~?= 1

  ,check ((shapes!!1) !! 0 `equals` ["##"])

  ,check ((shapes!!1) !! 1 `equals` ["#",
  									 "#"])
  ,length (shapes!!1) ~?= 2

  ,check ((shapes!!2) !! 0 `equals` ["##",
  	                                 " #"])

  ,check ((shapes!!2) !! 1 `equals` [" #",
  	                                 "##"])

  ,check ((shapes!!2) !! 2 `equals` ["# ",
  	                                 "##"])

  ,check ((shapes!!2) !! 3 `equals` ["##",
  	                                 "# "])
  ,length (shapes!!2) ~?= 4

  ,check ((shapes!!3) !! 0 `equals` ["###"])

  ,check ((shapes!!3) !! 1 `equals` ["#",
  	                                 "#",
  	                                 "#"])
  ,length (shapes!!3) ~?= 2

  ,check ((shapes!!7) !! 0 `equals` ["  #",
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

  ]


equals :: Shape -> [String] -> Bool
equals p s = p == (sharp s)
