module Blockus.ShapeTemplate
where

import Blockus.Shape
import Data.List 

template :: [Shape] -> Shape
template [] = empty
template (s:ss) = (positions ps) `merge` (translate (0,area s + 1) $ template ss)
              	where ps = nub $ (rotations s) ++ (rotations (vFlip s))
              	      rotations s = [s, rotate s, rotate (rotate s), rotate (rotate (rotate s))]

positions :: [Shape] -> Shape
positions [] = empty
positions (s:ss) = s `merge` (translate (area s + 1,0) $ positions ss) 

patterns :: [Shape]
patterns = [sharp ["#"]      -- 0

            ,sharp ["##"]    -- 1

            ,sharp ["##"     -- 2
             			 ," #"]

            ,sharp ["###"]   -- 3

            ,sharp ["##"     -- 4
             			 ,"##"]

            ,sharp [" # "    -- 5
             			 ,"###"]

            ,sharp ["####"]  -- 6

            ,sharp ["  #"    -- 7
             			 ,"###"]

            ,sharp [" ##"    -- 8
             			 ,"## "]

            ,sharp ["#   "   -- 9
             			 ,"####"]

            ,sharp [" # "    -- 10
             			 ," # "
             			 ,"###"]

            ,sharp ["#  "    -- 11
             			 ,"#  "
             			 ,"###"]

            ,sharp [" ###"   -- 12
             			 ,"##  "]

            ,sharp ["   #"   -- 13
             			 ,"####"
             			 ,"#   "]

            ,sharp ["#####"] -- 14

            ,sharp ["# "     -- 15
             			 ,"##"
             			 ,"##"]

            ,sharp [" ##"    -- 16
             			 ,"## "
             			 ,"#  "]

            ,sharp ["##"     -- 17
             			 ,"# "
             			 ,"##"]

            ,sharp [" ##"    -- 18
             			 ,"## "
             			 ," # "]

            ,sharp [" # "    -- 19
             			 ,"###"
             			 ," # "]

            ,sharp [" #  "   -- 20 
             			 ,"####"]
            ]
