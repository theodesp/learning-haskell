{- 
Remove minimum number of characters so that two strings become anagram
https://www.geeksforgeeks.org/remove-minimum-number-characters-two-strings-become-anagram/

https://www.hackerearth.com/practice/basic-programming/input-output/basics-of-input-output/practice-problems/algorithm/anagrams-651/

-}
{-# LANGUAGE ScopedTypeVariables #-}


import Control.Monad

strToInt :: String -> Int
strToInt x = read x :: Int

-- Find word frequency of string
wordFrequencies :: String -> [(Char, Int)]
wordFrequencies word = [ (x,c) | x<-['A'..'z'], let c = (length.filter (==x)) word, c>=0 ]

-- Find absolute diff of 2 numbers
absDiff :: Int -> Int -> Int
absDiff x y = abs (x - y)

-- Repeat function n times
repeatNTimes 0 _ = return ()
repeatNTimes n action =
 do
  action
  repeatNTimes (n-1) action

{-  
    function to calculate minimum numbers
    of characters to be removed to make
    two strings anagram
-}
anagramCheck = do
    first <- getLine
    second <- getLine

    -- calculate frequency of each character in first string
    let count1 = wordFrequencies first

    -- calculate frequency of each character in second string
    let count2 = wordFrequencies second
    
    -- calculate absolute difference of their freq count
    let diff :: Int = sum $ zipWith (\x y -> absDiff x y) (map snd count1) (map snd count2)
    putStrLn (show diff)
    return ()

main = do
    -- Read num of cases
    n <- getLine
    -- Repeat n times check
    replicateM_ (strToInt n) anagramCheck

