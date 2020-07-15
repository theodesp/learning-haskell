module Main where

--- This is a line comment

{- 
This is a multi line comment
-}

main = do
    let maxInt = (maxBound :: Int)
    let minInt = (minBound :: Int)
    print maxInt
    print minInt
