--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab 3: Recursive and higher-order functions                                --
--------------------------------------------------------------------------------

module Lab3 where

--------------------------------------------------------------------------------

-- Some of the functions we will be defining as part of this lab are
-- part of Haskell's standard library. The following line tells the compiler
-- not to import them.
import Prelude hiding ( Monoid(..), elem, maximum, intersperse, transpose
                      , subsequences, permutations, any, all, flip, takeWhile
                      , zipWith, groupBy, notElem )

--------------------------------------------------------------------------------
-- Recursive and higher-order functions

elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem t (x:xs) = if t == x then True else elem t xs

maximum :: Ord a => [a] -> a
maximum (x:[]) = x
maximum (x:y:[]) = if x > y then x else y
maximum (x:y:xs) = if x > y then maximum (x:xs) else maximum (y:xs)

intersperse :: a -> [a] -> [a]
intersperse _ [] = []
intersperse _ (x:[]) = [x]
intersperse t (x:xs) = x:t:(intersperse t xs)

any :: (a -> Bool) -> [a] -> Bool
any _ [] = False
any f (x:xs) = if f x then True else any f xs

all :: (a -> Bool) -> [a] -> Bool
all _ [] = True
all f (x:xs) = if f x then all f xs else False

flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile f (x:xs) = if f x then x:(takeWhile f xs) else []

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ _ [] = []
zipWith _ [] _ = []
zipWith f (x:xs) (y:ys) = (f x y):(zipWith f xs ys)

groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy _ [] = []
groupBy _ (x:[]) = [[x]]
groupBy f (x:y:xs) = if f x y then [x]:(groupBy f (y:xs)) else [[x]]++(groupBy f (y:xs))

subsequences :: [a] -> [[a]]
subsequences [] = [[]]
subsequences (x:[]) = [[], [x]]
subsequences (x:xs) = (map (\a -> a) (subsequences xs)) ++ (map (\a -> x:a) (subsequences xs))

shuffle :: Eq a => [a] -> [[a]]
shuffle [] = [[]]
shuffle (x:[]) = [[x]]
shuffle (x:y:[]) = [[x, y], [y, x]]
shuffle (x:y:xs) = (map (\z -> [x] ++ z ++ [y]) others) ++ (map (\z -> [y] ++ z ++ [x]) others)
    where
        others = shuffle xs

permutations :: Eq a => [a] -> [[a]]
permutations [] = [[]]
permutations (x:[]) = [[x]]
permutations (x:y:[]) = [[x, y], [y, x]]
permutations (x:xs) = (map (\y -> x:y) $ (permutations xs)) ++ (map (\y -> y++[x]) $ permutations xs)

--------------------------------------------------------------------------------
-- Monoids

-- Monoid laws:
--
-- (Left identity)      mappend mempty x = x
-- (Right identity)     mappend x mempty = x
-- (Associativity)      mappend x (mappend y z) = mappend (mappend x y) z
-- (mconcat)            mconcat = foldr mappend mempty

class Monoid a where
    mempty  :: a
    mappend :: a -> a -> a
    mconcat :: [a] -> a
    mconcat = foldr mappend mempty

instance Monoid Int where
    mempty  = 0
    mappend = (+)

instance Monoid [a] where
    mempty  = []
    mappend = (++)

instance Monoid b => Monoid (a -> b) where
    mempty  = undefined
    mappend = undefined

--------------------------------------------------------------------------------
