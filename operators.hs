module Main where

-- Common Operators
add1 :: Int -> Int
add1 x = x + 1

sub1 :: Int -> Int
sub1 x = x - 1

div2 :: Int -> Double
div2 x = (fromIntegral x) / 2


main = do
    print (add1 5)
    print (sub1 5)
    print (div2 5)
    
