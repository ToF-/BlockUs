module Blockus.BlockusPieces
where
{--
creates a table of pieces such that:
each line in the table start with a different blockus piece
each line contains all the possible positions of that piece

--}

import Blockus.Shape
import Blockus.Piece
import Data.List

shapes = [positions ss | ss <- patterns]
	where positions ss = nub ((rotations sh) ++ (rotations (vFlip sh))) 
	                       where sh = shapeFromStrings '#' ss

rotations s = [s, rotate s, rotate (rotate s), rotate (rotate (rotate s))]

patterns = [["#"]      -- 0

            ,["##"]    -- 1

            ,["##"     -- 2
             ," #"]

            ,["###"]   -- 3

            ,["##"     -- 4
             ,"##"]

            ,[" # "    -- 5
             ,"###"]

            ,["####"]  -- 6

            ,["  #"    -- 7
             ,"###"]

            ,[" ##"    -- 8
             ,"## "]

            ,["#   "   -- 9
             ,"####"]

            ,[" # "    -- 10
             ," # "
             ,"###"]

            ,["#  "    -- 11
             ,"#  "
             ,"###"]

            ,[" ###"   -- 12
             ,"##  "]

            ,["   #"   -- 13
             ,"####"
             ,"#   "]

            ,["#####"] -- 14

            ,["# "     -- 15
             ,"##"
             ,"##"]

            ,[" ##"    -- 16
             ,"## "
             ,"#  "]

            ,["##"     -- 17
             ,"# "
             ,"##"]

            ,[" ##"    -- 18
             ,"## "
             ," # "]

            ,[" # "    -- 19
             ,"###"
             ," # "]

            ,[" #  "   -- 20 
             ,"####"]
            ]