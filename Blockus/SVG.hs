module Blockus.SVG
where

data RGB = RGB Int Int Int 

attribute :: String -> String ->String
attribute a v = " " ++ a ++ " = " ++ show v

style :: RGB -> Int -> RGB -> String
style fc w sc = attribute "style" $ "fill:"++rgb fc ++ ";stroke-width:" ++ show w ++ ";stroke:" ++ rgb sc
  where
      rgb (RGB r g b) = "rgb(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"