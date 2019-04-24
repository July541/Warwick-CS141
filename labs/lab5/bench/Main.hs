--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab 5: Lazy evaluation                                                     --
--------------------------------------------------------------------------------

import Criterion.Main

import Lab5

--------------------------------------------------------------------------------

main :: IO ()
main = defaultMain [
    bgroup "foos (should be exponential)" [
        bench "10" $ nf (take 10 . foos 1) 2,
        bench "20" $ nf (take 20 . foos 1) 2,
        bench "30" $ nf (take 30 . foos 1) 2{-,
        bench "35" $ nf (take 35 . foos 1) 2,
        bench "40" $ nf (take 40 . foos 1) 2-}
    ],
    bgroup "foosPrime (should be linear)" [
        bench "10" $ nf (take 10 . foos' 1) 2,
        bench "20" $ nf (take 20 . foos' 1) 2,
        bench "30" $ nf (take 30 . foos' 1) 2{-,
        bench "35" $ nf (take 35 . foos' 1) 2,
        bench "40" $ nf (take 40 . foos' 1) 2-}

    ]
    ]

--------------------------------------------------------------------------------
