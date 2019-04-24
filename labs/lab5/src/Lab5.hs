--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab 5: Lazy evaluation                                                     --
--------------------------------------------------------------------------------

module Lab5 where

--------------------------------------------------------------------------------
-- Infinite data structures

-- | The infinite list of ones.
ones :: [Int]
ones = undefined

-- | An infinite list modelled after the Fibonacci numbers, but where the
-- seed values are x and y. (Exponential time complexity!)
foos :: Integer -> Integer -> [Integer]
foos x y = x : y : zipWith (+) (foos x y) (tail (foos x y))

-- | An infinite list modelled after the Fibonacci numbers, but where the
-- seed values are x and y. (Linear time complexity if you do it right!)
foos' :: Integer -> Integer -> [Integer]
foos' x y = undefined

--------------------------------------------------------------------------------
