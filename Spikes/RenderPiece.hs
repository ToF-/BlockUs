module Main
where

import Blockus.SVGRenderer
import Blockus.Piece
import Data.ByteString.Char8 as BS



r = pieceFrom ["###"] Yellow 


main = BS.putStrLn $ render 5 10 r 