import GHC.RTS.Flags (ProfFlags (typeSelector))

-- -- Boolean
-- 3>4

stepFunction :: Double -> Double
stepFunction x =
  if x <= 0
    then 0
    else 1

-- Char
ticTacToeMarker :: Char
ticTacToeMarker = 'X'

newLine :: Char
newLine = '\n'

-- String
hello :: String
hello = "Hello, world!"

errorMessage :: String
errorMessage = "Can't take the square root of a Boolean!"

-- numbers

-- Function
isX :: Char -> Bool
isX c = c == 'X'

bagFeeMessage :: Bool -> String
bagFeeMessage checkingBags =
  if checkingBags
    then "There is a $100 fee."
    else "There is no fee."

bagFeeMessage2 :: Bool -> String
bagFeeMessage2 checkingBags = case checkingBags of
  False -> "There is no fee."
  True -> "There is a $100 fee."


--Exercises
-- 3.6
amazingCurve :: Int -> Int
amazingCurve x =
    if x * 2 > 100
        then 100
        else x * 2
