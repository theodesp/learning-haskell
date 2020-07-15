module Main where

-- sequence of Integers
oneToTen :: [Integer]
oneToTen =  [1..10]

main = do
    print oneToTen
    let sumOfOneToTen = sum oneToTen
    -- Note that you cannot do `print sum oneToTen`
    print sumOfOneToTen
