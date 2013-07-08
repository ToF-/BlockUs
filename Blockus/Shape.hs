module Blockus.Shape
where
import qualified Data.Set as S
import Data.List

type Coord = (Int,Int)
type Shape = S.Set Coord

shape :: [(Int,Int)] -> Shape 
shape cs = S.fromList cs

overlap :: Shape -> Shape -> Bool
overlap s t = not $ S.null $ S.intersection s t  

neighbor :: Shape -> Shape -> Bool
neighbor s t = any (s `overlap`) $ map (\c-> translate c t) [(-1,0),(1,0),(0,-1),(0,1)] 

connect :: Shape -> Shape -> Bool
connect s t = any (s `overlap`) $ map (\c -> translate c t) [(-1,-1),(1,1),(1,-1),(-1,1)]

translate :: Coord -> Shape -> Shape
translate (i,j) s = S.map (\(x,y) -> (x+i,y+j)) s

vFlip :: Shape -> Shape 
vFlip s = S.map (\(x,y) -> (m-x,y)) s
	where m = maximum (map fst (S.toList s))

rotate :: Shape -> Shape
rotate = vFlip . reverse
	where reverse s = S.map (\(x,y) -> (y,x)) s

merge :: Shape -> Shape -> Shape
merge = S.union

shapeFromStrings :: Char -> [String] -> Shape
shapeFromStrings c ss = shape $ concat (zipWith getRow [0..] ss)
  where getRow y s = [(x,y) | x <- elemIndices c s]

sharp = shapeFromStrings '#'

allShapes = [["#"]

            ,["##"]

            ,["##"
             ," #"]

            ,["###"]

            ,["##"
             ,"##"]

            ,[" # "
             ,"###"]

            ,["####"]

            ,["  #"
             ,"###"]

            ,[" ##"
             ,"## "]

            ,["#   "
             ,"####"]

            ,[" # "
             ," # "
             ,"###"]

            ,["#  "
             ,"#  "
             ,"###"]

            ,[" ###"
             ,"##  "]

            ,["   #"
             ,"####"
             ,"#   "]

            ,["#####"]

            ,["# "
             ,"##"
             ,"##"]

            ,[" ##"
             ,"## "
             ,"#  "]

            ,["##"
             ,"# "
             ,"##"]

            ,[" ##"
             ,"## "
             ," # "]

            ,[" # "
             ,"###"
             ," # "]

            ,[" #  "
             ,"####"]
            ]