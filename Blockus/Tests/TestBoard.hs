module Blockus.Tests.TestBoard
where

import Test.HUnit
import Blockus.Shape
import Blockus.Board


tests = "A Board" ~: TestList 
  ["doesn't accept the dropping outside its limit" ~: 
    TestList ["of a very single square shape " ~: 
                accept emptyBoard (0,0) block ~?= Left IllegalCoord
            ]
  ]

block = shape [(0,0)]

