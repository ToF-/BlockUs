module Blockus.SVG
where
import Data.List
import Blockus.Shape as S

data Color   = RGB Int Int Int 
data Context = Context { fillColor :: Color, strokeWidth :: Int, strokeColor :: Color }

blue :: Context
blue =  Context (RGB 0 0 255) 2 (RGB 0 0 240)

shape :: Context -> Int -> Int -> Shape -> String
shape ctx x y s = ""

square :: Context -> Int -> Int -> String
square ctx x y = rect (x*24) (y*24) 24 24 ctx

attribute :: String -> String ->String
attribute a v = (' ': a) ++ "=" ++ show v

map_ = map . uncurry

style :: Context -> String
style ctx = showArgs ";" $ map_ styleAttribute [("fill",          rgb (fillColor ctx))
										 	   ,("stroke-width",  show (strokeWidth ctx))
									     	   ,("stroke",        rgb (strokeColor ctx))]

rgb (RGB r g b) = "rgb(" ++ showArgs "," (map show [r,g,b]) ++ ")"

styleAttribute :: String -> String -> String
styleAttribute a v = a ++ ":" ++ v

showArgs :: String -> [String] -> String
showArgs sep args = concat $ intersperse sep $ args

element :: String -> [String] -> String
element el atts = ('<' : el) ++ concat atts ++ "/>"

rect :: Int -> Int -> Int -> Int -> Context -> String
rect x y w h ctx = element "rect" $ map_ attribute [("x",     show x) 
								                   ,("y",     show y) 
								                   ,("width", show w)
								                   ,("height",show h)
								                   ,("style", style ctx)]