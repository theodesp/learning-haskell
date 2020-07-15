strToInt :: String -> Int
strToInt x = read x :: Int

timesTwo :: Int -> Int
timesTwo x = x * 2

main = do
    num <- getLine
    msg <- getLine
    putStrLn $ show $ timesTwo $ strToInt num
    putStrLn msg