module Main
where

import Blockus.SVGRenderer
import Blockus.Piece
import Data.ByteString.Char8 as BS
import Blockus.ShapeTemplate

main = BS.putStrLn $ renderSVG $ [(0,0,  Piece (template patterns) Blue)
																 ,(50,0, Piece (template patterns) Red)
																 ,(100,0, Piece (template patterns) Green)
																 ,(150,0, Piece (template patterns) Yellow)]
