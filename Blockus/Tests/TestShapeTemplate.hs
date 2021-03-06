module Blockus.Tests.TestShapeTemplate
where

import Test.HUnit
import Blockus.Tests.TestUtils
import Blockus.Shape
import Blockus.ShapeTemplate

tests = "A ShapeTemplate" ~: TestList
	["collects at least 1 shape" ~: template [sharp ["#"]] ~?= sharp ["#"]
	,"merge 2 distinct shapes into one, with a line separation" ~:
		template [sharp ["#"], sharp ["##","##"]] ~?= sharp ["# ",
																												 "  ",
																												 "##",
																												 "##"]
	,"merge N distinct shapes into one, with a line separation" ~:
		template [sharp ["#"], sharp ["##","##"], sharp ["#"]] ~?= sharp ["# ",
																												              "  ",
																												              "##",
																												              "##",
																												              "  ",
																												              "# "]
	,"merge disctinct shape positions of a simple shape into one, with a column separation" ~:
	  template [sharp ["##"]] ~?= sharp ["## #",
	   																   "   #"]
	,"merge disctinct shape positions of a symmetric shape into one, with a column separation" ~:
	  template [sharp ["###",
	  								 " # "]] ~?= sharp ["###  #   #  #  ",
	   											 					    " #  ##  ### ## ",
	   																    "     #      #  "]
	 ,"merge distinct shape positions of non symmetric shape into one, with a column separation" ~:
	 	template [sharp ["###",
	 	  						   "#  "]] ~?= sharp ["### ##    # #   ###  #  #   ## ",
	 	  						   										"#    #  ### #     #  #  ### #  ",
	 	  						   										"     #      ##      ##      #  "]
	  ] 

