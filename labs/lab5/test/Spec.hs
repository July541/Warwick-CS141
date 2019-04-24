--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab 5: Lazy evaluation                                                     --
--------------------------------------------------------------------------------

{-# LANGUAGE ScopedTypeVariables #-}

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

import qualified Lab5 as L

--------------------------------------------------------------------------------

-- | The main entry point to the test suite.
main :: IO ()
main = hspec $ do
    describe "ones" $ do
        prop "appears to be an infinite list containing only ones" $
            \(Positive n) -> let xs = take n L.ones
                             in all (==1) xs && length xs == n


--------------------------------------------------------------------------------
