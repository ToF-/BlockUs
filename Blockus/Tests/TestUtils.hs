module Blockus.Tests.TestUtils
where
import Test.HUnit

check :: Bool -> Test
check b = b ~?= True

reject :: Bool -> Test
reject b = b ~?= False
