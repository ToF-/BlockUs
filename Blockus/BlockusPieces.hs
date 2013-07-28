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


template :: [((Int, Int),Piece)]
template = map (\((c,s,p),pc) -> ((templatePos c s p),pc))
             $ indexPositions $ indexShapes $ indexColors pieces


indexColors :: [[[Piece]]] -> [(Int,[[Piece]])]
indexColors = zip [0..]

indexShapes :: [(Int,[[Piece]])] -> [((Int,Int),[Piece])]
indexShapes cs =  concat [[((ixc,ixs),s) | (ixs,s) <- zip [0..] ss] | (ixc,ss) <- cs]

indexPositions :: [((Int,Int),[Piece])] -> [((Int,Int,Int),Piece)]
indexPositions ss = concat [[((ixc,ixs,ixp),p) | (ixp,p) <- zip [0..] ps] | ((ixc,ixs),ps) <- ss]   

index :: [a] -> [(Int,a)]
index = zip [0..]

mergeIx :: [[(Int,a)]] -> [((Int,Int),a)]
mergeIx ll = concat [[((y,x),i) | (x,i) <- l] | (y,l) <- index ll]  

templatePos :: Int -> Int -> Int -> (Int,Int)
templatePos c s p = (p*6,c*6*21+s*6)

pieces :: [[[Piece]]]
pieces = [[[piece s col | s <- ps] | ps <- shapes] | col <- [Blue, Red, Green, Yellow]]

shapes :: [[Shape]]
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