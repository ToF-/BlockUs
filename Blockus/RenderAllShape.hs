module Main
where

import Blockus.SVGRenderer
import Blockus.Piece
import Data.ByteString.Char8 as BS
import Blockus.BlockusPieces

main = BS.putStrLn $ render $ Prelude.map (\((x,y),p) -> (x,y,p)) template