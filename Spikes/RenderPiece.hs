module Main
where

import Blockus.SVGRenderer
import Blockus.Piece
import Data.ByteString.Char8 as BS



r = pieceFrom ["###"] Red 
y = pieceFrom ["##","#"] Yellow
b = pieceFrom [" # ","###"," # "] Blue
g = pieceFrom ["#","#","#","#"] Green

main = BS.putStrLn $ render [(5,10,r),(0,0,y),(4,4,b),(2,7,g)] 