import Debug.Trace

debug = flip trace

myGcd :: Int -> Int -> Int
myGcd p q =
    case q of
        0 -> p
        _ -> myGcd q (mod p q)

myGcd2 :: Int -> Int -> Int
myGcd2 p q
    | q == 0 = p `debug` ("q is zero. returning p: " ++  show p)
    | otherwise = myGcd2 q (mod p q) `debug` ("when q: " ++ show q ++ " and p: " ++ show p)

myGcd3 :: Int -> Int -> Int 
myGcd3 p 0 = p
myGcd3 p q = myGcd3 q (mod p q)

main = do
    putStrLn (show $ myGcd3 54 24)
    