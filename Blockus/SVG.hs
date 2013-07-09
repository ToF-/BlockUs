module Blockus.SVG
where
import Data.List

data RGB = RGB Int Int Int 
data Context = Context { fillColor :: RGB, strokeWidth :: Int, strokeColor :: RGB }

attribute :: String -> String ->String
attribute a v = (' ': a) ++ "=" ++ show v

style :: Context -> String
style ctx = showArgs ";" $ map (uncurry styleAttribute) [("fill",          rgb (fillColor ctx))
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
rect x y w h ctx = element "rect" (map (uncurry attribute)  [("x",     show x) 
								                            ,("y",     show y) 
								                            ,("width", show w)
								                            ,("height",show h)
								                            ,("style", style ctx)] )