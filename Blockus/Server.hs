-- Server.hs
{-# LANGUAGE FlexibleContexts #-}

{--

  ghc --make -threaded Server.hs -o bin/server
  to launch server: bin/server                             
  to access server: http://localhost:8000
  refreshing the page increments the counter
  
--}

module Main 
where
import Happstack.Server (nullConf, simpleHTTP, toResponse, ok)

main::IO ()
main = simpleHTTP nullConf $ ok "Blockus"