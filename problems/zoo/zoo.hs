{- 
https://www.hackerearth.com/practice/basic-programming/input-output/basics-of-input-output/practice-problems/algorithm/is-zoo-f6f309e7/
-}

-- Counts the number of elem instances in a list
countOfElem :: Char -> String -> Int
countOfElem elem list = length $ filter (\x -> x == elem) list

isSimilar :: Int -> Int -> Bool
isSimilar x y = 2 * x == y

-- Converts a bool to yes/no strings
boolToString :: Bool -> String
boolToString x = if x then "Yes" else "No"

main = do
    name <- getLine
    let zCount = countOfElem 'z' name
    let oCount = countOfElem 'o' name
    putStrLn $ boolToString $ isSimilar zCount oCount