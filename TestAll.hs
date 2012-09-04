module TestAll
where
import Test.HUnit
import Blockus.Tests.TestShape

main = runTestTT $ TestList
  [Blockus.Tests.TestShape.tests]
