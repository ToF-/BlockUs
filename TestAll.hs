module TestAll
where
import Test.HUnit
import Blockus.Tests.TestShape
import Blockus.Tests.TestPiece
import Blockus.Tests.TestBoard
import Blockus.Tests.TestBoardRenderer

main = runTestTT $ TestList
  [Blockus.Tests.TestShape.tests
  ,Blockus.Tests.TestPiece.tests
  ,Blockus.Tests.TestBoard.tests
  ,Blockus.Tests.TestBoardRenderer.tests
  ]
