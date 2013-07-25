module Main
where

import Blockus.SVGRenderer
import Blockus.Piece
import Data.ByteString.Char8 as BS


b = pieceFrom ["#"] Blue
r = pieceFrom ["#"] Red 
y = pieceFrom ["#"] Yellow
g = pieceFrom ["#"] Green

main = BS.putStrLn $ render 0 0 r 