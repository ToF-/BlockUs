module TestAll
where
import Test.HUnit
import Blockus.Tests.TestShape

main = runTestTT $ TestList
  ["A Shape" ~: Blockus.Tests.TestShape.tests]
