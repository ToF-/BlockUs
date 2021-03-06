module TestAll
where
import Test.HUnit
import Blockus.Tests.TestShape
import Blockus.Tests.TestPiece
import Blockus.Tests.TestBoard
import Blockus.Tests.TestBoardRenderer
import Blockus.Tests.TestDrawShapes
import Blockus.Tests.TestSVGRenderer
import Blockus.Tests.TestBlockusPieces
import Blockus.Tests.TestShapeTemplate

main = runTestTT $ TestList
  [Blockus.Tests.TestShape.tests
  ,Blockus.Tests.TestPiece.tests
  ,Blockus.Tests.TestBoard.tests
  ,Blockus.Tests.TestBoardRenderer.tests
  ,Blockus.Tests.TestDrawShapes.tests
  ,Blockus.Tests.TestSVGRenderer.tests
  ,Blockus.Tests.TestBlockusPieces.tests
  ,Blockus.Tests.TestShapeTemplate.tests
  ]
