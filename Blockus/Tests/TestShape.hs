module Blockus.Tests.TestShape 
where
import Test.HUnit
import Blockus.Shape

tests = TestList [
  "two simple shapes overlap if on same coords" ~: shape [(0,0)] `overlap` shape [(0,0)] ~?= True  
  ]  