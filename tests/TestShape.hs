module TestShape 
where
import Test.HUnit

shape       = const -- fake 
overlap _ _ = True  -- ditto

tests = TestList [
  "two simple shapes overlap if on same coords" ~: shape [(0,0)] `overlap` shape [(0,0)] ~?= True  
  ]  