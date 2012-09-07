module TestAll
where
import Test.HUnit
import Blockus.Tests.TestShape
import Blockus.Tests.TestPiece
import Blockus.Tests.TestBoard

main = runTestTT $ TestList
<<<<<<< HEAD
  [Blockus.Tests.TestShape.tests
  ,Blockus.Tests.TestBoard.tests
  ,Blockus.Tests.TestPiece.tests]
=======
  [Blockus.Tests.TestShape.tests]
>>>>>>> commit w/o sync
