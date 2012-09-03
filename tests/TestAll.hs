module TestAll
where
import Test.HUnit
import TestShape

main = runTestTT $ TestList
  [TestShape.tests]
