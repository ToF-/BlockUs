module Blockus.SVG
where

data RGB = RGB Int Int Int 
data Context = Context RGB Int RGB
attribute :: String -> String ->String
attribute a v = " " ++ a ++ "=" ++ show v

style :: RGB -> Int -> RGB -> String
style fc w sc = "fill:"++rgb fc ++ ";stroke-width:" ++ show w ++ ";stroke:" ++ rgb sc
  where
      rgb (RGB r g b) = "rgb(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"

rect :: Int -> Int -> Int -> Int -> Context -> String
rect x y w h (Context fc sw sc) = "<rect" ++ attribute "x" (show x) ++ 
                              attribute "y" (show y) ++ 
                              attribute "width" (show w) ++
                              attribute "height" (show h) ++
                              attribute "style" (style fc sw sc) ++ "/>"